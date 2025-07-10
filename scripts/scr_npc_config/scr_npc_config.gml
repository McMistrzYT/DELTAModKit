function scr_npc_setup() {
	var handled = true;
	
	switch (room) {
		case room_dw_test: {
			// set dark world room "room_dw_test" appearance here
			sprite_index = spr_maus_idle;
			break;	
		}
		
		case room_lw_test: {
			// set light world room "room_lw_test" appearance here
			sprite_index = spr_virovirokun_idle;
			break;
		}
		
		default: handled = false; break;	
	}
	
	return handled;
}

function scr_npc_interact() {
	var handled = true;
	
	switch (room) {
		case room_dw_test: {
			// set dialogue here
			msgset(0, "* Ay, boss!^2 Welcome to the Testbed room!/");
			msgnext("* Here you can test out all the things DELTAModKit offers!/");
			msgnext("* .../");
			msgnext("* Oh, and hey, if you wanna see how my dialogue works.../");
			msgnext("* You should check out scr_npc_config./");
			msgnext("* I've heard that this magical file is located in the Configs folder.../%");
			break;
		}
		
		case room_lw_test: {
			msgset(0, "* ...Hey wait...!/");
			msgnext("* This isn't the Dark World?!^2 What am I doing here?!/");
			msgnext("* Hey,^1 Kris,^1 could you carry me back into the Dark World?/");
			msgnext("* I don't wanna be here./%");
			break;
		}
		
		default: handled = false; break;	
	}
	
	return handled;
}