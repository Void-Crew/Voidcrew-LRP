/datum/job/officer
	title = "Security Officer"
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list("Head of Security")
	faction = "Station"
	total_positions = 5 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	spawn_positions = 5 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	supervisors = "the head of security, and the head of your assigned department (if applicable)"
	selection_color = "#ffeeee"
	minimal_player_age = 7
	exp_requirements = 300
	exp_type = EXP_TYPE_CREW
	wiki_page = "Space_Law" //WS Edit - Wikilinks/Warning

	outfit = /datum/outfit/job/security

	access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_COURT, ACCESS_MAINT_TUNNELS, ACCESS_MECH_SECURITY, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_FORENSICS_LOCKERS, ACCESS_MINERAL_STOREROOM, ACCESS_EVA)
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_MECH_SECURITY, ACCESS_MINERAL_STOREROOM) // See /datum/job/officer/get_access()
	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_SEC
	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_SECURITY_OFFICER

/datum/job/officer/get_access()
	var/list/L = list()
	L |= ..() | check_config_for_sec_maint()
	return L

GLOBAL_LIST_INIT(available_depts, list(SEC_DEPT_ENGINEERING, SEC_DEPT_MEDICAL, SEC_DEPT_SCIENCE, SEC_DEPT_SUPPLY))

/datum/job/officer/after_spawn(mob/living/carbon/human/H, mob/M)
	. = ..()
	// Assign department security
	var/department
	if(M && M.client && M.client.prefs)
		department = M.client.prefs.prefered_security_department
		if(!LAZYLEN(GLOB.available_depts) || department == "None")
			return
		else if(department in GLOB.available_depts)
			LAZYREMOVE(GLOB.available_depts, department)
		else
			department = pick_n_take(GLOB.available_depts)
	var/ears = null
	var/accessory = null
	var/list/dep_access = null
	var/spawn_point = null
	switch(department)
		if(SEC_DEPT_SUPPLY)
			ears = /obj/item/radio/headset/headset_sec/alt/department/supply
			dep_access = list(ACCESS_MAILSORTING, ACCESS_MINING, ACCESS_MINING_STATION, ACCESS_CARGO)
			spawn_point = locate(/obj/effect/landmark/start/depsec/supply) in GLOB.department_security_spawns
			accessory = /obj/item/clothing/accessory/armband/cargo
		if(SEC_DEPT_ENGINEERING)
			ears = /obj/item/radio/headset/headset_sec/alt/department/engi
			dep_access = list(ACCESS_CONSTRUCTION, ACCESS_ENGINE, ACCESS_ATMOSPHERICS)
			spawn_point = locate(/obj/effect/landmark/start/depsec/engineering) in GLOB.department_security_spawns
			accessory = /obj/item/clothing/accessory/armband/engine
		if(SEC_DEPT_MEDICAL)
			ears = /obj/item/radio/headset/headset_sec/alt/department/med
			dep_access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY)
			spawn_point = locate(/obj/effect/landmark/start/depsec/medical) in GLOB.department_security_spawns
			accessory =  /obj/item/clothing/accessory/armband/medblue
		if(SEC_DEPT_SCIENCE)
			ears = /obj/item/radio/headset/headset_sec/alt/department/sci
			dep_access = list(ACCESS_RESEARCH, ACCESS_TOX)
			spawn_point = locate(/obj/effect/landmark/start/depsec/science) in GLOB.department_security_spawns
			accessory = /obj/item/clothing/accessory/armband/science

	if(accessory)
		var/obj/item/clothing/under/U = H.w_uniform
		U.attach_accessory(new accessory)
	if(ears)
		if(H.ears)
			qdel(H.ears)
		H.equip_to_slot_or_del(new ears(H),ITEM_SLOT_EARS)

	var/obj/item/card/id/W = H.wear_id
	W.access |= dep_access

	if(!CONFIG_GET(flag/sec_start_brig))
		if(spawn_point)
			var/turf/T
			T = get_turf(spawn_point)
			H.Move(T)
	if(department)
		to_chat(M, "<b>You have been assigned to [department]!</b>")
	else
		to_chat(M, "<b>You have not been assigned to any department. Patrol the halls and help where needed.</b>")



