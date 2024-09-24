/mob/living/simple_animal/hostile/alien
	name = "alien runner"
	desc = "Hiss!"
	icon = 'icons/mob/alienqueen.dmi'
	icon_state = "alienh"
	icon_living = "alienh"
	icon_dead = "alienh_dead"
	icon_gib = "syndicate_gib"
	speed = 0
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/xeno = 4,
							/obj/item/stack/sheet/animalhide/xeno = 1)
	pixel_x = -16
	maxHealth = 200
	health = 200
	harm_intent_damage = 5
	obj_damage = 60
	melee_damage_lower = 25
	melee_damage_upper = 25
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	speak_emote = list("hisses")
	bubble_icon = "alien"
	a_intent = INTENT_HARM
	attack_sound = 'sound/weapons/bladeslice.ogg'
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	faction = list(ROLE_ALIEN)
	status_flags = CANPUSH
	minbodytemp = 0
	see_in_dark = 8
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
	unique_name = 1
	gold_core_spawnable = NO_SPAWN
	deathsound = 'sound/voice/hiss6.ogg'
	deathmessage = "lets out a waning guttural screech, green blood bubbling from its maw..."

/mob/living/simple_animal/hostile/alien/asteroid
	faction = list("mining")

/mob/living/simple_animal/hostile/alien/Initialize()
	. = ..()
	AddComponent(/datum/component/footstep, FOOTSTEP_MOB_CLAW)

/mob/living/simple_animal/hostile/alien/drone
	name = "alien drone"
	icon_state = "aliend"
	icon_living = "aliend"
	icon_dead = "aliend_dead"
	melee_damage_lower = 15
	melee_damage_upper = 15
	var/plant_cooldown = 30
	var/plants_off = 0
	speed = 0

/mob/living/simple_animal/hostile/alien/drone/handle_automated_action()
	if(!..()) //AIStatus is off
		return
	plant_cooldown--
	if(AIStatus == AI_IDLE)
		if(!plants_off && prob(10) && plant_cooldown<=0)
			plant_cooldown = initial(plant_cooldown)
			SpreadPlants()

/mob/living/simple_animal/hostile/alien/sentinel
	name = "alien sentinel"
	icon_state = "aliens"
	icon_living = "aliens"
	icon_dead = "aliens_dead"
	health = 200
	maxHealth = 200
	melee_damage_lower = 15
	melee_damage_upper = 15
	ranged = 1
	retreat_distance = 5
	minimum_distance = 5
	speed = 0
	projectiletype = /obj/projectile/neurotox
	projectilesound = 'sound/weapons/pierce.ogg'

/mob/living/simple_animal/hostile/alien/sentinel/spitter
	name = "alien spitter"
	icon_state = "aliensp"
	icon_living = "aliensp"
	icon_dead = "aliensp_dead"
	health = 300
	maxHealth = 300
	speed = 0

/mob/living/simple_animal/hostile/alien/warrior
	name = "alien warrior"
	icon_state = "alienw"
	icon_living = "alienw"
	icon_dead = "alienw_dead"
	health = 400
	maxHealth = 400
	melee_damage_lower = 20
	melee_damage_upper = 20
	speed = 0

/mob/living/simple_animal/hostile/alien/praetorian
	name = "alien praetorian"
	icon_state = "alienp"
	icon_living = "alienp"
	icon_dead = "alienp_dead"
	health = 450
	maxHealth = 450
	melee_damage_lower = 15
	melee_damage_upper = 15
	retreat_distance = 5
	minimum_distance = 5
	ranged = 1
	speed = 0
	projectiletype = /obj/projectile/neurotox
	projectilesound = 'sound/weapons/pierce.ogg'


