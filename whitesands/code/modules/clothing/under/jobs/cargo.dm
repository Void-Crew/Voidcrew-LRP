//Alt uniforms

//QM

/obj/item/clothing/under/suit/qm
	name = "quartermaster's uniform"
	desc = "A brown dress shirt, coupled with a pair of black slacks. It's specially designed to prevent back injuries caused by pushing paper."
	icon_state = "supply_chief"
	fitted = NO_FEMALE_UNIFORM
	icon = 'icons/obj/clothing/under/cargo.dmi'
	mob_overlay_icon = 'icons/mob/clothing/under/cargo.dmi'

/obj/item/clothing/under/suit/qm/skirt
	name = "quartermaster's skirt"
	desc = "A brown dress shirt, coupled with a long pleated black skirt. It's specially designed to prevent back injuries caused by pushing paper."
	icon_state = "supply_chief_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE

//Cargo

/obj/item/clothing/under/suit/cargo_tech
	name = "cargo technician's shorts"
	desc = "I like shooooorts! They're comfy and easy to wear!"
	icon_state = "deliveries_officer"
	fitted = NO_FEMALE_UNIFORM
	icon = 'icons/obj/clothing/under/cargo.dmi'
	mob_overlay_icon = 'icons/mob/clothing/under/cargo.dmi'

/obj/item/clothing/under/suit/cargo_tech/skirt
	name = "cargo technician's shortskirt"
	desc = "I like skiiiiirts! They're comfy and easy to wear!"
	icon_state = "deliveries_officer_skirt"

	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE

/obj/item/clothing/under/rank/cargo/tech/mailroom_technician
	name = "cargo technician's uniform"
	desc = "A brown sweater and black jeans, because, honestly, who likes shorts?"
	icon_state = "mailroom_technician"
	body_parts_covered = CHEST|GROIN|ARMS
	// mutantrace_variation = NO_MUTANTRACE_VARIATION
	fitted = NO_FEMALE_UNIFORM
	icon = 'icons/obj/clothing/under/cargo.dmi'
	mob_overlay_icon = 'icons/mob/clothing/under/cargo.dmi'

/obj/item/clothing/under/rank/cargo/tech/mailroom_technician/skirt
	name = "cargo technician's skirt"
	desc = "A brown sweater and a black skirt to match."
	icon_state = "mailroom_technician_skirt"
	can_adjust = FALSE
