/obj/item/stack/tile
	name = "broken tile"
	singular_name = "broken tile"
	desc = "A broken tile. This should not exist."
	lefthand_file = 'icons/mob/inhands/misc/tiles_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/tiles_righthand.dmi'
	icon = 'icons/obj/tiles.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	force = 1
	throwforce = 1
	throw_speed = 3
	throw_range = 7
	max_amount = 60
	novariants = TRUE
	/// What type of turf does this tile produce.
	var/turf_type = null
	/// Determines certain welder interactions.
	var/mineralType = null
	/// Cached associative lazy list to hold the radial options for tile reskinning. See tile_reskinning.dm for more information. Pattern: list[type] -> image
	var/list/tile_reskin_types


/obj/item/stack/tile/Initialize(mapload, amount)
	. = ..()
	pixel_x = rand(-3, 3)
	pixel_y = rand(-3, 3) //randomize a little
	if(tile_reskin_types)
		tile_reskin_types = tile_reskin_list(tile_reskin_types)


/obj/item/stack/tile/examine(mob/user)
	. = ..()
	if(throwforce && !is_cyborg) //do not want to divide by zero or show the message to borgs who can't throw
		var/verb
		switch(CEILING(MAX_LIVING_HEALTH / throwforce, 1)) //throws to crit a human
			if(1 to 3)
				verb = "superb"
			if(4 to 6)
				verb = "great"
			if(7 to 9)
				verb = "good"
			if(10 to 12)
				verb = "fairly decent"
			if(13 to 15)
				verb = "mediocre"
		if(!verb)
			return
		. += "<span class='notice'>Those could work as a [verb] throwing weapon.</span>"


/obj/item/stack/tile/attackby(obj/item/W, mob/user, params)

	if (W.tool_behaviour == TOOL_WELDER)
		if(get_amount() < 4)
			to_chat(user, "<span class='warning'>You need at least four tiles to do this!</span>")
			return

		if(!mineralType)
			to_chat(user, "<span class='warning'>You can not reform this!</span>")
			return

		if(W.use_tool(src, user, 0, volume=40))
			if(mineralType == "plasma")
				atmos_spawn_air("plasma=5;TEMP=1000")
				user.visible_message("<span class='warning'>[user.name] sets the plasma tiles on fire!</span>", \
									"<span class='warning'>You set the plasma tiles on fire!</span>")
				qdel(src)
				return

			if (mineralType == "metal")
				var/obj/item/stack/sheet/metal/new_item = new(user.loc)
				user.visible_message(
					"<span class='notice'>[user.name] shaped [src] into metal with the welding tool.</span>",
					"<span class='notice'>You shaped [src] into metal with the welding tool.</span>",
					"<span class='hear'>You hear welding.</span>"
				)
				var/obj/item/stack/rods/R = src
				src = null
				var/replace = (user.get_inactive_held_item()==R)
				R.use(4)
				if (!R && replace)
					user.put_in_hands(new_item)

			else
				var/sheet_type = text2path("/obj/item/stack/sheet/mineral/[mineralType]")
				var/obj/item/stack/sheet/mineral/new_item = new sheet_type(user.loc)
				user.visible_message(
					"<span class='notice'>[user.name] shaped [src] into a sheet with the welding tool.</span>",
					"<span class='notice'>You shaped [src] into a sheet with the welding tool.</span>",
					"<span class='hear'>You hear welding.</span>"
				)
				var/obj/item/stack/rods/R = src
				src = null
				var/replace = (user.get_inactive_held_item()==R)
				R.use(4)
				if (!R && replace)
					user.put_in_hands(new_item)
	else
		return ..()

/obj/item/stack/tile/iron/base //this subtype should be used for most stuff
	merge_type = /obj/item/stack/tile/iron/base

/obj/item/stack/tile/iron/base/cyborg //cant reskin these, fucks with borg code
	tile_reskin_types = null

//Grass
/obj/item/stack/tile/grass
	name = "grass tile"
	singular_name = "grass floor tile"
	desc = "A patch of grass like they use on space golf courses."
	icon_state = "tile_grass"
	item_state = "tile-grass"
	turf_type = /turf/open/floor/grass
	resistance_flags = FLAMMABLE

