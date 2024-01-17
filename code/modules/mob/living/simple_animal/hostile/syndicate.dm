/*
	CONTENTS
	LINE 10  - BASE MOB
	LINE 52  - SWORD AND SHIELD
	LINE 164 - GUNS
	LINE 267 - MISC
*/


///////////////Base mob////////////
/obj/effect/light_emitter/red_energy_sword //used so there's a combination of both their head light and light coming off the energy sword
	set_luminosity = 2
	set_cap = 2.5
	light_color = COLOR_SOFT_RED


/mob/living/simple_animal/hostile/syndicate
	name = "Syndicate Conscript"
	desc = "An low rank operative of The Syndicate."
	icon = 'icons/mob/simple_human.dmi'
	icon_state = "syndicate"
	icon_living = "syndicate"
	icon_dead = "syndicate_dead"
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
	melee_damage_upper = 10
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	attack_sound = 'sound/weapons/punch1.ogg'
	deathsound = 'sound/voice/hacked.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/effect/mob_spawn/human/corpse/syndicatesoldier)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	faction = list(ROLE_SYNDICATE)
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 1
	dodging = TRUE
	rapid_melee = 2
	footstep_type = FOOTSTEP_MOB_SHOE

/mob/living/simple_animal/hostile/syndicate/engie
	name = "Syndicate Engineer"
	desc = "An engineer of The Syndicate armed with a welder. Hey look buddy, he's an engineer. That means he solves problems."
	melee_damage_lower = 15
	melee_damage_upper = 15
	melee_damage_type = BURN
	icon_state = "syndicateeng"
	icon_living = "syndicateeng"
	loot = list(/obj/effect/gibspawner/human,/obj/item/weldingtool/hugetank)
	attack_verb_continuous = "burns"
	attack_verb_simple = "burn"
	attack_sound = 'sound/items/welder.ogg'
	status_flags = 0
	var/projectile_deflect_chance = 0

/mob/living/simple_animal/hostile/syndicate/sci
	name = "Syndicate Scientist"
	desc = "An scientist of The Syndicate. Also known as the reason for xenomorph outbreaks, and evil technology."
	melee_damage_lower = 20
	melee_damage_upper = 20
	melee_damage_type = BRUTE
	icon_state = "syndicatesci"
	icon_living = "syndicatesci"
	loot = list(/obj/effect/gibspawner/human,/obj/item/circular_saw,/obj/item/research_notes/loot/big)
	attack_verb_continuous = "saws"
	attack_verb_simple = "saw"
	attack_sound = 'sound/weapons/circsawhit.ogg'
	status_flags = 0
	var/projectile_deflect_chance = 0

///////////////Melee////////////

/mob/living/simple_animal/hostile/syndicate/space
	name = "Syndicate Conscript"
	desc = "An low rank operative of The Syndicate. IN SPACE!"
	icon_state = "syndicate_space"
	icon_living = "syndicate_space"
	maxHealth = 125
	health = 125
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speed = 1

/mob/living/simple_animal/hostile/syndicate/space/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)
	set_light(4)

/mob/living/simple_animal/hostile/syndicate/space/stormtrooper
	name = "Syndicate Conscript"
	desc = "An low rank operative of The Syn-- HEY WAIT- WHO GAVE THE CONSCRIPT A ELITE SUIT?!"
	icon_state = "syndicate_stormtrooper"
	icon_living = "syndicate_stormtrooper"
	maxHealth = 150
	health = 150

/mob/living/simple_animal/hostile/syndicate/melee //dude with a knife and no shields
	name = "Syndicate Conscript"
	melee_damage_lower = 15
	melee_damage_upper = 15
	icon_state = "syndicate_knife"
	icon_living = "syndicate_knife"
	loot = list(/obj/effect/gibspawner/human)
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	status_flags = 0
	var/projectile_deflect_chance = 0

/mob/living/simple_animal/hostile/syndicate/melee/space
	name = "Syndicate Conscript"
	desc = "An low rank operative of The Syndicate. IN SPACE!"
	icon_state = "syndicate_space_knife"
	icon_living = "syndicate_space_knife"
	maxHealth = 125
	health = 125
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speed = 1
	projectile_deflect_chance = 50

/mob/living/simple_animal/hostile/syndicate/melee/space/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)
	set_light(4)

