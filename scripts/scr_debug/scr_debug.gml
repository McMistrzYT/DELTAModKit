function scr_debug_print(msg)
{
    if (!scr_debug())
    {
        exit;
    }
    if (!instance_exists(obj_debug_gui))
    {
        instance_create(__view_get(0, 0) + 10, __view_get(1, 0) + 10, obj_debug_gui);
        obj_debug_gui.depth = -9999;
    }
    
    obj_debug_gui.newtext = string(msg);
    
    with (obj_debug_gui)
    {
        message[messagecount] = newtext;
        newtext = "";
        timer[messagecount] = 90 - totaltimer;
        totaltimer += timer[messagecount];
        messagecount++;
        debugmessage = message[0];
        
        for (i = 1; i < messagecount; i++)
        {
            debugmessage += ("#" + message[i]);
        }
    }
    show_debug_message(msg)
}

function print_message(msg)
{
	show_message(msg)
}

function debug_print(msg)
{
    return scr_debug_print(msg);
}

function scr_debug_clear_all()
{
    if (!scr_debug())
    {
        exit;
    }
    
    scr_debug_clear_persistent();
}


function scr_debug_keycheck(key)
{
    return scr_debug() && keyboard_check_pressed(key);
}

function scr_debug_print_persistent(persistname, msg)
{
    if (!scr_debug())
    {
        exit;
    }
    
    if (!instance_exists(obj_debug_gui_persistent))
    {
        instance_create(__view_get(0, 0) + 10, __view_get(1, 0) + 10, obj_debug_gui_persistent);
        obj_debug_gui_persistent.depth = -9999;
    }
    
    obj_debug_gui_persistent.newtext = string(msg);
    
    with (obj_debug_gui_persistent)
    {
        message[messagecount] = newtext;
        newtext = "";
        timer[messagecount] = 90 - totaltimer;
        totaltimer += timer[messagecount];
        messagecount++;
        debugmessage = message[0];
        
        for (i = 1; i < messagecount; i++)
        {
            debugmessage += ("#" + message[i]);
        }
        
        name = persistname;
    }
}

function debug_print_persistent(persistname, msg)
{
	scr_debug_print_persistent(persistname, msg)
}

function scr_debug_delete_persistent(persistname, deleteall = false)
{
    with (obj_debug_gui_persistent)
    {
		if deleteall
			instance_destroy()
		else if (name == persistname)
        {
            instance_destroy();
        }
    }
}

function scr_debug_clear_persistent()
{
    with (obj_debug_gui)
    {
        message[0] = "";
        debugmessage = "";
        newtext = "";
        timer[0] = 90;
        messagecount = 0;
        totaltimer = 0;
    }
    
    with (obj_debug_gui_persistent)
    {
        message[0] = "";
        debugmessage = "";
        newtext = "";
        timer[0] = 90;
        messagecount = 0;
        totaltimer = 0;
    }
}


function debug_printline(string, yoff)
{
    if (scr_debug())
    {
        draw_set_font(fnt_small);
        draw_set_color(c_black);
        yy = 480 - (8 * yoff);
        xx = 2;
		draw_text(xx + 1, yy, string);
		draw_text(xx - 1, yy, string);
		draw_text(xx, yy + 1, string);
		draw_text(xx, yy - 1, string);
        draw_set_color(c_white);
		draw_text(xx, yy, string);
    }
}
