con = 0
lightsoff = 0
startdepth = depth
if (global.chapter == 1){
	if (global.plot >= 250) {
		con = 99
		instance_destroy()
	} else {
		global.interact = 1
		lightsoff = 1
	}
}

clean_room = false

if (global.chapter == 2) {
	con = 50
	
	if (global.plot >= 9) clean_room = true
}

if (global.chapter > 2) clean_room = true

if (clean_room) {
	con = 99
	lightsoff = 2
}


with obj_readable_room1 {
	USECUSTOMFUNC = true
	CUSTOM_TEXT = "%%";
	CUSTOM_FUNC = function() {	
		skip = 1
		mydialoguer = obj_room_unusedroom.show_convo(extflag, read)
		if i_ex(mydialoguer) {
			_unfreeze = false
			debug_log("Starting Unused Class dialogue from [obj_room_unusedroom/show_convo]")
		} else {
		}
	}	
}

show_convo = function(extflag, read) {
	scr_speaker("no_name")
	switch extflag {
		default: return noone;
		case "closet_door": 
			msgset(0, "* (The door is locked.)/%", "obj_readable_room1_slash_Other_10_gml_631_0") 
		break;
		case "seam":
			if clean_room return noone;
			
			msgset(0, "* (It's a worn-down stuffed animal.)/%", "obj_readable_room1_slash_Other_10_gml_632_0")
		break;
		case "switch":
			msgset(0, "* (It's a lightswitch.)/%", "obj_readable_room1_slash_Other_10_gml_633_0")
		break;
		case "greatboard":
			if clean_room return noone;
			msgset(0, "* (It's a checkerboard.^1)&* (There are pawns strewn on it.)/%", "obj_readable_room1_slash_Other_10_gml_634_0")
			if i_ex(obj_mainchara) && obj_mainchara.y < 130 msgset(0, "* (You stared at the checkerboard from the doorway.)/%", "obj_readable_room1_slash_Other_10_gml_644_0")
			
		break;
		case "cardcastle":
			msgset(0, "* (Playing cards spill out of a deck in the closet.)/%", "obj_readable_room1_slash_Other_10_gml_635_0")
			if clean_room msgset(0, "* (Managed to cram everything into the closet^1. Even the rug.)/%", "obj_readable_room1_slash_Other_10_gml_645_0")
		break;
		case "picture":
			msgset(0, "* (It's a yellowed, poorly-drawn picture of a green turtle.)/", "obj_readable_room1_slash_Other_10_gml_638_0")
			msgnext("* (It's signed 'Alvin.')/%", "obj_readable_room1_slash_Other_10_gml_639_0")		
		break;
	}
	return d_make()
}