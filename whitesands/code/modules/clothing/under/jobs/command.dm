/obj/item/clothing/under/rank/command/captain/suit
	armor = list("melee" = 10, "bullet" = 5, "laser" = 5,"energy" = 5, "bomb" = 10, "bio" = 10, "rad" = 5, "fire" = 75, "acid" = 50)


/obj/item/clothing/under/rank/command
	desc = "A standard command jumpsuit."
	name = "command jumpsuit"
	icon = 'icons/obj/clothing/under/command.dmi'
	mob_overlay_icon = 'icons/mob/clothing/under/command.dmi'
	icon_state = "cmd"
	item_state = "w_suit"
	armor = list("melee" = 10, "bullet" = 5, "laser" = 5,"energy" = 5, "bomb" = 10, "bio" = 10, "rad" = 5, "fire" = 75, "acid" = 50)

/obj/item/clothing/under/rank/command/skirt
	desc = "A standard command jumpskirt."
	name = "command jumpskirt"
	icon_state = "cmd_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/rank/command/nt
	icon_state = "cmd_nt"
	item_state = "b_suit"

/obj/item/clothing/under/rank/command/skirt/nt
	desc = "A standard command jumpskirt."
	name = "command jumpskirt"
	icon_state = "cmd_skirt_nt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP

//Captain

/obj/item/clothing/under/rank/command/captain
	desc = "It's a white jumpsuit with some gold markings denoting the rank of \"Captain\"."
	name = "captain's jumpsuit"
	icon_state = "captain"
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE

/obj/item/clothing/under/rank/command/captain/skirt
	name = "captain's jumpskirt"
	desc = "It's a white jumpskirt with some gold markings denoting the rank of \"Captain\"."
	icon_state = "captain_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/rank/command/captain/suit/skirt
	name = "green suitskirt"
	desc = "A green suitskirt and yellow necktie. Exemplifies authority."
	icon_state = "green_suit_skirt"
	item_state = "dg_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/rank/command/captain/parade
	name = "captain's parade uniform"
	desc = "A captain's luxury-wear, for special occasions."
	icon_state = "captain_parade"
	item_state = "b_suit"
	can_adjust = FALSE

//Head of Personnel

/obj/item/clothing/under/rank/command/head_of_personnel
	desc = "It's a jumpsuit worn by someone who works in the position of \"Head of Personnel\"."
	name = "head of personnel's jumpsuit"
	icon_state = "hop"
	can_adjust = FALSE
	armor = list("melee" = 10, "bullet" = 5, "laser" = 5,"energy" = 5, "bomb" = 5, "bio" = 10, "rad" = 5, "fire" = 40, "acid" = 40)


/obj/item/clothing/under/rank/command/head_of_personnel/skirt
	name = "head of personnel's jumpskirt"
	desc = "It's a jumpskirt worn by someone who works in the position of \"Head of Personnel\"."
	icon_state = "hop_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/command/head_of_personnel/nt
	icon_state = "hop_nt"
	item_state = "b_suit"

/obj/item/clothing/under/rank/command/head_of_personnel/nt/skirt
	name = "head of personnel's jumpskirt"
	desc = "It's a jumpskirt worn by someone who works in the position of \"Head of Personnel\"."
	icon_state = "hop_nt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/rank/command/head_of_personnel/suit
	name = "head of personnel's suit"
	desc = "A teal suit and yellow necktie. An authoritative yet tacky ensemble."
	icon_state = "teal_suit"
	item_state = "g_suit"
	can_adjust = FALSE

/obj/item/clothing/under/rank/command/head_of_personnel/suit/skirt
	name = "teal suitskirt"
	desc = "A teal suitskirt and yellow necktie. An authoritative yet tacky ensemble."
	icon_state = "teal_suit_skirt"
	item_state = "g_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/command/captain/nt
	desc = "It's a blue jumpsuit with some gold markings denoting the rank of \"Captain\"."
	icon_state = "captain_nt"
	item_state = "b_suit"
	can_adjust = FALSE

/obj/item/clothing/under/rank/command/captain/nt/alt
	icon_state = "captain_nt_alt"

/obj/item/clothing/under/rank/command/captain/nt/skirt
	name = "captain's jumpskirt"
	desc = "It's a blue jumpskirt with some gold markings denoting the rank of \"Captain\"."
	icon_state = "captain_nt_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/rank/command/captain/nt/skirt/alt
	name = "captain's jumpskirt"
	desc = "It's a blue jumpskirt with some gold markings denoting the rank of \"Captain\"."
	icon_state = "captain_nt_alt_skirt"

//Lieutenant

/obj/item/clothing/under/rank/command/lieutenant
	name = "blueshield's suit"
	desc = "A classic bodyguard's suit, with custom-fitted Blueshield-Blue cuffs and a Nanotrasen insignia over one of the pockets."
	icon_state = "blueshield"
	can_adjust = FALSE

/obj/item/clothing/under/rank/command/lieutenant/skirt
	name = "blueshield's suitskirt"
	desc = "A classic bodyguard's suitskirt, with custom-fitted Blueshield-Blue cuffs and a Nanotrasen insignia over one of the pockets."
	icon_state = "blueshieldskirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/command/lieutenant/alt
	name = "blueshield's turtleneck"
	desc = "A tactical jumper fit for only the best of bodyguards, with plenty of tactical pockets for your tactical needs."
	icon_state = "bs_turtleneck"
	item_state = "b_suit"

/obj/item/clothing/under/rank/command/lieutenant/alt/skirt
	name = "blueshield's skirtleneck"
	desc = "A tactical jumper fit for only the best of bodyguards - instead of tactical pockets, this one has a tactical lack of leg protection."
	icon_state = "bs_skirtleneck"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON
