function scr_save_point_text(){
	switch (room) {
		case room_dw_test:
			nodialogue = false;
			
			scr_speaker("no_name");
			msgset(0, "* You are filled with the power of DELTAModKit./%");
			break;
		
		default:
			nodialogue = false;
			
			scr_speaker("no_name");
			msgset(0, "* This is a save point./");
			msgnext("* You can configure this dialogue in scr_save_point_text./%");
			break;
	}
}