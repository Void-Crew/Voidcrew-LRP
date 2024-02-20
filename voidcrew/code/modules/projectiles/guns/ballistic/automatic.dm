/obj/item/gun/ballistic/automatic/pistol/tec9
	name = "TEC9 Machine Pistol"
	desc = "A new take on an old classic, firing 9mm rounds at unprecedented firerates. Perfect for gatting people down, especially considering how plentiful ammo is."
	icon = 'voidcrew/icons/obj/guns/projectile.dmi'
	icon_state = "tec9"
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/tec9
	fire_rate = 6
	automatic = 1
	mag_display = TRUE

/obj/item/gun/ballistic/automatic/ebr
	name = "\improper M514 EBR"
	desc = {"A cheap, reliable rifle often found in the hands of low-ranking Syndicate personnel. It's known for rather high stopping power and mild armor-piercing capabilities."}
	icon = 'voidcrew/icons/obj/guns/48x32guns.dmi'
	lefthand_file = 'voidcrew/icons/mob/inhands/weapons/64x_guns_left.dmi'
	righthand_file = 'voidcrew/icons/mob/inhands/weapons/64x_guns_right.dmi'
	fire_sound = 'sound/weapons/gun/rifle/shot.ogg'
	icon_state = "ebr"
	item_state = "ebr"
	fire_rate = 2
	mag_display = TRUE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/ebr

/obj/item/gun/ballistic/automatic/zip_pistol
	name = "Makeshift Pistol"
	desc = "A makeshift janky pistol, its a miracle it even works."
	icon = 'voidcrew/icons/obj/guns/projectile.dmi'
	lefthand_file = 'voidcrew/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'voidcrew/icons/mob/inhands/weapons/guns_righthand.dmi'
	icon_state = "ZipPistol"
	item_state = "ZipPistol"
	mag_type = /obj/item/ammo_box/magazine/zip_ammo_9mm
	can_suppress = FALSE
	actions_types = list()
	can_bayonet = FALSE
	mag_display = TRUE
	weapon_weight = WEAPON_LIGHT
	fire_rate = 3
