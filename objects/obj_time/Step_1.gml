scr_input_manager_process();

if (!paused) global.time += 1;
else return;

/*if (scr_debug())
{
    if (sunkus_kb_check_pressed(117) && quicksaved == 22)
    {
        quicksaved = 1;
        remmyfight = global.myfight;
        remmnfight = global.mnfight;
        reminteract = global.interact;
        remturntimer = global.turntimer;
        remcamerax = camerax();
        remcameray = cameray();
        
        for (var i = 0; i < instance_count; i++)
        {
            instance_list[i] = instance_id_get(i);
            xstart_list[i] = instance_list[i].xstart;
            ystart_list[i] = instance_list[i].ystart;
            object_list[i] = instance_list[i].object_index;
            
            with (instance_list[i])
                __quickSaved = 1;
            
            __masterArray = variable_instance_get_names(instance_list[i]);
            __arrayLength[i] = array_length_1d(__masterArray);
            
            for (var __n = 0; __n < __arrayLength[i]; __n++)
            {
                __remArray[i][__n] = __masterArray[__n];
                ___saveSpriteIndex[i] = instance_list[i].sprite_index;
                ___saveImageIndex[i] = instance_list[i].image_index;
                ___saveXscale[i] = instance_list[i].image_xscale;
                ___saveYscale[i] = instance_list[i].image_yscale;
                ___saveAlpha[i] = instance_list[i].image_alpha;
                ___saveBlend[i] = instance_list[i].image_blend;
                ___saveAngle[i] = instance_list[i].image_angle;
                ___saveX[i] = instance_list[i].x;
                ___saveY[i] = instance_list[i].y;
                ___saveSpeed[i] = instance_list[i].speed;
                ___saveDirection[i] = instance_list[i].direction;
                ___saveDepth[i] = instance_list[i].depth;
                ___saveVisible[i] = instance_list[i].visible;
                ___saveGravity[i] = instance_list[i].gravity;
                ___saveGravityDirection[i] = instance_list[i].gravity_direction;
                ___saveFriction[i] = instance_list[i].friction;
                
                if (__masterArray[__n] == "__myVar")
                    __myVar[i][__n] = 0;
                else
                    __myVar[i][__n] = variable_instance_get(instance_list[i], __masterArray[__n]);
            }
        }
        
        reminstancecount = instance_count;
    }
    
    if (quicksaved == 2)
        quicksaved = 1;
    
    if (sunkus_kb_check_pressed(118) && quicksaved == 99)
    {
        global.myfight = remmyfight;
        global.mnfight = remmnfight;
        global.interact = reminteract;
        global.turntimer = remturntimer;
        camerax_set(remcamerax);
        cameray_set(remcameray);
        
        with (all)
        {
            if (object_index != obj_time && object_index != obj_gamecontroller)
                instance_change(obj_doom, false);
        }
        
        with (obj_doom)
            instance_destroy();
        
        for (var i = 0; i < reminstancecount; i++)
        {
            if (!i_ex(instance_list[i]))
            {
                instance_list[i] = instance_create(xstart_list[i], ystart_list[i], obj_marker);
                instance_list[i].__changeobject = object_list[i];
                
                with (instance_list[i])
                    instance_change(__changeobject, false);
            }
        }
        
        for (var i = 0; i < reminstancecount; i++)
        {
            for (var __n = 0; __n < __arrayLength[i]; __n++)
            {
                instance_list[i].sprite_index = ___saveSpriteIndex[i];
                instance_list[i].image_index = ___saveImageIndex[i];
                instance_list[i].image_xscale = ___saveXscale[i];
                instance_list[i].image_yscale = ___saveYscale[i];
                instance_list[i].image_alpha = ___saveAlpha[i];
                instance_list[i].image_blend = ___saveBlend[i];
                instance_list[i].image_angle = ___saveAngle[i];
                instance_list[i].x = ___saveX[i];
                instance_list[i].y = ___saveY[i];
                instance_list[i].speed = ___saveSpeed[i];
                instance_list[i].direction = ___saveDirection[i];
                instance_list[i].depth = ___saveDepth[i];
                instance_list[i].visible = ___saveVisible[i];
                instance_list[i].gravity = ___saveGravity[i];
                instance_list[i].gravity_direction = ___saveGravityDirection[i];
                instance_list[i].friction = ___saveFriction[i];
                
                if (__remArray[i][__n] != "__myVar" && __remArray[i][__n] != "__masterArray")
                    variable_instance_set(id, __remArray[i][__n], __myVar[i][__n]);
            }
        }
        
        quicksaved = 2;
    }
}*/

