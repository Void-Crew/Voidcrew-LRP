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
