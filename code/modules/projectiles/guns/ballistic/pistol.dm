/obj/item/gun/ballistic/automatic/pistol
	name = "stechkin pistol"
	desc = "A small, easily concealable 10mm handgun. Has a threaded barrel for suppressors."
	icon_state = "pistol"
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/m10mm
	can_suppress = TRUE
	actions_types = list()
	bolt_type = BOLT_TYPE_LOCKING
	fire_sound = 'sound/weapons/gun/pistol/shot.ogg'
	dry_fire_sound = 'sound/weapons/gun/pistol/dry_fire.ogg'
	suppressed_sound = 'sound/weapons/gun/pistol/shot_suppressed.ogg'
	load_sound = 'sound/weapons/gun/pistol/mag_insert.ogg'
	load_empty_sound = 'sound/weapons/gun/pistol/mag_insert.ogg'
	eject_sound = 'sound/weapons/gun/pistol/mag_release.ogg'
	eject_empty_sound = 'sound/weapons/gun/pistol/mag_release.ogg'
	vary_fire_sound = FALSE
	rack_sound = 'sound/weapons/gun/pistol/rack_small.ogg'
	lock_back_sound = 'sound/weapons/gun/pistol/lock_small.ogg'
	bolt_drop_sound = 'sound/weapons/gun/pistol/drop_small.ogg'
	fire_sound_volume = 90
	bolt_wording = "slide"
	fire_rate = 3
	automatic = 0
	weapon_weight = WEAPON_LIGHT

/obj/item/gun/ballistic/automatic/pistol/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/suppressed/Initialize(mapload)
	. = ..()
	var/obj/item/suppressor/S = new(src)
	install_suppressor(S)

/obj/item/gun/ballistic/automatic/pistol/commander
	name = "\improper Commander"
	desc = "A modification on the classic 1911 handgun, this one is chambered in 9mm. Much like its predecessor, it suffers from low capacity."
	icon_state = "commander"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/co9mm
	can_suppress = FALSE

/obj/item/gun/ballistic/automatic/pistol/commander/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/commander/inteq
	name = "\improper Commissioner"
	desc = "A handgun seized from Nanotrasen armories by deserting troopers and modified to IRMG's standards. A yellow IRMG shield is set into the grips. Chambered in 9mm."
	icon_state = "commander-inteq"
	item_state = "commander-inteq"

/obj/item/gun/ballistic/automatic/pistol/solgov
	name = "SolGov M9C"
	desc = "Known formally as the M9A5C, this is a compact caseless ammo handgun made for switching to when your primary runs empty on it's mag."
	icon_state = "solm9c"
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/pistol556mm

/obj/item/gun/ballistic/automatic/pistol/m1911
	name = "\improper M1911"
	desc = "A classic .45 handgun with a small magazine capacity."

	icon_state = "m1911"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/m45
	can_suppress = FALSE
	fire_sound = 'sound/weapons/gun/pistol/shot.ogg'
	rack_sound = 'sound/weapons/gun/pistol/rack.ogg'
	lock_back_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/weapons/gun/pistol/slide_drop.ogg'

/obj/item/gun/ballistic/automatic/pistol/m1911/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/suns
	desc = "A small, easily concealable 10mm handgun that bears Scarborough Arms stamps. It is painted in the colors of SUNS."
	icon_state = "pistol_suns"

/obj/item/gun/ballistic/automatic/pistol/candor
	name = "\improper Candor"
	desc = "A classic semi-automatic handgun, widely popular throughout the Frontier. An engraving on the slide marks it as a product of Hunter's Pride. Chambered in .45."
	icon_state = "candor"
	item_state = "hp_generic"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/m45
	can_suppress = FALSE
	fire_sound = 'sound/weapons/gun/pistol/candor.ogg'
	rack_sound = 'sound/weapons/gun/pistol/candor_cocked.ogg'
	lock_back_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/weapons/gun/pistol/slide_drop.ogg'
	load_sound = 'sound/weapons/gun/pistol/candor_reload.ogg'
	load_empty_sound = 'sound/weapons/gun/pistol/candor_reload.ogg'
	eject_sound = 'sound/weapons/gun/pistol/candor_unload.ogg'
	eject_empty_sound = 'sound/weapons/gun/pistol/candor_unload.ogg'
	recoil = -2

/obj/item/gun/ballistic/automatic/pistol/candor/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/candor/factory //also give this to the srm, their candors should probably look factory fresh from how well taken care of they are
	desc = "A classic semi-automatic handgun, widely popular throughout the Frontier. An engraving on the slide marks it as a product of Hunter's Pride. This example has been kept in especially good shape, and may as well be fresh out of the workshop. Chambered in .45."
	item_state = "hp_generic_fresh"

/obj/item/gun/ballistic/automatic/pistol/candor/factory/update_overlays()
	. = ..()
	. += "[initial(icon_state)]_factory"

