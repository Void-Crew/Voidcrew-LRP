/obj/item/assembly/control/multitool_act(mob/living/user)
	var/change_id = input("Set the shutters/blast door/blast door controllers ID. It must be a number between 1 and 100.", "ID", id) as num|null
	if(change_id)
		id = clamp(round(change_id, 1), 1, 100)
		to_chat(user, "<span class='notice'>You change the ID to [id].</span>")
