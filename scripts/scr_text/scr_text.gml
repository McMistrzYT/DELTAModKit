function scr_text_extra(msc){
	var handled = true;
	
	debug_log("scr_text_extra(): " + string(msc));
	switch (msc) {
		// begin it at 10000 to not interfere with any original scr_text data if you plan on porting
		// that from deltarune
		
		case SCRTEXT_Choices_ExampleChoice: {
			scr_speaker("no_name");
			global.choicemsg[0] = "#Choicers";
			global.choicemsg[1] = "#Are done#like this";
			global.choicemsg[2] = " ";
			global.choicemsg[3] = " ";
			
			msgset(0, "\\C2");
			break;	
		}
		
		case SCRTEXT_Choices_ExampleChoice+1: {
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
	var handled = scr_text_extra(msc);
	
	if !handled {
		switch msc {
		case SCRTEXT_Choices_Item_BallofJunk:
			global.choicemsg[0] = stringsetloc("#Yes", "scr_text_slash_scr_text_gml_8_0")
			global.choicemsg[1] = stringsetloc("#No", "scr_text_slash_scr_text_gml_9_0")
			global.choicemsg[2] = stringsetloc(" ", "scr_text_slash_scr_text_gml_12_0_b")
			global.choicemsg[3] = stringsetloc(" ", "scr_text_slash_scr_text_gml_13_0_b")
			global.msg[0] = stringsetloc("* You really didn't want to throw it away./", "scr_text_slash_scr_text_gml_12_0")
			global.msg[1] = stringsetloc("* Throw it away anyway?/", "scr_text_slash_scr_text_gml_13_0")
			global.msg[2] = stringsetloc("\\C2 ", "scr_text_slash_scr_text_gml_14_0")
			
			if (global.chapter >= 2) msgset(0, "* You took it from your pocket^1.&* You have a \\cYvery^1, very^1, bad feeling\\c0 about throwing it away./", "scr_text_slash_scr_text_gml_19_0")
			
			break
		
		case SCRTEXT_Choices_Item_BallofJunk + 1:
			if (global.choice == 0)
			{
				global.flag[466] = 1
				snd_play(snd_bageldefeat)
				global.msg[0] = stringsetloc("* Hand shaking^1, you dropped the ball of junk on the ground./", "scr_text_slash_scr_text_gml_20_0")
				global.msg[1] = stringsetloc("* It broke into pieces./", "scr_text_slash_scr_text_gml_21_0")
				global.msg[2] = stringsetloc("* You felt bitter./%", "scr_text_slash_scr_text_gml_22_0")
				script_execute(scr_litemshift, global.menucoord[1], 0)
				
				for (var i = 0; i < 12; i += 1)
					global.item[i] = 0
				
				for (var i = 0; i < 48; i += 1)
				{
					global.armor[i] = 0
					global.weapon[i] = 0
				}
			} else {
				global.msg[0] = stringsetloc("* You felt a feeling of relief./%", "scr_text_slash_scr_text_gml_34_0")
			}
			
			break	
		}
	}
}

#macro SCRTEXT_Choices_ExampleChoice 10000
#macro SCRTEXT_Choices_Item_BallofJunk 10