/mob/living/simple_animal/hostile/alien/queen
	name = "alien queen"
	icon_state = "alienq"
	icon_living = "alienq"
	icon_dead = "alienq_dead"
	health = 500
	maxHealth = 500
	melee_damage_lower = 25
	melee_damage_upper = 25
	ranged = 1
	retreat_distance = 5
	minimum_distance = 5
	move_to_delay = 4
	speed = 0
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/xeno = 4,
							/obj/item/stack/sheet/animalhide/xeno = 1)
	projectiletype = /obj/projectile/neurotox
	projectilesound = 'sound/weapons/pierce.ogg'
	status_flags = 0
	unique_name = 0
	var/sterile = 1
	var/plants_off = 0
	var/egg_cooldown = 30
	var/plant_cooldown = 30

/mob/living/simple_animal/hostile/alien/queen/handle_automated_action()
	if(!..()) //AIStatus is off
		return
	egg_cooldown--
	plant_cooldown--
	if(AIStatus == AI_IDLE)
		if(!plants_off && prob(10) && plant_cooldown<=0)
			plant_cooldown = initial(plant_cooldown)
			SpreadPlants()
		if(!sterile && prob(10) && egg_cooldown<=0)
			egg_cooldown = initial(egg_cooldown)
			LayEggs()

/mob/living/simple_animal/hostile/alien/proc/SpreadPlants()
	if(!isturf(loc) || isspaceturf(loc))
		return
	if(locate(/obj/structure/alien/weeds/node) in get_turf(src))
		return
	visible_message("<span class='alertalien'>[src] plants some alien weeds!</span>")
	new /obj/structure/alien/weeds/node(loc)

/mob/living/simple_animal/hostile/alien/proc/LayEggs()
	if(!isturf(loc) || isspaceturf(loc))
		return
	if(locate(/obj/structure/alien/egg) in get_turf(src))
		return
	visible_message("<span class='alertalien'>[src] lays an egg!</span>")
	new /obj/structure/alien/egg(loc)

/mob/living/simple_animal/hostile/alien/queen/large
	name = "alien empress"
	icon = 'icons/mob/alienqueen.dmi'
	icon_state = "alienq"
	icon_living = "alienq"
	icon_dead = "alienq_dead"
	health_doll_icon = "alienq"
	bubble_icon = "alienroyal"
	move_to_delay = 4
	maxHealth = 400
	health = 400
	speed = 0
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/xeno = 10,
							/obj/item/stack/sheet/animalhide/xeno = 2)
	mob_size = MOB_SIZE_LARGE
	gold_core_spawnable = NO_SPAWN

/obj/projectile/neurotox
	name = "neurotoxin"
	damage = 30
	icon_state = "toxin"

/mob/living/simple_animal/hostile/alien/handle_temperature_damage()
	if(bodytemperature < minbodytemp)
		adjustBruteLoss(2)
		throw_alert("temp", /atom/movable/screen/alert/cold, 1)
	else if(bodytemperature > maxbodytemp)
		adjustBruteLoss(20)
		throw_alert("temp", /atom/movable/screen/alert/hot, 3)
	else
		clear_alert("temp")

/mob/living/simple_animal/hostile/alien/maid
	name = "lusty xenomorph maid"
	icon = 'icons/mob/alien.dmi'
	melee_damage_lower = 0
	melee_damage_upper = 0
	a_intent = INTENT_HELP
	friendly_verb_continuous = "caresses"
	friendly_verb_simple = "caress"
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	gold_core_spawnable = HOSTILE_SPAWN
	icon_state = "maid"
	icon_living = "maid"
	icon_dead = "maid_dead"
	speed = 0

/mob/living/simple_animal/hostile/alien/maid/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/cleaning)

/mob/living/simple_animal/hostile/alien/maid/AttackingTarget()
	if(ismovable(target))
		target.wash(CLEAN_WASH)
		if(istype(target, /obj/effect/decal/cleanable))
			visible_message("<span class='notice'>[src] cleans up \the [target].</span>")
		else
			visible_message("<span class='notice'>[src] polishes \the [target].</span>")
		return TRUE
