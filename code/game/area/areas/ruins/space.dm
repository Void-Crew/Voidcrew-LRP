//Space Ruin Parents

/area/ruin/space
	has_gravity = FALSE
	area_flags = NONE

/area/ruin/space/has_grav
	has_gravity = STANDARD_GRAVITY

/area/ruin/space/has_grav/powered
	requires_power = FALSE

/////////////

/area/ruin/space/way_home
	name = "\improper Salvation"
	icon_state = "away"
	always_unpowered = FALSE

// Ruins of "onehalf" ship

/area/ruin/space/has_grav/onehalf/hallway
	name = "Hallway"
	icon_state = "hallC"

/area/ruin/space/has_grav/onehalf/drone_bay
	name = "Mining Drone Bay"
	icon_state = "engine"

/area/ruin/space/has_grav/onehalf/dorms_med
	name = "Crew Quarters"
	icon_state = "Sleep"

/area/ruin/space/has_grav/onehalf/bridge
	name = "Bridge"
	icon_state = "bridge"



/area/ruin/space/has_grav/powered/dinner_for_two
	name = "Dinner for Two"

/area/ruin/space/has_grav/powered/cat_man
	name = "Kitty Den"

/area/ruin/space/has_grav/powered/authorship
	name = "Authorship"

/area/ruin/space/has_grav/powered/aesthetic
	name = "Aesthetic"
	ambientsounds = list('sound/ambience/ambivapor1.ogg')

//Ruin of Derelict Oupost

/area/ruin/space/has_grav/derelictoutpost
	name = "Derelict Outpost"
	icon_state = "green"

/area/ruin/space/has_grav/derelictoutpost/cargostorage
	name = "Derelict Outpost Cargo Storage"
	icon_state = "storage"

/area/ruin/space/has_grav/derelictoutpost/cargobay
	name = "Derelict Outpost Cargo Bay"
	icon_state = "quartstorage"

/area/ruin/space/has_grav/derelictoutpost/powerstorage
	name = "Derelict Outpost Power Storage"
	icon_state = "engine_smes"

/area/ruin/space/has_grav/derelictoutpost/dockedship
	name = "Derelict Outpost Docked Ship"
	icon_state = "red"

//Ruin of turretedoutpost

/area/ruin/space/has_grav/turretedoutpost
	name = "Turreted Outpost"
	icon_state = "red"


//Ruin of old teleporter

/area/ruin/space/oldteleporter
	name = "Old Teleporter"
	icon_state = "teleporter"


//Ruin of mech transport

/area/ruin/space/has_grav/powered/mechtransport
	name = "Mech Transport"
	icon_state = "green"


//Ruin of gas the lizard

/area/ruin/space/has_grav/gasthelizard
	name = "Gas the lizard"


//Ruin of Deep Storage

/area/ruin/space/has_grav/deepstorage
	name = "Deep Storage"
	icon_state = "storage"

/area/ruin/space/has_grav/deepstorage/airlock
	name = "Deep Storage Airlock"
	icon_state = "quart"

/area/ruin/space/has_grav/deepstorage/power
	name = "Deep Storage Power and Atmospherics Room"
	icon_state = "engi_storage"

/area/ruin/space/has_grav/deepstorage/hydroponics
	name = "Deep Storage Hydroponics"
	icon_state = "garden"

/area/ruin/space/has_grav/deepstorage/armory
	name = "Deep Storage Secure Storage"
	icon_state = "armory"

/area/ruin/space/has_grav/deepstorage/storage
	name = "Deep Storage Storage"
	icon_state = "storage_wing"

/area/ruin/space/has_grav/deepstorage/dorm
	name = "Deep Storage Dormitory"
	icon_state = "crew_quarters"

/area/ruin/space/has_grav/deepstorage/kitchen
	name = "Deep Storage Kitchen"
	icon_state = "kitchen"

/area/ruin/space/has_grav/deepstorage/crusher
	name = "Deep Storage Recycler"
	icon_state = "storage"


//Ruin of Abandoned Zoo

/area/ruin/space/has_grav/abandonedzoo
	name = "Abandoned Zoo"
	icon_state = "green"


//Ruin of ancient Space Station

/area/ruin/space/has_grav/ancientstation
	name = "Charlie Station Main Corridor"
	icon_state = "green"

/area/ruin/space/has_grav/ancientstation/powered
	name = "Powered Tile"
	icon_state = "teleporter"
	requires_power = FALSE

/area/ruin/space/has_grav/ancientstation/space
	name = "Exposed To Space"
	icon_state = "teleporter"
	has_gravity = FALSE

/area/ruin/space/has_grav/ancientstation/atmo
	name = "Beta Station Atmospherics"
	icon_state = "red"
	ambientsounds = ENGINEERING
	has_gravity = TRUE

