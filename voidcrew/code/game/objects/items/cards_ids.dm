/obj/item/card/id/solgov
	name = "\improper SolGov Officer ID"
	id_type_name = "\improper SolGov ID"
	desc = "A SolGov ID with no proper access to speak of."
	assignment = "SolGov Officer"
	icon = 'voidcrew/icons/obj/card.dmi' // work around until we have a new sprite
	icon_state = "solgov"
	uses_overlays = FALSE

/obj/item/card/id/solgov/commander
	name = "\improper SolGov Commander ID"
	id_type_name = "\improper SolGov ID"
	desc = "A SolGov ID with no proper access to speak of. This one indicates a Commander."

/obj/item/card/id/solgov/elite
	name = "\improper SolGov Elite ID"
	id_type_name = "\improper SolGov ID"
	desc = "A SolGov ID with no proper access to speak of. This one indicates an Elite."

/obj/item/card/robo_access_card
	name = "\improper robotics access card"
	desc = "A tiny chip that attaches to any standard ID card. This one is configured to access robotics equipment."
	icon = 'icons/obj/card.dmi'
	icon_state = "data_4"

/obj/item/card/id/solgov/police
	name = "\improper SolGov Police ID"
	id_type_name = "\improper SolGov ID"
	desc = "A SolGov ID, usually worn by Police Officers."
	icon_state = "solgovcop"
	access = list(ACCESS_AWAY_SEC)

/obj/item/card/id/solgov/police/chief
	name = "\improper SolGov Police Chief ID"
	id_type_name = "\improper SolGov ID"
	desc = "A SolGov ID, usually worn by Police Chiefs."
	icon_state = "solgovcop"
	access = list(ACCESS_AWAY_SEC, ACCESS_AWAY_GENERIC1)

/obj/item/card/robo_access_card/afterattack(atom/movable/AM, mob/user, proximity)
	. = ..()
	if(istype(AM, /obj/item/card/id) && proximity)
		var/obj/item/card/id/I = AM
		I.access |= ACCESS_ROBOTICS
		to_chat(user, "<span class='notice'>You upgrade [I] with robotics access.</span>")
		qdel(src)
