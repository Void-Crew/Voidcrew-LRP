/obj/item/clothing/under/syndicate
	name = "tactical turtleneck"
	desc = "A non-descript and slightly suspicious looking turtleneck with digital camouflage cargo pants."
	icon_state = "syndicate"
	item_state = "bl_suit"
	has_sensor = NO_SENSORS
	armor = list("melee" = 10, "bullet" = 5, "laser" = 5,"energy" = 5, "bomb" = 10, "bio" = 15, "rad" = 15, "fire" = 50, "acid" = 50)
	alt_covers_chest = TRUE
	icon = 'icons/obj/clothing/under/syndicate.dmi'
	mob_overlay_icon = 'icons/mob/clothing/under/syndicate.dmi'

/obj/item/clothing/under/syndicate/skirt
	name = "tactical skirtleneck"
	desc = "A non-descript and slightly suspicious looking skirtleneck."
	icon_state = "syndicate_skirt"
	item_state = "bl_suit"
	has_sensor = NO_SENSORS
	alt_covers_chest = TRUE
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE

/obj/item/clothing/under/syndicate/bloodred
	name = "blood-red sneaksuit"
	desc = "It still counts as stealth if there are no witnesses."
	icon_state = "bloodred_pajamas"
	item_state = "bl_suit"
	armor = list("melee" = 10, "bullet" = 10, "laser" = 10,"energy" = 10, "bomb" = 0, "bio" = 0, "rad" = 10, "fire" = 50, "acid" = 40)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	can_adjust = FALSE

/obj/item/clothing/under/syndicate/bloodred/sleepytime
	name = "blood-red pajamas"
	desc = "Do operatives dream of nuclear sheep?"
	icon_state = "bloodred_pajamas"
	item_state = "bl_suit"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 40)

/obj/item/clothing/under/syndicate/tacticool
	name = "tacticool turtleneck"
	desc = "Just looking at it makes you want to buy an SKS, go into the woods, and -operate-."
	icon_state = "tactifool"
	item_state = "bl_suit"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 40)

/obj/item/clothing/under/syndicate/tacticool/skirt
	name = "tacticool skirtleneck"
	desc = "Just looking at it makes you want to buy an SKS, go into the woods, and -operate-."
	icon_state = "tactifool_skirt"
	item_state = "bl_suit"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 40)
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE

/obj/item/clothing/under/syndicate/sniper
	name = "Tactical turtleneck suit"
	desc = "A double seamed tactical turtleneck disguised as a civilian grade silk suit. Intended for the most formal operator. The collar is really sharp."
	icon = 'icons/obj/clothing/under/suits.dmi'
	icon_state = "really_black_suit"
	item_state = "bl_suit"
	mob_overlay_icon = 'icons/mob/clothing/under/suits.dmi'
	can_adjust = FALSE

/obj/item/clothing/under/syndicate/camo
	name = "camouflage fatigues"
	desc = "A green military camouflage uniform."
	icon_state = "camogreen"
	item_state = "g_suit"
	can_adjust = FALSE

/obj/item/clothing/under/syndicate/soviet
	name = "Ratnik 5 tracksuit"
	desc = "Badly translated labels tell you to clean this in Vodka. Great for squatting in."
	icon_state = "trackpants"
	can_adjust = FALSE
	resistance_flags = NONE

/obj/item/clothing/under/syndicate/combat
	name = "combat uniform"
	desc = "With a suit lined with this many pockets, you are ready to operate."
	icon_state = "syndicate_combat"
	can_adjust = FALSE

/obj/item/clothing/under/syndicate/rus_army
	name = "advanced military tracksuit"
	desc = "Military grade tracksuits for frontline squatting."
	icon_state = "rus_under"
	can_adjust = FALSE
	resistance_flags = NONE

