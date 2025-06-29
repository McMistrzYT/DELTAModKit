function scr_text_extra(msc){
	var handled = true;
	
	show_debug_message("scr_text_extra(): " + string(msc));
	switch (msc) {
		// begin it at 10000
		
		case 9999: {
			scr_speaker("no_name");
			msgset(0, "* .../");
			msgnext("* Kris,^1 what do you think about this situation...?/");
			msgnext("\\C3");
			break;
		}
		
		case 10000: {
			scr_speaker("no_name");
			global.choicemsg[0] = "#Are you#okay?";
			global.choicemsg[1] = "#Do it";
			global.choicemsg[2] = " ";
			global.choicemsg[3] = " ";
			
			msgset(0, "\\C2");
			break;	
		}
		
		case 10001: {
			msgset(0, "* (K-KRIS?!)/%");
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