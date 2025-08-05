x = round(mouse_x);
y = round(mouse_y);
siner++;
mousebuffer--;
main_focus = true;


if (i_ex(obj_debug_windows))
{
    main_focus = false;
}

if main_focus
	window_set_cursor(cr_none);

if (main_focus)
{
    if (mouse_check_button_pressed(mb_left) && mousebuffer < 0)
    {
        mouse_held = 0;
        obj_check = collision_rectangle(x - 2, y - 2, x + 2, y + 2, all, false, true);
        
        if (obj_check != noone)
        {
            visiblecheck = false;
            
            if (show_invisible == true)
            {
                visiblecheck = true;
            }
            else if (obj_check.visible == true)
            {
                visiblecheck = true;
            }
            
            if (visiblecheck == true && obj_check.image_alpha > 0)
            {
                selected_object = obj_check;
            }
        }
        else
        {
            selected_object = -898;
        }
        
        if (instance_exists(obj_actor))
        {
            obj_check = collision_rectangle(x - 2, y - 2, x + 2, y + 2, obj_actor, false, true);
            
            if (obj_check != noone)
            {
                visiblecheck = false;
                
                if (show_invisible == true)
                {
                    visiblecheck = true;
                }
                else if (obj_check.visible == true)
                {
                    visiblecheck = true;
                }
                
                if (visiblecheck == true && obj_check.image_alpha > 0)
                {
                    selected_object = obj_check;
                }
            }
        }
    }
}

if (main_focus)
{
    if (mouse_check_button(mb_left) && i_ex(selected_object))
    {
        mouse_held++;
        mouse_held_minimum = 5;
        
        if (selected_object.object_index == obj_actor)
        {
            mouse_held_minimum = 15;
        }
        
        if (mouse_held >= mouse_held_minimum && i_ex(selected_object))
        {
            selected_object.x = x - (selected_object.sprite_width / 2);
            selected_object.y = y - (selected_object.sprite_height / 2);
        }
    }
    else
    {
        mouse_held = 0;
    }
}

if (keyboard_check_pressed(vk_pagedown))
{
    if (show_all_object_xy == true)
    {
        show_all_object_xy = false;
    }
    else
    {
        show_all_object_xy = true;
    }
    
    mouse_held = 0;
}

if (i_ex(selected_object) && !keyboard_check(ord("P")))
{
    if (selected_object.sprite_index != -1)
    {
        os = selected_object;
        
        if (keyboard_check(vk_up))
        {
            os.y -= 1;
        }
        
        if (keyboard_check(vk_left))
        {
            os.x -= 1;
        }
        
        if (keyboard_check(vk_down))
        {
            os.y += 1;
        }
        
        if (keyboard_check(vk_right))
        {
            os.x += 1;
        }
        
        draw_sprite_ext_flash(os.sprite_index, os.image_index, os.x, os.y, os.image_xscale, os.image_yscale, os.image_angle, os.image_blend, (sin(siner / 8) * 0.5) + 0.5);
    }
}

if (keyboard_check_pressed(vk_pageup))
{
    xy_camera_relative++;
    
    if (xy_camera_relative >= 3)
    {
        xy_camera_relative = 0;
    }
}

if (keyboard_check_pressed(vk_delete))
{
    if (i_ex(selected_object))
    {
        with (selected_object)
        {
            instance_destroy();
        }
        
        selected_object = -999;
    }
}

if (keyboard_check_pressed(ord("V")))
{
	show_invisible = !show_invisible
}

if (siner >= 5 && mouse_check_button_pressed(mb_middle))
{
    instance_destroy();
    
    with (obj_debug_windows)
    {
        instance_destroy();
    }
}

if (show_all_object_xy == true)
{
    for (i = 0; i < instance_count; i++)
    {
        findo = instance_id_get(i);
        
        if (i_ex(findo))
        {
            visiblecheck = false;
            
            if (show_invisible == true)
            {
                visiblecheck = true;
            }
            else if (findo.visible == true)
            {
                visiblecheck = true;
            }
            
            if (visiblecheck == true && findo.sprite_index != -1)
            {
                fox = findo.x;
                foy = findo.y;
                
                if (xy_camera_relative == 1)
                {
                    fox -= camerax()
                    foy -= cameray()
                }
                
                if (xy_camera_relative == 2)
                {
                    fox -= findo.xstart;
                    foy -= findo.ystart;
                }
                
                draw_info = true;
                
                if (findo.object_index == object_index)
                {
                    draw_info = false;
                }
                
                if (findo.object_index == obj_overworldheart)
                {
                    draw_info = false;
                }
                
                if (findo.object_index == obj_grazebox)
                {
                    draw_info = false;
                }
                
                if (draw_info == true)
                {
                    draw_set_color(c_black);
                    draw_rectangle(findo.x - 4, findo.y - 32, findo.x + 80, findo.y, false);
                    draw_set_font(fnt_main);
                    draw_set_color(c_aqua);
                    draw_text(findo.x, findo.y - 32, string_hash_to_newline(object_get_name(findo.object_index)));
                    draw_text(findo.x, findo.y - 16, string_hash_to_newline(string(fox) + " , " + string(foy)));
                    draw_set_color(c_red);
                    draw_rectangle(findo.bbox_left, findo.bbox_top, findo.bbox_right, findo.bbox_bottom, true);
                }
            }
        }
    }
}

