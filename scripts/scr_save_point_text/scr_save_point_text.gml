function scr_save_point_text(){
	switch (room) {
		default:
			nodialogue = 0;
			
			scr_speaker("no_name");
			msgset(0, "* This is a save point./");
			msgnext("* You can configure this dialogue in scr_save_point_text./%");
			break;
	}
}