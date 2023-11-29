

/obj/machinery/autolathe
	name = "autolathe"
	desc = "It produces items using metal and glass."
	icon_state = "autolathe"
	density = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 10
	active_power_usage = 100
	circuit = /obj/item/circuitboard/machine/autolathe
	layer = BELOW_OBJ_LAYER
	
	var/mob/last_user

	var/hacked   = FALSE
	var/disabled = FALSE
	var/shocked  = FALSE

	var/prod_coeff = 1	
	/// Internal techweb of designs
	var/datum/techweb/stored_research
	/// name of the design to search for
	var/search
	/// Maximum length of the queue
	var/queue_max_len = 12
	/// Is it currently printing
	var/processing_queue = FALSE
	/// Requested item to be made
	var/datum/design/request
	/// Items being built
	var/list/being_built = list()
	/// Item queue
	var/list/autoqueue = list()
	/// List describing the items for the UI
	var/processing_line
	/// Direction its qill output when the item is printed (0 for ontop of itself)
	var/printdirection = 0
	/// Length of the queue
	var/queuelength = 0
	/// Avaliable categories
	var/list/categories = list("Tools","Electronics","Construction","T-Comm","Security","Machinery","Medical","Miscellaneous","Dinnerware","Imported", "Search")


/obj/machinery/autolathe/Initialize()
	AddComponent(/datum/component/material_container, SSmaterials.materialtypes_by_category[MAT_CATEGORY_RIGID], 0, TRUE, null, null, CALLBACK(src, .proc/AfterMaterialInsert))
	. = ..()

	wires = new /datum/wires/autolathe(src)
	stored_research = new /datum/techweb/specialized/autounlocking/autolathe
	request = list()

/obj/machinery/autolathe/Destroy()
	QDEL_NULL(wires)
	return ..()

/obj/machinery/autolathe/ui_interact(mob/user, datum/tgui/ui)
	last_user = user
	ui = SStgui.try_update_ui(user, src, ui)
	if(!is_operational())
		return

	if(shocked && !(machine_stat & NOPOWER))
		shock(user,50)

	if(!ui)
		ui = new(user, src, "Autolathe", name)
		ui.open()				

/obj/machinery/autolathe/proc/wallcheck(direction) //Check for nasty walls and update ui
	if(iswallturf(get_step(src,(direction))))
		return TRUE
	else
		return FALSE
/obj/machinery/autolathe/ui_data(mob/user) // All the data the ui will need
	var/list/data = list()
	var/list/mat_types = SSmaterials.materialtypes_by_category[MAT_CATEGORY_RIGID]
	var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
	data["total_amount"] = materials.total_amount
	data["max_amount"] = materials.max_amount
	data["stored_materials"] = list()
	for(var/material in mat_types)	
		data["stored_materials"][SSmaterials.GetMaterialRef(material)] = materials.get_material_amount(material)
	data["rightwall"] = wallcheck(4) // Wall data for ui
	data["leftwall"] = wallcheck(8)
	data["abovewall"] = wallcheck(1)
	data["belowwall"] = wallcheck(2)
	processing_line = being_built.len ? get_processing_line() : null
	data["processing"] = processing_line
	data["printdir"] = printdirection
	data["isprocessing"] = processing_queue
	data["queuelength"] = queuelength
	data["categories"] = categories
	data["disabled"] = disabled
	
	if(istype(autoqueue) && autoqueue.len)
		var/list/uidata = list()
		var/index = 1
		for(var/list/L in autoqueue)
			var/datum/design/D = L[1]
			uidata[++uidata.len] = list("name" = initial(D.name), "multiplier" = L[2], "index" = index)
			index++
		data["queue"] = uidata
	else
		data["queue"] = list()

	return data
	
/obj/machinery/autolathe/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/spritesheet/research_designs),
	)

/obj/machinery/autolathe/ui_static_data(mob/user)
	var/list/data = list()
	var/list/designs = list()
	for(var/v in stored_research.researched_designs)
		var/datum/design/D = SSresearch.techweb_design_by_id(v)
		var/coeff = (ispath(D.build_path, /obj/item/stack) ? 1 : prod_coeff)
		var/list/design = list()
		design["name"] = D.name
		design["id"] = D.id
		design["category"] = D.category
		design["materials"] = list()
		for(var/i in D.materials)
			design["materials"][i] = D.materials[i] * coeff
		designs += list(design)
	data["designs"] = designs
	return data
