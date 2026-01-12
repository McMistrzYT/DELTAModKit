wallcheck = 0;
nowx = x;
nowy = y;

if (press_d == 0 && press_l == 0 && press_u == 0 && press_r == 0)
    nopress = 1;

press_l = 0;
press_r = 0;
press_d = 0;
press_u = 0;
bkx = 0;
bky = 0;
bkxy = 0;
jelly = 2;

if (!roomenterfreezeend)
{
    if (global.interact == 3)
    {
        if (global.flag[21] > 0)
        {
            global.flag[21]--;
        }
        else
        {
            roomenterfreezeend = 1;
            global.interact = 0;
            global.flag[21] = -10;
        }
    }
}

if (global.interact == 0)
{
    if (button3_p() && threebuffer < 0)
    {
        if (global.flag[7] == 0 && battlemode == 0 && swordmode == 0)
        {
            with (obj_darkcontroller)
                threebuffer = 2;
            
           with (obj_overworldc)
            {
                movenoise = 1;
                threebuffer = 2;
            }
            
            global.menuno = 0;
            global.interact = 5;
            threebuffer = 2;
            twobuffer = 2;
        }
    }
}

if (swordcon == 1)
{
    swordtimer++;
    
    if (swordtimer >= 15)
    {
        with (slashmarker)
            instance_destroy();
        
        swordcon = 0;
        swordsprite = rsprite;
        fun = 0;
        
        if (global.interact == 4)
            global.interact = 0;
        
        swordtimer = 0;
        image_speed = 0;
        image_index = 0;
        image_alpha = 1;
    }
}