/mob/living/simple_animal/hostile/syndicate/melee/space/stormtrooper
	name = "Syndicate Conscript"
	desc = "An low rank operative of The Syn-- HEY WAIT- WHO GAVE THE CONSCRIPT A ELITE SUIT?!"
	icon_state = "syndicate_stormtrooper_knife"
	icon_living = "syndicate_stormtrooper_knife"
	maxHealth = 150
	health = 150
	projectile_deflect_chance = 50

/mob/living/simple_animal/hostile/syndicate/melee/sword
	name = "Syndicate Elite Operative"
	desc = "One to be feared."
	maxHealth = 200
	health = 200
	melee_damage_lower = 30
	melee_damage_upper = 30
	icon_state = "syndicate_sword"
	icon_living = "syndicate_sword"
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/blade1.ogg'
	armour_penetration = 35
	light_color = COLOR_SOFT_RED
	status_flags = 0
	var/obj/effect/light_emitter/red_energy_sword/sord
	projectile_deflect_chance = 50

/mob/living/simple_animal/hostile/syndicate/melee/sword/Initialize()
	. = ..()
	set_light(2)

/mob/living/simple_animal/hostile/syndicate/melee/sword/Destroy()
	QDEL_NULL(sord)
	return ..()

/mob/living/simple_animal/hostile/syndicate/melee/bullet_act(obj/projectile/Proj)
	if(prob(projectile_deflect_chance))
		visible_message("<span class='danger'>[src] blocks [Proj] with its shield!</span>")
		return BULLET_ACT_BLOCK
	return ..()

/mob/living/simple_animal/hostile/syndicate/melee/sword/captain
	name = "Syndicate Elite Commander"
	desc = "You should run."
	icon_state = "syndicate_desword"
	icon_living = "syndicate_desword"
	maxHealth = 320
	health = 320
	speed = -1
	projectile_deflect_chance = 70
	loot = list(/obj/effect/gibspawner/human,/obj/item/melee/transforming/energy/sword/saber/red)

/mob/living/simple_animal/hostile/syndicate/melee/sword/space
	name = "Syndicate Elite Operative"
	desc = "One to be feared. IN SPACE!"
	icon_state = "syndicate_space_sword"
	icon_living = "syndicate_space_sword"
	maxHealth = 250
	health = 250
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speed = 1
	projectile_deflect_chance = 50

/mob/living/simple_animal/hostile/syndicate/melee/sword/space/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)
	sord = new(src)
	set_light(4)

/mob/living/simple_animal/hostile/syndicate/melee/sword/space/Destroy()
	QDEL_NULL(sord)
	return ..()

/mob/living/simple_animal/hostile/syndicate/melee/sword/space/stormtrooper
	name = "Syndicate Elite Sergeant"
	icon_state = "syndicate_stormtrooper_sword"
	icon_living = "syndicate_stormtrooper_sword"
	name = "Syndicate Stormtrooper"
	maxHealth = 250
	health = 250
	projectile_deflect_chance = 50

///////////////Guns////////////

/mob/living/simple_animal/hostile/syndicate/ranged
	name = "Syndicate Officer"
	desc = "An high ranked operative of The Syndicate."
	ranged = 1
	retreat_distance = 5
	minimum_distance = 5
	icon_state = "syndicate_pistol"
	icon_living = "syndicate_pistol"
	casingtype = /obj/item/ammo_casing/c10mm
	projectilesound = 'sound/weapons/gun/pistol/shot.ogg'
	loot = list(/obj/effect/gibspawner/human)
	dodging = FALSE
	rapid_melee = 1

/mob/living/simple_animal/hostile/syndicate/ranged/infiltrator //shuttle loan event
	projectilesound = 'sound/weapons/gun/smg/shot_suppressed.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/syndicatesoldier)

/mob/living/simple_animal/hostile/syndicate/ranged/space
	name = "Syndicate Officer"
	desc = "An high ranked operative of The Syndicate. IN SPACE."
	icon_state = "syndicate_space_pistol"
	icon_living = "syndicate_space_pistol"
	maxHealth = 170
	health = 170
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speed = 1

/mob/living/simple_animal/hostile/syndicate/ranged/space/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)
	set_light(4)

/mob/living/simple_animal/hostile/syndicate/ranged/space/stormtrooper
	name = "Syndicate Elite Leader"
	desc = "One to be feared. IN SPACE. Oh boy."
	icon_state = "syndicate_stormtrooper_pistol"
	icon_living = "syndicate_stormtrooper_pistol"
	maxHealth = 270
	health = 270

