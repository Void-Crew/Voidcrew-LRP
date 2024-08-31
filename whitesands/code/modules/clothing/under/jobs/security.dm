/*
 * Contains:
 *		Security Officer
 *		Detective
 *		Brig Physician
 *		Warden
 *		Head of Security
 *		Prisoner
 *		Misc Sec Uniforms
 */

/*
 * Security
 */

/obj/item/clothing/under/rank/security
	icon = 'icons/obj/clothing/under/security.dmi'
	mob_overlay_icon = 'icons/mob/clothing/under/security.dmi'
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 10, "bio" = 10, "rad" = 5, "fire" = 30, "acid" = 30)

// Security Officer //
/obj/item/clothing/under/rank/security/officer
	name = "security jumpsuit"
	desc = "A tactical security jumpsuit for officers complete with Nanotrasen belt buckle."
	icon_state = "security"
	item_state = "gy_suit"
	strip_delay = 50
	alt_covers_chest = TRUE
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE

/obj/item/clothing/under/rank/security/officer/skirt
	name = "security jumpskirt"
	desc = "A \"tactical\" security jumpsuit with the legs replaced by a skirt."
	icon_state = "security_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

// Detective//
/obj/item/clothing/under/rank/security/detective
	name = "hard-worn suit"
	desc = "Someone who wears this means business."
	icon_state = "detective"
	item_state = "det"
	strip_delay = 50
	alt_covers_chest = TRUE
	sensor_mode = 3
	random_sensor = FALSE

/obj/item/clothing/under/rank/security/detective/skirt
	name = "detective's suitskirt"
	desc = "Someone who wears this means business."
	icon_state = "detective_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/security/detective/grey
	name = "noir suit"
	desc = "A hard-boiled private investigator's grey suit, complete with tie clip."
	icon_state = "greydet"
	item_state = "greydet"
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/security/detective/grey/skirt
	name = "noir suitskirt"
	desc = "A hard-boiled private investigator's grey suitskirt, complete with tie clip."
	icon_state = "greydet_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

// Brig Physician //
/obj/item/clothing/under/rank/security/brig_phys
	name = "brig physician jumpsuit"
	desc = "A lightly armored jumpsuit worn by Nanotrasen's Asset Protection Medical Corps."
	icon_state = "brig_phys"

/obj/item/clothing/under/rank/security/brig_phys/skirt
	name = "brig physician jumpskirt"
	desc = "A lightly armored jumpsuit worn by Nanotrasen's Asset Protection Medical Corps."
	icon_state = "brig_phys_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/security/brig_phys/security_medic
	name = "security medic's uniform"
	desc = "A lightly armored uniform worn by medics ensuring the health of prisoners."
	icon_state = "security_medic"
	fitted = NO_FEMALE_UNIFORM

/obj/item/clothing/under/rank/security/brig_phys/security_medic/skirt
	name = "security medic's uniform"
	desc = "A lightly armored uniform, with a skirt, worn by medics ensuring the health of prisoners."
	icon_state = "security_medic_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

// Warden //
/obj/item/clothing/under/rank/security/warden
	name = "security suit"
	desc = "A formal security suit for officers complete with Nanotrasen belt buckle."
	icon_state = "warden"
	strip_delay = 50
	alt_covers_chest = TRUE
	sensor_mode = 3
	random_sensor = FALSE

/obj/item/clothing/under/rank/security/warden/skirt
	name = "warden's suitskirt"
	desc = "A formal security suitskirt for officers complete with Nanotrasen belt buckle."
	icon_state = "warden_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

// Head of Security //
/obj/item/clothing/under/rank/security/head_of_security
	name = "head of security's jumpsuit"
	desc = "A security jumpsuit decorated for those few with the dedication to achieve the position of Head of Security."
	icon_state = "hos"
	armor = list("melee" = 10, "bullet" = 5, "laser" = 5,"energy" = 5, "bomb" = 10, "bio" = 10, "rad" = 10, "fire" = 50, "acid" = 50)
	strip_delay = 60
	alt_covers_chest = TRUE
	sensor_mode = 3
	random_sensor = FALSE

