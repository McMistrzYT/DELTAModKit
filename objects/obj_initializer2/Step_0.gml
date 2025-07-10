if (!instance_exists(obj_time))
    scr_input_manager_process();

if (global.is_console)
{
    if (global.savedata_async_id >= 0)
        exit;
    
    if (!variable_global_exists("chapter"))
        exit;
    
    if (!textures_loaded)
        textures_loaded = loadtex.loaded;
    
    //if (textures_loaded)
        //show_debug_message_concat("TEXTURES LOADED");
    //else
        //exit;
}

var CH = string(global.chapter);

/*if (audio_group_is_loaded(1))
{*/
    roomchoice = room_legend;//PLACE_CONTACT;
    menu_go = 0;
    
    if (scr_chapter_save_file_exists(global.chapter) || ossafe_file_exists("dr.ini"))
        menu_go = 1;
    
    if (scr_completed_chapter_any_slot(global.chapter))
        menu_go = 2;
    
    if (scr_debug())
        menu_go = 3;
    
    if (menu_go == 0 || menu_go == 1)
    {
        if (global.is_console)
            global.screen_border_alpha = 0;
        
        roomchoice = room_intro;
    }
    
    if (menu_go == 2)
    {
        if (global.is_console)
            global.screen_border_alpha = 1;
        
        scr_windowcaption("DELTARUNE");
        global.tempflag[10] = 1;
        roomchoice = room_legend;
        global.plot = 0;
    }
    
    if (menu_go == 3)
    {
        if (global.is_console)
            global.screen_border_alpha = 0;
        
		global.darkzone = 0;
        roomchoice = scr_debug_get_start_room();
    }
    
    room_goto(roomchoice);
//}

/*if (scr_debug())
{
    if (!instance_exists(obj_debugProfiler))
        instance_create_depth(0, 0, 0, obj_debugProfiler);
}*/
