/mob/living/simple_animal/hostile/weyland
	name = "\improper Weyland-Yutani Corporate Security"
	desc = "A tough officer of Weyland-Yutani. Admittedly better than Nanotrasen Private Security."
	icon = 'icons/mob/simple_human.dmi'
	icon_state = "goon88m4"
	icon_living = "goon88m4"
	icon_dead = null
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	speak_chance = 0
	turns_per_move = 5
	speed = 0
	stat_attack = HARD_CRIT
	robust_searching = 1
	maxHealth = 150
	health = 150
	ranged = 1
	retreat_distance = 3
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/c45
	projectilesound = 'sound/weapons/88m4.ogg'
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 15
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = INTENT_HARM
	deathmessage = "collapses to the floor, pulling a pin on a grenade and exploding."
	loot = list(/obj/effect/gibspawner/human,/obj/effect/explosion)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	faction = list(ROLE_DEATHSQUAD)
	check_friendly_fire = TRUE
	status_flags = CANPUSH
	del_on_death = TRUE
	dodging = TRUE
	footstep_type = FOOTSTEP_MOB_NANOTRASEN

/mob/living/simple_animal/hostile/weyland/m41a
	icon_state = "goonm41a2"
	icon_living = "goonm41a2"
	maxHealth = 175
	health = 175
	rapid = 2
	retreat_distance = 3
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/caseless/c47x33mm
	projectilesound = 'sound/weapons/m41a.ogg'
	loot = list(/obj/effect/gibspawner/human,/obj/effect/explosion)

/mob/living/simple_animal/hostile/weyland/lead
	name = "\improper Weyland-Yutani Corporate Security Lead"
	desc = "A tougher leading officer of Weyland-Yutani. Admittedly better than Nanotrasen Private Security. This one's a little stronger than the normal goons."
	icon_state = "goonlead"
	icon_living = "goonlead"
	maxHealth = 225
	health = 225
	rapid = 3
	retreat_distance = 3
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/caseless/c47x33mm
	projectilesound = 'sound/weapons/nsg23.ogg'
	loot = list(/obj/effect/gibspawner/human,/obj/effect/explosion)

/mob/living/simple_animal/hostile/weyland/pmc
	name = "\improper Weyland-Yutani PMC Soldier"
	desc = "A tough-looking military combatant. Their choice of uniform color is quite unusual, but unique. Makes them a valuable enemy, they're armed with a M41A."
	icon_state = "pmcstandardm41a2"
	icon_living = "pmcstandardm41a2"
	maxHealth = 275
	health = 275
	rapid = 3
	retreat_distance = 3
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/caseless/c47x33mm
	projectilesound = 'sound/weapons/m41a.ogg'
	loot = list(/obj/effect/gibspawner/human,/obj/effect/explosion)

/mob/living/simple_animal/hostile/weyland/pmc/m39
	name = "\improper Weyland-Yutani PMC Soldier"
	desc = "A tough-looking military combatant. Their choice of uniform color is quite unusual, but unique. Makes them a valuable enemy, they're armed with a M39 submachinegun."
	icon_state = "pmcstandardm39"
	icon_living = "pmcstandardm39"
	rapid = 3
	retreat_distance = 5
	minimum_distance = 7
	casingtype = /obj/item/ammo_casing/caseless/c47x33mm
	projectilesound = 'sound/weapons/m39.ogg'
	loot = list(/obj/effect/gibspawner/human,/obj/effect/explosion)

/mob/living/simple_animal/hostile/weyland/pmc/nsg23
	name = "\improper Weyland-Yutani PMC Soldier"
	desc = "A tough-looking military combatant. Their choice of uniform color is quite unusual, but unique. Makes them a valuable enemy, they're armed with a NSG 23 assault rifle."
	icon_state = "pmcstandardnsg23"
	icon_living = "pmcstandardnsg23"
	maxHealth = 275
	health = 275
	rapid = 3
	retreat_distance = 3
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/caseless/c47x33mm
	projectilesound = 'sound/weapons/nsg23.ogg'
	loot = list(/obj/effect/gibspawner/human,/obj/effect/explosion)