/obj/item/clothing/under/rank/security/head_of_security/skirt
	name = "head of security's jumpskirt"
	desc = "A security jumpskirt decorated for those few with the dedication to achieve the position of Head of Security."
	icon_state = "hos_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/security/head_of_security/alt
	name = "head of security's turtleneck"
	desc = "A stylish alternative to the normal head of security jumpsuit, complete with tactical pants."
	icon_state = "hosalt"
	item_state = "bl_suit"

/obj/item/clothing/under/rank/security/head_of_security/alt/skirt
	name = "head of security's turtleneck skirt"
	desc = "A stylish alternative to the normal head of security jumpsuit, complete with a tactical skirt."
	icon_state = "hosalt_skirt"
	item_state = "bl_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/security/head_of_security/parade
	name = "head of security's parade uniform"
	desc = "A male head of security's luxury-wear, for special occasions."
	icon_state = "hos_parade_male"
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/head_of_security/parade/female
	name = "head of security's parade uniform"
	desc = "A female head of security's luxury-wear, for special occasions."
	icon_state = "hos_parade_fem"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE

// Prisoner //
/obj/item/clothing/under/rank/prisoner
	name = "prison jumpsuit"
	desc = "It's standardised Nanotrasen prisoner-wear. Its suit sensors are stuck in the \"Fully On\" position."
	icon = 'icons/obj/clothing/under/security.dmi'
	icon_state = "prisoner"
	item_state = "o_suit"
	mob_overlay_icon = 'icons/mob/clothing/under/security.dmi'
	has_sensor = LOCKED_SENSORS
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE

/obj/item/clothing/under/rank/prisoner/skirt
	name = "prison jumpskirt"
	desc = "It's standardised Nanotrasen prisoner-wear. Its suit sensors are stuck in the \"Fully On\" position."
	icon_state = "prisoner_skirt"
	item_state = "o_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/prisoner/protected_custody
	name = "protected custody jumpsuit"
	desc = "It's standardised Nanotrasen prisoner-wear worn by those in protected custody. Its suit sensors are stuck in the \"Fully On\" position."
	icon_state = "protected_custody"
	fitted = NO_FEMALE_UNIFORM

/obj/item/clothing/under/rank/prisoner/protected_custody/skirt
	name = "protected custody jumpskirt"
	desc = "It's standardised Nanotrasen prisoner-wear worn by those in protected custody. Its suit sensors are stuck in the \"Fully On\" position."
	icon_state = "protected_custody_skirt"
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/prisoner/solgov
	name = "SolGov prisoner uniform"
	desc = "It's a unique uniform worn by Prisoners under the Solar Government's cold grasp, whoever's wearing this is just a number now. Its suit sensors are stuck in the \"Fully On\" position."
	icon_state = "solgovprisoner"
	item_state = "b_suit"
	random_sensor = FALSE

// Non-official //
/obj/item/clothing/under/rank/security/old
	name = "ancient sec jumpsuit"
	desc = "A relic from security of old, this jumpsuit was coloured red to hide any potential bloodstains."
	icon_state = "old_security"
	item_state = "r_suit"

/obj/item/clothing/under/rank/security/constable
	name = "constable outfit"
	desc = "A british looking outfit."
	icon_state = "constable"
	item_state = "constable"
	can_adjust = FALSE
	custom_price = 200

/obj/item/clothing/under/rank/security/officer/spacepol
	name = "police officer's uniform"
	desc = "A snazzy, vintage-looking kind of police uniform with a golden badge indicating who's the actual law. Worn by SolGov Police."
	icon_state = "spacepol"
	item_state = "spacepol"
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/officer/spacepol/chief
	name = "police commmand's uniform"
	desc = "A snazzy, vintage-looking kind of police uniform with a golden badge indicating who's the actual law, with added gold on the uniform, and black pants! Worn by SolGov Police."
	icon_state = "spacepol_chief"
	item_state = "spacepol_chief"

/obj/item/clothing/under/rank/security/officer/beatcop
	name = "space police uniform"
	desc = "A police uniform often found in the lines at donut shops."
	icon_state = "spacepolice_families"
	item_state = "spacepolice_families"
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/officer/blueshirt
	name = "blue shirt and tie"
	desc = "I'm a little busy right now, Calhoun."
	icon_state = "blueshift"
	item_state = "blueshift"
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/officer/mallcop
	name = "NT mall cop uniform"
	desc = "The radio and badge are sewn on, what a crappy knock off. Secway not included."
	icon_state = "mallcop"
	can_adjust = FALSE