if (show_all_object_xy == true)
{
    fox = x;
    foy = y;
    
    if (xy_camera_relative == 1)
    {
        fox -= camerax()
        foy -= cameray()
    }
    
    if (xy_camera_relative == 2)
    {
        fox -= xstart;
        foy -= ystart;
    }
    
    draw_set_color(c_black);
    draw_rectangle(x - 4, y - 24, x + 60, y, false);
    draw_set_color(c_fuchsia);
    draw_text(x, y - 20, string_hash_to_newline(string(fox) + " , " + string(foy)));
}

draw_set_color(c_black);
draw_line_width(x + 16, y + 16, x + 2, y + 2, 5);
draw_set_color(c_white);
draw_line_width(x + 12, y + 12, x + 3, y + 3, 4);
draw_set_color(make_color_hsv(siner * 6, 255, 255));
draw_line_width(x + 7, y + 7, x + 3, y + 3, 3);
old_right_click = false;

if (!old_right_click)
{
    if (mouse_check_button_pressed(mb_right))
    {
        main_focus = false;
        
        if (!i_ex(obj_debug_windows))
        {
            instance_create(0, 0, obj_debug_windows);
            
            if (!i_ex(selected_object))
            {
                obj_debug_windows.type = 1;
            }
            
            with (obj_debug_windows)
            {
                event_user(15);
            }
        }
        else
        {
            with (obj_debug_windows)
            {
                instance_destroy();
            }
        }
    }
}

