enum DRGAMEOVERTYPES {
	GameOver,
	DojoFail,
	LoadRoom,
}
function scr_gameover() {
	switch global.flag[DRFLAG.GameOverType] {
		case DRGAMEOVERTYPES.GameOver:
	        audio_stop_all();
	        snd_play(snd_hurt1);
        
	        global.screenshot = sprite_create_from_surface(application_surface, 0, 0, 640, 480, 0, 0, 0, 0);
	        snd_free_all();
	        room_goto(room_gameover);
		break;
		case DRGAMEOVERTYPES.DojoFail:
	        global.turntimer = -1;
	        global.flag[DRFLAG.FailedBattle] = 1;
	        global.flag[DRFLAG.ForceEndBattle] = 1;		
		break;
		case DRGAMEOVERTYPES.LoadRoom:
	        audio_stop_all();
	        snd_play(snd_hurt1);
	        snd_free_all();
	        global.entrance = 0;
	        global.tempflag[9] = 1;
	        global.fighting = 0;
	        global.interact = 0;
	        for (var i = 0; i < DRHero.__MAX__; i++) global.hp[i] = 1;
	        __room = room; // Change this to whatever room you want!
        
	        if (global.chapter == 2) {
	            with (instance_create(0, 0, obj_persistentfadein))
	                image_alpha = 1.2;
	        }
        
			if __room == room 
				room_restart()
			else
				room_goto(__room);
		break;
		default: 
			debug_log("GameOver Process Error: Gameover Type ({0}) Does not Exist", global.flag[DRFLAG.GameOverType])
		break
	}
}