if (sunkus_kb_check(27))
{
    if (quit_timer < 0)
        quit_timer = 0;
    
    quit_timer += 1;
    
    if (quit_timer >= 30)
        ossafe_game_end();
}
else
{
    quit_timer -= 2;
}

if (sunkus_kb_check_pressed(115) || fullscreen_toggle == 1)
    alarm[1] = 1;

for (var i = 0; i < 10; i += 1)
{
    global.input_released[i] = 0;
    global.input_pressed[i] = 0;
}

/*gamepad_check_timer += 1;

if (gamepad_check_timer >= 90)
{
    if (!gamepad_is_connected(obj_gamecontroller.gamepad_id))
    {
        var gp_num = gamepad_get_device_count();
        var any_connected = false;
        
        for (var i = 0; i < gp_num; i++)
        {
            if (gamepad_is_connected(i))
            {
                obj_gamecontroller.gamepad_active = 1;
                obj_gamecontroller.gamepad_id = i;
                any_connected = true;
                break;
            }
        }
        
        if (any_connected == false)
            obj_gamecontroller.gamepad_active = 0;
    }
    
    gamepad_check_timer = 0;
}

if (obj_gamecontroller.gamepad_active == 1 && quicksaved != 2)
{
    for (var i = 0; i < 4; i += 1)
    {
        if (sunkus_kb_check(global.input_k[i]) || (i_ex(obj_gamecontroller) && (gamepad_button_check(obj_gamecontroller.gamepad_id, global.input_g[i]) || scr_gamepad_axis_check(obj_gamecontroller.gamepad_id, i))))
        {
            if (global.input_held[i] == 0)
                global.input_pressed[i] = 1;
            
            global.input_held[i] = 1;
        }
        else
        {
            if (global.input_held[i] == 1)
                global.input_released[i] = 1;
            
            global.input_held[i] = 0;
        }
    }
    
    for (var i = 4; i < 10; i += 1)
    {
        if (sunkus_kb_check(global.input_k[i]) || (i_ex(obj_gamecontroller) && gamepad_button_check(obj_gamecontroller.gamepad_id, global.input_g[i])))
        {
            if (global.input_held[i] == 0)
                global.input_pressed[i] = 1;
            
            global.input_held[i] = 1;
        }
        else
        {
            if (global.input_held[i] == 1)
                global.input_released[i] = 1;
            
            global.input_held[i] = 0;
        }
    }
}
else*/
{
    for (var i = 0; i < 10; i += 1)
    {
        if (sunkus_kb_check(global.input_k[i]))
        {
            if (global.input_held[i] == 0)
                global.input_pressed[i] = 1;
            
            global.input_held[i] = 1;
        }
        else
        {
            if (global.input_held[i] == 1)
                global.input_released[i] = 1;
            
            global.input_held[i] = 0;
        }
    }
}

/*if (scr_debug())
{
    if (mouse_check_button_pressed(mb_middle))
        instance_create(0, 0, obj_debug_xy);
    
    if (sunkus_kb_check_pressed(192))
    {
        if (room_speed == 30)
            room_speed = 150 - (140 * sunkus_kb_check(17));
        else
            room_speed = 30;
    }
}*/
