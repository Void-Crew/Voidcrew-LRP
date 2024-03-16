/datum/job/qm
	title = "Quartermaster"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list("Captain")
	head_announce = list(RADIO_CHANNEL_SUPPLY)
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#d7b088"
	minimal_player_age = 7
	exp_type_department = EXP_TYPE_SUPPLY
	exp_requirements = 180
	exp_type = EXP_TYPE_CREW
	officer = TRUE
	wiki_page = "Quartermaster" //WS Edit - Wikilinks/Warning

	outfit = /datum/outfit/job/quartermaster

	access = list(
		ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, ACCESS_HEADS, ACCESS_SEC_DOORS,
		ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM, ACCESS_VAULT, ACCESS_RC_ANNOUNCE,
		ACCESS_KEYCARD_AUTH)
	minimal_access = list(
		ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, ACCESS_HEADS, ACCESS_SEC_DOORS,
		ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM, ACCESS_VAULT, ACCESS_RC_ANNOUNCE,
		ACCESS_KEYCARD_AUTH)
	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_QUARTERMASTER

/datum/outfit/job/quartermaster
	name = "Quartermaster"
	jobtype = /datum/job/qm

	id = /obj/item/card/id/silver
	belt = /obj/item/pda/quartermaster
	ears = /obj/item/radio/headset/heads/qm
	uniform = /obj/item/clothing/under/rank/cargo/qm
	alt_uniform = /obj/item/clothing/under/suit/qm //WS Edit - Alt Uniforms
	alt_suit = /obj/item/clothing/suit/hazardvest
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/cargo //WS Edit - Alt Uniforms
	shoes = /obj/item/clothing/shoes/sneakers/brown
	gloves = /obj/item/clothing/gloves/color/black
	glasses = /obj/item/clothing/glasses/sunglasses
	l_hand = /obj/item/clipboard
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/cargo=1)

	chameleon_extras = /obj/item/stamp/qm

/datum/outfit/job/quartermaster/supplychief
	name = "Quartermaster (Supply Chief)"
	jobtype = /datum/job/qm

	uniform = /obj/item/clothing/under/suit/qm
	suit = /obj/item/clothing/suit/toggle/hazard
	shoes = /obj/item/clothing/shoes/laceup
	l_hand = null
	head = /obj/item/clothing/head/supply_chief
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/cargo=1, /obj/item/clipboard=1)

/datum/outfit/job/quartermaster/western
	name = "Foreman (Western)"
	uniform = /obj/item/clothing/under/rank/cargo/qm
	suit = /obj/item/clothing/suit/toggle/hazard
	shoes = /obj/item/clothing/shoes/workboots
	glasses = /obj/item/clothing/glasses/sunglasses
	head = /obj/item/clothing/head/cowboy/sec

/datum/outfit/job/quartermaster/soviet
	name = "Soviet Logistics Coordinator"

	uniform = /obj/item/clothing/under/suit/qm
	alt_uniform = null
	shoes = /obj/item/clothing/shoes/jackboots
	l_hand = null
	neck = /obj/item/clothing/neck/tie/brown
	head = /obj/item/clothing/head/beret/qm
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/cargo=1, /obj/item/clipboard=1)
