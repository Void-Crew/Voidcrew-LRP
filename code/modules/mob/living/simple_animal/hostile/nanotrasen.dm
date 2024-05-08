/mob/living/simple_animal/hostile/nanotrasen
	name = "\improper Nanotrasen Private Security Squad Recruit"
	desc = "An low ranked officer part of Nanotrasen's private security force. Does he know what he's doing? They aren't holding anything."
	icon = 'icons/mob/simple_human.dmi'
	icon_state = "nanotrasen"
	icon_living = "nanotrasen"
	icon_dead = null
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	speak_chance = 0
	turns_per_move = 5
	speed = 0
	stat_attack = HARD_CRIT
	robust_searching = 1
	maxHealth = 100
	health = 100
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 15
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = INTENT_HARM
	deathsound = 'sound/voice/die1.ogg'
	deathmessage = "collapses to the floor, going limp as their lifeline ceases."
	loot = list(/obj/effect/mob_spawn/human/corpse/nanotrasensoldier)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	faction = list(ROLE_DEATHSQUAD)
	check_friendly_fire = TRUE
	status_flags = CANPUSH
	del_on_death = TRUE
	dodging = TRUE
	footstep_type = FOOTSTEP_MOB_NANOTRASEN

/mob/living/simple_animal/hostile/nanotrasen/baton
	desc = "An low ranked officer part of Nanotrasen's private security force. Does he know what he's doing? He's wielding a stun baton."
	icon = 'icons/mob/simple_human.dmi'
	icon_state = "nanotrasenbaton"
	icon_living = "nanotrasenbaton"
	maxHealth = 100
	health = 100
	melee_damage_lower = 25
	melee_damage_upper = 25
	melee_damage_type = STAMINA
	attack_verb_continuous = "stuns"
	attack_verb_simple = "stun"
	attack_sound = 'sound/weapons/egloves.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/nanotrasensoldier,/obj/item/melee/baton/loaded)

/mob/living/simple_animal/hostile/nanotrasen/screaming
	icon_state = "nanotrasen"
	icon_living = "nanotrasen"

/mob/living/simple_animal/hostile/nanotrasen/screaming/Aggro()
	..()
	summon_backup(15)
	say("10-64 in progress, requesting backup!")


/mob/living/simple_animal/hostile/nanotrasen/ranged
	name = "\improper Nanotrasen Private Security Squad Operative"
	desc = "An low ranked officer part of Nanotrasen's private security force. Just MIGHT know what he's doing. They are clutching a M1911."
	icon_state = "nanotrasenranged"
	icon_living = "nanotrasenranged"
	maxHealth = 150
	health = 150
	ranged = 1
	retreat_distance = 3
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/c45
	projectilesound = 'sound/weapons/gun/pistol/shot.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/nanotrasensoldier/ranged,/obj/item/ammo_box/magazine/m45)

/mob/living/simple_animal/hostile/nanotrasen/ranged/shotgun
	name = "\improper Nanotrasen Private Security Biohazard Operative"
	desc = "A mysterious officer in a biohazard suit. They are clutching a riot shotgun."
	icon_state = "nanotrasenbiosec"
	icon_living = "nanotrasenbiosec"
	maxHealth = 120
	health = 120
	ranged = 1
	retreat_distance = 3
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/shotgun/beanbag
	projectilesound = 'sound/weapons/gun/shotgun/shot.ogg'
	loot = list(/obj/effect/gibspawner/human,/obj/effect/explosion,/obj/item/gun/ballistic/shotgun/brimstone)
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)

/mob/living/simple_animal/hostile/nanotrasen/ranged/disabler
	desc = "An low ranked officer part of Nanotrasen's private security force. Just MIGHT know what he's doing. They are clutching a disabler."
	icon_state = "nanotrasenrangeddisabler"
	icon_living = "nanotrasenrangeddisabler"
	casingtype = /obj/item/ammo_casing/energy/disabler
	projectilesound = 'sound/weapons/taser2.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/nanotrasensoldier/ranged,/obj/item/gun/energy/disabler)

/mob/living/simple_animal/hostile/nanotrasen/ranged/smg
	name = "\improper Nanotrasen Private Security Squad Sergeant"
	desc = "An medium ranked officer part of Nanotrasen's private security force. He stares at you with disgust. They are clutching a WT550."
	icon_state = "nanotrasenrangedsmg"
	icon_living = "nanotrasenrangedsmg"
	maxHealth = 200
	health = 200
	rapid = 3
	casingtype = /obj/item/ammo_casing/c46x30mm
	projectilesound = 'sound/weapons/gun/smg/shot.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/nanotrasensoldier/smg,/obj/item/ammo_box/magazine/wt550m9)

