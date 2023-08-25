/obj/machinery/door/poddoor
	var/ertblast = FALSE //If this is true the blast door cannot be deconstructed
	var/deconstruction = INTACT //For the deconstruction steps

/obj/machinery/door/poddoor/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(ertblast && W.tool_behaviour == TOOL_SCREWDRIVER) // This makes it so ERT members cannot cheese by opening their blast doors.
		to_chat(user, "<span class='warning'>This shutter has a different kind of screw, you cannot unscrew the panel open.</span>")
		return

	if(W.tool_behaviour == TOOL_SCREWDRIVER)
		if(density)
			to_chat(user, "<span class='warning'>You need to open [src] before opening its maintenance panel.</span>")
			return
		else if(default_deconstruction_screwdriver(user, icon_state, icon_state, W))
			to_chat(user, "<span class='notice'>You [panel_open ? "open" : "close"] the maintenance hatch of [src].</span>")
			return TRUE

	if(panel_open)
		if(W.tool_behaviour == TOOL_MULTITOOL)
			var/change_id = input("Set the shutters/blast door/blast door controllers ID. It must be a number between 1 and 100.", "ID", id) as num|null
			if(change_id)
				id = clamp(round(change_id, 1), 1, 100)
				to_chat(user, "<span class='notice'>You change the ID to [id].</span>")

		if(W.tool_behaviour == TOOL_CROWBAR && deconstruction == INTACT)
			to_chat(user, "<span class='notice'>You start to remove the airlock electronics.</span>")
			if(do_after(user, 10 SECONDS, target = src))
				new /obj/item/electronics/airlock(loc)
				id = null
				deconstruction = FALSE

		if(W.tool_behaviour == TOOL_WIRECUTTER && deconstruction == FALSE)
			to_chat(user, "<span class='notice'>You start to remove the internal cables.</span>")
			if(do_after(user, 10 SECONDS, target = src))
				deconstruction = TRUE

		if(W.tool_behaviour == TOOL_WELDER && deconstruction == TRUE)
			to_chat(user, "<span class='notice'>You start tearing apart the [src].</span>")
			playsound(src.loc, 'sound/items/welder.ogg', 50, 1)
			if(do_after(user, 15 SECONDS, target = src))
				new /obj/item/stack/sheet/plasteel(loc, 5)
				qdel(src)

/obj/machinery/door/poddoor/examine(mob/user)
	. = ..()
	if(panel_open)
		. += "<span class='<span class='notice'>The maintenance panel is [panel_open ? "opened" : "closed"].</span>"

/obj/machinery/door/poddoor/ert
	ertblast = TRUE

/obj/machinery/door/poddoor/shuttledock
	ertblast = TRUE