/area/ruin/space/has_grav/ancientstation/betacorridor
	name = "Beta Station Main Corridor"
	icon_state = "bluenew"

/area/ruin/space/has_grav/ancientstation/engi
	name = "Charlie Station Engineering"
	icon_state = "engine"
	ambientsounds = ENGINEERING

/area/ruin/space/has_grav/ancientstation/comm
	name = "Charlie Station Command"
	icon_state = "captain"

/area/ruin/space/has_grav/ancientstation/hydroponics
	name = "Charlie Station Hydroponics"
	icon_state = "garden"

/area/ruin/space/has_grav/ancientstation/kitchen
	name = "Charlie Station Kitchen"
	icon_state = "kitchen"

/area/ruin/space/has_grav/ancientstation/sec
	name = "Charlie Station Security"
	icon_state = "red"

/area/ruin/space/has_grav/ancientstation/deltacorridor
	name = "Delta Station Main Corridor"
	icon_state = "green"

/area/ruin/space/has_grav/ancientstation/proto
	name = "Delta Station Prototype Lab"
	icon_state = "toxlab"

/area/ruin/space/has_grav/ancientstation/rnd
	name = "Delta Station Research and Development"
	icon_state = "toxlab"

/area/ruin/space/has_grav/ancientstation/deltaai
	name = "Delta Station AI Core"
	icon_state = "ai"
	ambientsounds = list('sound/ambience/ambimalf.ogg', 'sound/ambience/ambitech.ogg', 'sound/ambience/ambitech2.ogg', 'sound/ambience/ambiatmos.ogg', 'sound/ambience/ambiatmos2.ogg')

/area/ruin/space/has_grav/ancientstation/mining
	name = "Beta Station Mining Equipment"
	icon_state = "mining"

/area/ruin/space/has_grav/ancientstation/medbay
	name = "Beta Station Medbay"
	icon_state = "medbay"

/area/ruin/space/has_grav/ancientstation/betastorage
	name = "Beta Station Storage"
	icon_state = "storage"

/area/solar/ancientstation
	name = "Charlie Station Solar Array"
	icon_state = "panelsP"

//DERELICT

/area/ruin/space/derelict
	name = "Derelict Station"
	icon_state = "storage"

/area/ruin/space/derelict/hallway/primary
	name = "Derelict Primary Hallway"
	icon_state = "hallP"

/area/ruin/space/derelict/hallway/secondary
	name = "Derelict Secondary Hallway"
	icon_state = "hallS"

/area/ruin/space/derelict/hallway/primary/port
	name = "Derelict Port Hallway"
	icon_state = "hallFP"

/area/ruin/space/derelict/arrival
	name = "Derelict Arrival Centre"
	icon_state = "yellow"

/area/ruin/space/derelict/storage/equipment
	name = "Derelict Equipment Storage"

/area/ruin/space/derelict/bridge
	name = "Derelict Control Room"
	icon_state = "bridge"

/area/ruin/space/derelict/bridge/access
	name = "Derelict Control Room Access"
	icon_state = "auxstorage"

/area/ruin/space/derelict/bridge/ai_upload
	name = "Derelict Computer Core"
	icon_state = "ai"

/area/ruin/space/derelict/solar_control
	name = "Derelict Solar Control"
	icon_state = "engine"

/area/ruin/space/derelict/se_solar
	name = "South East Solars"
	icon_state = "engine"

/area/ruin/space/derelict/medical
	name = "Derelict Medbay"
	icon_state = "medbay"

/area/ruin/space/derelict/medical/chapel
	name = "Derelict Chapel"
	icon_state = "chapel"

/area/solar/derelict_starboard
	name = "Derelict Starboard Solar Array"
	icon_state = "panelsS"

/area/solar/derelict_aft
	name = "Derelict Aft Solar Array"
	icon_state = "yellow"

/area/ruin/space/derelict/singularity_engine
	name = "Derelict Singularity Engine"
	icon_state = "engine"

/area/ruin/space/derelict/gravity_generator
	name = "Derelict Gravity Generator Room"
	icon_state = "red"

/area/ruin/space/derelict/atmospherics
	name = "Derelict Atmospherics"
	icon_state = "red"

//DJSTATION

/area/ruin/space/djstation
	name = "Ruskie DJ Station"
	icon_state = "DJ"
	has_gravity = STANDARD_GRAVITY

/area/ruin/space/djstation/solars
	name = "DJ Station Solars"
	icon_state = "DJ"
	has_gravity = STANDARD_GRAVITY

//ABANDONED TELEPORTER

/area/ruin/space/abandoned_tele
	name = "Abandoned Teleporter"
	icon_state = "teleporter"
	ambientsounds = list('sound/ambience/ambimalf.ogg', 'sound/ambience/signal.ogg')