//Fairygrass
/obj/item/stack/tile/fairygrass
	name = "fairygrass tile"
	singular_name = "fairygrass floor tile"
	desc = "A patch of odd, glowing blue grass."
	icon_state = "tile_fairygrass"
	item_state = "tile-fairygrass"
	turf_type = /turf/open/floor/grass/fairy
	resistance_flags = FLAMMABLE

//Plastic
/obj/item/stack/tile/plastic
	name = "plastic tile"
	singular_name = "plastic floor tile"
	desc = "A tile of cheap, flimsy plastic flooring."
	icon_state = "tile_plastic"
	custom_materials = list(/datum/material/plastic=500)
	turf_type = /turf/open/floor/plastic
//Wood
/obj/item/stack/tile/wood
	name = "wood floor tile"
	singular_name = "wood floor tile"
	desc = "An easy to fit wood floor tile. Use while in your hand to change what pattern you want."
	icon_state = "tile-wood"
	turf_type = /turf/open/floor/wood
	resistance_flags = FLAMMABLE
	merge_type = /obj/item/stack/tile/wood
	tile_reskin_types = list(
		/obj/item/stack/tile/wood,
		/obj/item/stack/tile/wood/large,
		/obj/item/stack/tile/wood/tile,
		/obj/item/stack/tile/wood/parquet,
	)

/obj/item/stack/tile/wood/parquet
	name = "parquet wood floor tile"
	singular_name = "parquet wood floor tile"
	icon_state = "tile-wood_parquet"
	turf_type = /turf/open/floor/wood/parquet
	merge_type = /obj/item/stack/tile/wood/parquet

/obj/item/stack/tile/wood/large
	name = "large wood floor tile"
	singular_name = "large wood floor tile"
	icon_state = "tile-wood_large"
	turf_type = /turf/open/floor/wood/large
	merge_type = /obj/item/stack/tile/wood/large

/obj/item/stack/tile/wood/tile
	name = "tiled wood floor tile"
	singular_name = "tiled wood floor tile"
	icon_state = "tile-wood_tile"
	turf_type = /turf/open/floor/wood/tile
	merge_type = /obj/item/stack/tile/wood/tile

//Basalt
/obj/item/stack/tile/basalt
	name = "basalt tile"
	singular_name = "basalt floor tile"
	desc = "Artificially made ashy soil themed on a hostile environment."
	icon_state = "tile_basalt"
	item_state = "tile-basalt"
	turf_type = /turf/open/floor/grass/fakebasalt

//Carpets
/obj/item/stack/tile/carpet
	name = "carpet"
	singular_name = "carpet"
	desc = "A piece of carpet. It is the same size as a floor tile."
	icon_state = "tile-carpet"
	item_state = "tile-carpet"
	turf_type = /turf/open/floor/carpet
	resistance_flags = FLAMMABLE
	tableVariant = /obj/structure/table/wood/fancy

/obj/item/stack/tile/carpet/red_gold
	name = "fancy red carpet"
	icon_state = "tile-carpet-red_gold"
	item_state = "tile-carpet-red_gold"
	turf_type = /turf/open/floor/carpet/red_gold
	tableVariant = /obj/structure/table/wood/fancy/red_gold

/obj/item/stack/tile/carpet/black
	name = "black carpet"
	icon_state = "tile-carpet-black"
	item_state = "tile-carpet-black"
	turf_type = /turf/open/floor/carpet/black
	tableVariant = /obj/structure/table/wood/fancy/black

/obj/item/stack/tile/carpet/blue
	name = "blue carpet"
	icon_state = "tile-carpet-blue"
	item_state = "tile-carpet-blue"
	turf_type = /turf/open/floor/carpet/blue
	tableVariant = /obj/structure/table/wood/fancy/blue

/obj/item/stack/tile/carpet/cyan
	name = "cyan carpet"
	icon_state = "tile-carpet-cyan"
	item_state = "tile-carpet-cyan"
	turf_type = /turf/open/floor/carpet/cyan
	tableVariant = /obj/structure/table/wood/fancy/cyan

/obj/item/stack/tile/carpet/green
	name = "green carpet"
	icon_state = "tile-carpet-green"
	item_state = "tile-carpet-green"
	turf_type = /turf/open/floor/carpet/green
	tableVariant = /obj/structure/table/wood/fancy/green

