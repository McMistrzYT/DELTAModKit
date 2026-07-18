with obj_npc_sign {
	if sprite_index == spr_npc_beachtable {
		USECUSTOMFUNC = true
		CUSTOM_FUNC = function() {
			scr_speaker("no_name")
			msgset(0, "* (It's a metal picnic table.)/")
			if scr_havechar(DRCharacter.Susie) {
				scr_anyface_next("susie", "K")
				msgnext("\\EK* (Damnit^1, my fingers won't fit through the holes.)/%")
			}
			msgnext("%%")
		}
	}
}