//OLD AI SAT

/area/tcommsat/oldaisat
	name = "Abandoned Satellite"
	icon_state = "tcomsatcham"

//ABANDONED BOX WHITESHIP

/area/ruin/space/has_grav/whiteship/box

	name = "Abandoned Ship"
	icon_state = "red"


//SYNDICATE LISTENING POST STATION

/area/ruin/space/has_grav/listeningstation
	name = "Listening Post"
	icon_state = "yellow"

/area/ruin/space/has_grav/powered/ancient_shuttle
	name = "Ancient Shuttle"
	icon_state = "yellow"

//HELL'S FACTORY OPERATING FACILITY
/area/ruin/space/has_grav/hellfactory
	name = "Hell Factory"
	icon_state = "yellow"

/area/ruin/space/has_grav/hellfactoryoffice
	name = "Hell Factory Office"
	icon_state = "red"
	area_flags = VALID_TERRITORY | BLOBS_ALLOWED | NOTELEPORT

//Ruin of Transport 18
/area/ruin/space/has_grav/transport18fore
	name = "Booze Cruise Fore"
	icon_state = "crew_quarters"

/area/ruin/space/has_grav/transport18mid
	name = "Booze Cruise Hold"
	icon_state = "cargo_bay"

/area/ruin/space/transport18aft
	name = "Booze Cruise Aft"
	icon_state = "engine"

//Ruin of the rad ship. It's pretty rad.

/area/ruin/space/has_grav/radship/Cargo1
	name = "Cargo Bay 1"
	icon_state = "cargo_bay"

/area/ruin/space/has_grav/radship/Cargo2
	name = "Cargo Bay 2"
	icon_state = "cargo_bay"

/area/ruin/space/has_grav/radship/Cargo3
	name = "Cargo Bay 3"
	icon_state = "cargo_bay"

/area/ruin/space/has_grav/radship/Cargo4
	name = "Cargo Bay 4"
	icon_state = "cargo_bay"

/area/ruin/space/has_grav/radship/EngineRoom
	name = "Engine Room"
	icon_state = "yellow"

/area/ruin/space/has_grav/radship/Engineering
	name = "Engineering"
	icon_state = "engine"

/area/ruin/space/has_grav/radship/MethLab
	name = "Storage"
	icon_state = "red"

/area/ruin/space/has_grav/radship/CrewQuarters
	name = "Crew Quarters"
	icon_state = "green"

/area/ruin/space/has_grav/radship/Hallway
	name = "Hallway"
	icon_state = "away"


/area/ruin/space/has_grav/event_battleship
	name = "NT-C Vanguard"

/area/ruin/space/has_grav/event_battleship/bridge
	name = "NT-C Vanguard Bridge"

/area/ruin/space/has_grav/event_battleship/hallway
	name = "NT-C Vanguard Central Hallway"

/area/ruin/space/has_grav/event_battleship/gunbay
	name = "NT-C Vanguard Gunnery"

/area/ruin/space/has_grav/event_battleship/engine
	name = "NT-C Vanguard Engineering"

/area/ruin/space/has_grav/event_battleship/hangar
	name = "NT-C Vanguard Hangar"

/area/ruin/space/has_grav/event_battleship/ammo
	name = "NT-C Vanguard Ammunition Racks"

/area/ruin/space/has_grav/event_battleship/deathsquad
	name = "NT-C Vanguard Special Operations Prep Room"

/area/ruin/space/has_grav/event_battleship/dorms
	name = "NT-C Vanguard Crew Quarters"

/area/ruin/space/has_grav/event_battleship/atmos
	name = "NT-C Vanguard Atmospherics"

/area/ruin/space/has_grav/event_battleship/medical
	name = "NT-C Vanguard Medical"

/area/ruin/space/has_grav/event_battleship/security
	name = "NT-C Vanguard Security"

/area/ruin/space/has_grav/event_battleship/hangar_control
	name = "NT-C Vanguard Hangar Control"

/area/ruin/space/has_grav/event_battleship/ert
	name = "Nanotrasen Response Vessel"

/area/ruin/space/has_grav/event_battleship/crashed_syndies
	name = "SYN-C Cuban Pete"

/area/ruin/space/has_grav/event_battleship/fighter1
	name = "Nanotrasen Escort Fighter Alpha"

/area/ruin/space/has_grav/event_battleship/fighter2
	name = "Nanotrasen Escort Fighter Beta"

/area/ruin/space/has_grav/event_battleship/fighter3
	name = "Nanotrasen Escort Fighter Charlie"

/area/ruin/space/has_grav/event_battleship/fighter4
	name = "Nanotrasen Escort Dropship"
