
// CENTCOM

/area/centcom
	name = "CentCom"
	icon_state = "centcom"
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	area_flags = VALID_TERRITORY | UNIQUE_AREA | NOTELEPORT
	flags_1 = NONE

/area/centcom/exterior
	name = "CentCom Exterior"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED
	outdoors = TRUE

/area/centcom/control
	name = "CentCom Control Center"
	icon_state = "centcom_control"

/area/centcom/arrivals
	name = "CentCom Arrivals"
	icon_state = "centcom_arrivals"

/area/centcom/admin
	name = "CentCom Administration"
	icon_state = "centcom_admin"

/area/centcom/admin_storage
	name = "CentCom Administration Storage"
	icon_state = "centcom_admin_storage"

/area/centcom/evac
	name = "CentCom Recovery Ship"
	icon_state = "centcom_evacuation_ship"

/area/centcom/supply
	name = "CentCom Cargo Bay"
	icon_state = "centcom_supply"

/area/centcom/ferry
	name = "CentCom Ferry Docking Bay"
	icon_state = "centcom_ferry"

/area/centcom/brief
	name = "CentCom Dispatch Center"
	icon_state = "centcom_briefing"

/area/centcom/armory
	name = "CentCom Dispatch Center Armory"
	icon_state = "centcom_armory"

/area/centcom/prison
	name = "CentCom Prison Facility"
	icon_state = "centcom_prison"

/area/centcom/prison_cells
	name = "CentCom Prison Cells"
	icon_state = "centcom_cells"

/area/centcom/holding
	name = "CentCom Holding Cell"
	icon_state = "centcom_holding"

/area/centcom/court
	name = "CentCom Grand Courtroom"
	icon_state = "centcom_court"

/area/centcom/supplypod/flyMeToTheMoon
	name = "Supply Pod Shipping lane"
	icon_state = "supplypod_flight"

/area/centcom/supplypod
	name = "CentCom Supply Pod Facility"
	icon_state = "supplypod"

/area/centcom/supplypod/podStorage
	name = "CentCom Supply Pod Storage"
	icon_state = "supplypod_holding"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED

/area/centcom/supplypod/loading
	name = "CentCom Supply Pod Loading Facility"
	icon_state = "supplypod_loading"

/area/centcom/supplypod/loading/one
	name = "Bay #1"
	icon_state = "supplypod"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED

/area/centcom/supplypod/loading/two
	name = "Bay #2"
	icon_state = "supplypod"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED

/area/centcom/supplypod/loading/three
	name = "Bay #3"
	icon_state = "supplypod"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED

/area/centcom/supplypod/loading/four
	name = "Bay #4"
	icon_state = "supplypod"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED

/area/centcom/supplypod/loading/ert
	name = "ERT Bay"
	icon_state = "supplypod"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED

//THUNDERDOME

/area/tdome
	name = "Thunderdome"
	icon_state = "thunder"
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE

/area/tdome/arena
	name = "Thunderdome Arena"
	icon_state = "thunder"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED

/area/tdome/arena_source
	name = "Thunderdome Arena Template"
	icon_state = "thunder"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED

/area/tdome/tdome1
	name = "Thunderdome (Team 1)"
	icon_state = "thunder_team_one"

/area/tdome/tdome2
	name = "Thunderdome (Team 2)"
	icon_state = "thunder_team_two"

/area/tdome/tdomeadmin
	name = "Thunderdome (Admin.)"
	icon_state = "thunder_admin"

/area/tdome/tdomeobserve
	name = "Thunderdome (Observer.)"
	icon_state = "thunder_observe"


//ENEMY

//Wizard
/area/wizard_station
	name = "Wizard's Den"
	icon_state = "yellow"
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	area_flags = VALID_TERRITORY | UNIQUE_AREA | NOTELEPORT
	flags_1 = NONE

//Abductors
/area/abductor_ship
	name = "Abductor Ship"
	icon_state = "yellow"
	requires_power = FALSE
	area_flags = VALID_TERRITORY | UNIQUE_AREA | NOTELEPORT
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE

//Syndicates
/area/syndicate_mothership
	name = "Syndicate Mothership"
	icon_state = "syndie-ship"
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	area_flags = VALID_TERRITORY | UNIQUE_AREA | NOTELEPORT
	flags_1 = NONE
	ambientsounds = HIGHSEC

/area/syndicate_mothership/control
	name = "Syndicate Control Room"
	icon_state = "syndie-control"
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED

/area/syndicate_mothership/elite_squad
	name = "Syndicate Elite Squad"
	icon_state = "syndie-elite"

//CAPTURE THE FLAG

/area/ctf
	name = "Capture the Flag"
	icon_state = "yellow"
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE

/area/ctf/control_room
	name = "Control Room A"

/area/ctf/control_room2
	name = "Control Room B"

/area/ctf/central
	name = "Central"

/area/ctf/main_hall
	name = "Main Hall A"

/area/ctf/main_hall2
	name = "Main Hall B"

/area/ctf/corridor
	name = "Corridor A"

/area/ctf/corridor2
	name = "Corridor B"

/area/ctf/flag_room
	name = "Flag Room A"

/area/ctf/flag_room2
	name = "Flag Room B"