/mob/living/simple_animal/hostile/weyland/pmc/sniper
	name = "\improper Weyland-Yutani PMC Sniper"
	desc = "A tough-looking military combatant. Their choice of uniform color is quite unusual, but unique. Makes them a valuable enemy, they're armed with a M42C anti-tank sniper rifle."
	icon_state = "pmcsniper"
	icon_living = "pmcsniper"
	maxHealth = 200
	health = 200
	rapid = 1
	retreat_distance = 12
	minimum_distance = 15
	aggro_vision_range = 15
	vision_range = 15
	casingtype = /obj/item/ammo_casing/a300
	projectilesound = 'sound/weapons/sniper_heavy.ogg'
	loot = list(/obj/effect/gibspawner/human,/obj/effect/explosion)

/mob/living/simple_animal/hostile/weyland/pmc/heavy
	name = "\improper Weyland-Yutani PMC Heavy Gunner"
	desc = "A extremely tough-looking military combatant. Their choice of uniform color is quite unusual, but unique. Makes them a valuable enemy, they're armed with a M56D 'Dirty' smartgun. This one is particularly armored."
	icon_state = "pmcheavy"
	icon_living = "pmcheavy"
	maxHealth = 375
	health = 375
	rapid = 3
	retreat_distance = 3
	minimum_distance = 5
	move_to_delay = 6
	casingtype = /obj/item/ammo_casing/mm712x82
	projectilesound = 'sound/weapons/smartgun.ogg'
	loot = list(/obj/effect/gibspawner/human,/obj/effect/explosion)

/mob/living/simple_animal/hostile/weyland/pmc/officer
	name = "\improper Weyland-Yutani PMC Officer"
	desc = "A tough-looking, and commanding role of a military combatant. Their choice of uniform color is quite unusual, but unique. Makes them a valuable enemy, they're armed with a FN FP9000/2 submachinegun."
	icon_state = "pmcofficer"
	icon_living = "pmcofficer"
	maxHealth = 300
	health = 300
	rapid = 3
	retreat_distance = 3
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/caseless/c556mm
	projectilesound = 'sound/weapons/fp9000.ogg'
	loot = list(/obj/effect/gibspawner/human,/obj/effect/explosion)

/mob/living/simple_animal/hostile/weyland/joe
	name = "\improper Working Joe"
	desc = "A Working Joe, also referred to as Maintenance Synths are a line of rudimentary androids manufactured and sold by the Seegson Corporation."
	icon_state = "joe"
	icon_living = "joe"
	maxHealth = 300
	health = 300
	ranged = 0
	dodge_prob = 0
	harm_intent_damage = 5
	melee_damage_lower = 30
	melee_damage_upper = 35
	retreat_distance = null
	minimum_distance = 1
	deathsound = 'sound/voice/joe/death_normal.ogg'
	deathmessage = "chokes up a dark fluid, collapsing to the floor before exploding."
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	loot = list(/obj/effect/gibspawner/robot,/obj/effect/explosion)

/mob/living/simple_animal/hostile/weyland/joe/hazardous
	name = "\improper Hazardous Environment Working Joe"
	desc = "A Working Joe, also referred to as Maintenance Synths are a line of rudimentary androids manufactured and sold by the Seegson Corporation. This one's in a snazzy hazard suit."
	icon_state = "biojoe"
	icon_living = "biojoe"
	maxHealth = 325
	health = 325

/mob/living/simple_animal/hostile/weyland/joe/maintenance
	name = "\improper Maintenance Working Joe"
	desc = "A Working Joe, also referred to as Maintenance Synths are a line of rudimentary androids manufactured and sold by the Seegson Corporation. This one's in a snazzy hazard suit with some utility overalls, and gripping tightly onto a maintenance jack."
	icon_state = "overallsjoe"
	icon_living = "overallsjoe"
	attack_verb_continuous = "smacks"
	attack_verb_simple = "smack"
	attack_sound = 'sound/weapons/genhit1.ogg'
	maxHealth = 350
	health = 350

/mob/living/simple_animal/hostile/weyland/joe/Aggro()
	..()
	summon_backup(15)
	var/list/messagevoice = list("You really shouldn't be here." = 'sound/voice/joe/really_shouldnt_be_here.ogg',"Running causes accidents." = 'sound/voice/joe/running_accidents.ogg',"You shouldn't be here." = 'sound/voice/joe/shouldnt_be_here.ogg',"You are trespassing." = 'sound/voice/joe/trespassing.ogg',"This is a breach of multiple safety directives." = 'sound/voice/joe/safety_breach.ogg',"Protected area compromised." = 'sound/voice/joe/protected_area_compromised.ogg')
	var/message = pick(messagevoice)
	say(message)
	playsound(src, messagevoice[message], 50)