/mob/living/simple_animal/hostile/nanotrasen/ranged/smg/taser
	desc = "An medium ranked officer part of Nanotrasen's private security force. He stares at you with disgust. They are clutching a taser, and classic baton."
	icon_state = "nanotrasenrangedtaser"
	icon_living = "nanotrasenrangedtaser"
	rapid = 1
	melee_damage_lower = 15
	melee_damage_upper = 15
	melee_damage_type = STAMINA
	attack_verb_continuous = "batons"
	attack_verb_simple = "baton"
	attack_sound = 'sound/effects/woodhit.ogg'
	casingtype = /obj/item/ammo_casing/energy/electrode
	projectilesound = 'sound/weapons/taser.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/nanotrasensoldier/smg,/obj/item/stock_parts/cell/gun/large/empty)

/mob/living/simple_animal/hostile/nanotrasen/ranged/assault
	name = "\improper Nanotrasen Private Security Squad Commander"
	desc = "A pissed off high ranked officer of the Private Security detail, they look extremely tough. They are clutching a L6 Saw."
	icon_state = "nanotrasenrangedassault"
	icon_living = "nanotrasenrangedassault"
	icon_dead = null
	icon_gib = "syndicate_gib"
	ranged = TRUE
	maxHealth = 300
	health = 300
	rapid = 4
	rapid_fire_delay = 1
	rapid_melee = 1
	retreat_distance = 2
	minimum_distance = 4
	casingtype = /obj/item/ammo_casing/mm712x82
	projectilesound = 'sound/weapons/gun/l6/shot.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/nanotrasensoldier/assault,/obj/item/ammo_box/magazine/mm712x82)

/mob/living/simple_animal/hostile/nanotrasen/ranged/assault/Aggro()
	..()
	summon_backup(15)
	say("10-64! I need backup!")


/mob/living/simple_animal/hostile/nanotrasen/elite
	name = "Nanotrasen Elite Response Officer"
	desc = "Sometimes they just can't afford to send the Death Squad. These guys tend to be enough. They are clutching a heavy laser rifle."
	icon = 'icons/mob/simple_human.dmi'
	icon_state = "nanotrasen_ert"
	icon_living = "nanotrasen_ert"
	maxHealth = 250
	health = 250
	melee_damage_lower = 13
	melee_damage_upper = 18
	ranged = TRUE
	rapid = 3
	rapid_fire_delay = 5
	rapid_melee = 3
	retreat_distance = 0
	minimum_distance = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	projectiletype = /obj/projectile/beam/laser
	projectilesound = 'sound/weapons/laser.ogg'
	loot = list(/obj/effect/gibspawner/human)
	faction = list(ROLE_DEATHSQUAD)

/mob/living/simple_animal/hostile/nanotrasen/civilian
	name = "\improper Nanotrasen Medical Doctor"
	desc = "A mysterious doctor in a biohazard suit."
	icon_state = "nanotrasenbiomed"
	icon_living = "nanotrasenbiomed"
	maxHealth = 100
	health = 100
	minimum_distance = 10
	retreat_distance = 10
	obj_damage = 0
	deathsound = null
	environment_smash = ENVIRONMENT_SMASH_NONE
	loot = list(/obj/effect/gibspawner/human,/obj/effect/explosion,/obj/item/storage/firstaid/brute,/obj/item/research_notes/loot/small)

/mob/living/simple_animal/hostile/nanotrasen/civilian/Aggro()
	..()
	summon_backup(15)
	say("HELP! SECURITY!!")

/mob/living/simple_animal/hostile/nanotrasen/civilian/chem
	name = "\improper Nanotrasen Chemist"
	desc = "A mysterious pharmacologist in a biohazard suit."
	icon_state = "nanotrasenbiochem"
	icon_living = "nanotrasenbiochem"
	loot = list(/obj/effect/gibspawner/human,/obj/effect/explosion,/obj/item/storage/box/hypospray,/obj/item/research_notes/loot/medium)

/mob/living/simple_animal/hostile/nanotrasen/civilian/viro
	name = "\improper Nanotrasen Virologist"
	desc = "A mysterious pathologist in a biohazard suit."
	icon_state = "nanotrasenbioviro"
	icon_living = "nanotrasenbioviro"
	loot = list(/obj/effect/gibspawner/human,/obj/effect/explosion,/obj/item/reagent_containers/glass/bottle/random_virus,/obj/item/research_notes/loot/big)

/mob/living/simple_animal/hostile/nanotrasen/civilian/sci
	name = "\improper Nanotrasen Scientist"
	desc = "A mysterious egghead in a biohazard suit."
	icon_state = "nanotrasenbiosci"
	icon_living = "nanotrasenbiosci"
	loot = list(/obj/effect/gibspawner/human,/obj/effect/explosion,/obj/item/stack/sheet/bluespace_crystal/five,/obj/item/research_notes/loot/genius)
