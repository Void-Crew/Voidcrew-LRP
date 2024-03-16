/obj/item/gun/ballistic/automatic
	w_class = WEIGHT_CLASS_NORMAL
	var/select = 1
	can_suppress = TRUE
	actions_types = list(/datum/action/item_action/toggle_firemode)
	semi_auto = TRUE
	fire_sound = 'sound/weapons/gun/smg/shot.ogg'
	fire_sound_volume = 90
	vary_fire_sound = FALSE
	rack_sound = 'sound/weapons/gun/smg/smgrack.ogg'
	suppressed_sound = 'sound/weapons/gun/smg/shot_suppressed.ogg'
	automatic = 1
	weapon_weight = WEAPON_MEDIUM
	pickup_sound =  'sound/items/handling/rifle_pickup.ogg'

	spread = 0
	recoil = 0

/obj/item/gun/ballistic/automatic/update_overlays()
	. = ..()
	if(!select)
		. += "[initial(icon_state)]_semi"
	if(select == 1)
		. += "[initial(icon_state)]_burst"

/obj/item/gun/ballistic/automatic/ui_action_click(mob/user, actiontype)
	if(istype(actiontype, /datum/action/item_action/toggle_firemode))
		burst_select()
	else
		..()

/obj/item/gun/ballistic/automatic/proc/burst_select()
	var/mob/living/carbon/human/user = usr
	select = !select
	if(!select)
		burst_size = 1
		fire_delay = 0
		to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	else
		burst_size = initial(burst_size)
		fire_delay = initial(fire_delay)
		to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")

	playsound(user, 'sound/weapons/gun/general/selector.ogg', 100, TRUE)
	update_icon()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

// SNIPER //

/obj/item/gun/ballistic/automatic/sniper_rifle
	name = "sniper rifle"
	desc = "An anti-material rifle chambered in .50 BMG with a scope mounted on it. Its prodigious bulk requires both hands to use."
	icon_state = "sniper"
	item_state = "sniper"
	fire_sound = 'sound/weapons/gun/sniper/shot.ogg'
	fire_sound_volume = 90
	vary_fire_sound = FALSE
	load_sound = 'sound/weapons/gun/sniper/mag_insert.ogg'
	rack_sound = 'sound/weapons/gun/sniper/rack.ogg'
	suppressed_sound = 'sound/weapons/gun/general/heavy_shot_suppressed.ogg'
	recoil = 2
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/sniper_rounds
	fire_delay = 40
	burst_size = 1
	w_class = WEIGHT_CLASS_NORMAL
	zoomable = TRUE
	zoom_amt = 10 //Long range, enough to see in front of you, but no tiles behind you.
	zoom_out_amt = 5
	slot_flags = ITEM_SLOT_BACK
	actions_types = list()
	mag_display = TRUE

	spread = -5
	recoil = 0

/obj/item/gun/ballistic/automatic/sniper_rifle/syndicate
	name = "syndicate sniper rifle"
	desc = "A heavily-modified .50 BMG anti-material rifle utilized by Syndicate agents. Requires both hands to fire."
	can_suppress = TRUE
	can_unsuppress = TRUE
	pin = /obj/item/firing_pin/implant/pindicate

// Old Semi-Auto Rifle //

/obj/item/gun/ballistic/automatic/surplus
	name = "surplus rifle"
	desc = "One of countless cheap, obsolete rifles found throughout the Frontier. Its lack of lethality renders it mostly a deterrent. Chambered in 10mm."
	icon_state = "surplus"
	item_state = "moistnugget"
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/m10mm/rifle
	fire_delay = 10
	burst_size = 1
	can_unsuppress = TRUE
	can_suppress = TRUE
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BACK
	actions_types = list()
	mag_display = TRUE

// Laser rifle (rechargeable magazine) //