/obj/item/gun/ballistic/automatic/pistol/candor/factory/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/deagle
	name = "\improper Desert Eagle"
	desc = "A robust .50 AE handgun."
	icon_state = "deagle"
	force = 14
	mag_type = /obj/item/ammo_box/magazine/m50
	can_suppress = FALSE
	mag_display = TRUE
	fire_sound = 'sound/weapons/gun/rifle/shot_alt.ogg'
	rack_sound = 'sound/weapons/gun/pistol/rack.ogg'
	lock_back_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/weapons/gun/pistol/slide_drop.ogg'

/obj/item/gun/ballistic/automatic/pistol/deagle/gold
	desc = "A gold plated Desert Eagle folded over a million times by superior martian gunsmiths. Uses .50 AE ammo."
	icon_state = "deagleg"
	item_state = "deagleg"

/obj/item/gun/ballistic/automatic/pistol/deagle/camo
	desc = "A Deagle brand Deagle for operators operating operationally. Uses .50 AE ammo."
	icon_state = "deaglecamo"
	item_state = "deagleg"

/obj/item/gun/ballistic/automatic/pistol/APS
	name = "stechkin APS pistol"
	desc = "The original Russian version of a widely used Syndicate sidearm. Uses 9mm ammo."
	icon_state = "aps"
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/pistolm9mm
	can_suppress = FALSE
	fire_rate = 4
	automatic = 1

/obj/item/gun/ballistic/automatic/pistol/solgov/shiptest
	name = "\improper Pistole C"
	desc = "A favorite of the Terran Regency that is despised by the Solarian bureaucracy. Shifted out of military service centuries ago, though still popular among civilians. Chambered in 5.56mm caseless."
	icon_state = "pistole-c"
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/pistol556mm
	fire_sound = 'sound/weapons/gun/pistol/pistolec.ogg'
	load_sound = 'sound/weapons/gun/pistol/mag_insert.ogg'
	load_empty_sound = 'sound/weapons/gun/pistol/mag_insert.ogg'
	eject_sound = 'sound/weapons/gun/pistol/mag_release.ogg'
	eject_empty_sound = 'sound/weapons/gun/pistol/mag_release.ogg'

/obj/item/gun/ballistic/automatic/pistol/solgov/shiptest/old
	icon_state = "pistole-c-old"

/obj/item/gun/ballistic/automatic/pistol/himehabu
	name = "\improper Himehabu"
	desc = "A very small .22 LR pistol. The long awaited successor to the Stechkin; It has become a favorite among syndicate spies. Chambered in .22 LR."
	icon_state = "himehabu"
	w_class = WEIGHT_CLASS_TINY
	mag_type = /obj/item/ammo_box/magazine/m22lr
	can_suppress = FALSE
	fire_sound = 'sound/weapons/gun/pistol/himehabu.ogg'

	recoil = -2

/obj/item/gun/ballistic/automatic/pistol/stickman
	name = "flat gun"
	desc = "A 2 dimensional gun.. what?"
	icon_state = "flatgun"

/obj/item/gun/ballistic/automatic/pistol/stickman/pickup(mob/living/user)
	SHOULD_CALL_PARENT(0)
	to_chat(user, "<span class='notice'>As you try to pick up [src], it slips out of your grip..</span>")
	if(prob(50))
		to_chat(user, "<span class='notice'>..and vanishes from your vision! Where the hell did it go?</span>")
		qdel(src)
		user.update_icons()
	else
		to_chat(user, "<span class='notice'>..and falls into view. Whew, that was a close one.</span>")
		user.dropItemToGround(src)

/obj/item/gun/ballistic/automatic/pistol/disposable
	name = "disposable gun"
	desc = "An exceedingly flimsy gun that is extremely cheap and easy to produce. You get what you pay for."
	icon_state = "disposable"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/disposable
	custom_materials = list(/datum/material/plastic=2000)
	can_suppress = FALSE
	var/random_icon = TRUE

/obj/item/gun/ballistic/automatic/pistol/disposable/Initialize()
	..()
	var/picked = pick("none","red","purple","yellow","green","dark")
	if(random_icon)
		if(picked == "none")
			return
		icon_state = "disposable_[picked]"

/obj/item/gun/ballistic/automatic/pistol/disposable/eject_magazine(mob/user)
	to_chat(user, "<span class='warning'>Theres no magazine to eject!</span>")
	return

/obj/item/gun/ballistic/automatic/pistol/disposable/insert_magazine(mob/user)
	to_chat(user, "<span class='warning'>Theres no magazine to replace!</span>")
	return

/obj/item/gun/ballistic/automatic/pistol/disposable/pizza
	name = "pizza disposable gun"
	desc = "How horrible. Whoever you point at with this won't be very cheesed to meet you." //this is a warcrime against itallians
	icon_state = "disposable_pizza"
	random_icon = FALSE
	custom_materials = list(/datum/material/pizza=2000)
