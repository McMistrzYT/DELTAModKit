if (keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check_pressed(ord("C")))
{
    snd_play_pitch(snd_egg, 1.2);
    
    if (!i_ex(obj_debug_drawInput))
    {
        instance_create(x, y, obj_debug_drawInput);
    }
    else
    {
        safe_delete(obj_debug_drawInput);
    }
}

if (keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check_pressed(vk_up))
{
    snd_play(snd_txtsans);
    
    if (showdebug == false)
    {
        showdebug = true;
    }
    else
    {
        showdebug = false;
    }
    
    show_debug_overlay(showdebug);
    scr_debug_print("showdebug = " + string(showdebug));
}

if (keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check_pressed(ord("D")))
{
    if (writedisplay == false)
    {
        writedisplay = true;
    }
    else
    {
        writedisplay = false;
    }
    
    var i = array_length(global.flag) - 1;
    
    while (i > -1)
    {
        lastval[i] = global.flag[i];
        i--;
    }
    
    snd_play_pitch(snd_deep_noise, 1.1);
}

if (writedisplay == true)
{
    var i = array_length(global.flag) - 1;
    
    while (i > -1)
    {
        if (lastval[i] != global.flag[i])
        {
            debug_message("global.flag[" + string(i) + "] has been changed from " + string(lastval[i]) + " to " + string(global.flag[i]));
        }
        
        i--;
    }
    
    i = array_length(global.flag) - 1;
    
    while (i > -1)
    {
        lastval[i] = global.flag[i];
        i--;
    }
}

if (keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check_pressed(ord("P")))
{
    var dump_date = string(date_get_year(date_current_datetime())) + "_" + string(date_get_month(date_current_datetime())) + "_" + string(date_get_day(date_current_datetime())) + "_" + string(date_get_hour(date_current_datetime())) + "_" + string(date_get_minute(date_current_datetime())) + "_" + string(date_get_second(date_current_datetime()));
    ini_open("activeObjectList_" + dump_date + ".txt");
    ini_write_string("objects", "total number of objects at call", string(instance_count));
    
    with (all)
    {
        var sid = "[" + string(id) + "]";
        var writestring = object_get_name(object_index);
        
        if (persistent == true)
        {
            writestring += " [persistent object]";
        }
        
        if (visible == false)
        {
            writestring += " [not visible]";
        }
        
        ini_write_string("objects", sid, writestring);
    }
    
    ini_close();
    snd_play(snd_won);
    file_text_open_read("activeObjectList_" + dump_date + ".txt");
}

if (keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check_pressed(ord("T")))
{
    snd_play_pitch(snd_break1, 0.8);
    
    if (cutsceneshow == true)
    {
        cutsceneshow = false;
    }
    else
    {
        cutsceneshow = true;
    }
    
    scr_debug_print("cutsceneshow = " + string(cutsceneshow));
}

if (keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check_pressed(ord("G")))
{
    global.chemg_god_mode = !global.chemg_god_mode;
    
    if (global.chemg_god_mode == true)
    {
        snd_play_pitch(snd_swing, 1.5);
    }
    
    if (global.chemg_god_mode == false)
    {
        snd_play_pitch(snd_swing, 0.5);
    }
}

if (global.chemg_god_mode == true)
{
    for (var i = 0; i < 6; i++)
    {
        if (global.hp[i] < global.maxhp[i])
        {
            global.hp[i]++;
        }
    }
}

if (keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check_pressed(ord("B")))
{
    with (obj_solidblock)
    {
        visible = true;
    }
    
    snd_play(snd_txtspam);
}

if (keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check_pressed(ord("W")))
{
    windowswitcher = !windowswitcher;
    
    if (windowswitcher == false)
    {
        window_set_size(1280, 960);
    }
    
    if (windowswitcher == true)
    {
        window_set_size(640, 480);
    }
    
    alarm[1] = 1;
}

if (keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check_pressed(ord("I")))
{
    snd_play_pitch(snd_egg, 1.2);
    interactshower = 1 - interactshower;
}

if (keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check_pressed(ord("M")))
{
    //scr_change_language();
    //scr_84_load_ini();
    room_restart();
}