/obj/item/gun/ballistic/automatic/laser
	name = "laser rifle"
	desc = "Though sometimes mocked for the relatively weak firepower of their energy weapons, the logistic miracle of rechargeable ammunition has given Nanotrasen a decisive edge over many a foe."
	icon_state = "oldrifle"
	item_state = "arg"
	mag_type = /obj/item/ammo_box/magazine/recharge
	fire_delay = 2
	can_suppress = FALSE
	burst_size = 0
	actions_types = list()
	fire_sound = 'sound/weapons/laser.ogg'
	casing_ejector = FALSE

/obj/item/gun/ballistic/automatic/ebr
	name = "\improper M514 EBR"
	desc = "A reliable, high-powered battle rifle often found in the hands of Syndicate personnel and remnants, chambered in .308. Effective against personnel and armor alike."
	icon = 'icons/obj/guns/48x32guns.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/64x_guns_left.dmi'
	righthand_file = 'icons/mob/inhands/weapons/64x_guns_right.dmi'
	icon_state = "ebr"
	item_state = "ebr"
	mag_display = TRUE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/ebr
	fire_sound = 'sound/weapons/gun/rifle/shot_alt2.ogg'
	burst_size = 0
	actions_types = list()

	spread = -4

/obj/item/gun/ballistic/automatic/gal
	name = "\improper CM-GAL-S"
	desc = "The standard issue DMR of the CMM. Dates back to the Xenofauna War, this particular model is in a carbine configuration, and, as such, is shorter than the standard model. Chambered in .308."
	icon = 'icons/obj/guns/48x32guns.dmi'
	fire_sound = 'sound/weapons/gun/rifle/shot.ogg'
	icon_state = "gal"
	item_state = "gal"
	mag_display = TRUE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/gal
	fire_sound = 'sound/weapons/gun/rifle/gal.ogg'
	burst_size = 0
	actions_types = list()

	spread = -4

/obj/item/gun/ballistic/automatic/gal/inteq
	name = "\improper SsG-04"
	desc = "A marksman rifle purchased from the Colonial Minutemen and modified to suit IRMG's needs. Chambered in .308."
	icon_state = "gal-inteq"
	item_state = "gal-inteq"

/obj/item/gun/ballistic/automatic/zip_pistol
	name = "makeshift pistol"
	desc = "A makeshift zip gun cobbled together from various scrap bits and chambered in 9mm. It's a miracle it even works."
	icon_state = "ZipPistol"
	item_state = "ZipPistol"
	mag_type = /obj/item/ammo_box/magazine/zip_ammo_9mm
	can_suppress = FALSE
	actions_types = list()
	can_bayonet = FALSE
	mag_display = TRUE
	weapon_weight = WEAPON_LIGHT

/obj/item/gun/ballistic/automatic/proto
	name = "\improper Nanotrasen Saber SMG"
	desc = "A prototype full-auto 9mm submachine gun, designated 'SABR'. Has a threaded barrel for suppressors and a folding stock."
	icon_state = "saber"
	actions_types = list()
	mag_type = /obj/item/ammo_box/magazine/smgm9mm
	fire_rate = 5
	pin = null
	bolt_type = BOLT_TYPE_LOCKING
	mag_display = TRUE

/obj/item/gun/ballistic/automatic/proto/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/c20r
	name = "\improper C-20r SMG"
	desc = "A bullpup .45 SMG designated 'C-20r.' Its buttstamp reads 'Scarborough Arms - Per falcis, per pravitas.'"
	icon_state = "c20r"
	item_state = "c20r"
	mag_type = /obj/item/ammo_box/magazine/smgm45
	can_bayonet = TRUE
	can_suppress = FALSE
	fire_delay = 2
	burst_size = 2
	knife_x_offset = 26
	knife_y_offset = 12
	mag_display = TRUE
	mag_display_ammo = TRUE
	empty_indicator = TRUE

