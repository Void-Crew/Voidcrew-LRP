/obj/machinery/ammo_printer
	name = "Bluespace ammo manufacturer"
	desc = "A bluespace ammo manufacturer designed to replace the aging mag printers found laying around deserted planets. It uses bluespace to make a fresh mag and ammo out of nothing but raw metal for the gun inserted."
	icon = 'voidcrew/icons/obj/machines/ammo_printer.dmi'
	icon_state = "ammo_printer"
	var/icon_idle = "ammo_printer"
	var/icon_insert = "ammo_printer_i"
	var/icon_craft = "ammo_printer_m"
	anchored = TRUE
	density = TRUE
	var/used = FALSE
	var/blacklist = list(
		/obj/item/gun/ballistic/revolver/grenadelauncher,
		/obj/item/gun/grenadelauncher,
		/obj/item/gun/ballistic/rocketlauncher,
		/obj/item/gun/ballistic/automatic/gyropistol
	)
	var/obj/item/gun/ballistic/inserted_gun
	var/metal_amount = 0
	var/total_ammo = 1
	var/metal_required = 10
	var/ammo_type
	var/reusable = TRUE
	var/active = FALSE

/obj/machinery/ammo_printer/Initialize()
	. = ..()
	component_parts = list()
	component_parts += new /obj/item/circuitboard/machine/ammo_printer(null)
	component_parts += new /obj/item/stock_parts/scanning_module/triphasic(null)
	component_parts += new /obj/item/stock_parts/scanning_module/triphasic(null)
	component_parts += new /obj/item/stock_parts/manipulator/femto(null)
	component_parts += new /obj/item/stock_parts/micro_laser/quadultra(null)
	component_parts += new /obj/item/stock_parts/matter_bin/bluespace(null)

/obj/machinery/ammo_printer/attackby(obj/item/I, mob/living/user)
	if(!inserted_gun && default_deconstruction_screwdriver(user, icon_state, icon_state, I))
		return
	if(default_deconstruction_crowbar(I))
		return
	if(!inserted_gun && default_unfasten_wrench(user, I))
		return
	if(used)
		to_chat(user, "<span class='warning'>The printer has no power left!</span>")
		playsound(src, 'sound/machines/uplinkerror.ogg', 25, FALSE)
		return
	if(istype(I, /obj/item/gun/ballistic))
		if(inserted_gun)
			to_chat(user, "<span class='warning'>A weapon is already loaded into the machine!</span>")
			playsound(src, 'sound/machines/uplinkerror.ogg', 25, FALSE)
			return
		for(var/weapon in blacklist)
			if(istype(I, weapon))
				to_chat(user, "<span class='warning'>The printer cannot work with weapons of this caliber!</span>")
				playsound(src, 'sound/machines/uplinkerror.ogg', 25, FALSE)
				return
		if(!user.transferItemToLoc(I, src))
			to_chat(user, "<span class='warning'>The weapon is stuck to your hand!</span>")
			playsound(src, 'sound/machines/uplinkerror.ogg', 25, FALSE)
			return
		inserted_gun = I
		playsound(src, 'sound/items/deconstruct.ogg', 50, FALSE)
		to_chat(user, "You load the [I.name] into the printer.")
		icon_state = icon_insert
		addtimer(CALLBACK(src, .proc/resetIcon), 1 SECONDS)

	if(istype(I, /obj/item/stack/sheet/metal) && reusable)
		if (metal_amount >= metal_required)
			to_chat(user, "<span class='warning'>The machine is already full of metal!</span>")
			playsound(src, 'sound/machines/uplinkerror.ogg', 25, FALSE)
			return
		else//inserts as much as need, or as much as possible if not enough
			var/obj/item/stack/sheet/metal/stack = I
			var/metal_needed = metal_required - metal_amount
			if(stack.amount > metal_needed)
				metal_amount += metal_needed
				stack.add(-metal_needed)
			else
				metal_amount += stack.amount
				metal_needed = stack.amount
				qdel(stack)

			to_chat(user, "<span class='warning'>You insert [metal_needed] metal sheets into the machine.</span>")
			playsound(src, 'sound/items/deconstruct.ogg', 50, FALSE)
			icon_state = icon_insert
			addtimer(CALLBACK(src, .proc/resetIcon), 1 SECONDS)

/obj/machinery/ammo_printer/interact(mob/user)
	. = ..()
	if(active)
		return
	if(used)
		to_chat(user, "<span class='warning'>The printer has no power left!</span>")
		playsound(src, 'sound/machines/uplinkerror.ogg', 25, FALSE)
		return
	if(!inserted_gun)
		to_chat(user, "<span class='warning'>Insert a weapon first!</span>")
		playsound(src, 'sound/machines/uplinkerror.ogg', 25, FALSE)
		return
	if((metal_amount < metal_required) && reusable)
		to_chat(user, "<span class='warning'>You need to insert [metal_required] metal to operate this printer!</span>")
		playsound(src, 'sound/machines/uplinkerror.ogg', 25, FALSE)
		return

	if(inserted_gun.internal_magazine)
		var/obj/item/ammo_box/magazine/internal/mag = inserted_gun.mag_type
		ammo_type = initial(mag.ammo_type)
		total_ammo = rand(3,10)
	else
		ammo_type = inserted_gun.mag_type
		if(!reusable)
			total_ammo = pick(1,2)
		else
			total_ammo = 1
	playsound(src, 'sound/machines/button1.ogg', 25, FALSE)
	icon_state = icon_craft
	active = TRUE
	addtimer(CALLBACK(src, .proc/manufacture), 2 SECONDS)


/obj/machinery/ammo_printer/proc/manufacture()
	playsound(src, 'sound/machines/whirr_beep.ogg', 25, FALSE)
	while(total_ammo != 0)
		new ammo_type(src.loc)
		total_ammo -= 1
	inserted_gun.forceMove(src.loc)
	inserted_gun = FALSE

	if(reusable)
		metal_amount -= metal_required
	else
		used = TRUE
		return
	active = FALSE
	icon_state = icon_idle

/obj/machinery/ammo_printer/proc/resetIcon()
	icon_state = icon_idle

/obj/machinery/ammo_printer/AltClick(mob/user)
	if(inserted_gun)
		inserted_gun.forceMove(src.loc)
		inserted_gun = null
	else
		to_chat(user, "<span class='warning'>No weapon inserted!</span>")

/obj/machinery/ammo_printer/examine(mob/user)
	. = ..()
	if(reusable)
		. += "It has [metal_amount] sheets of metal loaded."
	if(used)
		. += "It is out of juice!"

/obj/machinery/ammo_printer/ruin
	name = "Rusting ammo printer"
	desc = "An ammunition printer covered in rust."
	icon = 'icons/obj/storage.dmi'
	icon_state = "brassbox"
	icon_idle = "brassbox"
	icon_insert = "brassbox"
	icon_craft = "brassbox"
	reusable = FALSE
	metal_required = 0

/obj/machinery/ammo_printer/ruin/Initialize()
	. = ..()
	flags_1 += NODECONSTRUCT_1
