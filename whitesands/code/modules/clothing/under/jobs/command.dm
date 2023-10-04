/obj/item/clothing/under/rank/command/bridgestaff
	name = "bridge staff uniform"
	desc = "It's a bland white formal shirt on some brown formal trousers."
	icon_state = "cmd"
	item_state = "w_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE

/obj/item/clothing/under/rank/command/bridgestaff/skirt
	name = "bridge staff uniform"
	desc = "It's a bland white formal shirt on a brown skirt."
	icon_state = "cmd_skirt"
	item_state = "w_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/rank/command/nt/bridge_staff
	name = "bridge staff uniform"
	desc = "It's a bland blue formal shirt on some black formal trousers."
	icon_state = "cmd_nt"
	item_state = "b_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE

/obj/item/clothing/under/rank/command/nt/bridge_staff/skirt
	name = "bridge staff uniform"
	desc = "It's a bland blue formal shirt on a black skirt."
	icon_state = "cmd_nt_skirt"
	item_state = "b_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP

//Captain

/obj/item/clothing/under/rank/command/captain
	name = "captain uniform"
	desc = "It's a white button-up shirt with gold markings on the wrists, and shoulders above some brown and gold trousers. It demonstrates the rank of \"Captain\" on it."
	icon_state = "captain"
	item_state = "w_suit"
	random_sensor = FALSE
	sensor_mode = SENSOR_COORDS
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	armor = list("melee" = 10, "bullet" = 5, "laser" = 5,"energy" = 5, "bomb" = 5, "bio" = 10, "rad" = 5, "fire" = 40, "acid" = 40)

/obj/item/clothing/under/rank/command/captain/skirt
	name = "captain uniform"
	desc = "It's a white button-up shirt with gold markings on the wrists, and shoulders above a brown and gold skirt. It demonstrates the rank of \"Captain\" on it."
	icon_state = "captain"
	item_state = "w_suit"
	random_sensor = FALSE
	sensor_mode = SENSOR_COORDS
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	armor = list("melee" = 10, "bullet" = 5, "laser" = 5,"energy" = 5, "bomb" = 5, "bio" = 10, "rad" = 5, "fire" = 40, "acid" = 40)

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
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE

//Head of Personnel

/obj/item/clothing/under/rank/command/head_of_personnel
	name = "head of personnel uniform"
	desc = "It's a white formal shirt with red shoulders and wrists, with a gold nametag on it above some brown trousers. It demonstrates the rank of \"Head of Personnel\" on it."
	icon_state = "hop"
	item_state = "w_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	armor = list("melee" = 10, "bullet" = 5, "laser" = 5,"energy" = 5, "bomb" = 5, "bio" = 10, "rad" = 5, "fire" = 40, "acid" = 40)


/obj/item/clothing/under/rank/command/head_of_personnel/skirt
	name = "head of personnel uniform"
	desc = "It's a white formal shirt with a gold nametag on it above a brown skirt. It demonstrates the rank of \"Head of Personnel\" on it."
	icon_state = "hop_skirt"
	item_state = "w_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	armor = list("melee" = 10, "bullet" = 5, "laser" = 5,"energy" = 5, "bomb" = 5, "bio" = 10, "rad" = 5, "fire" = 40, "acid" = 40)

/obj/item/clothing/under/rank/command/nt/head_of_personnel
	name = "head of personnel uniform"
	desc = "It's a blue formal shirt with red shoulders and wrists, with a gold nametag on it above some black trousers. It demonstrates the rank of \"Head of Personnel\" on it."
	icon_state = "hop_nt"
	item_state = "b_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	armor = list("melee" = 10, "bullet" = 5, "laser" = 5,"energy" = 5, "bomb" = 5, "bio" = 10, "rad" = 5, "fire" = 40, "acid" = 40)

/obj/item/clothing/under/rank/command/nt/head_of_personnel/skirt
	name = "head of personnel uniform"
	desc = "It's a blue formal shirt with red shoulders and wrists, with a gold nametag on it above a black skirt. It demonstrates the rank of \"Head of Personnel\" on it."
	icon_state = "hop_nt_skirt"
	item_state = "b_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	armor = list("melee" = 10, "bullet" = 5, "laser" = 5,"energy" = 5, "bomb" = 5, "bio" = 10, "rad" = 5, "fire" = 40, "acid" = 40)

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

/obj/item/clothing/under/rank/command/nt/captain
	name = "captain uniform"
	desc = "It's a blue button-up shirt with gold markings on the wrists, and shoulders above some black and gold trousers. It demonstrates the rank of \"Captain\" on it."
	icon_state = "captain_nt"
	item_state = "b_suit"
	random_sensor = FALSE
	sensor_mode = SENSOR_COORDS
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	armor = list("melee" = 10, "bullet" = 5, "laser" = 5,"energy" = 5, "bomb" = 5, "bio" = 10, "rad" = 5, "fire" = 40, "acid" = 40)

/obj/item/clothing/under/rank/command/nt/captain/skirt
	name = "captain uniform"
	desc = "It's a blue button-up shirt with gold markings on the wrists, and shoulders above a black and gold skirt. It demonstrates the rank of \"Captain\" on it."
	icon_state = "captain_nt_skirt"
	item_state = "b_suit"
	random_sensor = FALSE
	sensor_mode = SENSOR_COORDS
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	armor = list("melee" = 10, "bullet" = 5, "laser" = 5,"energy" = 5, "bomb" = 5, "bio" = 10, "rad" = 5, "fire" = 40, "acid" = 40)

//Lieutenant

/obj/item/clothing/under/rank/command/lieutenant
	name = "lieutenant uniform"
	desc = "It's a white formal shirt with green shoulders and wrists, with a silver nametag on it above some brown trousers. It demonstrates the rank of \"Lieutenant\" on it."
	icon_state = "lt"
	item_state = "w_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE

/obj/item/clothing/under/rank/command/lieutenant/skirt
	name = "lieutenant uniform"
	desc = "It's a white formal shirt with green shoulders and wrists, with a silver nametag on it above a brown skirt. It demonstrates the rank of \"Lieutenant\" on it."
	icon_state = "lt_skirt"
	item_state = "w_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/rank/command/nt/lieutenant
	name = "lieutenant uniform"
	desc = "It's a blue formal shirt with green shoulders and wrists, with a silver nametag on it above some black trousers. It demonstrates the rank of \"Lieutenant\" on it."
	icon_state = "lt_nt"
	item_state = "b_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE

/obj/item/clothing/under/rank/command/nt/lieutenant/skirt
	name = "lieutenant uniform"
	desc = "It's a blue formal shirt with green shoulders and wrists, with a silver nametag on it above a black skirt. It demonstrates the rank of \"Lieutenant\" on it."
	icon_state = "lt_nt_skirt"
	item_state = "b_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
