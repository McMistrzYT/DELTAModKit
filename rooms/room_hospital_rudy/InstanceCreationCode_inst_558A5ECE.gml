CUSTOM_FUNC = function() {
	if scr_havechar(DRCharacter.Susie){
		if (read == 0) {
			scr_speaker("susie")
			msgset(0, "\\EC* ..^1. so why do you collect creepy dolls?/", "obj_readable_room1_slash_Other_10_gml_855_0_b")
			scr_anyface_next("rudy", "0")
			msgnext("\\E0* Hey^1, Noelle and her sister made that. Respect it!/", "obj_readable_room1_slash_Other_10_gml_857_0")
			scr_anyface_next("susie", "K")
			msgnext("\\E0* (Noelle's sister...)/%", "obj_readable_room1_slash_Other_10_gml_859_0")
		} else {
			scr_speaker("susie")
			msgset(0, "\\EC* (...)/%", "obj_readable_room1_slash_Other_10_gml_863_0")
		}
	} else {
		msgset(0, "* (It's an angel doll.^1)&* (Its lack of facial features is unsettling.)/")
		scr_anyface_next("rudy", 0)
		msgnext("* That angel^1?&* Noelle n' Dess made it in youth group./")
		msgnext("\\E2* It's kind of like a good luck charm to me now./")
		msgnext("\\E4* Oh^1, right^1, you and Azzy tried to make one too.../")
		msgnext("\\E7* But you wasted the whole time making huge wings for it!/%")
			
		if (read >= 1) msgset(0, "* (It's an angel doll.^1)&* (Its lack of facial features is unsettling.)/%", "obj_readable_room1_slash_Other_10_gml_742_0")
	}
}
USECUSTOMFUNC = true;