/obj/item/clothing/under/syndicate/intern
	name = "red polo and khaki pants"
	desc = "A non-descript and slightly suspicious looking polo paired with a respectable yet also suspicious pair of khaki pants."
	icon_state = "jake"
	can_adjust = FALSE
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 40)
	alt_covers_chest = TRUE

/obj/item/clothing/under/syndicate/donk
	name = "Donk! Co. employee uniform"
	desc = "The standard employee uniform of Donk Co. Smells like minimum wage."
	icon_state = "donk_cargo"
	can_adjust = FALSE
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 40)
	body_parts_covered = CHEST|GROIN|ARMS
	alt_covers_chest = TRUE

/obj/item/clothing/under/syndicate/donk/qm
	name = "Donk! Co. manager uniform"
	desc = "The standard uniform of Donk Co. managers. Direct all complaints here."
	icon_state = "donk_qm"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS

/obj/item/clothing/under/syndicate/cybersun
	name = "Cybersun jumpsuit"
	desc = "The standard jumpsuit used by the agents employed by Cybersun, in its distinctive half-black-half-white aesthetic."
	icon_state = "cybersun_agent"
	can_adjust = FALSE
	alt_covers_chest = TRUE

/obj/item/clothing/under/syndicate/cybersun/research
	name = "Cybersun coveralls"
	desc = "Nomex coveralls worn by workers and research personnel employed by Cybersun industries."
	icon_state = "cybersun"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 100)
	alt_covers_chest = TRUE

/obj/item/clothing/under/syndicate/cybersun/officer
	name = "Cybersun officer's suit"
	desc = "A crimson-red suit used by the officers employed by Cybersun."
	icon_state = "cybersun_officer"
	alt_covers_chest = TRUE

/obj/item/clothing/under/syndicate/medic
	name = "Cybersun medical jumpsuit"
	desc = "Sterile coveralls worn by Cybersun Industries field medics for protection against biological hazards."
	icon_state = "cybersun_med"
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/syndicate/medic/skirt
	name = "Cybersun medical jumpskirt"
	desc = "A sterile jumpskirt worn by Cybersun Industries field medics for protection against biological hazards."
	icon_state = "cybersun_med_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE

/obj/item/clothing/under/syndicate/aclf
	name = "ACLF officer uniform"
	desc = "A black uniform worn by officers of the The Gorlex Marauders."
	icon_state = "aclf"
	can_adjust = FALSE
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 40)
	alt_covers_chest = TRUE

/obj/item/clothing/under/syndicate/aclf/grunt
	name = "ACLF uniform"
	desc = "A button-up in a tasteful shade of gray with red pants, used as the basic uniform of the Anti-Corporate Liberation Front."
	icon_state = "aclf_grunt"
	can_adjust = FALSE
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 40)
	alt_covers_chest = TRUE

/obj/item/clothing/under/syndicate/gorlex
	name = "Gorlex Marauder uniform"
	desc = "Originally worn by the miners of the Gorlex VII colony, it is now donned by veteran Gorlex Marauders."
	icon_state = "gorlex"
	can_adjust = FALSE
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 40)
	alt_covers_chest = TRUE

/obj/item/clothing/under/syndicate/gec
	name = "GEC engineer jumpsuit"
	desc = "A jumpsuit worn by GEC engineers. This one is worn by low ranking engineers."
	icon_state = "gec_engineer"
	can_adjust = FALSE
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 10, "fire" = 60, "acid" = 20)
	resistance_flags = NONE

/obj/item/clothing/under/syndicate/gec/atmos_tech
	name = "GEC atmospheric technician jumpsuit"
	desc = "A jumpsuit worn by GEC engineers. This one is worn by atmospheric technicians."
	icon_state = "gec_atmos"

/obj/item/clothing/under/syndicate/gec/chief_engineer
	name = "GEC chief engineer jumpsuit"
	desc = "A jumpsuit worn by GEC engineers. This one is worn by high ranking chiefengineers."
	icon_state = "gec_ce"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 10, "fire" = 80, "acid" = 40)