if (global.interact == 0 && freeze == 0)
{
    if (global.flag[11] == 1)
    {
        if (button2_h() && twobuffer < 0)
            run = 0;
        else
            run = 1;
    }
    else if (button2_h() && twobuffer < 0)
    {
        run = 1;
    }
    else
    {
        run = 0;
    }
    
    if (autorun > 0)
    {
        if (autorun == 1)
        {
            run = 1;
            runtimer = 200;
        }
        
        if (autorun == 2)
        {
            run = 1;
            runtimer = 50;
        }
    }
    
    if (!canrun)
        run = 0;
    
    if (run == 1)
    {
        if (darkmode == 0)
        {
            wspeed = bwspeed + 1;
            
            if (runtimer > 10)
                wspeed = bwspeed + 2;
            
            if (runtimer > 60)
                wspeed = bwspeed + 3;
        }
        
        if (darkmode == 1)
        {
            wspeed = bwspeed + 2;
            
            if (runtimer > 10)
                wspeed = bwspeed + 4;
            
            if (runtimer > 60)
                wspeed = bwspeed + 5;
        }
    }
    
    if (run == 0)
        wspeed = bwspeed;
    
    if (climbing == 1)
        wspeed = ceil(wspeed * 0.7);
    
    if (left_h())
        press_l = 1;
    
    if (right_h())
        press_r = 1;
    
    if (up_h())
        press_u = 1;
    
    if (down_h())
        press_d = 1;
    
    px = 0;
    py = 0;
    pressdir = -1;
    
    if (press_r == 1)
    {
        px = wspeed;
        pressdir = 1;
    }
    
    if (press_l == 1)
    {
        px = -wspeed;
        pressdir = 3;
    }
    
    if (press_d == 1)
    {
        py = wspeed;
        pressdir = 0;
    }
    
    if (press_u == 1)
    {
        py = -wspeed;
        pressdir = 2;
    }
    
    if (nopress == 1 && pressdir != -1)
        global.facing = pressdir;
    
    if (global.facing == 2)
    {
        if (press_d == 1)
            global.facing = 0;
        
        if (press_u == 0 && pressdir != -1)
            global.facing = pressdir;
    }
    
    if (global.facing == 0)
    {
        if (press_u == 1)
            global.facing = 2;
        
        if (press_d == 0 && pressdir != -1)
            global.facing = pressdir;
    }
    
    if (global.facing == 3)
    {
        if (press_r == 1)
            global.facing = 1;
        
        if (press_l == 0 && pressdir != -1)
            global.facing = pressdir;
    }
    
    if (global.facing == 1)
    {
        if (press_l == 1)
            global.facing = 3;
        
        if (press_r == 0 && pressdir != -1)
            global.facing = pressdir;
    }
    
    if (press_r == 1)
        swordfacing = 1;
    
    if (press_l == 1)
        swordfacing = -1;
    
    if (swordmode == 1)
    {
        if (button1_p() && swordcon == 0 && global.interact == 0)
        {
            global.interact = 4;
            swordsprite = rsprite;
            slashmarker = scr_dark_marker(x, y, rsprite);
            slashmarker.depth = depth;
            slashmarker.image_speed = 1;
            
            if (swordfacing == -1)
            {
                slashmarker.x += sprite_width;
                slashmarker.image_xscale = -image_xscale;
            }
            
            image_alpha = 0;
            fun = 1;
            //snd_play(snd_laz_c);
            image_index = 0;
            image_speed = 0.5;
            swordtimer = 0;
            swordcon = 1;
            press_l = 0;
            press_r = 0;
            press_u = 0;
            press_d = 0;
            //swordhitbox = instance_create(slashmarker.x, slashmarker.y, obj_swordhitbox);
            //swordhitbox.image_xscale = slashmarker.image_xscale;
            //swordhitbox.image_yscale = image_yscale;
        }
    }
    
    nopress = 0;
    xmeet = 0;
    ymeet = 0;
    xymeet = 0;
    
    if (floorheight == 0)
    {
        var checkcol = true;
        
        if (scr_debug() && noclip)
            checkcol = false;
        
        if (checkcol)
        {
			scr_defaultprimarycollisioncode(obj_solidblock)
        }
    } else {
        var _hedge = bbox_right;
        var _vedge = bbox_bottom;
        var _goingright = 0;
        var _goingdown = 0;
        var _checkobj = asset_get_index("obj_heightfloor");
        
        if (px > 0) {
            _goingright = 1;
            _hedge = bbox_right;
        }
        
        if (px < 0) {
            _goingright = -1;
            _hedge = bbox_left;
        }
        
        if (py > 0) {
            _goingdown = 1;
            _vedge = bbox_bottom;
        }
        
        if (py < 0) {
            _goingdown = -1;
            _vedge = bbox_top;
        }
        
        if (!check_heightfloor(px, 0, _checkobj)) {
            for (g = wspeed; g > 0; g -= 1) {
                mvd = false;
                
                if (press_d == false) {
					if (check_heightfloor(px, -g, _checkobj)) {
                        y -= g;
                        py = 0;
                        _vedge = bbox_top;
                        mvd = true;
                        break;
                    }
				}
                
                if (press_u == false) {
                    if (check_heightfloor(px, g, _checkobj)) {
                        y += g;
                        py = 0;
                        _vedge = bbox_bottom;
                        break;
                    }
                }
            }
            
            xmeet = true;
            bkx = false;
            
            if (px > 0) {
                for (var i = px; i >= 0; i -= 1) {
                    if (check_heightfloor(i, 0, _checkobj))
                    {
                        px = i;
                        bkx = true;
                        break;
                    }
                }
            }
            
            if (px < 0) {
                for (var i = px; i <= 0; i += 1) {
                    if (check_heightfloor(i, 0, _checkobj))
                    {
                        px = i;
                        bkx = true;
                        break;
                    }
                }
            }
            
            if (bkx == false) px = 0;
        }
        
        if (!check_heightfloor(0, py, _checkobj)) {
            ymeet = true;
            bky = false;
            
            for (g = wspeed; g > 0; g -= 1) {
                mvd = false;
                
                if (press_r == false && check_heightfloor(-g, py, _checkobj)) {
                    x -= g;
                    px = 0;
                    _hedge = bbox_left;
                    mvd = true;
                    break;
                }
                
                if (mvd == false && press_l == false && check_heightfloor(g, py, _checkobj)) {
                    x += g;
                    px = 0;
                    _hedge = bbox_right;
                    break;
                }
            }
            
            if (py > 0) {
                for (var i = py; i >= 0; i -= 1) {
                    if (check_heightfloor(0, i, _checkobj)) {
                        py = i;
                        bky = true;
                        break;
                    }
                }
            }
            
            if (py < 0) {
                for (var i = py; i <= 0; i += 1) {
                    if (check_heightfloor(0, i, _checkobj)) {
                        py = i;
                        bky = true;
                        break;
                    }
                }
            }
            
            if (bky == false) py = 0;
        }
        
        if (!check_heightfloor(px, 0, _checkobj)) {
            xymeet = true;
            bkxy = false;
            var i = px;
            j = py;
            
            while (j != 0 || i != 0) {
                if (check_heightfloor(i, j, _checkobj)) {
                    px = i;
                    py = j;
                    bkxy = true;
                    break;
                }
                
                if (abs(j) >= 1) {
                    if (j > 0) j -= 1;
                    if (j < 0) j += 1;
                }       else   j = 0;
                
                if (abs(i) >= 1) {
                    if (i > 0) i -= 1;
                    if (i < 0) i += 1;
                }       else   i = 0;
            }
            
            if (bkxy == false) {
                px = 0;
                py = 0;
            }
        }
    }
    
    runmove = false;
    
    if (run == 1 && xmeet == 0 && ymeet == 0 && xymeet == 0) {
        if (abs(px) > 0 || abs(py) > 0)
        {
            runmove = 1;
            runtimer += 1;
            runcounter += 1;
        }
        else
        {
            runtimer = 0;
        }
    }
    else
    {
        runtimer = 0;
    }
    
    x += px;
    y += py;
}

