/datum/job/blueshield
	title = "Blueshield"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list("Captain")
	head_announce = list(RADIO_CHANNEL_COMMAND)
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain, and head of personnel"
	selection_color = "#ddddff"
	minimal_player_age = 20
	exp_requirements = 180
	officer = TRUE
	wiki_page = "Head_of_Personnel" //WS Edit - Wikilinks/Warning
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_COMMAND
	outfit = /datum/outfit/job/blueshield

	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC

	mind_traits = list(TRAIT_DISK_VERIFIER)

	display_order = JOB_DISPLAY_ORDER_BLUESHIELD

/datum/job/lieutenant/get_access()
	return get_all_accesses()

/datum/outfit/job/blueshield
	name = "Blueshield"
	jobtype = /datum/job/blueshield

	id = /obj/item/card/id/silverbluey
	head = /obj/item/clothing/head/beret/lt
	uniform = /obj/item/clothing/under/rank/command/lieutenant
	alt_uniform = /obj/item/clothing/under/rank/command/lieutenant/alt
	suit = /obj/item/clothing/suit/armor/vest/lieutenant
	alt_suit = /obj/item/clothing/suit/toggle/lieutenant
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/lt
	gloves = /obj/item/clothing/gloves/combat
	shoes = /obj/item/clothing/shoes/jackboots
	ears = /obj/item/radio/headset/heads/captain/alt
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses
	belt = /obj/item/pda/lieutenant
