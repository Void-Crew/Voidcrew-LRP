/obj/mecha/combat/five_stars
	desc = "The FV-101, the combat tank of the modern era. Lightweight enough to be transported on your average ship, while still packing enough of a punch to tear a new hole in any attacker. The flagship armoured vehicle of any force worth its salt."
	name = "tank"
	icon = 'icons/mecha/mecha_96x96.dmi'
	icon_state = "five_stars"
	armor = list("melee" = 95, "bullet" = 45, "laser" = 30, "energy" = 30, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 100)
	exit_delay = 20
	step_in = 2 //almost as fast as a ripley
	dir_in = 1 //Facing North.
	max_integrity = 400
	pixel_x = -32
	pixel_y = -32

/obj/mecha/combat/five_stars/Initialize()
	. = ..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/spacecops(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/lmg/hull(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay(src)
	ME.attach(src)
	max_ammo()

/obj/mecha/combat/five_stars/mechturn(direction)
	if(prob(80))
		crush_floor()
	return ..()

/obj/mecha/combat/five_stars/domove(direction)
	. = ..()
	if (.)
		if(prob(30))
			crush_floor()

/obj/mecha/combat/five_stars/proc/crush_floor() //DID I MENTION THE TANK IS A TANK (shouldnt cause hull breaches)
	var/turf/open/floor/tile = get_turf(src)
	if(!istype(tile, /turf/open/floor))
		return
	tile.crush()
