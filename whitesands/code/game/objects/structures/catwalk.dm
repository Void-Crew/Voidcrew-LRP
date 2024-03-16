/obj/structure/catwalk
	name = "catwalk"
	desc = "A catwalk for easier EVA maneuvering and cable placement."
	icon = 'whitesands/icons/obj/smooth_structures/catwalk.dmi'
	icon_state = "catwalk"
	base_icon_state = "catwalk"
	density = FALSE
	anchored = TRUE
	armor = list("melee" = 50, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 50)
	max_integrity = 50
	layer = LATTICE_LAYER //under pipes
	plane = FLOOR_PLANE
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_LATTICE, SMOOTH_GROUP_CATWALK, SMOOTH_GROUP_OPEN_FLOOR)
	canSmoothWith = list(SMOOTH_GROUP_CATWALK)
	obj_flags = CAN_BE_HIT | BLOCK_Z_OUT_DOWN | BLOCK_Z_IN_UP
	var/number_of_rods = 1
	var/hatch_open = FALSE
	var/obj/item/stack/tile/plated_tile

/obj/structure/catwalk/Initialize()
	. = ..()
	update_icon()

/obj/structure/catwalk/over
	layer = CATWALK_LAYER //over pipes, duh

/obj/structure/catwalk/over/plated_catwalk
	name = "plated catwalk"
	icon_state = "catwalk_platedwhite"
	plated_tile = /obj/item/stack/tile/plasteel

/obj/structure/catwalk/over/plated_catwalk/dark
	plated_tile = /obj/item/stack/tile/plasteel/dark

/obj/structure/catwalk/over/plated_catwalk/white
	name = "plated catwalk"
	plated_tile = /obj/item/stack/tile/plasteel/white

/obj/structure/catwalk/update_icon()
	..()
	cut_overlays()
	icon_state = hatch_open ? "open" : "catwalk"
	if(plated_tile)
		var/turf/open/floor/turf_type = initial(plated_tile.turf_type)
		smoothing_flags &= ~SMOOTH_BITMASK
		SSicon_smooth.remove_from_queues(src)
		var/image/I = image('whitesands/icons/obj/catwalks.dmi', "plated")
		I.color = initial(turf_type.color)
		overlays += I
	else
		smoothing_flags |= SMOOTH_BITMASK

/obj/structure/catwalk/examine(mob/user)
	. = ..()
	if(!(resistance_flags & INDESTRUCTIBLE))
		. += "<span class='notice'>The supporting rods look like they could be <b>sliced</b>.</span>"

/obj/structure/catwalk/attackby(obj/item/C, mob/user, params)
	if(C.tool_behaviour == TOOL_WELDER && !(resistance_flags & INDESTRUCTIBLE))
		to_chat(user, "<span class='notice'>You slice off [src]</span>")
		deconstruct()
		return
	if(C.tool_behaviour == TOOL_CROWBAR && plated_tile)
		hatch_open = !hatch_open
		if(hatch_open)
			C.play_tool_sound(src, 100)
			to_chat(user, "<span class='notice'>You pry open \the [src]'s maintenance hatch.</span>")
		else
			playsound(src, 'sound/items/Deconstruct.ogg', 100, 2)
			to_chat(user, "<span class='notice'>You shut \the [src]'s maintenance hatch.</span>")
		update_icon()
		return
	if(istype(C, /obj/item/stack/tile) && !plated_tile)
		var/obj/item/stack/tile/plasteel/ST = C
		to_chat(user, "<span class='notice'>Placing tile...</span>")
		if(do_after(user, 30, target = src))
			to_chat(user, "<span class='notice'>You plate \the [src]</span>")
			name = "plated catwalk"
			src.add_fingerprint(user)
			if(ST.use(1))
				plated_tile = ST.type
				update_icon()
		return
	return ..()

/obj/structure/catwalk/Move(atom/newloc)
	var/turf/T = loc
	if(!istype(T, /turf/open/floor))
		for(var/obj/structure/cable/C in T)
			C.deconstruct()
	return ..()

/obj/structure/catwalk/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/rods(get_turf(src), number_of_rods)
	qdel(src)
	var/turf/T = loc
	if(!istype(T, /turf/open/floor))
		for(var/obj/structure/cable/C in T)
			C.deconstruct()
	return ..()