/obj/item/gun/ballistic/automatic/c20r/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/c20r/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/ballistic/automatic/c20r/cobra
	name = "\improper Cobra 20"
	desc = "An older model of SMG manufactured by Scarborough Arms, a predecessor to the military C-20 series. Chambered in .45. "
	can_bayonet = FALSE
	icon_state = "cobra20"
	item_state = "cobra20"

/obj/item/gun/ballistic/automatic/c20r/suns
	desc = "A bullpup .45 SMG designated 'C-20r.' Its buttstamp reads 'Scarborough Arms - Per falcis, per pravitas.' This one is painted in SUNS' colors."
	icon_state = "c20r_suns"
	item_state = "c20r_suns"

/obj/item/gun/ballistic/automatic/inteq
	name = "\improper SkM-44(k)"
	desc = "An extreme modification of an obsolete assault rifle, converted into a compact submachine gun by IRMG. Chambered in 10mm."
	icon_state = "inteqsmg"
	item_state = "inteqsmg"
	fire_sound = 'sound/weapons/gun/smg/vector_fire.ogg'
	mag_type = /obj/item/ammo_box/magazine/smgm10mm
	can_bayonet = FALSE
	can_flashlight = TRUE
	flight_x_offset = 15
	flight_y_offset = 13
	can_suppress = TRUE
	mag_display = TRUE

/obj/item/gun/ballistic/automatic/wt550
	name = "\improper WT-550 Automatic Rifle"
	desc = "An outdated PDW, used centuries ago by Nanotrasen security elements. Uses 4.6x30mm rounds."
	icon_state = "wt550"
	item_state = "arg"
	mag_type = /obj/item/ammo_box/magazine/wt550m9
	can_suppress = FALSE
	burst_size = 1
	actions_types = list()
	can_bayonet = TRUE
	fire_rate = 4
	knife_x_offset = 25
	knife_y_offset = 12
	mag_display = TRUE
	mag_display_ammo = TRUE
	empty_indicator = TRUE
	fire_sound = 'sound/weapons/gun/smg/smg_heavy.ogg'

/obj/item/gun/ballistic/automatic/mini_uzi
	name = "\improper Type U3 Uzi"
	desc = "A lightweight submachine gun, for when you really want someone dead. Uses 9mm rounds."
	icon_state = "uzi"
	mag_type = /obj/item/ammo_box/magazine/uzim9mm
	bolt_type = BOLT_TYPE_OPEN
	mag_display = TRUE

	fire_sound = 'sound/weapons/gun/smg/uzi.ogg'
	rack_sound = 'sound/weapons/gun/smg/uzi_cocked.ogg'

	load_sound = 'sound/weapons/gun/smg/uzi_reload.ogg'
	load_empty_sound = 'sound/weapons/gun/smg/uzi_reload.ogg'
	eject_sound = 'sound/weapons/gun/smg/uzi_unload.ogg'
	eject_empty_sound = 'sound/weapons/gun/smg/uzi_unload.ogg'

	spread = 4
	fire_rate = 4

/obj/item/gun/ballistic/automatic/vector
	name = "\improper Vector carbine"
	desc = "A police carbine based on a pre-Night of Fire SMG design. Most of the complex workings have been removed for reliability. Chambered in 9mm."
	icon_state = "vector"
	item_state = "vector"
	mag_type = /obj/item/ammo_box/magazine/smgm9mm //you guys remember when the autorifle was chambered in 9mm
	bolt_type = BOLT_TYPE_LOCKING
	mag_display = TRUE
	weapon_weight = WEAPON_LIGHT
	fire_sound = 'sound/weapons/gun/smg/vector_fire.ogg'
	fire_rate = 4

