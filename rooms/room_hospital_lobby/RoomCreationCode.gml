with obj_readable_room1 {
	if !is_array(CUSTOM_TEXT) CUSTOM_TEXT = [string(CUSTOM_TEXT)]
	var name = string(CUSTOM_TEXT[0])
	
	if string_pos("readable_beads_00", name) > 0 {
		USECUSTOMFUNC = true
		CUSTOM_FUNC = function() {
			global.msg[0] = stringsetloc("* (It's one of those sliding bead toys that naturally spawns inside doctors' offices.)/", "obj_readable_room1_slash_Other_10_gml_586_0")
			global.msg[1] = stringsetloc("* (The beads march grimly along their set path.)/%", "obj_readable_room1_slash_Other_10_gml_587_0")
			if read {
				scr_speaker("no_name")
				msgset(0, "* (The beads of the toy march on.)/%")
			}
		}
	}
}