/obj/item/stack/tile/carpet/orange
	name = "orange carpet"
	icon_state = "tile-carpet-orange"
	item_state = "tile-carpet-orange"
	turf_type = /turf/open/floor/carpet/orange
	tableVariant = /obj/structure/table/wood/fancy/orange

/obj/item/stack/tile/carpet/purple
	name = "purple carpet"
	icon_state = "tile-carpet-purple"
	item_state = "tile-carpet-purple"
	turf_type = /turf/open/floor/carpet/purple
	tableVariant = /obj/structure/table/wood/fancy/purple

/obj/item/stack/tile/carpet/red
	name = "red carpet"
	icon_state = "tile-carpet-red"
	item_state = "tile-carpet-red"
	turf_type = /turf/open/floor/carpet/red
	tableVariant = /obj/structure/table/wood/fancy/red

/obj/item/stack/tile/carpet/royalblack
	name = "royal black carpet"
	icon_state = "tile-carpet-royalblack"
	item_state = "tile-carpet-royalblack"
	turf_type = /turf/open/floor/carpet/royalblack
	tableVariant = /obj/structure/table/wood/fancy/royalblack

/obj/item/stack/tile/carpet/royalblue
	name = "royal blue carpet"
	icon_state = "tile-carpet-royalblue"
	item_state = "tile-carpet-royalblue"
	turf_type = /turf/open/floor/carpet/royalblue
	tableVariant = /obj/structure/table/wood/fancy/royalblue

/obj/item/stack/tile/carpet/executive
	name = "executive carpet"
	icon_state = "tile_carpet_executive"
	item_state = "tile-carpet-royalblue"
	turf_type = /turf/open/floor/carpet/executive

/obj/item/stack/tile/carpet/stellar
	name = "stellar carpet"
	icon_state = "tile_carpet_stellar"
	item_state = "tile-carpet-royalblue"
	turf_type = /turf/open/floor/carpet/stellar

/obj/item/stack/tile/carpet/donk
	name = "donk co promotional carpet"
	icon_state = "tile_carpet_donk"
	item_state = "tile-carpet-orange"
	turf_type = /turf/open/floor/carpet/donk

/obj/item/stack/tile/carpet/fifty
	amount = 50

/obj/item/stack/tile/carpet/black/fifty
	amount = 50

/obj/item/stack/tile/carpet/blue/fifty
	amount = 50

/obj/item/stack/tile/carpet/cyan/fifty
	amount = 50

/obj/item/stack/tile/carpet/green/fifty
	amount = 50

/obj/item/stack/tile/carpet/orange/fifty
	amount = 50

/obj/item/stack/tile/carpet/purple/fifty
	amount = 50

/obj/item/stack/tile/carpet/red/fifty
	amount = 50

/obj/item/stack/tile/carpet/royalblack/fifty
	amount = 50

/obj/item/stack/tile/carpet/royalblue/fifty
	amount = 50


/obj/item/stack/tile/fakespace
	name = "astral carpet"
	singular_name = "astral carpet"
	desc = "A piece of carpet with a convincing star pattern."
	icon_state = "tile_space"
	item_state = "tile-space"
	turf_type = /turf/open/floor/fakespace
	resistance_flags = FLAMMABLE
	merge_type = /obj/item/stack/tile/fakespace

/obj/item/stack/tile/fakespace/loaded
	amount = 30

/obj/item/stack/tile/fakepit
	name = "fake pits"
	singular_name = "fake pit"
	desc = "A piece of carpet with a forced perspective illusion of a pit. No way this could fool anyone!"
	icon_state = "tile_pit"
	item_state = "tile-basalt"
	turf_type = /turf/open/floor/fakepit
	resistance_flags = FLAMMABLE
	merge_type = /obj/item/stack/tile/fakepit

/obj/item/stack/tile/fakepit/loaded
	amount = 30

//High-traction
/obj/item/stack/tile/noslip
	name = "high-traction floor tile"
	singular_name = "high-traction floor tile"
	desc = "A high-traction floor tile. It feels rubbery in your hand."
	icon_state = "tile_noslip"
	item_state = "tile-noslip"
	turf_type = /turf/open/floor/noslip
	merge_type = /obj/item/stack/tile/noslip