/obj/item/gun/ballistic/automatic/m90
	name = "\improper M-90gl Carbine"
	desc = "A three-round burst 5.56 toploading carbine, designated 'M-90gl'. Has an attached underbarrel grenade launcher which can be toggled on and off."
	icon_state = "m90"
	item_state = "m90"
	mag_type = /obj/item/ammo_box/magazine/m556
	can_suppress = FALSE
	actions_types = list(/datum/action/item_action/toggle_firemode)
	var/obj/item/gun/ballistic/revolver/grenadelauncher/underbarrel
	burst_size = 3
	fire_delay = 2
	pin = /obj/item/firing_pin/implant/pindicate
	mag_display = TRUE
	empty_indicator = TRUE
	fire_sound = 'sound/weapons/gun/rifle/shot_alt.ogg'

	spread = 1

/obj/item/gun/ballistic/automatic/m90/Initialize()
	. = ..()
	underbarrel = new /obj/item/gun/ballistic/revolver/grenadelauncher(src)
	update_icon()

/obj/item/gun/ballistic/automatic/m90/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/m90/unrestricted/Initialize()
	. = ..()
	underbarrel = new /obj/item/gun/ballistic/revolver/grenadelauncher/unrestricted(src)
	update_icon()

/obj/item/gun/ballistic/automatic/m90/afterattack(atom/target, mob/living/user, flag, params)
	if(select == 2)
		underbarrel.afterattack(target, user, flag, params)
	else
		return ..()

/obj/item/gun/ballistic/automatic/m90/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_casing))
		if(istype(A, underbarrel.magazine.ammo_type))
			underbarrel.attack_self()
			underbarrel.attackby(A, user, params)
	else
		..()

/obj/item/gun/ballistic/automatic/m90/update_overlays()
	. = ..()
	switch(select)
		if(0)
			. += "[initial(icon_state)]_semi"
		if(1)
			. += "[initial(icon_state)]_burst"
		if(2)
			. += "[initial(icon_state)]_gren"

/obj/item/gun/ballistic/automatic/m90/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select = 1
			burst_size = initial(burst_size)
			fire_delay = initial(fire_delay)
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(1)
			select = 2
			to_chat(user, "<span class='notice'>You switch to grenades.</span>")
		if(2)
			select = 0
			burst_size = 1
			fire_delay = 0
			to_chat(user, "<span class='notice'>You switch to semi-auto.</span>")
	playsound(user, 'sound/weapons/gun/general/selector.ogg', 100, TRUE)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/firestorm //weapon designed by Apogee-dev
	name = "HP Firestorm"
	desc = "An unconventional submachinegun, rarely issued to Saint-Roumain Militia mercenary hunters for outstanding situations where normal hunting weapons fall short. Chambered in .45."
	icon = 'icons/obj/guns/48x32guns.dmi'
	icon_state = "firestorm"
	item_state = "firestorm"
	mag_type = /obj/item/ammo_box/magazine/c45_firestorm_mag
	can_suppress = FALSE
	burst_size = 1
	actions_types = list()
	fire_delay = 1
	fire_rate = 5
	rack_sound = 'sound/weapons/gun/smg/uzi_cocked.ogg'
	fire_sound = 'sound/weapons/gun/smg/firestorm.ogg'


/obj/item/gun/ballistic/automatic/firestorm/pan //spawns with pan magazine, can take sticks instead of just drums, not sure where this would be used, maybe erts?
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/firestorm/pan/Initialize()
	. = ..()
	magazine = new /obj/item/ammo_box/magazine/c45_firestorm_mag/pan(src)
	chamber_round()

/obj/item/gun/ballistic/automatic/cm5
	name = "\improper CM-5"
	desc = "The standard issue SMG of the CMM. One of the few firearm designs that were left mostly intact from the designs found on the UNSV Lichtenstein. Chambered in 9mm."
	icon_state = "cm5"
	item_state = "cm5"
	fire_rate = 5
	mag_type = /obj/item/ammo_box/magazine/smgm9mm
	weapon_weight = WEAPON_LIGHT
	fire_sound = 'sound/weapons/gun/smg/smg_heavy.ogg'