if (fun == false) {
	scr_overworldcharwalking_shared(global.facing)
    if (climbing == true) sprite_index = climbsprite;
}

if (stepping == 1 && fun == 0)
{
    if (image_index == 1 && stepped == 0)
    {
        //if (global.flag[31] == 0)
        //    snd_play(snd_step1);
        
        stepped = 1;
    }
    
    if (image_index == 0 || image_index == 2)
        stepped = 0;
    
    if (image_index == 3 && stepped == 0)
    {
        //if (global.flag[31] == 0)
        //    snd_play(snd_step2);
        
        stepped = 1;
    }
}

if (onebuffer < 0)
{
    if (global.interact == 0)
    {
        if (button1_p())
        {
            thisinteract = 0;
            d = global.darkzone + 1;
            
            if (global.facing == 1)
            {
                if (collision_rectangle(x + (sprite_width / 2), y + (6 * d) + (sprite_height / 2), x + sprite_width + (13 * d), y + sprite_height, obj_interactable, false, true))
                    thisinteract = 1;
                
                if (collision_rectangle(x + (sprite_width / 2), y + (6 * d) + (sprite_height / 2), x + sprite_width + (13 * d), y + sprite_height, obj_interactablesolid, false, true))
                    thisinteract = 2;
            }
            
            if (thisinteract > 0)
            {
                if (thisinteract == 1)
                    interactedobject = collision_rectangle(x + (sprite_width / 2), y + (6 * d) + (sprite_height / 2), x + sprite_width + (13 * d), y + sprite_height, obj_interactable, false, true);
                
                if (thisinteract == 2)
                    interactedobject = collision_rectangle(x + (sprite_width / 2), y + (6 * d) + (sprite_height / 2), x + sprite_width + (13 * d), y + sprite_height, obj_interactablesolid, false, true);
                
                if (interactedobject != -4)
                {
                    with (interactedobject)
                        facing = 3;
                    
                    with (interactedobject)
                        scr_interact();
                }
            }
            
            thisinteract = 0;
            
            if (global.facing == 3)
            {
                if (collision_rectangle(x + (sprite_width / 2), y + (6 * d) + (sprite_height / 2), x - (13 * d), y + sprite_height, obj_interactable, false, true))
                    thisinteract = 1;
                
                if (collision_rectangle(x + (sprite_width / 2), y + (6 * d) + (sprite_height / 2), x - (13 * d), y + sprite_height, obj_interactablesolid, false, true))
                    thisinteract = 2;
            }
            
            if (thisinteract > 0)
            {
                if (thisinteract == 1)
                    interactedobject = collision_rectangle(x + (sprite_width / 2), y + (6 * d) + (sprite_height / 2), x - (13 * d), y + sprite_height, obj_interactable, false, true);
                
                if (thisinteract == 2)
                    interactedobject = collision_rectangle(x + (sprite_width / 2), y + (6 * d) + (sprite_height / 2), x - (13 * d), y + sprite_height, obj_interactablesolid, false, true);
                
                if (interactedobject != -4)
                {
                    with (interactedobject)
                        facing = 1;
                    
                    with (interactedobject)
                        scr_interact();
                }
            }
            
            thisinteract = 0;
            
            if (global.facing == 0)
            {
                if (collision_rectangle(x + (4 * d), y + (28 * d), (x + sprite_width) - (4 * d), y + sprite_height + (15 * d), obj_interactable, false, true))
                    thisinteract = 1;
                
                if (collision_rectangle(x + (4 * d), y + (28 * d), (x + sprite_width) - (4 * d), y + sprite_height + (15 * d), obj_interactablesolid, false, true))
                    thisinteract = 2;
            }
            
            if (thisinteract > 0)
            {
                if (thisinteract == 1)
                    interactedobject = collision_rectangle(x + (4 * d), y + (28 * d), (x + sprite_width) - (4 * d), y + sprite_height + (15 * d), obj_interactable, false, true);
                
                if (thisinteract == 2)
                    interactedobject = collision_rectangle(x + (4 * d), y + (28 * d), (x + sprite_width) - (4 * d), y + sprite_height + (15 * d), obj_interactablesolid, false, true);
                
                if (interactedobject != -4)
                {
                    with (interactedobject)
                        facing = 2;
                    
                    with (interactedobject)
                        scr_interact();
                }
            }
            
            thisinteract = 0;
            
            if (global.facing == 2)
            {
                if (collision_rectangle(x + 3, (y + sprite_height) - (5 * d), (x + sprite_width) - (5 * d), y + (5 * d), obj_interactable, false, true))
                    thisinteract = 1;
                
                if (collision_rectangle(x + 3, (y + sprite_height) - (5 * d), (x + sprite_width) - (5 * d), y + (5 * d), obj_interactablesolid, false, true))
                    thisinteract = 2;
            }
            
            if (thisinteract > 0)
            {
                if (thisinteract == 1)
                    interactedobject = collision_rectangle(x + (3 * d), (y + sprite_height) - (5 * d), (x + sprite_width) - (5 * d), y + (5 * d), obj_interactable, false, true);
                
                if (thisinteract == 2)
                    interactedobject = collision_rectangle(x + (3 * d), (y + sprite_height) - (5 * d), (x + sprite_width) - (5 * d), y + (5 * d), obj_interactablesolid, false, true);
                
                if (interactedobject != -4)
                {
                    with (interactedobject)
                        facing = 0;
                    
                    with (interactedobject)
                        scr_interact();
                }
            }
        }
    }
}