/obj/item/stack/tile/noslip/thirty
	amount = 30

//Circuit
/obj/item/stack/tile/circuit
	name = "blue circuit tile"
	singular_name = "blue circuit tile"
	desc = "A blue circuit tile."
	icon_state = "tile_bcircuit"
	item_state = "tile-bcircuit"
	turf_type = /turf/open/floor/circuit
	custom_materials = list(/datum/material/iron = 500, /datum/material/glass = 500) // WS Edit - Item Materials
	tile_reskin_types = list(
		/obj/item/stack/tile/circuit,
		/obj/item/stack/tile/circuit/green,
		/obj/item/stack/tile/circuit/red
		)

/obj/item/stack/tile/circuit/green
	name = "green circuit tile"
	singular_name = "green circuit tile"
	desc = "A green circuit tile."
	icon_state = "tile_gcircuit"
	item_state = "tile-gcircuit"
	turf_type = /turf/open/floor/circuit/green

/obj/item/stack/tile/circuit/green/anim
	turf_type = /turf/open/floor/circuit/green/anim

/obj/item/stack/tile/circuit/red
	name = "red circuit tile"
	singular_name = "red circuit tile"
	desc = "A red circuit tile."
	icon_state = "tile_rcircuit"
	item_state = "tile-rcircuit"
	turf_type = /turf/open/floor/circuit/red

/obj/item/stack/tile/circuit/red/anim
	turf_type = /turf/open/floor/circuit/red/anim

//Pod floor
/obj/item/stack/tile/pod
	name = "pod floor tile"
	singular_name = "pod floor tile"
	desc = "A grooved floor tile."
	icon_state = "tile_pod"
	item_state = "tile-pod"
	turf_type = /turf/open/floor/pod
	tile_reskin_types = list(
		/obj/item/stack/tile/pod,
		/obj/item/stack/tile/pod/light,
		/obj/item/stack/tile/pod/dark
		)

/obj/item/stack/tile/pod/light
	name = "light pod floor tile"
	singular_name = "light pod floor tile"
	desc = "A lightly colored grooved floor tile."
	icon_state = "tile_podlight"
	turf_type = /turf/open/floor/pod/light

/obj/item/stack/tile/pod/dark
	name = "dark pod floor tile"
	singular_name = "dark pod floor tile"
	desc = "A darkly colored grooved floor tile."
	icon_state = "tile_poddark"
	turf_type = /turf/open/floor/pod/dark

//Plasteel (normal)

/obj/item/stack/tile/iron
	name = "iron tile"
	singular_name = "floor tile"
	icon_state = "tile"
	turf_type = /turf/open/floor/iron
	merge_type = /obj/item/stack/tile/iron

/obj/item/stack/tile/iron/cyborg
	custom_materials = null // All other Borg versions of items have no Metal or Glass - RR
	is_cyborg = 1
	cost = 125

/obj/item/stack/tile/iron/edge
	name = "edge tile"
	singular_name = "edge floor tile"
	icon_state = "tile_edge"
	turf_type = /turf/open/floor/iron/edge
	merge_type = /obj/item/stack/tile/iron/edge

/obj/item/stack/tile/iron/half
	name = "half tile"
	singular_name = "half floor tile"
	icon_state = "tile_half"
	turf_type = /turf/open/floor/iron/half
	merge_type = /obj/item/stack/tile/iron/half

/obj/item/stack/tile/iron/corner
	name = "corner tile"
	singular_name = "corner floor tile"
	icon_state = "tile_corner"
	turf_type = /turf/open/floor/iron/corner
	merge_type = /obj/item/stack/tile/iron/corner

/obj/item/stack/tile/iron/large
	name = "large tile"
	singular_name = "large floor tile"
	icon_state = "tile_large"
	turf_type = /turf/open/floor/iron/large
	merge_type = /obj/item/stack/tile/iron/large

/obj/item/stack/tile/iron/textured
	name = "textured tile"
	singular_name = "textured floor tile"
	icon_state = "tile_textured"
	turf_type = /turf/open/floor/iron/textured
	merge_type = /obj/item/stack/tile/iron/textured

