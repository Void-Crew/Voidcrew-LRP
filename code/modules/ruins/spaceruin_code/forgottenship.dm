// forgottenship ruin
GLOBAL_VAR_INIT(fscpassword, generate_password())

/proc/generate_password()
	return "[pick(GLOB.phonetic_alphabet)] [rand(1000,9999)]"

///////////	forgottenship objects

/obj/machinery/door/password/voice/sfc
	name = "vault door"
	desc = "A rusty, yet nigh-impervious blast door. You can see a microphone on it."
/obj/machinery/door/password/voice/sfc/Initialize(mapload)
	. = ..()
	password = "[GLOB.fscpassword]"

///////////	forgottenship lore

/obj/item/paper/fluff/ruins/forgottenship/password
	name = "old pamphlet"

/obj/item/paper/fluff/ruins/forgottenship/password/Initialize(mapload)
	. = ..()
	info = "Greetings, Captain, and welcome to the SYN-C Hellfire, the pride of Cybersun. Your objective is to escort a freighter in hostile territory. In event of an emergency, your vessel will automatically dock with a Theta-class Cybersun Recovery Pod. On docking, the pod's vault door code will be set to [GLOB.fscpassword]. Glory to the Syndicate."
	icon_state = "paper_words"
	item_state = "paper"

/obj/item/paper/fluff/ruins/forgottenship/powerissues
	name = "blackout response protocol"
	info = "In event of a blackout, you are to start the SUPERPACMAN generator immediately to restore primary systems and activate the Antimatter Engine prototype assigned to your vessel upon system restart. Ensure that the turrets are rebooted as well, as they only have so much battery."

/obj/item/paper/fluff/ruins/forgottenship/missionobj
	name = "primary objectives"
	info = "Your objectives onboard the SYN-C Hellfire are to escort a freighter through hostile space. Do not allow it to fall into enemy hands, as its cargo is vital for the Syndicate Coalition as a whole."

///////////	forgottenship items
/obj/item/disk/surgery/forgottenship
	name = "Advanced Surgery Disk"
	desc = "A disk that contains advanced surgery procedures, must be loaded into an Operating Console."
	surgeries = list(/datum/surgery/advanced/lobotomy, /datum/surgery/advanced/bioware/vein_threading, /datum/surgery/advanced/bioware/nerve_splicing)

/obj/structure/fluff/empty_sleeper/syndicate/captain
	name = "broken-down sleeper"
	desc = "A broken-down sleeper, somewhat regal even now."
	icon_state = "sleeper_s-open"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	deconstructible = FALSE

/obj/structure/fluff/empty_sleeper/syndicate/captain/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/gps, "Forgotten Signal")

/obj/item/storage/box/firingpins/syndicate
	name = "box of syndicate firing pins"
	desc = "A box full of special syndicate firing pins which allow only syndicate operatives to use weapons with those firing pins."

/obj/item/storage/box/firingpins/syndicate/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/firing_pin/implant/pindicate(src)



///////////	forgottenship areas

/area/ruin/space/has_grav/syndicate_forgotten_ship
	name = "SYN-C Hellfire"
	icon_state = "syndie-ship"
	ambientsounds = list('sound/ambience/ambidanger.ogg', 'sound/ambience/ambidanger2.ogg', 'sound/ambience/ambigen9.ogg', 'sound/ambience/ambigen10.ogg')

/area/ruin/space/has_grav/syndicate_forgotten_cargopod
	name = "Cybersun Emergency Survival Equipment Pod"
	icon_state = "syndie-ship"
	ambientsounds = list('sound/ambience/ambigen4.ogg', 'sound/ambience/signal.ogg')

/area/ruin/space/has_grav/powered/syndicate_forgotten_vault
	name = "Cybersun Emergency Survival Equipment Pod Vault"
	icon_state = "syndie-ship"
	ambientsounds = list('sound/ambience/ambitech2.ogg', 'sound/ambience/ambitech3.ogg')
	area_flags = NOTELEPORT | UNIQUE_AREA

	//Cybersun hardsuit

/obj/item/clothing/head/helmet/space/hardsuit/cybersun
	name = "cybersun hardsuit helmet"
	desc = "A prototype hardsuit helmet bearing the Cybersun logo."
	icon_state = "cybersun"
	item_state = "cybersun"
	hardsuit_type = "cybersun"
	armor = list("melee" = 30, "bullet" = 40, "laser" = 80, "energy" = 80, "bomb" = 30, "bio" = 100, "rad" = 60, "fire" = 60, "acid" = 60)
	strip_delay = 600
	actions_types = list()


/obj/item/clothing/suit/space/hardsuit/cybersun
	icon_state = "cybersun"
	item_state = "cybersun"
	hardsuit_type = "cybersun"
	name = "cybersun hardsuit"
	desc = "A lightweight, prototype hardsuit armoured against laser fire but not as efficient against other forms of attack."
	armor = list("melee" = 30, "bullet" = 40, "laser" = 80, "energy" = 80, "bomb" = 30, "bio" = 100, "rad" = 60, "fire" = 60, "acid" = 60)
	slowdown = 0
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/cybersun
	actions_types = list(/datum/action/item_action/toggle_helmet)
	jetpack = /obj/item/tank/jetpack/suit

//Special NT NPCs