if (i_ex(selected_object))
{
    so = selected_object;
    
    if (object_get_parent(so.object_index) == obj_monsterparent)
    {
        if (enable_mouse_wheel)
        {
            if (mouse_wheel_up() || mouse_wheel_down())
            {
                with (so)
                {
                    if (state == 0)
                    {
                        state = 3;
                        shakex = 2;
                        hurttimer = 10;
                    }
                    else
                    {
                        state = 0;
                    }
                }
            }
        }
    }
    
    if (so.object_index == obj_actor)
    {
        if (mouse_wheel_up() && enable_mouse_wheel)
        {
            with (so)
            {
                if (specialspriteno < 9)
                {
                    specialspriteno++;
                    sprite_index = specialsprite[specialspriteno];
                }
                else
                {
                    specialspriteno = 0;
                    sprite_index = dsprite;
                }
            }
        }
        
        if (mouse_wheel_down() && enable_mouse_wheel)
        {
            with (so)
            {
                if (specialspriteno > 0)
                {
                    specialspriteno--;
                    sprite_index = specialsprite[specialspriteno];
                }
                else
                {
                    specialspriteno = 9;
                    sprite_index = specialsprite[specialspriteno];
                }
            }
        }
        
        if (button2_h())
        {
            cardinal_grid_align = true;
        }
        else
        {
            cardinal_grid_align = false;
        }
        
        if (old_right_click)
        {
            if (mouse_check_button_pressed(mb_right) && mousebuffer < 0)
            {
                cardinal_grid_align = false;
                thiscardinal = "d";
                actor_debug_xstart = so.x;
                actor_debug_ystart = so.y;
            }
        }
        
        if (old_right_click)
        {
            if (mouse_check_button(mb_right) && mousebuffer < 0)
            {
                dir_from_actor = point_direction(so.x, so.y, x, y);
                thiscardinal = scr_get_cardinal_direction(dir_from_actor);
                
                if (cardinal_grid_align == true)
                {
                    if (thiscardinal == "d" || thiscardinal == "u")
                    {
                        x = so.x;
                    }
                    
                    if (thiscardinal == "r" || thiscardinal == "l")
                    {
                        y = so.y;
                    }
                }
                
                actor_debug_x = x;
                actor_debug_y = y;
                scr_actor_facing(so, thiscardinal);
                draw_set_color(c_red);
                
                if (cardinal_grid_align == true)
                {
                    draw_set_color(c_aqua);
                }
                
                draw_arrow(so.x, so.y, x, y, 8);
                draw_sprite_ext(so.sprite_index, so.image_index, x, y, so.image_xscale, so.image_yscale, so.image_angle, so.image_blend, 0.5 + (sin(siner / 4) * 0.1));
            }
        }
        
        if (old_right_click)
        {
            if (mouse_check_button_released(mb_right) && mousebuffer < 0)
            {
                dir_from_actor = point_direction(so.x, so.y, x, y);
                thiscardinal = scr_get_cardinal_direction(dir_from_actor);
                
                if (cardinal_grid_align == true)
                {
                    if (thiscardinal == "d" || thiscardinal == "u")
                    {
                        x = so.x;
                    }
                    
                    if (thiscardinal == "r" || thiscardinal == "l")
                    {
                        y = so.y;
                    }
                }
                
                if (actor_previously_selected != so.number)
                {
                    totalstring += ("c_sel(" + string(so.number) + ") //select " + so.name + " \\n");
                }
                
                actor_previously_selected = so.number;
                _speed = 4;
                _time = 40;
                _realdist = point_distance(so.x, so.y, x, y);
                _realtime = _realdist / _speed;
                
                if (cardinal_grid_align == 1)
                {
                    totalstring += ("c_walk_wait(\"" + thiscardinal + "\"" + "," + string(_speed) + "," + string(_realtime) + ") //move " + so.name + " " + string(_realdist) + " pixels\\n");
                }
                else
                {
                    totalstring += ("c_walkdirect_wait(" + string(x) + "," + string(y) + "," + string(ceil(_realtime)) + ")//move" + so.name + " \\n");
                }
                
                clipboard_set_text(totalstring);
                scr_actor_facing(so, thiscardinal);
                so.x = x;
                so.y = y;
                copymessage = "Copied to clipboard";
                copybuffer = 15;
                mousebuffer = 3;
            }
        }
        
        if (keyboard_check_pressed(ord("W")))
        {
            totalstring += "c_wait(30)\\n";
            copymessage = "Wait command copied";
            copybuffer = 15;
        }
        
        if (keyboard_check_pressed(ord("D")))
        {
            totalstring += "c_msgset(0,\"* Text/%\")\\nc_talk_wait()\\n";
            copymessage = "Dialogue command copied";
            copybuffer = 15;
        }
        
        if (keyboard_check_pressed(ord("Q")))
        {
            if (actor_previously_selected != so.number)
            {
                totalstring += ("c_sel(" + string(so.number) + ") //select " + so.name + " \\n");
            }
            
            actor_previously_selected = so.number;
            totalstring += ("c_specialsprite(" + string(so.specialspriteno) + ")\\n");
            copymessage = "Sprite change copied";
            copybuffer = 15;
        }
        
        if (keyboard_check_pressed(ord("P")))
        {
            panremx = camerax();
            panremy = cameray();
            
            if (instance_exists(obj_mainchara))
            {
                if (obj_mainchara.cutscene == false)
                {
                    obj_mainchara.cutscene = true;
                    totalstring += "c_pannable(1)\\n";
                    copymessage = "Panning enabled!";
                    copybuffer = 5;
                }
            }
        }
        
        if (keyboard_check(ord("P")))
        {
            cameraxadd = 0;
            camerayadd = 0;
            cameraspeed = 2;
            
            if (global.darkzone == true)
            {
                cameraspeed = 4;
            }
            
            if (right_h())
            {
                cameraxadd = cameraspeed;
            }
            
            if (left_h())
            {
                cameraxadd = -cameraspeed;
            }
            
            if (up_h())
            {
                camerayadd = -cameraspeed;
            }
            
            if (down_h())
            {
                camerayadd = cameraspeed;
            }
            
            camerax_set(camerax() + cameraxadd);
            cameray_set(cameray() + camerayadd);
        }
        
        if (keyboard_check_released(ord("P")))
        {
            if (camerax() != panremx || cameray() != panremy)
            {
                pandiffx = camerax() - panremx;
                pandiffy = cameray() - panremy;
                totalstring += ("c_panspeed_wait(" + string(pandiffx / 40) + "," + string(pandiffy / 40) + ",40) //pan amount: " + string(pandiffx) + "," + string(pandiffy));
                totalstring += (" // panned to: " + string(camerax()) + "," + string(cameray()) + "  \\n");
                copymessage = "Pan copied!";
                copybuffer = 15;
                panremx = camerax();
                panremy = cameray();
            }
        }
        
        if (copybuffer > 0)
        {
            if (copybuffer == 15)
            {
                clipboard_set_text(totalstring);
            }
            
            draw_set_color(c_yellow);
            copybuffer -= 1;
            draw_text(x, y, string_hash_to_newline(copymessage));
        }
    }
}