/obj/item/stack/tile/iron/textured_edge
	name = "textured edge tile"
	singular_name = "edged textured floor tile"
	icon_state = "tile_textured_edge"
	turf_type = /turf/open/floor/iron/textured_edge
	merge_type = /obj/item/stack/tile/iron/textured_edge

/obj/item/stack/tile/iron/textured_half
	name = "textured half tile"
	singular_name = "halved textured floor tile"
	icon_state = "tile_textured_half"
	turf_type = /turf/open/floor/iron/textured_half
	merge_type = /obj/item/stack/tile/iron/textured_half

/obj/item/stack/tile/iron/textured_corner
	name = "textured corner tile"
	singular_name = "cornered textured floor tile"
	icon_state = "tile_textured_corner"
	turf_type = /turf/open/floor/iron/textured_corner
	merge_type = /obj/item/stack/tile/iron/textured_corner

/obj/item/stack/tile/iron/textured_large
	name = "textured large tile"
	singular_name = "large textured floor tile"
	icon_state = "tile_textured_large"
	turf_type = /turf/open/floor/iron/textured_large
	merge_type = /obj/item/stack/tile/iron/textured_large

/obj/item/stack/tile/iron/small
	name = "small tile"
	singular_name = "small floor tile"
	icon_state = "tile_small"
	turf_type = /turf/open/floor/iron/small
	merge_type = /obj/item/stack/tile/iron/small

/obj/item/stack/tile/iron/diagonal
	name = "diagonal tile"
	singular_name = "diagonal floor tile"
	icon_state = "tile_diagonal"
	turf_type = /turf/open/floor/iron/diagonal
	merge_type = /obj/item/stack/tile/iron/diagonal

/obj/item/stack/tile/iron/herringbone
	name = "herringbone tile"
	singular_name = "herringbone floor tile"
	icon_state = "tile_herringbone"
	turf_type = /turf/open/floor/iron/herringbone
	merge_type = /obj/item/stack/tile/iron/herringbone

/obj/item/stack/tile/iron/white
	name = "white tile"
	singular_name = "white floor tile"
	icon_state = "tile_white"
	turf_type = /turf/open/floor/iron/white
	merge_type = /obj/item/stack/tile/iron/white

/obj/item/stack/tile/iron/white/smooth_edge
	name = "white edge tile"
	singular_name = "edged white floor tile"
	icon_state = "tile_white_edge"
	turf_type = /turf/open/floor/iron/white/smooth_edge
	merge_type = /obj/item/stack/tile/iron/white/smooth_edge

/obj/item/stack/tile/iron/white/smooth_half
	name = "white half tile"
	singular_name = "halved white floor tile"
	icon_state = "tile_white_half"
	turf_type = /turf/open/floor/iron/white/smooth_half
	merge_type = /obj/item/stack/tile/iron/white/smooth_half

/obj/item/stack/tile/iron/white/smooth_corner
	name = "white corner tile"
	singular_name = "cornered white floor tile"
	icon_state = "tile_white_corner"
	turf_type = /turf/open/floor/iron/white/smooth_corner
	merge_type = /obj/item/stack/tile/iron/white/smooth_corner

/obj/item/stack/tile/iron/white/smooth_large
	name = "white large tile"
	singular_name = "large white floor tile"
	icon_state = "tile_white_large"
	turf_type = /turf/open/floor/iron/white/smooth_large
	merge_type = /obj/item/stack/tile/iron/white/smooth_large

/obj/item/stack/tile/iron/white_side
	name = "half white tile"
	singular_name = "half white floor tile"
	icon_state = "tile_whiteside"
	turf_type = /turf/open/floor/iron/white/side
	merge_type = /obj/item/stack/tile/iron/white_side

/obj/item/stack/tile/iron/white_corner
	name = "quarter white tile"
	singular_name = "quarter white floor tile"
	icon_state = "tile_whitecorner"
	turf_type = /turf/open/floor/iron/white/corner
	merge_type = /obj/item/stack/tile/iron/white_corner

/obj/item/stack/tile/iron/white/textured
	name = "white textured tile"
	singular_name = "white textured floor tile"
	icon_state = "tile_textured_white"
	turf_type = /turf/open/floor/iron/white/textured
	merge_type = /obj/item/stack/tile/iron/white/textured

