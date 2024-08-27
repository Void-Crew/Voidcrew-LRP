//Meant for simple animals to drop lootable human bodies.

//If someone can do this in a neater way, be my guest-Kor

//This has to be separate from the Away Mission corpses, because New() doesn't work for those, and initialize() doesn't work for these.

//To do: Allow corpses to appear mangled, bloody, etc. Allow customizing the bodies appearance (they're all bald and white right now).

//List of different corpse types

/obj/effect/mob_spawn/human/corpse/syndicatesoldier
	name = "Syndicate Operative"
	id_job = "Operative"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	icon_state = "corpsesyndicate"
	outfit = /datum/outfit/syndicatesoldiercorpse

/datum/outfit/syndicatesoldiercorpse
	name = "Syndicate Operative Corpse"
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/sechailer/syndie
	head = /obj/item/clothing/head/helmet/swat
	id = /obj/item/card/id/syndicate

/obj/effect/mob_spawn/human/corpse/syndicatecommando
	name = "Syndicate Commando"
	id_job = "Operative"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/syndicatecommandocorpse

/datum/outfit/syndicatecommandocorpse
	name = "Syndicate Commando Corpse"
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/space/hardsuit/syndi
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/syndicate
	back = /obj/item/tank/jetpack/oxygen
	r_pocket = /obj/item/tank/internals/emergency_oxygen
	id = /obj/item/card/id/syndicate


/obj/effect/mob_spawn/human/corpse/syndicatestormtrooper
	name = "Syndicate Stormtrooper"
	id_job = "Operative"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/syndicatestormtroopercorpse

/datum/outfit/syndicatestormtroopercorpse
	name = "Syndicate Stormtrooper Corpse"
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/elite
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/syndicate
	back = /obj/item/tank/jetpack/oxygen/harness
	id = /obj/item/card/id/syndicate


/obj/effect/mob_spawn/human/clown/corpse
	roundstart = FALSE
	instant = TRUE
	skin_tone = "caucasian1"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"

/obj/effect/mob_spawn/human/corpse/pirate
	name = "Pirate"
	skin_tone = "caucasian1" //all pirates are white because it's easier that way
	outfit = /datum/outfit/piratecorpse
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"

/datum/outfit/piratecorpse
	name = "Pirate Corpse"
	uniform = /obj/item/clothing/under/costume/pirate
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/eyepatch
	head = /obj/item/clothing/head/bandana


/obj/effect/mob_spawn/human/corpse/pirate/ranged
	name = "Pirate Gunner"
	outfit = /datum/outfit/piratecorpse/ranged

/datum/outfit/piratecorpse/ranged
	name = "Pirate Gunner Corpse"
	suit = /obj/item/clothing/suit/pirate
	head = /obj/item/clothing/head/pirate


/obj/effect/mob_spawn/human/corpse/russian
	name = "Russian"
	outfit = /datum/outfit/russiancorpse
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"

/datum/outfit/russiancorpse
	name = "Russian Corpse"
	uniform = /obj/item/clothing/under/costume/soviet
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/bearpelt
	gloves = /obj/item/clothing/gloves/color/black
	mask = /obj/item/clothing/mask/gas



/obj/effect/mob_spawn/human/corpse/russian/ranged
	name = "Russian Rifleman"
	outfit = /datum/outfit/russiancorpse/ranged

/datum/outfit/russiancorpse/ranged
	name = "Russian Rifleman Corpse"
	head = /obj/item/clothing/head/ushanka


/obj/effect/mob_spawn/human/corpse/russian/ranged/trooper
	name = "Russian Soldier"
	outfit = /datum/outfit/russiancorpse/ranged/trooper

/datum/outfit/russiancorpse/ranged/trooper
	name = "Russian Soldier Corpse"
	uniform = /obj/item/clothing/under/syndicate/camo
	suit = /obj/item/clothing/suit/armor/bulletproof
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat
	ears = /obj/item/radio/headset
	head = /obj/item/clothing/head/helmet/alt
	mask = /obj/item/clothing/mask/russian_balaclava


/obj/effect/mob_spawn/human/corpse/russian/ranged/officer
	name = "Russian Officer"
	outfit = /datum/outfit/russiancorpse/officer

/datum/outfit/russiancorpse/officer
	name = "Russian Officer Corpse"
	uniform = /obj/item/clothing/under/costume/russian_officer
	suit = /obj/item/clothing/suit/security/officer/russian
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset
	head = /obj/item/clothing/head/ushanka

/obj/effect/mob_spawn/human/corpse/russian/ranged/automatic
	name = "Russian Trooper"
	outfit = /datum/outfit/russiancorpse/automatic

/datum/outfit/russiancorpse/automatic
	name = "Russian Trooper Corpse"
	suit = /obj/item/clothing/suit/armor/vest/russian_coat
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat
	ears = /obj/item/radio/headset
	head = /obj/item/clothing/head/helmet/rus_ushanka

/obj/effect/mob_spawn/human/corpse/wizard
	name = "Space Wizard Corpse"
	outfit = /datum/outfit/wizardcorpse
	hairstyle = "Bald"
	facial_hairstyle = "Long Beard"
	skin_tone = "caucasian1"

/datum/outfit/wizardcorpse
	name = "Space Wizard Corpse"
	uniform = /obj/item/clothing/under/color/lightpurple
	suit = /obj/item/clothing/suit/wizrobe
	shoes = /obj/item/clothing/shoes/sandal/magic
	head = /obj/item/clothing/head/wizard


