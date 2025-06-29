depth = -10000;

if (EVENT == 0)
{
    DRAWNAME = 0;
    EVENT = 70;
}

var CANCELMENU = 0;

if (EVENT == 70 && instance_exists(obj_writer) == false)
{
    JA_XOFF = -12;
    JA_YOFF = 0;
    
    if (global.lang == "ja")
    {
        JA_XOFF = -50;
        JA_YOFF = 10;
    }
    
    with (obj_writer)
        instance_destroy();
    
    msgset(0, "ENTER YOUR OWN NAME.");
    W = instance_create(80 + JA_XOFF, 20 + JA_YOFF, obj_writer);
    
    with (W)
    {
        hspace *= 0.8;
        skipme = 1;
    }
    
    CHOICE = instance_create(0, 0, DEVICE_CHOICE);
    EVENT = 71;
    
    with (CHOICE)
        event_user(0);
    
    with (CHOICE)
    {
        depth = -100;
        
        if (global.lang == "ja")
            STRINGMAX = 7;
    }
}

if (EVENT == 71)
{
    if (i_ex(CHOICE))
    {
        global.truename = CHOICE.NAMESTRING;
        FN_3 = global.truename;
        
        if (FN_3 == "GASTER" || FN_3 == "がすたー" || FN_3 == "ガスター")
        {
            snd_free_all();
            game_restart();
        }
        
        if (CHOICE.backout == 1)
        {
            CANCELMENU = 1;
            
            with (CHOICE)
                instance_destroy();
        }
    }
    else
    {
        EVENT = 73;
    }
}

if (EVENT == 73)
{
    with (obj_writer)
        instance_destroy();
    
    FOUND = 0;
    FN = global.truename;
    event_user(0);
    msgset(0, "THIS IS YOUR NAME.");
    
    if (global.lang == "ja")
        JA_XOFF = -30;
    
    W = instance_create(78 + JA_XOFF, 20 + JA_YOFF, obj_writer);
    
    with (W)
    {
        hspace *= 0.8;
        skipme = 1;
    }
    
    DRAWNAME = 1;
    FIXY = 0;
    EVENT = 74;
    global.choice = -1;
    CHOICE = instance_create(100, 100, DEVICE_CHOICE);
    CHOICE.depth = -100;
}

if (EVENT == 74)
{
    if (FIXY < 100)
        FIXY += 2;
    
    if (global.choice == 0)
        CANCELMENU = 1;
    
    if (global.choice == 1)
    {
        snd_free_all();
        snd_play(snd_dtrans_lw);
        fade = scr_fadeout(80);
        fade.depth = -1;
        fade.image_blend = c_white;
        EVENT = 75;
        TIMER = 0;
    }
}

if (CANCELMENU == 1)
{
    if (EVENT == 74)
    {
        DRAWNAME = 0;
        EVENT = 70;
        
        with (DEVICE_MENU)
        {
            ONEBUFFER = 3;
            TWOBUFFER = 3;
        }
        
        safe_delete(obj_writer);
        safe_delete(DEVICE_CHOICE);
    }
    else
    {
        DRAWNAME = 0;
        
        with (DEVICE_MENU)
        {
            MENU_NO = 0;
            ONEBUFFER = 3;
            TWOBUFFER = 3;
        }
        
        with (obj_writer)
            instance_destroy();
        
        instance_destroy();
        exit;
    }
}

if (EVENT == 75)
{
    TIMER++;
    
    if (TIMER >= 130)
        EVENT = 76;
}

if (EVENT == 76)
{
    global.flag[20] = 0;
    global.plot = 0;
    
	// !MOD! !CHANGE! starter chapter location here
    switch (global.chapter) {
		default:
			global.darkzone = 1;
			room_goto(room_dw_test);
			break;
	}
}

if (DRAWNAME)
{
    draw_set_font(global.main_font);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text_transformed(camerax() + 160, cameray() + 40 + (FIXY / 2), global.truename, 1 + (FIXY / 100), 1 + (FIXY / 100), 1 + random(4));
    draw_set_halign(fa_left);
}

if (scr_debug() && sunkus_kb_check_pressed(82))
    room_restart();
