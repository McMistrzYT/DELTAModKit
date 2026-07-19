function scr_text_extra(msc){
	var handled = true;
	
	debug_log("scr_text_extra(): " + string(msc));
	switch (msc) {
		// begin it at 10000 to not interfere with any original scr_text data if you plan on porting
		// that from deltarune, if you start at the same value as a Deltarune one it'll use the one in here instead
		
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
			
		case SCRTEXT_Choices_Hometown_Graveyard_Bench:
			global.choicemsg[0] = stringsetloc(" #Sit", "scr_text_slash_scr_text_gml_716_0")
			global.choicemsg[1] = stringsetloc(" #Don't Sit", "scr_text_slash_scr_text_gml_717_0")
			global.choicemsg[2] = stringsetloc(" ", "scr_text_slash_scr_text_gml_718_0_b")
			global.choicemsg[3] = stringsetloc(" ", "scr_text_slash_scr_text_gml_719_0_b")
			global.msg[0] = stringsetloc("* (Gerson Boom Memorial Bench)/", "scr_text_slash_scr_text_gml_718_0")
			global.msg[1] = stringsetloc("* \"Throughout my career^1, some of my best ideas came from dreams.\"/", "scr_text_slash_scr_text_gml_719_0")
			global.msg[2] = stringsetloc("* \"Take a rest here. If anyone asks -- you're writing!\"/", "scr_text_slash_scr_text_gml_720_0")
			global.msg[3] = stringsetloc("\\C2 ", "scr_text_slash_scr_text_gml_721_0")
			global.msg[4] = stringsetloc(" ", "scr_text_slash_scr_text_gml_724_0")
			break
		
		case SCRTEXT_Choices_Hometown_Graveyard_Bench + 1:
			msgset(0, "* (You stared confused.)/%")
			if (global.choice == 0) global.msg[0] = stringsetloc("* (Didn't feel like it.)/%", "scr_text_slash_scr_text_gml_730_0")			
			if (global.choice == 1) global.msg[0] = stringsetloc("* (You decided not to sit.)/%", "scr_text_slash_scr_text_gml_736_0")
			
			break
		}
	}
}

#macro SCRTEXT_Choices_ExampleChoice 10000
#macro SCRTEXT_Choices_Item_BallofJunk 10
#macro SCRTEXT_Choices_Hometown_Graveyard_Bench 190