/datum/outfit/job/security
	name = "Security Officer"
	jobtype = /datum/job/officer

	belt = /obj/item/pda/security
	ears = /obj/item/radio/headset/headset_sec/alt
	uniform = /obj/item/clothing/under/rank/security/officer
	alt_uniform = /obj/item/clothing/under/rank/security/old
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/helmet/sec
	suit = /obj/item/clothing/suit/armor/vest
	alt_suit = /obj/item/clothing/suit/armor/vest/security/officer
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security //WS Edit - Alt Uniforms
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/restraints/handcuffs
	r_pocket = /obj/item/assembly/flash/handheld
	backpack_contents = list(/obj/item/melee/baton/loaded=1, /obj/item/ammo_box/magazine/co9mm=1, /obj/item/gun_voucher=1) //WS edit - security rearming

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec
	box = /obj/item/storage/box/survival/security

	implants = list(/obj/item/implant/mindshield)

	chameleon_extras = list(/obj/item/gun/energy/disabler, /obj/item/clothing/glasses/hud/security/sunglasses, /obj/item/clothing/head/helmet)
	//The helmet is necessary because /obj/item/clothing/head/helmet/sec is overwritten in the chameleon list by the standard helmet, which has the same name and icon state

//Shiptest outfits begin


/obj/item/radio/headset/headset_sec/alt/department/Initialize()
	. = ..()
	wires = new/datum/wires/radio(src)
	secure_radio_connections = new
	recalculateChannels()

/obj/item/radio/headset/headset_sec/alt/department/engi
	keyslot = new /obj/item/encryptionkey/headset_sec
	keyslot2 = new /obj/item/encryptionkey/headset_eng

/obj/item/radio/headset/headset_sec/alt/department/supply
	keyslot = new /obj/item/encryptionkey/headset_sec
	keyslot2 = new /obj/item/encryptionkey/headset_cargo

/obj/item/radio/headset/headset_sec/alt/department/med
	keyslot = new /obj/item/encryptionkey/headset_sec
	keyslot2 = new /obj/item/encryptionkey/headset_med

/obj/item/radio/headset/headset_sec/alt/department/sci
	keyslot = new /obj/item/encryptionkey/headset_sec
	keyslot2 = new /obj/item/encryptionkey/headset_sci

/datum/outfit/job/security/nanotrasen
	name = "Security Officer (Nanotrasen)"

	uniform = /obj/item/clothing/under/rank/security/officer
	alt_uniform = null
	backpack_contents = list(/obj/item/radio, /obj/item/flashlight/seclite, /obj/item/gun_voucher)

/datum/outfit/job/security/nanotrasen/ert
	name = "QRF Officer (Nanotrasen)"

	uniform = /obj/item/clothing/under/rank/security/officer
	head = null
	backpack = /obj/item/storage/backpack/ert/security
	belt = /obj/item/storage/belt/military
	id = /obj/item/card/id/ert/security
	r_pocket = /obj/item/kitchen/knife/combat/survival
	backpack_contents = list(/obj/item/radio, /obj/item/flashlight/seclite)

/datum/outfit/job/security/nanotrasen/ert/engi
	name = "QRF Engineering Officer (Nanotrasen)"

	uniform = /obj/item/clothing/under/rank/engineering/engineer/hazard
	head = null
	backpack = /obj/item/storage/backpack/ert/engineer
	belt = /obj/item/storage/belt/utility/full
	id = /obj/item/card/id/ert/security
	r_pocket = /obj/item/kitchen/knife/combat/survival
	backpack_contents = list(/obj/item/radio, /obj/item/flashlight/seclite)
	accessory = /obj/item/clothing/accessory/armband/engine
	glasses = /obj/item/clothing/glasses/hud/diagnostic/sunglasses

/datum/outfit/job/security/nanotrasen/ert/med
	name = "QRF Medical Officer (Nanotrasen)"

	uniform = /obj/item/clothing/under/rank/security/officer
	head = /obj/item/clothing/head/beret/med
	backpack = /obj/item/storage/backpack/ert/medical
	belt = /obj/item/storage/belt/medical/webbing/paramedic
	id = /obj/item/card/id/ert/security
	r_pocket = /obj/item/kitchen/knife/combat/survival
	backpack_contents = list(/obj/item/radio, /obj/item/flashlight/seclite)
	accessory = /obj/item/clothing/accessory/armband/med
	glasses = /obj/item/clothing/glasses/hud/health/night

/datum/outfit/job/security/nanotrasen/mech_pilot
	name = "Mech Pilot (Nanotrasen)"

	uniform = /obj/item/clothing/under/rank/security/old
	head = /obj/item/clothing/head/beret/sec/officer
	suit = /obj/item/clothing/suit/armor/bulletproof
	backpack_contents = list(/obj/item/radio, /obj/item/flashlight/seclite)

//Shiptest outfits end

/datum/outfit/job/security/soviet
	name = "Soviet Soldier"

	uniform = /obj/item/clothing/under/costume/soviet
	head = /obj/item/clothing/head/ushanka
	l_pocket = /obj/item/reagent_containers/food/drinks/bottle/vodka
	r_pocket = /obj/item/flashlight/seclite
	backpack_contents = list(/obj/item/melee/baton/loaded=1) //VC edit - fuck your security rearming. glory to the soviet union
