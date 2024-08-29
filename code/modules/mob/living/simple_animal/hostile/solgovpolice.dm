/mob/living/simple_animal/hostile/police
	name = "Police Officer"
	desc = "A Solarian Government police officer, on their patrol as usual, they don't seem particularly friendly though.. They aren't holding anything."
	icon = 'icons/mob/simple_human.dmi'
	health = 100
	maxHealth = 100
	icon_state = "police"
	icon_living = "police"
	icon_dead = null
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	speak_chance = 0
	turns_per_move = 5
	speed = 0
	stat_attack = HARD_CRIT
	robust_searching = 1
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 15
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = INTENT_HARM
	deathsound = 'sound/voice/die1.ogg'
	var/static/list/police_sounds
	deathmessage = "collapses to the floor, going limp as their lifeline ceases."
	loot = list(/obj/effect/mob_spawn/human/corpse/police/armorless)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	faction = list(ROLE_DEATHSQUAD)
	check_friendly_fire = TRUE
	status_flags = CANPUSH
	del_on_death = TRUE
	dodging = TRUE
	footstep_type = FOOTSTEP_MOB_NANOTRASEN

/mob/living/simple_animal/hostile/police/Initialize()
	. = ..()
	police_sounds = list('sound/voice/policechatter1.ogg', 'sound/voice/policechatter2.ogg', 'sound/voice/policechatter3.ogg')

/mob/living/simple_animal/hostile/police/say(message, bubble_type, list/spans = list(), sanitize = TRUE, datum/language/language = null, ignore_spam = FALSE, forced = null)
	..()
	if(stat)
		return
	var/chosen_sound = pick(police_sounds)
	playsound(src, chosen_sound, 50, TRUE)

/mob/living/simple_animal/hostile/police/Life()
	..()
	if(stat)
		return
	if(prob(10))
		var/chosen_sound = pick(police_sounds)
		playsound(src, chosen_sound, 50, TRUE)

/mob/living/simple_animal/hostile/police/Aggro()
	..()
	summon_backup(15)
	say("Suspect spotted, requesting backup!")

/mob/living/simple_animal/hostile/police/baton
	desc = "A Solarian Government police officer, on their patrol as usual, they don't seem particularly friendly though.. They are gripping onto a baton."
	icon_state = "policebaton"
	icon_living = "policebaton"
	melee_damage_lower = 25
	melee_damage_upper = 25
	melee_damage_type = STAMINA
	attack_verb_continuous = "stuns"
	attack_verb_simple = "stun"
	attack_sound = 'sound/effects/woodhit.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/police/armorless,/obj/item/melee/classic_baton/solgov)

/mob/living/simple_animal/hostile/police/ranged
	desc = "A Solarian Government police officer, on their patrol as usual, they don't seem particularly friendly though.. They are gripping onto a Worn Candor."
	icon_state = "policepistol"
	icon_living = "policepistol"
	ranged = 1
	retreat_distance = 3
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/c45
	projectilesound = 'sound/weapons/gun/pistol/candor.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/police/armorless,/obj/item/gun/ballistic/automatic/pistol/candor)

/mob/living/simple_animal/hostile/police/armored
	name = "Armored Police Officer"
	desc = "A Solarian Government police officer, on their patrol as usual with some added armor! They don't seem particularly friendly though.. They aren't holding anything."
	health = 150
	maxHealth = 150
	icon_state = "policearmored"
	icon_living = "policearmored"
	loot = list(/obj/effect/mob_spawn/human/corpse/police)

/mob/living/simple_animal/hostile/police/armored/baton
	desc = "A Solarian Government police officer, on their patrol as usual with some added armor! They don't seem particularly friendly though.. They are gripping onto a baton."
	icon_state = "policearmoredbaton"
	icon_living = "policearmoredbaton"
	melee_damage_lower = 25
	melee_damage_upper = 25
	melee_damage_type = STAMINA
	attack_verb_continuous = "stuns"
	attack_verb_simple = "stun"
	attack_sound = 'sound/effects/woodhit.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/police,/obj/item/melee/classic_baton/solgov)

/mob/living/simple_animal/hostile/police/armored/ranged
	desc = "A Solarian Government police officer, on their patrol as usual with some added armor! They don't seem particularly friendly though.. They are gripping onto a Worn Candor."
	icon_state = "policearmoredpistol"
	icon_living = "policearmoredpistol"
	ranged = 1
	retreat_distance = 3
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/c45
	projectilesound = 'sound/weapons/gun/pistol/candor.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/police,/obj/item/gun/ballistic/automatic/pistol/candor)

/mob/living/simple_animal/hostile/police/hicom
	name = "Police Lieutenant"
	desc = "A Solarian Government police lieutenant, on their patrol with other officers usually, they don't seem particularly friendly though.. They aren't holding anything."
	health = 200
	maxHealth = 200
	icon_state = "policehigh"
	icon_living = "policehigh"
	loot = list(/obj/effect/mob_spawn/human/corpse/police/hicom/armorless)