/obj/item/gun/ballistic/automatic/cm5/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/ar
	name = "\improper NT-ARG 'Boarder'"
	desc = "A robust assault rifle used by Nanotrasen fighting forces."
	fire_sound = 'sound/weapons/gun/rifle/shot.ogg'
	icon_state = "arg"
	item_state = "arg"
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/m556
	can_suppress = FALSE
	fire_rate = 5

/obj/item/gun/ballistic/automatic/aks74u
	name = "\improper AKS-74U"
	desc = "A pre-FTL era carbine, known to be incredibly cheap. Its extreme fire rate make it perfect for bandits, pirates and colonists on a budget."
	fire_sound = 'sound/weapons/gun/rifle/shot.ogg'
	icon_state = "aks74u"
	lefthand_file = 'icons/mob/inhands/weapons/64x_guns_left.dmi'
	righthand_file = 'icons/mob/inhands/weapons/64x_guns_right.dmi'
	item_state = "aks74u"
	fire_rate = 5
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/aks74u

/obj/item/gun/ballistic/automatic/l6_saw
	name = "\improper L6 SAW"
	desc = "A heavy machine gun, designated 'L6 SAW'. Chambered in 7.12x82mm."
	icon_state = "l6"
	item_state = "l6closedmag"
	base_icon_state = "l6"
	mag_type = /obj/item/ammo_box/magazine/mm712x82
	can_suppress = FALSE
	spread = 7
	fire_rate = 6
	bolt_type = BOLT_TYPE_OPEN
	mag_display = TRUE
	mag_display_ammo = TRUE
	tac_reloads = FALSE
	fire_sound = 'sound/weapons/gun/l6/shot.ogg'
	rack_sound = 'sound/weapons/gun/l6/l6_rack.ogg'
	suppressed_sound = 'sound/weapons/gun/general/heavy_shot_suppressed.ogg'
	var/cover_open = FALSE


/obj/item/gun/ballistic/automatic/l6_saw/examine(mob/user)
	. = ..()
	. += "<b>alt + click</b> to [cover_open ? "close" : "open"] the dust cover."
	if(cover_open && magazine)
		. += "<span class='notice'>It seems like you could use an <b>empty hand</b> to remove the magazine.</span>"

/obj/item/gun/ballistic/automatic/l6_saw/AltClick(mob/user)
	cover_open = !cover_open
	to_chat(user, "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>")
	playsound(user, 'sound/weapons/gun/l6/l6_door.ogg', 60, TRUE)
	update_icon()

/obj/item/gun/ballistic/automatic/l6_saw/update_overlays()
	. = ..()
	. += "l6_door_[cover_open ? "open" : "closed"]"

/obj/item/gun/ballistic/automatic/l6_saw/afterattack(atom/target as mob|obj|turf, mob/living/user as mob|obj, flag, params)
	if(cover_open)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
		return
	else
		. = ..()
		update_icon()

//ATTACK HAND IGNORING PARENT RETURN VALUE
/obj/item/gun/ballistic/automatic/l6_saw/attack_hand(mob/user)
	if (loc != user)
		..()
		return
	if (!cover_open)
		to_chat(user, "<span class='warning'>[src]'s cover is closed! Open it before trying to remove the magazine!</span>")
		return
	..()

/obj/item/gun/ballistic/automatic/l6_saw/attackby(obj/item/A, mob/user, params)
	if(!cover_open && istype(A, mag_type))
		to_chat(user, "<span class='warning'>[src]'s dust cover prevents a magazine from being fit.</span>")
		return
	..()

/obj/item/gun/ballistic/automatic/solar //This thing fires a 5.56 equivalent, that's an LMG, not an HMG, get out
	name = "\improper Solar"
	desc = "A TerraGov LMG-169 designed in 169 FS, nicknamed 'Solar.' A inscription reads: 'PROPERTY OF TERRAGOV', with 'TERRAGOV' poorly scribbled out, and replaced by 'SOLAR ARMORIES'. Chambered in 4.73×33mm caseless ammunition."
	icon_state = "solar"
	fire_sound = 'sound/weapons/gun/l6/shot.ogg'
	item_state = "arg"
	mag_type = /obj/item/ammo_box/magazine/rifle47x33mm
	spread = 7
	can_suppress = FALSE
	can_bayonet = FALSE
	mag_display = TRUE
	w_class = WEIGHT_CLASS_BULKY