/obj/item/clothing/under/syndicate/interdyne
	name = "interdyne turtleneck"
	desc = "A dusty dark red turtleneck with tactical cargo pants, the shoulder shows the logo of the company Interdyne Pharmaceuticals."
	icon_state = "interdyne"

/obj/item/clothing/under/syndicate/interdyne/skirt
	name = "interdyne skirtleneck"
	desc = "A dusty dark red turtleneck with a free flowing black skirt, the shoulder shows the logo of the company Interdyne Pharmaceuticals."
	icon_state = "interdyne_skirt"

/obj/item/clothing/under/syndicate/interdyne/medical
	name = "interdyne medical turtleneck"
	desc = "A sterile white turtleneck with tactical cargo pants, the shoulder shows the logo of the company Interdyne Pharmaceuticals."
	icon_state = "interdynemed"

/obj/item/clothing/under/syndicate/interdyne/medical/skirt
	name = "interdyne medical skirtleneck"
	desc = "A sterile white turtleneck with a free flowing black skirt, the shoulder shows the logo of the company Interdyne Pharmaceuticals."
	icon_state = "interdynemed_skirt"

/obj/item/clothing/under/syndicate/interdyne/officer
	name = "interdyne officer's suit"
	desc = "A dusty-rose suit used by the officers employed by Interdyne Pharmaceuticals."
	icon_state = "interdyne_officer"
	alt_covers_chest = TRUE

/obj/item/clothing/under/syndicate/inteq
	name = "inteq turtleneck"
	desc = "A rich brown turtleneck with black pants, it has a small 'IRMG' embroidered onto the shoulder."
	icon_state = "inteq"
	item_state = "bl_suit"
	has_sensor = HAS_SENSORS
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 40)
	alt_covers_chest = TRUE
	icon = 'icons/obj/clothing/under/syndicate.dmi'
	mob_overlay_icon = 'icons/mob/clothing/under/syndicate.dmi'

/obj/item/clothing/under/syndicate/inteq/skirt
	name = "inteq skirtleneck"
	desc = "A rich brown turtleneck with a free flowing black skirt, it has a small 'IRMG' embroidered onto the shoulder."
	icon_state = "inteq_skirt"
	item_state = "bl_suit"
	has_sensor = HAS_SENSORS
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 40)
	body_parts_covered = CHEST|GROIN|ARMS
	alt_covers_chest = TRUE

/obj/item/clothing/under/syndicate/inteq/artificer
	name = "inteq artificer overalls"
	desc = "A black set of overalls atop a standard issue turtleneck, for the IRMG's support division Artificers."
	icon_state = "inteqeng"

/obj/item/clothing/under/syndicate/inteq/skirt/artificer
	name = "inteq artificer overall skirt"
	desc = "A black set of overalls in the likeness of a skirt atop a standard issue turtleneck, for the IRMG's support division Artificers."
	icon_state = "inteqeng_skirt"

/obj/item/clothing/under/syndicate/inteq/corpsman
	name = "inteq corpsman turtleneck"
	desc = "A sterile white turtleneck with tactical cargo pants, it is emblazoned with the lettering 'IRMG' on the shoulder. For the IRMG's support division Corpsmen."
	icon_state = "inteqmed"

/obj/item/clothing/under/syndicate/inteq/skirt/corpsman
	name = "inteq corpsman skirtleneck"
	desc = "A sterile white turtleneck with a free flowing black skirt, it is emblazoned with the lettering 'IRMG' on the shoulder. For the IRMG's support division Corpsmen."
	icon_state = "inteqmed_skirt"

/obj/item/clothing/under/syndicate/inteq/honorable
	name = "honorable vanguard turtleneck"
	desc = "a midnight black turtleneck worn by honorable Vanguards of the IRMG."
	icon_state = "inteq_honorable"
	item_state = "inteq_honorable"
