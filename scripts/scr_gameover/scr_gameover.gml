function scr_gameover()
{
    if (global.flag[35] == 0)
    {
        audio_stop_all();
        snd_play(snd_hurt1);
        
        global.screenshot = sprite_create_from_surface(application_surface, 0, 0, __view_get(e__VW.WView, 0), __view_get(e__VW.HView, 0), 0, 0, 0, 0);
        snd_free_all();
        room_goto(room_gameover);
    }
    
    if (global.flag[35] == 1)
    {
        global.turntimer = -1;
        global.flag[36] = 1;
        global.flag[39] = 1;
    }
    
    if (global.flag[35] == 2)
    {
        audio_stop_all();
        snd_play(snd_hurt1);
        snd_free_all();
        global.entrance = 0;
        global.tempflag[9] = 1;
        global.fighting = 0;
        global.interact = 0;
        for (var i = 0; i < DRHero.__MAX__; i++)
			global.hp[i] = 1;
        __room = room;
        
        if (global.chapter == 2)
        {
            with (instance_create(0, 0, obj_persistentfadein))
                image_alpha = 1.2;
        }
        
        room_goto(__room);
    }
}