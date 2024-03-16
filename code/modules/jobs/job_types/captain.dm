/datum/job/captain
	title = "Captain"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list("CentCom")
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Nanotrasen officials and Space law"
	selection_color = "#ccccff"
	minimal_player_age = 30
	exp_requirements = 180
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_COMMAND
	officer = TRUE
	wiki_page = "Captain"

	outfit = /datum/outfit/job/captain

	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC

	mind_traits = list(TRAIT_DISK_VERIFIER)

	display_order = JOB_DISPLAY_ORDER_CAPTAIN

/datum/job/captain/get_access()
	return get_all_accesses()

/datum/outfit/job/captain
	name = "Captain"
	jobtype = /datum/job/captain

	id = /obj/item/card/id/gold
	belt = /obj/item/pda/captain
	gloves = /obj/item/clothing/gloves/color/captain
	uniform =  /obj/item/clothing/under/rank/command/captain
	alt_uniform = /obj/item/clothing/under/rank/command/captain/parade //WS Edit - Alt Uniforms
	suit = /obj/item/clothing/suit/armor/vest/capcarapace
	alt_suit = /obj/item/clothing/suit/armor/vest/capcarapace/alt
	ears = /obj/item/radio/headset/heads/captain/alt
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/caphat
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1, /obj/item/station_charter=1)

	implants = list(/obj/item/implant/mindshield)

	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	courierbag = /obj/item/storage/backpack/messenger/com

	accessory = /obj/item/clothing/accessory/medal/gold/captain

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/captain)

/datum/outfit/job/captain/hardsuit
	name = "Captain (Hardsuit)"

	mask = /obj/item/clothing/mask/gas/atmos/captain
	suit = /obj/item/clothing/suit/space/hardsuit/swat/captain
	suit_store = /obj/item/tank/internals/oxygen

/datum/outfit/job/captain/nt
	name = "Captain (Nanotrasen)"

	uniform =  /obj/item/clothing/under/rank/command/captain/nt
	head = /obj/item/clothing/head/caphat/parade
	suit = /obj/item/clothing/suit/armor/vest/capcarapace/nt
	alt_suit = /obj/item/clothing/suit/armor/vest/capcarapace/alt/nt


/datum/outfit/job/captain/nt/heron
	name = "Captain (Nanotrasen Fleet Captain)"

	uniform = /obj/item/clothing/under/rank/centcom/official
	head = /obj/item/clothing/head/caphat/parade/cent
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/vest/capcarapace/centcom
	ears = /obj/item/radio/headset/headset_cent/commander

/datum/outfit/job/captain/soviet
	name = "Soviet Captain"
	uniform =  /obj/item/clothing/under/costume/russian_officer
	alt_uniform = /obj/item/clothing/under/costume/soviet //WS Edit - Alt Uniforms
	shoes = /obj/item/clothing/shoes/combat
	head = /obj/item/clothing/head/ushanka
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1, /obj/item/station_charter=1)

	accessory = /obj/item/clothing/accessory/medal/silver/valor

	chameleon_extras = list(/obj/item/gun/ballistic/rifle/boltaction, /obj/item/stamp/captain)

/datum/outfit/job/captain/interdyne
	name = "Captain (Interdyne Pharmaceuticals)"

	uniform = /obj/item/clothing/under/syndicate/interdyne/officer
	id = /obj/item/card/id/syndicate_command/captain_id
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	head = /obj/item/clothing/head/HoS/interdyne
	shoes = /obj/item/clothing/shoes/combat
	back = /obj/item/storage/backpack/satchel/sec
	suit = /obj/item/clothing/suit/armor/vest/alt
	ears = /obj/item/radio/headset/syndicate/alt/leader

/datum/outfit/job/captain/cybersun
	name = "Captain (Cybersun Industries)"

	uniform = /obj/item/clothing/under/syndicate/cybersun/officer
	id = /obj/item/card/id/syndicate_command/captain_id
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	head = /obj/item/clothing/head/HoS/cybersun
	shoes = /obj/item/clothing/shoes/combat
	back = /obj/item/storage/backpack/satchel/sec
	suit = /obj/item/clothing/suit/armor/vest/capcarapace/cybersun
	ears = /obj/item/radio/headset/syndicate/alt/leader

/datum/outfit/job/captain/inteq
	name = "Vanguard (IRMG Captain)"

	ears = /obj/item/radio/headset/inteq/alt
	uniform = /obj/item/clothing/under/syndicate/inteq
	head = /obj/item/clothing/head/beret/sec/hos/inteq
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	mask = /obj/item/clothing/mask/gas/sechailer/inteq
	suit = /obj/item/clothing/suit/armor/hos/inteq
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	id = /obj/item/card/id/inteq/com
	accessory = null

	backpack = /obj/item/storage/backpack/messenger/inteq
	satchel = /obj/item/storage/backpack/messenger/inteq
	courierbag = /obj/item/storage/backpack/messenger/inteq

/datum/outfit/job/captain/soviet
	name = "Soviet Captain"
	uniform =  /obj/item/clothing/under/costume/russian_officer
	alt_uniform = /obj/item/clothing/under/costume/soviet //WS Edit - Alt Uniforms
	shoes = /obj/item/clothing/shoes/combat
	head = /obj/item/clothing/head/ushanka
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1, /obj/item/station_charter=1)

	accessory = /obj/item/clothing/accessory/medal/silver/valor

	chameleon_extras = list(/obj/item/gun/ballistic/rifle/boltaction, /obj/item/stamp/captain)