/obj/machinery/autolathe/ui_act(action, params)
	if(..())
		return

	switch(action)
		if("make") // Lets try make the item supplied via the UI
			request = stored_research.isDesignResearchedID(params["item_id"])
			if(!request)
				return
			var/multiplier = text2num(params["multiplier"])
			multiplier = clamp(multiplier,1,50)
			if((autoqueue.len + 1) < queue_max_len)
				add_to_queue(request, multiplier) // Add item to queue for processing
			else
				to_chat(usr, span_warning("The autolathe queue is full!"))
		if("eject_mats")
			
			if(processing_queue)
				to_chat(usr, span_warning("The autolathe queue is processing, please stop before ejecting material"))
			if(!request)
				return
			
			var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
			materials.retrieve_all()

			processing_queue = FALSE

		if("process_queue")   // Processing queue flag triggers the queue
			if(processing_queue)
				processing_queue = FALSE
				return
			processing_queue = TRUE
			process_queue()

		if("remove_from_queue")
			var/index = text2num(params["index"])
			if(isnum(index) && ISINRANGE(index, 1, autoqueue.len))
				remove_from_queue(index)

		if("queue_move")  // Moves items up and down the list
			var/index = text2num(params["index"])
			var/new_index = index + text2num(params["queue_move"])
			if(isnum(index) && isnum(new_index))
				if(ISINRANGE(new_index, 1, autoqueue.len))
					autoqueue.Swap(index,new_index)

		if("clear_queue")
			queuelength = 0
			processing_queue = FALSE
			autoqueue = list()
			processing_line = null

		if("printdir")
			printdirection = text2num(params["direction"])
			if(printdirection > 8)  // Simple Sanity Check
				printdirection = 0

	update_icon()


/obj/machinery/autolathe/on_deconstruction()
	var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
	materials.retrieve_all()

/obj/machinery/autolathe/attackby(obj/item/O, mob/user, params)
	if(default_deconstruction_screwdriver(user, "autolathe_t", "autolathe", O))
		return TRUE

	if(default_deconstruction_crowbar(O))
		return TRUE

	if(panel_open && is_wire_tool(O))
		wires.interact(user)
		return TRUE

	if(user.a_intent == INTENT_HARM) //so we can hit the machine
		return ..()

	if(machine_stat)
		return TRUE

	if(istype(O, /obj/item/disk/design_disk))
		user.visible_message("<span class='notice'>[user] begins to load \the [O] in \the [src]...</span>",
			"<span class='notice'>You begin to load a design from \the [O]...</span>",
			"<span class='hear'>You hear the chatter of a floppy drive.</span>")
		var/obj/item/disk/design_disk/D = O
		if(do_after(user, 14.4, target = src))
			for(var/B in D.blueprints)
				if(B)
					stored_research.add_design(B)
				update_static_data(user)
		return TRUE

	return ..()


/obj/machinery/autolathe/proc/AfterMaterialInsert(item_inserted, id_inserted, amount_inserted)
	if(istype(item_inserted, /obj/item/stack/ore/bluespace_crystal))
		use_power(MINERAL_MATERIAL_AMOUNT / 10)
	else if(custom_materials && custom_materials.len && custom_materials[SSmaterials.GetMaterialRef(/datum/material/glass)])
		flick("autolathe_r",src)//plays glass insertion animation by default otherwise
		use_power(min(1000, amount_inserted / 100))
	else
		flick("autolathe_o",src)//plays metal insertion animation
		use_power(min(1000, amount_inserted / 100))

/obj/machinery/autolathe/RefreshParts()
	var/T = 0
	for(var/obj/item/stock_parts/matter_bin/MB in component_parts)
		T += MB.rating*75000
	var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
	materials.max_amount = T
	T=1.2
	for(var/obj/item/stock_parts/manipulator/M in component_parts)
		T -= M.rating*0.2
	prod_coeff = min(1,max(0,T)) // Coeff going 1 -> 0,8 -> 0,6 -> 0,4

/obj/machinery/autolathe/examine(mob/user)
	. += ..()
	var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
	if(in_range(user, src) || isobserver(user))
		. += "<span class='notice'>The status display reads: Storing up to <b>[materials.max_amount]</b> material units.<br>Material consumption at <b>[prod_coeff*100]%</b>.</span>"

