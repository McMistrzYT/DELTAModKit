function scr_npc_setup() {
	var handled = true;
	
	switch (room) {
		case room_dw_test: {
			// set appearance here
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
			msgset(0, "* Hello!/");
			msgnext("* I'm the \\cYTEMPLATE NPC!\\c0/");
			msgnext("* You can customize my dialogue and appearance in scr_npc_setup./");
			msgnext("* I've been told that this magical file is located at Custom > Scripts > scr_npc_setup.../%");
			break;
		}
		
		default: handled = false; break;	
	}
	
	return handled;
}