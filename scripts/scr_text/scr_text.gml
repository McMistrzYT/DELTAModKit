function scr_text_extra(msc){
	var handled = true;
	
	show_debug_message("scr_text_extra(): " + string(msc));
	switch (msc) {
		// begin it at 10000 to not interfere with any original scr_text data if you plan on porting
		// that from deltarune
		
		case 10000: {
			scr_speaker("no_name");
			global.choicemsg[0] = "#Choicers";
			global.choicemsg[1] = "#Are done#like this";
			global.choicemsg[2] = " ";
			global.choicemsg[3] = " ";
			
			msgset(0, "\\C2");
			break;	
		}
		
		case 10001: {
			msgset(0, "* (You chose the option \"" + string_replace(global.choicemsg[global.choice], "#", " ") + "\")/%");
			break;
		}
		
		default: {
			handled = false;
			break;
		}
	}
	
	return handled;
}

function scr_text(msc) {
	// !MOD! !PATCH! patch this func
	scr_text_extra(msc);
}