/obj/item/gun/ballistic/automatic/ak47
	name = "\improper SVG-67"
	desc = "A Frontier-built assault rifle descended from a pattern of unknown provenance. Its low cost, ease of maintenance, and powerful 7.62x39mm cartridge make it a popular choice among a wide variety of outlaws."
	icon = 'icons/obj/guns/48x32guns.dmi'
	fire_sound = 'sound/weapons/gun/rifle/ak47.ogg'

	rack_sound = 'sound/weapons/gun/rifle/ak47_cocked.ogg'
	load_sound = 'sound/weapons/gun/rifle/ak47_reload.ogg'
	load_empty_sound = 'sound/weapons/gun/rifle/ak47_reload.ogg'
	eject_sound = 'sound/weapons/gun/rifle/ak47_unload.ogg'
	eject_empty_sound = 'sound/weapons/gun/rifle/ak47_unload.ogg'

	icon_state = "ak47"
	item_state = "ak47"
	mag_display = TRUE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/ak47
	spread = 0
	fire_rate = 5

/obj/item/gun/ballistic/automatic/ak47/nt
	name = "\improper NT-SVG"
	desc = "An even cheaper version of the SVG-67, rechambered for the lightweight 4.6x30mm PDW cartridge. The flimsy folding stock and light construction make for a highly-portable rifle that lacks accuracy and power."
	icon = 'icons/obj/guns/48x32guns.dmi'
	fire_sound = 'sound/weapons/gun/rifle/shot.ogg'
	icon_state = "ak47_nt"
	item_state = "ak47_nt"
	mag_type = /obj/item/ammo_box/magazine/aknt
	var/folded = FALSE
	var/unfolded_spread = 2
	var/unfolded_item_state = "ak47_nt"
	var/folded_spread = 20
	var/folded_item_state = "ak47_nt_stockless"

/obj/item/gun/ballistic/automatic/ak47/nt/CtrlClick(mob/user)
	. = ..()
	if((!ishuman(user) || user.stat))
		return
	to_chat(user, "<span class='notice'>You start to [folded ? "unfold" : "fold"] the stock on the [src].</span>")
	if(do_after(user, 10, target = src))
		fold(user)
		user.update_inv_back()
		user.update_inv_hands()
		user.update_inv_s_store()

