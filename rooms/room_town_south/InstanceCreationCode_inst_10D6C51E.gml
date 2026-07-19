if scr_havechar(DRCharacter.Susie) {
	USECUSTOMFUNC = true
	CUSTOM_FUNC = function() {
		if (read == 0){
			scr_speaker("susie")
			msgset(0, "\\E0* If they have police tape.../")
			msgnext("\\E1* ..^1. why don't they have police glue?/%")
		} else {
			scr_speaker("susie")
			msgset(0, "\\E0* I mean^1, I'm glad they don't^1. But they could./%")
		}			
	}
}

