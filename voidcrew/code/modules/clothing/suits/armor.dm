/obj/item/clothing/suit/armor/vest/solgov
	name = "\improper SolGov armor vest"
	desc = "A standard armor vest fielded for SolGov's infantry."
	icon = 'voidcrew/icons/obj/clothing/suits.dmi'
	icon_state = "armor_solgov"
	item_state = "armor_solgov"

/obj/item/clothing/suit/armor/vest/solgov/Initialize()
	. = ..()
	allowed |= list(/obj/item/gun/energy/laser/terra, /obj/item/gun/energy/pulse/terra, /obj/item/tank)

/obj/item/clothing/suit/armor/vest/solgov/rep
	name = "\improper SolGov slim armor vest"
	desc = "A type I armor vest emblazoned with the SolGov logo."
	icon_state = "armor_alt_solgov"
	item_state = "armor_alt_solgov"

/obj/item/clothing/suit/armor/vest/solgov_hop
	name = "SolGov Executive Officer's coat"
	desc = "To show you have class. Or at least some of it."
	icon_state = "coat_solgov_hop"
	item_state = "b_suit"

/obj/item/clothing/suit/armor/vest/solgov_hop/terragov
	name = "TerraGov Executive Officer's coat"
	desc = "To show you have class. Or at least some of it. This one's colored in TerraGov's classic green color."
	icon_state = "coat_terragov_hop"
	item_state = "g_suit"