/mob/living/simple_animal/hostile/police/hicom/baton
	name = "Police Lieutenant"
	desc = "A Solarian Government police lieutenant, on their patrol with other officers usually, they don't seem particularly friendly though.. They are gripping onto a baton."
	icon_state = "policehighbaton"
	icon_living = "policehighbaton"
	melee_damage_lower = 30
	melee_damage_upper = 30
	melee_damage_type = STAMINA
	attack_verb_continuous = "stuns"
	attack_verb_simple = "stun"
	attack_sound = 'sound/effects/woodhit.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/police/hicom/armorless,/obj/item/melee/classic_baton/solgov/gold)

/mob/living/simple_animal/hostile/police/hicom/ranged
	desc = "A Solarian Government police lieutenant, on their patrol with other officers usually, they don't seem particularly friendly though.. They are gripping onto a Factory-New Candor."
	icon_state = "policehighpistol"
	icon_living = "policehighpistol"
	ranged = 1
	retreat_distance = 3
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/c45
	projectilesound = 'sound/weapons/gun/pistol/candor.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/police/hicom/armorless,/obj/item/gun/ballistic/automatic/pistol/candor/factory)

/mob/living/simple_animal/hostile/police/hicom/ranged/shotgun
	desc = "A Solarian Government police lieutenant, on their patrol with other officers usually, they don't seem particularly friendly though.. They are gripping onto a HP Brimstone."
	icon_state = "policehighshotgun"
	icon_living = "policehighshotgun"
	casingtype = /obj/item/ammo_casing/shotgun/buckshot
	projectilesound = 'sound/weapons/gun/shotgun/shot.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/police/hicom/armorless,/obj/item/gun/ballistic/shotgun/brimstone)

/mob/living/simple_animal/hostile/police/hicom/armored
	name = "Armored Police Lieutenant"
	desc = "A Solarian Government police lieutenant, on their patrol with other officers usually with some added armor! They don't seem particularly friendly though.. They aren't holding anything."
	health = 250
	maxHealth = 250
	icon_state = "policehigharmored"
	icon_living = "policehigh"
	loot = list(/obj/effect/mob_spawn/human/corpse/police/hicom)

/mob/living/simple_animal/hostile/police/hicom/armored/baton
	name = "Armored Police Lieutenant"
	desc = "A Solarian Government police lieutenant, on their patrol with other officers usually with some added armor! They don't seem particularly friendly though.. They are gripping onto a baton."
	icon_state = "policehigharmoredbaton"
	icon_living = "policehigharmoredbaton"
	melee_damage_lower = 30
	melee_damage_upper = 30
	melee_damage_type = STAMINA
	attack_verb_continuous = "stuns"
	attack_verb_simple = "stun"
	attack_sound = 'sound/effects/woodhit.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/police/hicom,/obj/item/melee/classic_baton/solgov/gold)

/mob/living/simple_animal/hostile/police/hicom/armored/ranged
	name = "Armored Police Lieutenant"
	desc = "A Solarian Government police lieutenant, on their patrol with other officers usually with some added armor! They don't seem particularly friendly though.. They are gripping onto a Factory-New Candor."
	icon_state = "policehigharmoredpistol"
	icon_living = "policehigharmoredpistol"
	ranged = 1
	retreat_distance = 3
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/c45
	projectilesound = 'sound/weapons/gun/pistol/candor.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/police/hicom/armorless,/obj/item/gun/ballistic/automatic/pistol/candor/factory)

/mob/living/simple_animal/hostile/police/hicom/armored/ranged/shotgun
	name = "Armored Police Lieutenant"
	desc = "A Solarian Government police lieutenant, on their patrol with other officers usually with some added armor! They don't seem particularly friendly though.. They are gripping onto a HP Brimstone."
	icon_state = "policehigharmoredshotgun"
	icon_living = "policehigharmoredshotgun"
	casingtype = /obj/item/ammo_casing/shotgun/buckshot
	projectilesound = 'sound/weapons/gun/shotgun/shot.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/police/hicom/armorless,/obj/item/gun/ballistic/shotgun/brimstone)

/mob/living/simple_animal/hostile/police/chief
	name = "Police Chief"
	desc = "A Solarian Government police chief, the highest rank within the department. They seem especially pissed off towards you. They are gripping onto a CM-5."
	icon_state = "policechief"
	icon_living = "policechief"
	maxHealth = 300
	health = 300
	rapid = 5
	ranged = 1
	retreat_distance = 3
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/c9mm
	projectilesound = 'sound/weapons/gun/smg/smg_heavy.ogg'
	loot = list(/obj/effect/gibspawner/human,/obj/effect/explosion,/obj/item/gun/ballistic/automatic/cm5)