/obj/machinery/autolathe/proc/materials_printout()
	var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
	var/dat = "<b>Total amount:</b> [materials.total_amount] / [materials.max_amount] cm<sup>3</sup><br>"
	for(var/mat_id in materials.materials)
		var/datum/material/M = mat_id
		var/mineral_amount = materials.materials[mat_id]
		if(mineral_amount > 0)
			dat += "<b>[M.name] amount:</b> [mineral_amount] cm<sup>3</sup><br>"
	return dat

/obj/machinery/autolathe/proc/can_build(datum/design/D, amount = 1)
	if(D.make_reagents.len)
		return FALSE

	var/coeff = (ispath(D.build_path, /obj/item/stack) ? 1 : prod_coeff)

	var/list/required_materials = list()

	for(var/i in D.materials)
		required_materials[i] = D.materials[i] * coeff * amount

	var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
	if(wallcheck(printdirection))
		say("Output blocked, please remove obstruction.")
		return FALSE
	if(!materials)
		say("Error, invalid object.")
		return FALSE

	return materials.has_materials(required_materials)


/obj/machinery/autolathe/proc/get_design_cost(datum/design/D)
	var/coeff = (ispath(D.build_path, /obj/item/stack) ? 1 : prod_coeff)
	var/dat
	for(var/i in D.materials)
		if(istext(i)) //Category handling
			dat += "[D.materials[i] * coeff] [i]"
		else
			var/datum/material/M = i
			dat += "[D.materials[i] * coeff] [M.name] "
	return dat

/obj/machinery/autolathe/proc/reset(wire)
	switch(wire)
		if(WIRE_HACK)
			if(!wires.is_cut(wire))
				adjust_hacked(FALSE)
		if(WIRE_SHOCK)
			if(!wires.is_cut(wire))
				shocked = FALSE
		if(WIRE_DISABLE)
			if(!wires.is_cut(wire))
				disabled = FALSE

/obj/machinery/autolathe/proc/shock(mob/user, prb)
	if(machine_stat & (BROKEN|NOPOWER))		// unpowered, no shock
		return FALSE
	if(!prob(prb))
		return FALSE
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(5, 1, src)
	s.start()
	if (electrocute_mob(user, get_area(src), src, 0.7, TRUE))
		return TRUE
	else
		return FALSE

/obj/machinery/autolathe/proc/adjust_hacked(state)
	hacked = state
	for(var/id in SSresearch.techweb_designs)
		var/datum/design/D = SSresearch.techweb_design_by_id(id)
		if(D.build_type & AUTOLATHE)
			if("hacked" in D.category)
				if(hacked || obj_flags & EMAGGED) //WS - Emag the lathe
					stored_research.add_design(D)
				else
					stored_research.remove_design(D)
			if(("emagged" in D.category) && (obj_flags & EMAGGED))
				stored_research.add_design(D)

/obj/machinery/autolathe/emag_act(mob/user) //WS - Emag the lathe
	if(obj_flags & EMAGGED)
		return
	obj_flags |= EMAGGED
	adjust_hacked(TRUE) // im in
	update_static_data(user)
	to_chat(user, "<span class='warning'>You load the [src] with a series of specialized designs.</span>")

/obj/machinery/autolathe/hacked/Initialize()
	. = ..()
	adjust_hacked(TRUE)

//Called when the object is constructed by an autolathe
//Has a reference to the autolathe so you can do !!FUN!! things with hacked lathes
/obj/item/proc/autolathe_crafted(obj/machinery/autolathe/A)
	return

/obj/machinery/autolathe/proc/make_item_old(power, list/materials_used, multiplier, coeff, is_stack, mob/user)

	var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
	materials.use_materials(materials_used)

	if(is_stack)
		var/obj/item/stack/N 
		///= new old_being_built.build_path(A, multiplier)
		N.update_icon()
		N.autolathe_crafted(src)
	else
		for(var/i=1, i<=multiplier, i++)
			var/obj/item/new_item 
			///= new old_being_built.build_path(A)
			new_item.autolathe_crafted(src)

			if(length(materials_used))
				new_item.set_custom_materials(materials_used, 1 / multiplier) //Ensure we get the non multiplied amount
				for(var/x in materials_used)
					var/datum/material/M = x
					if(!istype(M, /datum/material/glass) && !istype(M, /datum/material/iron))
						user.client.give_award(/datum/award/achievement/misc/getting_an_upgrade, user)


	icon_state = "autolathe"