/obj/item/gun/ballistic/automatic/ak47/nt/proc/fold(mob/user)
	if(folded)
		to_chat(user, "<span class='notice'>You unfold the stock on the [src].</span>")
		spread = unfolded_spread
		item_state = unfolded_item_state
		w_class = WEIGHT_CLASS_BULKY
	else
		to_chat(user, "<span class='notice'>You fold the stock on the [src].</span>")
		spread = folded_spread
		item_state = folded_item_state
		w_class = WEIGHT_CLASS_NORMAL

	folded = !folded
	playsound(src.loc, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()

/obj/item/gun/ballistic/automatic/ak47/nt/update_overlays()
	. = ..()
	var/mutable_appearance/stock
	if(!folded)
		stock = mutable_appearance(icon, "ak47_nt_stock")
	else
		stock = mutable_appearance(icon, null)
	. += stock

/obj/item/gun/ballistic/automatic/ak47/inteq
	name = "\improper SkM-24"
	desc = "An antique assault rifle seized from Frontiersmen armories then extensively modified to IRMG standards. Chambered in 7.62x39mm."
	icon = 'icons/obj/guns/48x32guns.dmi'
	fire_sound = 'sound/weapons/gun/rifle/akm.ogg'
	icon_state = "akm"
	item_state = "akm"
	mob_overlay_icon = 'icons/mob/clothing/back.dmi'

/obj/item/gun/ballistic/automatic/p16
	name = "\improper P-16"
	desc = "An assault rifle pattern from Sol, existing before the Night of Fire. A favorite of professional mercenaries and well-heeled pirates. Chambered in 5.56mm."
	icon = 'icons/obj/guns/48x32guns.dmi'
	fire_sound = 'sound/weapons/gun/rifle/m16.ogg'
	icon_state = "p16"
	item_state = "p16"
	mag_display = TRUE
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/p16
	spread = 2
	fire_rate = 5
	rack_sound = 'sound/weapons/gun/rifle/m16_cocked.ogg'
	load_sound = 'sound/weapons/gun/rifle/m16_reload.ogg'
	load_empty_sound = 'sound/weapons/gun/rifle/m16_reload.ogg'
	eject_sound = 'sound/weapons/gun/rifle/m16_unload.ogg'
	eject_empty_sound = 'sound/weapons/gun/rifle/m16_unload.ogg'

/obj/item/gun/ballistic/automatic/p16/minutemen
	name = "\improper CM-16"
	desc = "The standard-issue rifle of the Colonial Minutemen and an extensively modified reproduction of the P-16. Chambered in 5.56mm."
	icon_state = "cm16"
	item_state = "cm16"

/obj/item/gun/ballistic/automatic/sniper_rifle
	name = "sniper rifle"
	desc = "A long ranged weapon that does significant damage. No, you can't quickscope."
	icon_state = "sniper"
	item_state = "sniper"
	fire_sound = 'sound/weapons/gun/sniper/shot.ogg'
	fire_sound_volume = 90
	vary_fire_sound = FALSE
	load_sound = 'sound/weapons/gun/sniper/mag_insert.ogg'
	rack_sound = 'sound/weapons/gun/sniper/rack.ogg'
	suppressed_sound = 'sound/weapons/gun/general/heavy_shot_suppressed.ogg'
	recoil = 2
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/sniper_rounds
	fire_delay = 40
	burst_size = 1
	w_class = WEIGHT_CLASS_NORMAL
	zoomable = TRUE
	zoom_amt = 10 //Long range, enough to see in front of you, but no tiles behind you.
	zoom_out_amt = 5
	slot_flags = ITEM_SLOT_BACK
	actions_types = list()
	mag_display = TRUE

/obj/item/gun/ballistic/automatic/sniper_rifle/syndicate
	name = "syndicate sniper rifle"
	desc = "An illegally modified .50 cal sniper rifle with suppression compatibility. Quickscoping still doesn't work."
	can_suppress = TRUE
	can_unsuppress = TRUE
	pin = /obj/item/firing_pin/implant/pindicate

// Old Semi-Auto Rifle //

/obj/item/gun/ballistic/automatic/surplus
	name = "Surplus Rifle"
	desc = "One of countless obsolete ballistic rifles that still sees use as a cheap deterrent. Uses 10mm ammo and its bulky frame prevents one-hand firing."
	icon_state = "surplus"
	item_state = "moistnugget"
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/m10mm/rifle
	can_unsuppress = TRUE
	can_suppress = TRUE
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BACK
	actions_types = list()
	mag_display = TRUE
	automatic = 0
	fire_rate = 1.5

// Laser rifle (rechargeable magazine) //

/obj/item/gun/ballistic/automatic/laser
	name = "laser rifle"
	desc = "Though sometimes mocked for the relatively weak firepower of their energy weapons, the logistic miracle of rechargeable ammunition has given Nanotrasen a decisive edge over many a foe."
	icon_state = "oldrifle"
	item_state = "arg"
	mag_type = /obj/item/ammo_box/magazine/recharge
	can_suppress = FALSE
	actions_types = list()
	fire_sound = 'sound/weapons/laser.ogg'
	casing_ejector = FALSE
	fire_rate = 2