/obj/item/stack/tile/iron/white/textured_edge
	name = "white textured edge tile"
	singular_name = "edged white textured floor tile"
	icon_state = "tile_textured_white_edge"
	turf_type = /turf/open/floor/iron/white/textured_edge
	merge_type = /obj/item/stack/tile/iron/white/textured_edge

/obj/item/stack/tile/iron/white/textured_half
	name = "white textured half tile"
	singular_name = "halved white textured floor tile"
	icon_state = "tile_textured_white_half"
	turf_type = /turf/open/floor/iron/white/textured_half
	merge_type = /obj/item/stack/tile/iron/white/textured_half

/obj/item/stack/tile/iron/white/textured_corner
	name = "white textured corner tile"
	singular_name = "cornered white textured floor tile"
	icon_state = "tile_textured_white_corner"
	turf_type = /turf/open/floor/iron/white/textured_corner
	merge_type = /obj/item/stack/tile/iron/white/textured_corner

/obj/item/stack/tile/iron/white/textured_large
	name = "white textured large tile"
	singular_name = "large white textured floor tile"
	icon_state = "tile_textured_white_large"
	turf_type = /turf/open/floor/iron/white/textured_large
	merge_type = /obj/item/stack/tile/iron/white/textured_large

/obj/item/stack/tile/iron/white/small
	name = "white small tile"
	singular_name = "white small floor tile"
	icon_state = "tile_white_small"
	turf_type = /turf/open/floor/iron/white/small
	merge_type = /obj/item/stack/tile/iron/white/small

/obj/item/stack/tile/iron/white/diagonal
	name = "white diagonal tile"
	singular_name = "white diagonal floor tile"
	icon_state = "tile_white_diagonal"
	turf_type = /turf/open/floor/iron/white/diagonal
	merge_type = /obj/item/stack/tile/iron/white/diagonal

/obj/item/stack/tile/iron/white/herringbone
	name = "white herringbone tile"
	singular_name = "white herringbone floor tile"
	icon_state = "tile_white_herringbone"
	turf_type = /turf/open/floor/iron/white/herringbone
	merge_type = /obj/item/stack/tile/iron/white/herringbone

/obj/item/stack/tile/iron/dark
	name = "dark tile"
	singular_name = "dark floor tile"
	icon_state = "tile_dark"
	turf_type = /turf/open/floor/iron/dark
	merge_type = /obj/item/stack/tile/iron/dark

/obj/item/stack/tile/iron/dark/smooth_edge
	name = "dark edge tile"
	singular_name = "edged dark floor tile"
	icon_state = "tile_dark_edge"
	turf_type = /turf/open/floor/iron/dark/smooth_edge
	merge_type = /obj/item/stack/tile/iron/dark/smooth_edge

/obj/item/stack/tile/iron/dark/smooth_half
	name = "dark half tile"
	singular_name = "halved dark floor tile"
	icon_state = "tile_dark_half"
	turf_type = /turf/open/floor/iron/dark/smooth_half
	merge_type = /obj/item/stack/tile/iron/dark/smooth_half

/obj/item/stack/tile/iron/dark/smooth_corner
	name = "dark corner tile"
	singular_name = "cornered dark floor tile"
	icon_state = "tile_dark_corner"
	turf_type = /turf/open/floor/iron/dark/smooth_corner
	merge_type = /obj/item/stack/tile/iron/dark/smooth_corner

/obj/item/stack/tile/iron/dark/smooth_large
	name = "dark large tile"
	singular_name = "large dark floor tile"
	icon_state = "tile_dark_large"
	turf_type = /turf/open/floor/iron/dark/smooth_large
	merge_type = /obj/item/stack/tile/iron/dark/smooth_large

/obj/item/stack/tile/iron/dark_side
	name = "half dark tile"
	singular_name = "half dark floor tile"
	icon_state = "tile_darkside"
	turf_type = /turf/open/floor/iron/dark/side
	merge_type = /obj/item/stack/tile/iron/dark_side

/obj/item/stack/tile/iron/dark_corner
	name = "quarter dark tile"
	singular_name = "quarter dark floor tile"
	icon_state = "tile_darkcorner"
	turf_type = /turf/open/floor/iron/dark/corner
	merge_type = /obj/item/stack/tile/iron/dark_corner