/obj/machinery/autolathe/proc/make_item(datum/design/D, multiplier)
	var/is_stack = ispath(D.build_path, /obj/item/stack)
	var/coeff = (is_stack ? 1 : prod_coeff) //stacks are unaffected by production coefficient
	var/total_amount = 0
	for(var/MAT in D.materials)
		total_amount += D.materials[MAT]
	var/power = max(2000, (total_amount)*multiplier/5) //Change this to use all materials
	var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
	if (!materials)
		say("No access to material storage, please contact the quartermaster.")
		return FALSE
	if(can_build(D, multiplier))  // Check if we can build if not, return
		var/list/materials_used = list()

		for(var/MAT in D.materials)
			var/datum/material/used_material = MAT
			var/amount_needed = D.materials[MAT] * coeff * multiplier
			materials_used[used_material] = amount_needed

		if(materials.has_materials(materials_used))
			use_power(power)
			materials.use_materials(materials_used)
			being_built = list(D, multiplier)
			desc = "It's building \a [initial(D.name)]."
			icon_state = "autolathe_n"
			var/time = is_stack ? 32 : 32 * coeff * multiplier
			sleep(time)
			if(wallcheck(printdirection))
				printdirection = 0
			var/atom/A = drop_location()
			var/location = get_step(src,(printdirection))
			if(printdirection)
				A = location
			if(is_stack) // If its a stack we need to define it as so
				var/obj/item/stack/N = new D.build_path(A, multiplier)
				N.update_icon()
				N.autolathe_crafted(src)
			else
				for(var/i=1, i<=multiplier, i++)
					var/obj/item/new_item = new D.build_path(A)
					new_item.autolathe_crafted(src)
					if(length(materials_used))
						new_item.set_custom_materials(materials_used, 1 / multiplier) //Ensure we get the non multiplied amount
						for(var/x in materials_used)
							var/datum/material/M = x
							if(!istype(M, /datum/material/glass) && !istype(M, /datum/material/iron))
								last_user.client.give_award(/datum/award/achievement/misc/getting_an_upgrade, last_user)

						
			icon_state = "autolathe"
			desc = initial(desc)
			return TRUE
	else
		say("Not enough resources. Queue processing stopped.")
		return FALSE

/obj/machinery/autolathe/proc/add_to_queue(D, multiplier)
	queuelength++
	if(!istype(autoqueue))
		autoqueue = list()
	if(D)
		autoqueue.Add(list(list(D,multiplier)))
	return autoqueue.len

/obj/machinery/autolathe/proc/remove_from_queue(index)
	queuelength--
	if(!isnum(index) || !istype(autoqueue) || (index<1 || index>autoqueue.len))
		return FALSE
	autoqueue.Cut(index,++index)
	return TRUE

/obj/machinery/autolathe/proc/process_queue() //Process the queue from the autoqueue list. Will add temp metal and glass later.
	var/datum/design/D = autoqueue[1][1]
	var/multiplier = autoqueue[1][2]
	if(!multiplier || !isnum(multiplier))
		message_admins("[ADMIN_FULLMONTY(usr)] is attempting to create NAN stacks of items")
		return
	if(!processing_queue)
		say("Queue processing halted.")
		return
	if(machine_stat&(NOPOWER|BROKEN) || panel_open)
		processing_queue = FALSE
		return
	if(!can_build(D,multiplier))
		say("Not enough resources. Queue processing terminated.")
		processing_queue = FALSE
		return
	remove_from_queue(1)
	if(!make_item(D,multiplier))
		return
	if(autoqueue.len)
		process_queue()
	else
		being_built = new /list()
		say("Queue processing finished successfully.")
		processing_queue = FALSE
/obj/machinery/autolathe/proc/get_processing_line()  //Gets processing line for whats building for UI
	var/datum/design/D = being_built[1]
	var/multiplier = being_built[2]
	var/is_stack = (multiplier>1)
	var/output = "[initial(D.name)][is_stack?" (x[multiplier])":null]"
	return output
