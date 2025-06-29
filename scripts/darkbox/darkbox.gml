function scr_darkbox(arg0, arg1, arg2, arg3)
{
    cur_jewel += 1;
    textbox_width = arg2 - arg0 - 63;
    
    if (textbox_width < 0)
        textbox_width = 0;
    
    textbox_height = arg3 - arg1 - 63;
    
    if (textbox_height < 0)
        textbox_height = 0;
    
    if (textbox_width > 0)
    {
        draw_sprite_stretched(spr_textbox_top, 0, arg0 + 32, arg1, textbox_width, 32);
        draw_sprite_ext(spr_textbox_top, 0, arg0 + 32, arg3 + 1, textbox_width, -2, 0, c_white, 1);
    }
    
    if (textbox_height > 0)
    {
        draw_sprite_ext(spr_textbox_left, 0, arg2 + 1, arg1 + 32, -2, textbox_height, 0, c_white, 1);
        draw_sprite_ext(spr_textbox_left, 0, arg0, arg1 + 32, 2, textbox_height, 0, c_white, 1);
    }
    
    if (global.flag[8] == 0)
    {
        draw_sprite_ext(spr_textbox_topleft, cur_jewel / 10, arg0, arg1, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_textbox_topleft, cur_jewel / 10, arg2 + 1, arg1, -2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_textbox_topleft, cur_jewel / 10, arg0, arg3 + 1, 2, -2, 0, c_white, 1);
        draw_sprite_ext(spr_textbox_topleft, cur_jewel / 10, arg2 + 1, arg3 + 1, -2, -2, 0, c_white, 1);
    }
    else
    {
        draw_sprite_ext(spr_textbox_topleft, 0, arg0, arg1, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_textbox_topleft, 0, arg2 + 1, arg1, -2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_textbox_topleft, 0, arg0, arg3 + 1, 2, -2, 0, c_white, 1);
        draw_sprite_ext(spr_textbox_topleft, 0, arg2 + 1, arg3 + 1, -2, -2, 0, c_white, 1);
    }
}


function scr_darkbox_black(arg0, arg1, arg2, arg3)
{
    draw_set_color(c_black);
    draw_rectangle(arg0 + 20, arg1 + 20, arg2 - 20, arg3 - 20, false);
    scr_darkbox(arg0, arg1, arg2, arg3);
	draw_set_color(c_white);
}

function scr_terminate_writer()
{
    __writerkilled = 0;
    __writerkillable = 0;
    __writerended = 0;
    
    if (instance_exists(obj_writer))
    {
        obj_writer.__endcheckid = id;
        
        with (obj_writer)
        {
            if (reachedend == 1)
            {
                with (__endcheckid)
                    __writerended++;
            }
        }
        
        if (__writerended == instance_number(obj_writer))
            __writerkillable = 1;
    }
    else
    {
        __writerkilled = 1;
    }
    
    if (button1_p() && __writerkillable == 1)
    {
        with (obj_writer)
            instance_destroy();
        
        __writerkilled = 1;
    }
    
    return __writerkilled;
}