onebuffer -= 1;
twobuffer -= 1;
threebuffer -= 1;
climbbuffer--;

if (climbbuffer <= 0)
    climbing = 0;

with (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_doorparent, 0, 0))
    event_user(9);

if (battlemode == 1)
{
    global.inv -= 1;
    
    if (global.inv < 0)
    {
		if object_exists(asset_get_index("obj_overworldbulletparent"))
		{
	        with (collision_rectangle(x + 12, y + 40, x + 27, y + 49, obj_overworldbulletparent, 1, 0))
	            event_user(5);
        
	        with (collision_line(x + 12, y + 49, x + 19, y + 57, obj_overworldbulletparent, 1, 0))
	            event_user(5);
        
	        with (collision_line(x + 26, y + 49, x + 19, y + 57, obj_overworldbulletparent, 1, 0))
	            event_user(5);
		}
    }
}

if (scr_debug())
{
    if (sunkus_kb_check_pressed(45))
    {
        if (room_exists(room_next(room)))
            room_goto_next();
    }
    
    if (sunkus_kb_check_pressed(46))
    {
        if (room_exists(room_previous(room)))
            room_goto_previous();
    }
    
    if (sunkus_kb_check_pressed(36) && floorheight == 0)
    {
        if (sunkus_kb_check(50))
        {
			var krroom = asset_get_index("room_krisroom")
			if room_exists(krroom)
			{
	            room_goto(krroom);
	            global.plot = 0;
	            global.darkzone = 0;
			}
        }
        
        if (sunkus_kb_check(51))
        {
			var ctroom = asset_get_index("room_dw_castle_area_1")
			if room_exists(ctroom)
			{
	            room_goto(ctroom);
	            global.plot = 7;
	            global.darkzone = 1;
			}
        }
        
        if (sunkus_kb_check(55))
		{
			var neolegend = asset_get_index("room_legend_neo")
			if room_exists(neolegend)
				room_goto(neolegend);
		}
        
        if (sunkus_kb_check(56))
        {
			var battest = asset_get_index("room_battletest")
			if room_exists(battest)
			{
				room_goto(battest);
				global.darkzone = 1;
			}
        }
        
        if (sunkus_kb_check(57))
        {
			var bultest = asset_get_index("room_bullettest")
			if room_exists(bultest)
			{
	            room_goto(bultest);
	            global.darkzone = 1;
			}
        }
    }
}

if !ignoredepth
	scr_depth();