/obj/item/stack/tile/iron/dark/textured
	name = "dark textured tile"
	singular_name = "dark textured floor tile"
	icon_state = "tile_textured_dark"
	turf_type = /turf/open/floor/iron/dark/textured
	merge_type = /obj/item/stack/tile/iron/dark/textured

/obj/item/stack/tile/iron/dark/textured_edge
	name = "dark textured edge tile"
	singular_name = "edged dark textured floor tile"
	icon_state = "tile_textured_dark_edge"
	turf_type = /turf/open/floor/iron/dark/textured_edge
	merge_type = /obj/item/stack/tile/iron/dark/textured_edge

/obj/item/stack/tile/iron/dark/textured_half
	name = "dark textured half tile"
	singular_name = "halved dark textured floor tile"
	icon_state = "tile_textured_dark_half"
	turf_type = /turf/open/floor/iron/dark/textured_half
	merge_type = /obj/item/stack/tile/iron/dark/textured_half

/obj/item/stack/tile/iron/dark/textured_corner
	name = "dark textured corner tile"
	singular_name = "cornered dark textured floor tile"
	icon_state = "tile_textured_dark_corner"
	turf_type = /turf/open/floor/iron/dark/textured_corner
	merge_type = /obj/item/stack/tile/iron/dark/textured_corner

/obj/item/stack/tile/iron/dark/textured_large
	name = "dark textured large tile"
	singular_name = "large dark textured floor tile"
	icon_state = "tile_textured_dark_large"
	turf_type = /turf/open/floor/iron/dark/textured_large
	merge_type = /obj/item/stack/tile/iron/dark/textured_large

/obj/item/stack/tile/iron/dark/small
	name = "dark small tile"
	singular_name = "dark small floor tile"
	icon_state = "tile_dark_small"
	turf_type = /turf/open/floor/iron/dark/small
	merge_type = /obj/item/stack/tile/iron/dark/small

/obj/item/stack/tile/iron/dark/diagonal
	name = "dark diagonal tile"
	singular_name = "dark diagonal floor tile"
	icon_state = "tile_dark_diagonal"
	turf_type = /turf/open/floor/iron/dark/diagonal
	merge_type = /obj/item/stack/tile/iron/dark/diagonal

/obj/item/stack/tile/iron/dark/herringbone
	name = "dark herringbone tile"
	singular_name = "dark herringbone floor tile"
	icon_state = "tile_dark_herringbone"
	turf_type = /turf/open/floor/iron/dark/herringbone
	merge_type = /obj/item/stack/tile/iron/dark/herringbone

/obj/item/stack/tile/iron/checker
	name = "checker tile"
	singular_name = "checker floor tile"
	icon_state = "tile_checker"
	turf_type = /turf/open/floor/iron/checker
	merge_type = /obj/item/stack/tile/iron/checker

/obj/item/stack/tile/iron/cafeteria
	name = "cafeteria tile"
	singular_name = "cafeteria floor tile"
	icon_state = "tile_cafeteria"
	turf_type = /turf/open/floor/iron/cafeteria
	merge_type = /obj/item/stack/tile/iron/cafeteria

/obj/item/stack/tile/iron/smooth
	name = "smooth tile"
	singular_name = "smooth floor tile"
	icon_state = "tile_smooth"
	turf_type = /turf/open/floor/iron/smooth
	merge_type = /obj/item/stack/tile/iron/smooth

/obj/item/stack/tile/iron/smooth_edge
	name = "smooth edge tile"
	singular_name = "edged smooth floor tile"
	icon_state = "tile_smooth_edge"
	turf_type = /turf/open/floor/iron/smooth_edge
	merge_type = /obj/item/stack/tile/iron/smooth_edge

/obj/item/stack/tile/iron/smooth_half
	name = "smooth half tile"
	singular_name = "halved smooth floor tile"
	icon_state = "tile_smooth_half"
	turf_type = /turf/open/floor/iron/smooth_half
	merge_type = /obj/item/stack/tile/iron/smooth_half

/obj/item/stack/tile/iron/smooth_corner
	name = "smooth corner tile"
	singular_name = "cornered smooth floor tile"
	icon_state = "tile_smooth_corner"
	turf_type = /turf/open/floor/iron/smooth_corner
	merge_type = /obj/item/stack/tile/iron/smooth_corner