/obj/effect/mob_spawn/human/corpse/nanotrasensoldier
	name = "\improper Nanotrasen Private Security Squad Recruit"
	id_job = "Private Security Squad Recruit"
	outfit = /datum/outfit/nanotrasensoldiercorpserecruit
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	icon_state = "corpsentrecruit"

/datum/outfit/nanotrasensoldiercorpserecruit
	name = "Nanotrasen Private Security Squad Recruit Corpse"
	uniform = /obj/item/clothing/under/rank/security/officer
	suit = /obj/item/clothing/suit/armor/vest/alt
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	head = /obj/item/clothing/head/helmet/swat/nanotrasen
	back = /obj/item/storage/backpack/satchel/sec
	id = /obj/item/card/id/pso

/obj/effect/mob_spawn/human/corpse/nanotrasensoldier/ranged
	name = "\improper Nanotrasen Private Security Squad Operative"
	id_job = "Private Security Squad Operative"
	outfit = /datum/outfit/nanotrasensoldiercorpseoperative
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	icon_state = "corpsentoperative"

/datum/outfit/nanotrasensoldiercorpseoperative
	name = "Nanotrasen Private Security Squad Operative Corpse"
	uniform = /obj/item/clothing/under/rank/security/red/officer
	suit = /obj/item/clothing/suit/armor/vest/alt
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	head = /obj/item/clothing/head/helmet/swat/nanotrasen
	back = /obj/item/storage/backpack/satchel/sec
	id = /obj/item/card/id/pso

/obj/effect/mob_spawn/human/corpse/nanotrasensoldier/smg
	name = "\improper Nanotrasen Private Security Squad Sergeant"
	id_job = "Private Security Squad Sergeant"
	outfit = /datum/outfit/nanotrasensoldiercorpsesergeant
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	icon_state = "corpsentsergeant"

/datum/outfit/nanotrasensoldiercorpsesergeant
	name = "Nanotrasen Private Security Squad Sergeant Corpse"
	uniform = /obj/item/clothing/under/rank/security/nanotrasenhr
	suit = /obj/item/clothing/suit/armor/vest/alt
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	head = /obj/item/clothing/head/helmet/swat/nanotrasen/hr
	back = /obj/item/storage/backpack/satchel/sec
	id = /obj/item/card/id/pso

/obj/effect/mob_spawn/human/corpse/nanotrasensoldier/assault
	name = "\improper Nanotrasen Private Security Squad Commander"
	id_job = "Private Security Squad Commander"
	outfit = /datum/outfit/nanotrasensoldiercorpsecommander
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	icon_state = "corpsentcommander"

/datum/outfit/nanotrasensoldiercorpsecommander
	name = "Nanotrasen Private Security Squad Commander Corpse"
	uniform = /obj/item/clothing/under/rank/security/nanotrasenhr
	suit = /obj/item/clothing/suit/armor/vest/alt
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	head = /obj/item/clothing/head/helmet/swat/nanotrasen/commander
	belt = /obj/item/storage/belt/security/webbing
	id = /obj/item/card/id/pso

/obj/effect/mob_spawn/human/corpse/cat_butcher
	name = "The Cat Surgeon"
	id_job = "Cat Surgeon"
	id_access_list = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_MAINT)
	hairstyle = "Cut Hair"
	facial_hairstyle = "Watson Mustache"
	skin_tone = "caucasian1"
	outfit = /datum/outfit/cat_butcher

/datum/outfit/cat_butcher
	name = "Cat Butcher Uniform"
	uniform = /obj/item/clothing/under/rank/medical/doctor/green
	suit = /obj/item/clothing/suit/apron/surgical
	shoes = /obj/item/clothing/shoes/sneakers/white
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	ears = /obj/item/radio/headset
	back = /obj/item/storage/backpack/satchel/med
	id = /obj/item/card/id
	glasses = /obj/item/clothing/glasses/hud/health

/obj/effect/mob_spawn/human/corpse/charlie/private
	name = "\improper Charlie Station Security Private"
	id_job = "Charlie Station Security Private"
	outfit = /datum/outfit/charlieprivate
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"

/datum/outfit/charlieprivate
	name = "Charlie Station Security Private Corpse"
	uniform = /obj/item/clothing/under/rank/security/charlie/officer
	shoes = /obj/item/clothing/shoes/jackboots/charlieboots
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/soft/sec/charlie
	id = /obj/item/card/id/away/old/sec

/obj/effect/mob_spawn/human/corpse/charlie/officer
	name = "\improper Charlie Station Security Officer"
	id_job = "Charlie Station Security Officer"
	outfit = /datum/outfit/charlieofficer
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"

/datum/outfit/charlieofficer
	name = "Charlie Station Security Officer Corpse"
	uniform = /obj/item/clothing/under/rank/security/charlie/warden
	suit = /obj/item/clothing/suit/armor/vest/old/charlie
	shoes = /obj/item/clothing/shoes/jackboots/charlieboots
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/helmet/old/charlie
	id = /obj/item/card/id/away/old/sec

/obj/effect/mob_spawn/human/corpse/charlie/captain
	name = "\improper Charlie Station Security Captain"
	id_job = "Charlie Station Security Captain"
	outfit = /datum/outfit/charliecaptain
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"

/datum/outfit/charliecaptain
	name = "Charlie Station Security Captain Corpse"
	uniform = /obj/item/clothing/under/rank/security/charlie/head_of_security
	suit = /obj/item/clothing/suit/armor/vest/old/charlie
	shoes = /obj/item/clothing/shoes/jackboots/charlieboots
	gloves = /obj/item/clothing/gloves/color/black
	mask = /obj/item/clothing/mask/gas/sechailer
	head = /obj/item/clothing/head/helmet/old/charlie/beret
	id = /obj/item/card/id/away/old/sec
