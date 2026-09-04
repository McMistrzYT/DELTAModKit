function scr_npc_setup() {
	var handled = true;
	
	switch (room) { // In Older Versions this was Broken, and went Unused.
		/*
		case room_dw_test: {
			// set dark world room "room_dw_test" appearance here
			sprite_index = spr_maus_idle;
			break;	
		}
		
		case room_lw_test: {
			// set light world room "room_lw_test" appearance here
			sprite_index = spr_virovirokun_idle;
			break;
		}*/
		case room_diner: {
			sprite_index = spr_npc_qc
			break;
		}
		case room_hospital_lobby: {
			sprite_index = spr_npc_nurse
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
			scr_smallface(0, "ralsei", 2, "right", "bottom", "Bottom Right")
			scr_smallface(1, "ralsei", 18, "right", "bottom", "(That's what this#is, Susie)")
			scr_smallface(2, "susie", 3, "left", "bottom", "What's a#DELTAModKit?")
			msgset(0, "* Ay, boss!^2 \\f0Welcome to the Testbed room!/");
			msgnext("* Here you can test out all the things DELTAModKit\\f2 offers\\f1!/");
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
		
		case room_diner: { // QC, Chapter 2 Dialogue
			global.msg[0] = stringsetloc("* Don't be a stranger now^1, alright^1, hun?/%", "obj_npc_room_slash_Other_10_gml_415_0")
			
			
			if scr_flag_get(DRFLAG.NPC_QC_DinerCh2_CollectedHotChocolate) == 0 {
				global.msg[0] = stringsetloc("* Hey there^1!&* Haven't seen you in a while^1, hun./", "obj_npc_room_slash_Other_10_gml_421_0")
				global.msg[1] = stringsetloc("* I remember^1, back on Sundays^1, after service.../", "obj_npc_room_slash_Other_10_gml_423_0")
				global.msg[2] = stringsetloc("* You and your family would come in and order the special./", "obj_npc_room_slash_Other_10_gml_424_0")
				global.msg[3] = stringsetloc("* 'Course^1, things happened^1, and then.../", "obj_npc_room_slash_Other_10_gml_425_0")
				global.msg[4] = stringsetloc("* Y'all..^1.&* Stopped comin' together./", "obj_npc_room_slash_Other_10_gml_426_0")
				global.msg[5] = stringsetloc("* But every Sunday^1, you and your brother'd still come in./", "obj_npc_room_slash_Other_10_gml_427_0")
				global.msg[6] = stringsetloc("* He'd order you a hot chocolate.../", "obj_npc_room_slash_Other_10_gml_428_0")
				global.msg[7] = stringsetloc("* And you two'd sit down at that table in the corner.../", "obj_npc_room_slash_Other_10_gml_429_0")
				global.msg[8] = stringsetloc("* ... drawin' shapes in the window with your breath./", "obj_npc_room_slash_Other_10_gml_430_0")
				global.msg[9] = stringsetloc("* .../", "obj_npc_room_slash_Other_10_gml_431_0")
				global.msg[10] = stringsetloc("* You must really miss him^1, huh?/", "obj_npc_room_slash_Other_10_gml_432_0")
				global.msg[11] = stringsetloc("* ... Here^1, how about this?/", "obj_npc_room_slash_Other_10_gml_433_0")
				global.msg[12] = stringsetloc("* (Kris got the Hot Chocolate.)/", "obj_npc_room_slash_Other_10_gml_434_0")
				global.msg[13] = stringsetloc("* On the house, hun./%", "obj_npc_room_slash_Other_10_gml_435_0")
				scr_flag_set(DRFLAG.NPC_QC_DinerCh2_CollectedHotChocolate, 1)
				noroom = 0
				scr_litemget(1)
				
				if (noroom == 1){
					scr_flag_set(DRFLAG.NPC_QC_DinerCh2_CollectedHotChocolate, 2)
					global.msg[11] = stringsetloc("* ... You know^1, I'd give you a hot chocolate on the house.../", "obj_npc_room_slash_Other_10_gml_442_0")
					global.msg[12] = stringsetloc("* ... But it looks like you've got enough things already./", "obj_npc_room_slash_Other_10_gml_443_0")
					global.msg[13] = stringsetloc("* Take it easy^1, okay^1, hun?/%", "obj_npc_room_slash_Other_10_gml_444_0")
				}
			}
			break;	
		}
		
		case room_hospital_lobby: {
			
			global.msg[0] = stringsetloc("* Oh^1, it's you^1.&* Are you here to play the piano again?/", "obj_npc_room_slash_Other_10_gml_796_0")
			global.msg[1] = stringsetloc("* The patients can't hear it well from here^1, but I personally enjoy it./%", "obj_npc_room_slash_Other_10_gml_797_0")
		
			if talked >= 1 {
				global.msg[0] = stringsetloc("* Sometimes the police chief comes in to play the piano./", "obj_npc_room_slash_Other_10_gml_801_0")
				global.msg[1] = stringsetloc("* Her playing is nice^1, but when she starts singing.../", "obj_npc_room_slash_Other_10_gml_802_0")
				global.msg[2] = stringsetloc("* We have to ask her to leave./%", "obj_npc_room_slash_Other_10_gml_803_0")
			}
			/*
			if talked >= 2 {
				msgset(0, "* Why is the door Locked?/")	
				msgnext("* Those Three rooms haven't been implemented Yet./%")
			}
			*/
			if (tempvar >= 1) {
				global.msg[0] = stringsetloc("* Hmmm..^1. you usually play the piano a bit more..^1. beautifully./", "obj_npc_room_slash_Other_10_gml_809_0")
				global.msg[1] = stringsetloc("* Is everything OK^1?&* You DO seem a little sick.../%", "obj_npc_room_slash_Other_10_gml_810_0")
			}
			
			break;
		}
		
		default: handled = false; break;	
	}
	
	return handled;
}