/mob/living/simple_animal/hostile/syndicate/ranged/smg
	name = "Syndicate Elite Operative"
	desc = "One to be feared."
	maxHealth = 200
	health = 200
	rapid = 2
	icon_state = "syndicate_smg"
	icon_living = "syndicate_smg"
	casingtype = /obj/item/ammo_casing/c45
	projectilesound = 'sound/weapons/gun/smg/shot.ogg'

/mob/living/simple_animal/hostile/syndicate/ranged/smg/pilot //caravan ambush ruin
	name = "Syndicate Salvage Pilot"
	loot = list(/obj/effect/mob_spawn/human/corpse/syndicatesoldier)

/mob/living/simple_animal/hostile/syndicate/ranged/smg/space
	name = "Syndicate Elite Operative"
	desc = "One to be feared. IN SPACE."
	icon_state = "syndicate_space_smg"
	icon_living = "syndicate_space_smg"
	maxHealth = 250
	health = 250
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speed = 1

/mob/living/simple_animal/hostile/syndicate/ranged/smg/space/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)
	set_light(4)

/mob/living/simple_animal/hostile/syndicate/ranged/smg/space/stormtrooper
	name = "Syndicate Elite Leader"
	desc = "One to be feared. IN SPACE. Oh boy."
	icon_state = "syndicate_stormtrooper_smg"
	icon_living = "syndicate_stormtrooper_smg"
	name = "Syndicate Stormtrooper"
	maxHealth = 270
	health = 270

/mob/living/simple_animal/hostile/syndicate/ranged/shotgun
	name = "Syndicate Elite Captain"
	desc = "One to be feared even more."
	maxHealth = 300
	health = 300
	rapid = 2
	rapid_fire_delay = 6
	minimum_distance = 3
	icon_state = "syndicate_shotgun"
	icon_living = "syndicate_shotgun"
	casingtype = /obj/item/ammo_casing/shotgun/buckshot //buckshot (up to 72.5 brute) fired in a two-round burst

/mob/living/simple_animal/hostile/syndicate/ranged/shotgun/space
	name = "Syndicate Elite Captain"
	desc = "One to be feared even more. IN SPACE."
	icon_state = "syndicate_space_shotgun"
	icon_living = "syndicate_space_shotgun"
	name = "Syndicate Commando"
	maxHealth = 320
	health = 320
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speed = 1

/mob/living/simple_animal/hostile/syndicate/ranged/shotgun/space/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)
	set_light(4)

/mob/living/simple_animal/hostile/syndicate/ranged/shotgun/space/stormtrooper
	name = "Syndicate Elite Captain"
	desc = "One to be feared even more. IN SPACE. Oh boy."
	icon_state = "syndicate_stormtrooper_shotgun"
	icon_living = "syndicate_stormtrooper_shotgun"
	maxHealth = 350
	health = 350

///////////////Misc////////////

/mob/living/simple_animal/hostile/syndicate/civilian
	minimum_distance = 10
	retreat_distance = 10
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE

/mob/living/simple_animal/hostile/syndicate/civilian/Aggro()
	..()
	summon_backup(15)
	say("GUARDS!!")


/mob/living/simple_animal/hostile/viscerator
	name = "viscerator"
	desc = "A small, twin-bladed machine capable of inflicting very deadly lacerations."
	icon_state = "viscerator_attack"
	icon_living = "viscerator_attack"
	pass_flags = PASSTABLE | PASSMOB
	a_intent = INTENT_HARM
	mob_biotypes = MOB_ROBOTIC
	health = 25
	maxHealth = 25
	melee_damage_lower = 15
	melee_damage_upper = 15
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	attack_verb_continuous = "cuts"
	attack_verb_simple = "cut"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	faction = list(ROLE_SYNDICATE)
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	mob_size = MOB_SIZE_TINY
	movement_type = FLYING
	limb_destroyer = 1
	speak_emote = list("states")
	bubble_icon = "syndibot"
	gold_core_spawnable = HOSTILE_SPAWN
	del_on_death = 1
	deathmessage = "is smashed into pieces!"

/mob/living/simple_animal/hostile/viscerator/Initialize()
	. = ..()
	AddComponent(/datum/component/swarming)