/obj/item/stack/tile/iron/smooth_large
	name = "smooth large tile"
	singular_name = "large smooth floor tile"
	icon_state = "tile_smooth_large"
	turf_type = /turf/open/floor/iron/smooth_large
	merge_type = /obj/item/stack/tile/iron/smooth_large

/obj/item/stack/tile/iron/kitchen
	name = "kitchen tile"
	singular_name = "kitchen tile"
	icon_state = "tile_kitchen"
	turf_type = /turf/open/floor/iron/kitchen
	merge_type = /obj/item/stack/tile/iron/kitchen

/obj/item/stack/tile/iron/kitchen/small
	name = "small kitchen tile"
	singular_name = "small kitchen floor tile"
	icon_state = "tile_kitchen_small"
	turf_type = /turf/open/floor/iron/kitchen/small
	merge_type = /obj/item/stack/tile/iron/kitchen/small

/obj/item/stack/tile/iron/kitchen/diagonal
	name = "diagonal kitchen tile"
	singular_name = "diagonal kitchen floor tile"
	icon_state = "tile_kitchen_diagonal"
	turf_type = /turf/open/floor/iron/kitchen/diagonal
	merge_type = /obj/item/stack/tile/iron/kitchen/diagonal

/obj/item/stack/tile/iron/kitchen/herringbone
	name = "herringbone kitchen tile"
	singular_name = "herringbone kitchen floor tile"
	icon_state = "tile_kitchen_herringbone"
	turf_type = /turf/open/floor/iron/kitchen/herringbone
	merge_type = /obj/item/stack/tile/iron/kitchen/herringbone

/obj/item/stack/tile/iron/chapel
	name = "chapel floor tile"
	singular_name = "chapel floor tile"
	icon_state = "tile_chapel"
	turf_type = /turf/open/floor/iron/chapel
	merge_type = /obj/item/stack/tile/iron/chapel

/obj/item/stack/tile/iron/showroomfloor
	name = "showroom floor tile"
	singular_name = "showroom floor tile"
	icon_state = "tile_showroom"
	turf_type = /turf/open/floor/iron/showroomfloor
	merge_type = /obj/item/stack/tile/iron/showroomfloor

/obj/item/stack/tile/iron/solarpanel
	name = "solar panel tile"
	singular_name = "solar panel floor tile"
	icon_state = "tile_solarpanel"
	turf_type = /turf/open/floor/iron/solarpanel
	merge_type = /obj/item/stack/tile/iron/solarpanel

/obj/item/stack/tile/iron/freezer
	name = "freezer floor tile"
	singular_name = "freezer floor tile"
	icon_state = "tile_freezer"
	turf_type = /turf/open/floor/iron/freezer
	merge_type = /obj/item/stack/tile/iron/freezer

/obj/item/stack/tile/iron/grimy
	name = "grimy floor tile"
	singular_name = "grimy floor tile"
	icon_state = "tile_grimy"
	turf_type = /turf/open/floor/iron/grimy
	merge_type = /obj/item/stack/tile/iron/grimy

/obj/item/stack/tile/eighties
	name = "retro tile"
	singular_name = "retro floor tile"
	desc = "A stack of floor tiles that remind you of an age of funk."
	icon_state = "tile_eighties"
	turf_type = /turf/open/floor/eighties

/obj/item/stack/tile/iron/tech
	name = "techfloor tile"
	icon_state = "tile_podlight"
	turf_type = /turf/open/floor/iron/tech
	merge_type = /obj/item/stack/tile/iron/tech

/obj/item/stack/tile/iron/tech/grid
	name = "techfloor grid tile"
	icon_state = "tile_poddark"
	turf_type = /turf/open/floor/iron/tech/grid
	merge_type = /obj/item/stack/tile/iron/tech/grid

/obj/item/stack/tile/iron/tech/techmaint
	name = "techmaint tile"
	icon_state = "tile_pod"
	turf_type = /turf/open/floor/iron/tech/techmaint
	merge_type = /obj/item/stack/tile/iron/tech/techmaint

/obj/item/stack/tile/eighties/loaded
	amount = 15
