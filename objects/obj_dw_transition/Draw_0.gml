index += 1;

if (rect_draw == 1)
{
    rs += 1;
    
    for (var i = 0; i < rect_amount; i += 1)
    {
        rsize[i] += 0.25;
        
        if (quick_mode == 1)
            rsize[i] += 0.25;
        
        if (rsize[i] > 0)
        {
            r_darkest = 5 - (rsize[i] * 0.8);
            
            if (rs < 20)
                r_darkest *= (rs / 20);
            
            if (r_darkest < 0)
                r_darkest = 0;
            
            if (r_darkest > 1)
                r_darkest = 1;
            
            r_color = merge_color(c_black, c_white, r_darkest);
            draw_sprite_ext(spr_doorblack, 0, rx + camerax(), ry + cameray(), rw * rsize[i], rh * rsize[i], rsize[i], r_color, 1);
        }
    }
}

if (con == 8)
{
    mus_volume(global.currentsong[1], 0, 30);
    
    with (obj_mainchara)
        cutscene = 1;
    
    /*with (obj_kris_headobj)
    {
        follow = 0;
        depth = obj_dw_transition.depth - 10;
    }*/
    
    sus_draw = 1;
    sus_sprite = spr_susie_walk_up_lw;
    sus_index = 0;
    kris_sprite = spr_krisu;
    kris_index = 0;
    sus_v = 1.2;
    
    if (quick_mode == 1)
        sus_v = 2;
    
    timer = 0;
    con = 9;
    doorblack = 0;
}

if (con == 9)
{
    timer += 1;
    
    if (quick_mode == 1 || skiprunback == 1)
    {
        if (timer < 40)
        {
            snd_free_all();
            
            if (skiprunback == 0)
            {
                if (i_ex(obj_darkdoor))
                {
                    if (obj_darkdoor.image_index != 1)
                        snd_play(snd_locker);
                }
                
                doorblack = 1;
            }
            
            sus_v = 6;
            sus_f = 0.4;
            timer = 45;
            kris_x -= 4;
            sus_sprite = spr_susieu_run;
            kris_sprite = spr_krisu_run;
        }
    }
    
    if (timer < 30)
        sus_index += 0.2;
    
    if (timer == 30)
    {
        snd_free_all();
        
        if (i_ex(obj_darkdoor))
        {
            if (obj_darkdoor.image_index != 1)
                snd_play(snd_locker);
        }
        
        with (obj_darkdoor)
            instance_destroy();
        
        doorblack = 1;
        sus_index = 0;
        sus_v = 0;
        kris_x -= 4;
        sus_sprite = spr_susieu_run;
        kris_sprite = spr_krisu_run;
    }
    
    if (timer == 60)
    {
        sus_sprite = spr_susieu_run;
        kris_sprite = spr_krisu_run;
        sus_v = -5;
        sus_f = 0;
    }
    
    if (timer > 60 && timer < 68)
    {
        kris_y -= 1;
        sus_index += 0.25;
    }
    
    if (timer == 68)
    {
        sus_f = 0.15;
        sus_v = -4;
        sus_y -= 2;
        sus_x -= 2;
        sus_sprite = spr_susie_lw_fall_u;
        kris_sprite = spr_krisu_fall_lw;
        con = 15;
        soundtimer = 0;
    }
    
    if (doorblack == 1)
    {
        draw_set_color(c_black);
        ossafe_fill_rectangle(rx1 + camerax(), ry1 + cameray(), rx2 + camerax(), ry2 + cameray(), false);
        
        if (!border_fade)
        {
            border_fade = true;
        }
    }
}

if (con == 15)
{
    rs = 0;
    rh = (ry2 - ry1) / 100;
    rw = (rx2 - rx1) / 100;
    rx = (rx1 + rx2) / 2;
    ry = (ry1 + ry2) / 2;
    
    for (var i = 0; i < 8; i += 1)
        rsize[i] = 1 + (i * -2);
    
    rect_amount = 6;
    rect_draw = 1;
    timer = 0;
    
    if (quick_mode == 1)
        rect_amount = 3;
    
    con = 16;
    soundtimer = 3;
    rectsound = 0;
}

if (con == 16)
{
    soundthreshold = 6;
    
    if (quick_mode == 1)
        soundthreshold = 3;
    
    soundtimer++;
    
    if (soundtimer >= soundthreshold && rectsound < rect_amount)
    {
        soundtimer = 0;
        snd_stop(snd_dtrans_square);
        var snd = snd_play(snd_dtrans_square);
        snd_volume(snd, 0.5, 0);
        rectsound++;
    }
    
    sus_index += 0.25;
    
    if (sus_v >= 0)
    {
        sus_f = 0;
        sus_v += 0.005;
    }
    
    timer += 1;
    threshold = 80;
    
    if (quick_mode == 1)
        threshold = 30;
    
    if (timer >= threshold)
    {
        timer = 0;
        con = 17;
        sus_index = 0;
    }
}

if (con == 17)
{
    //__background_set(e__BG.Visible, 0, 0);
    draw_rect = 0;
    linecon = 1;
    sus_x_current = sus_x;
    kris_x_current = kris_x;
    sus_sprite = spr_susie_lw_fall_turn;
    kris_sprite = spr_kris_fall_turnaround;
    con = 18;
    soundcon = 1;
    radius = 60;
}

if (soundcon == 1)
{
    dronesfx = snd_loop(snd_dtrans_drone);
    snd_volume(dronesfx, 0, 0);
    snd_volume(dronesfx, 0.5, 60);
    snd_pitch(dronesfx, 0.1);
    dronetimer = 0;
    soundcon = 2;
}

if (soundcon == 2)
{
    dronetimer++;
    
    if (quick_mode == 1)
        dronetimer++;
    
    dronepitch = dronetimer / 80;
    
    if (dronepitch >= 1)
    {
        dronepitch = 1;
        soundcon = 3;
    }
    
    snd_pitch(dronesfx, dronepitch);
}

if (con == 18)
{
    timer += 1;
    
    if (quick_mode == 1)
        timer += 1;
    
    sus_index = (timer / 36) * 5;
    sus_x = sus_x_current - (sin(degtorad(timer * 2.5)) * radius);
    
    if (kris_only == 0)
        kris_x = kris_x_current + (sin(degtorad(timer * 2.5)) * radius);
    
    if (timer >= 35)
    {
        sus_sprite = spr_susie_lw_fall_d;
        kris_sprite = spr_kris_fall_d_lw;
        sus_index = 0;
        con = 19;
        timer = 0;
    }
}

if (con == 19)
{
    sus_index += 0.2;
    timer += 1;
    
    if (quick_mode == 1)
        timer = 8;
    
    if (timer >= 8)
    {
        con = 30;
        timer = 0;
        sus_draw = 0;
    }
}

if (con == 30)
{
    if (kris_only == 0)
        draw_sprite_ext(spr_susie_lw_fall_d, index / 4, sus_x, sus_y, 1, 1, 0, c_white, char_alpha);
    
    draw_sprite_ext(spr_kris_fall_d_lw, index / 4, kris_x, kris_y, 1, 1, 0, c_white, char_alpha);
    timer += 1;
    
    if (quick_mode == 1)
        timer += 1;
    
    if (timer >= 15)
    {
        con = 31;
        timer = 0;
        sus_width = sprite_get_width(spr_susie_dw_fall_d);
        sus_height = sprite_get_height(spr_susie_dw_fall_d);
        sus_top = sus_height;
        kris_width = sprite_get_width(spr_kris_fall_d_dw);
        kris_height = sprite_get_height(spr_kris_fall_d_dw);
        kris_top = kris_height;
    }
}

if (con == 31)
{
    timer += 1;
    
    if (kris_only == 0)
        draw_sprite_part(spr_susie_lw_fall_d, index / 4, 0, 0, sus_width, sus_top, sus_x, sus_y);
    
    draw_sprite_part(spr_kris_fall_d_lw, index / 4, 0, 0, kris_width, kris_top, kris_x, kris_y);
    
    if (kris_only == 0)
        draw_sprite_part(spr_susie_dw_fall_d, index / 4, 0, sus_top, sus_width, sus_height - sus_top, sus_x, sus_y + sus_top);
    
    draw_sprite_part(spr_kris_fall_d_dw, index / 4, 0, kris_top, kris_width, kris_height - kris_top, kris_x, kris_y + kris_top);
    
    if (timer == 15)
    {
        //with (obj_kris_headobj)
        //    breakcon = 1;
        
        /*if (room == room_library)
        {
            snd_play(snd_sparkle_glock);
            
            for (var i = 0; i < 1; i++)
            {
                sparkle[i] = scr_marker(kris_x + 15, kris_y + 15, spr_sparestar_anim);
                sparkle[i].image_speed = 0.5;
                sparkle[i].hspeed = random_range(-3, 3);
                sparkle[i].friction = 0.05;
                sparkle[i].gravity = -0.1;
            }
            
            scr_keyitemremove(9);
        }*/
        
        if (global.chapter == 2 && global.plot >= 200 && global.flag[387] == 0)
        {
            snd_play(snd_sparkle_glock);
            var total_recruits = scr_get_total_recruits(2) + 1;
            
            for (var i = 0; i < total_recruits; i++)
            {
                sparkle[i] = scr_marker(kris_x + 15, kris_y + 15, spr_sparestar_anim);
                sparkle[i].image_speed = 0.5;
                sparkle[i].hspeed = random_range(-3, 3);
                sparkle[i].friction = 0.05;
                sparkle[i].gravity = -0.1;
            }
        }
    }
    
    if (timer >= 4)
    {
        if (sus_top > 2)
        {
            sus_top -= 0.5;
            
            if (quick_mode == 1)
                sus_top -= 1.5;
        }
        else
        {
            sus_top = 0;
        }
        
        if (sus_top >= 2 && kris_only == 0)
        {
            sus_particle = instance_create(sus_x + 3 + random(sus_width - 6), sus_y + sus_top, obj_dw_transition_particle);
            draw_sprite_part(spr_susie_white_fall_d, index / 4, 0, sus_top, sus_width, 1, sus_x, sus_y + sus_top);
        }
        
        if (kris_top > 5)
        {
            kris_top -= 0.5;
            
            if (quick_mode == 1)
                kris_top -= 1.5;
        }
        else
        {
            kris_top = 0;
        }
        
        if (kris_top >= 2)
        {
            kris_particle = instance_create(kris_x + 3 + random(kris_width - 6), kris_y + kris_top, obj_dw_transition_particle);
            draw_sprite_part(spr_kris_fall_d_white, index / 4, 0, kris_top, kris_width, 1, kris_x, kris_y + kris_top);
        }
    }
    
    threshold = 130;
    
    if (quick_mode == 1)
        threshold = 40;
    
    if (timer >= threshold)
    {
        if (quick_mode == 1)
            linecon = 0;
        
        sus_y = round(sus_y);
        sus_x = round(sus_x);
        kris_y = round(kris_y);
        kris_x = round(kris_x);
        timer = 0;
        sus_v = -0.2;
        sus_f = 0.01;
        con = 32;
    }
}

if (con == 32)
{
    if (timer == 0)
    {
        megablack = scr_dark_marker(-10, -10, spr_whitepixel);
        
        with (megablack)
        {
            depth = 150;
            image_alpha = 1;
            y = -999;
            image_xscale = 999;
            image_yscale = 999;
            image_blend = c_black;
            persistent = 1;
        }
    }
    
    if (timer == 2)
        megablack.y = 0;
    
    timer += 1;
    
    if (timer >= 0 && timer < 8)
    {
        sus_v -= 0.5;
        
        if (kris_only == 0)
            draw_sprite_ext(spr_susie_dw_fall_smear, 0, sus_x, sus_y, 1, 1, 0, c_white, char_alpha);
        
        draw_sprite_ext(spr_kris_fall_smear, 0, kris_x, kris_y, 1, 1, 0, c_white, char_alpha);
    }
    
    if (timer >= 8 && timer < 12)
    {
        sus_v += 1;
        sus_f = 0;
        
        if (kris_only == 0)
            draw_sprite_ext(spr_susie_dw_fall_smear, 1, sus_x, sus_y, 1, 1, 0, c_white, char_alpha);
        
        draw_sprite_ext(spr_kris_fall_smear, 1, kris_x, kris_y, 1, 1, 0, c_white, char_alpha);
    }
    
    if (timer >= 12 && timer <= 13)
    {
        sus_v += 4;
        
        if (kris_only == 0)
            draw_sprite_ext(spr_susie_dw_fall_smear, 2, sus_x, sus_y, 1, 1, 0, c_white, char_alpha);
        
        draw_sprite_ext(spr_kris_fall_smear, 2, kris_x, kris_y, 1, 1, 0, c_white, char_alpha);
    }
    
    if (timer >= 14)
    {
        soundcon = 4;
        snd_volume(dronesfx, 0, 30);
        sus_v = 13;
        sus_f = 0;
        timer = 0;
        con = 33;
        rect_draw = 0;
    }
}

if (con == 33)
{
    timer += 1;
    
    if (quick_mode == 1 && timer < 31)
        timer = 31;
    
    if (kris_only == 0)
    {
        draw_sprite_ext(spr_susie_dw_fall_ball, timer / 2, sus_x, sus_y - (sus_v * 2), 1, 1, 0, c_white, 0.25);
        draw_sprite_ext(spr_susie_dw_fall_ball, timer / 2, sus_x, sus_y - sus_v, 1, 1, 0, c_white, 0.5);
        draw_sprite_ext(spr_susie_dw_fall_ball, timer / 2, sus_x, sus_y, 1, 1, 0, c_white, 1);
    }
    
    draw_sprite_ext(spr_kris_fall_ball, timer / 2, kris_x, kris_y - (sus_v * 2), 1, 1, 0, c_white, 0.25);
    draw_sprite_ext(spr_kris_fall_ball, timer / 2, kris_x, kris_y - sus_v, 1, 1, 0, c_white, 0.5);
    draw_sprite_ext(spr_kris_fall_ball, timer / 2, kris_x, kris_y, 1, 1, 0, c_white, 1);
    
    if (timer == 14)
        linecon = 0;
    
    if (timer == 30)
    {
        sus_y = -20;
        kris_y = -14;
    }
    
    if (timer > 30)
    {
        if (skiprunback == 1)
        {
            var _offset = 13;
            
            //if (room == room_schooldoor)
            //    _offset = 0;
            
            if (timer == (36 + _offset))
                snd_play(snd_dtrans_flip);
        }
        else
        {
            var _offset = 10;
            
            //if (room == room_schooldoor)
            //    _offset = 0;
            
            if (timer == (39 + _offset))
                snd_play(snd_dtrans_flip);
        }
        
        if (sus_y >= (finaly - 8))
        {
            con = 34;
            timer = 0;
            sus_v = 0;
            kris_y = finaly + 6;
            sus_y = finaly;
            getup_index = 0;
            fake_screenshake = 1;
            fake_shakeamount = 8;
            remkrisx = kris_x - camerax();
            remkrisy = kris_y - cameray();
            remsusx = sus_x - camerax();
            remsusy = sus_y - cameray();
        }
    }
}

if (con == 34)
{
    snd_stop(dronesfx);
    timer += 1;
    
    if (quick_mode == 1 && timer < 15)
        timer = 15;
    
    if (timer > 1)
    {
        if (kris_only == 0)
            draw_sprite_ext(spr_susie_dw_landed, getup_index, (sus_x * dz) + fake_shakeamount, sus_y * dz, 1 * dz, 1 * dz, 0, c_white, 1);
        
        draw_sprite_ext(spr_kris_dw_landed, getup_index, (kris_x * dz) + fake_shakeamount, kris_y * dz, 1 * dz, 1 * dz, 0, c_white, 1);
    }
    
    if (timer == 26)
    {
        /*if (room != room_town_church)
        {
            with (obj_border_controller)
                show_border();
        }*/
        
        kris_x = remkrisx;
        kris_y = remkrisy;
        sus_x = remsusx;
        sus_y = remsusy;
        
        if (global.flag[302] == 1)
            global.flag[302] = 2;
        
        scr_become_dark();
        dz = global.darkzone + 1;
        room_goto(nextroom);
    }
    
    if (timer == 27)
    {
        snd_play(snd_him_quick);
        
        with (obj_mainchara)
        {
            x = -999;
            cutscene = 1;
            visible = 0;
        }
        
        with (obj_caterpillarchara)
        {
            x = -999;
            visible = 0;
        }
        
        if (global.chapter == 2)
        {
            if (global.plot == 9)
            {
                obj_mainchara.y = kris_y;
                kris_y += 200;
                cameray_set(cameray() + 400);
            }
        }
    }
    
    if (timer >= 30 && timer < 60)
    {
        with (megablack)
            image_alpha -= 0.05;
        
        if (quick_mode == 1)
        {
            with (megablack)
                image_alpha -= 0.05;
        }
    }
    
    if (timer == 50)
        getup_index = 1;
    
    if (timer == 53)
        getup_index = 2;
    
    if (timer == 55)
    {
        with (megablack)
            instance_destroy();
        
        persistent = 0;
        global.interact = 0;
        global.facing = 0;
        obj_mainchara.x = (kris_x * 2) + 8;
        obj_mainchara.y = (kris_y * 2) + 4;
        
        with (obj_mainchara)
            visible = 1;
        
        if (i_ex(global.cinstance[1]))
        {
            with (global.cinstance[1])
                instance_destroy();
        }
        
        if (kris_only == 0 && i_ex(global.cinstance[0]))
        {
            global.cinstance[0].x = (sus_x * 2) + 10;
            global.cinstance[0].y = sus_y * 2;
            
            with (obj_caterpillarchara)
            {
                visible = 1;
                scr_caterpillar_interpolate();
                facing[target] = 0;
                sprite_index = dsprite;
            }
        }
        
        instance_destroy();
    }
}

if (sus_draw == 1)
{
    /*if (instance_exists(obj_kris_headobj))
    {
        obj_kris_headobj.x = kris_x + 14;
        obj_kris_headobj.y = kris_y - 2;
    }*/
    
    if (global.darkzone == 0)
    {
        draw_sprite_ext(kris_sprite, sus_index, kris_x + fake_shakeamount, kris_y, 1, 1, 0, c_white, char_alpha);
        
        if (kris_only == 0)
            draw_sprite_ext(sus_sprite, sus_index, sus_x + fake_shakeamount, sus_y, 1, 1, 0, c_white, char_alpha);
    }
    else
    {
        draw_sprite_ext(kris_sprite, sus_index, (kris_x * 2) + fake_shakeamount, kris_y * 2, 2, 2, 0, c_white, char_alpha);
        
        if (kris_only == 0)
            draw_sprite_ext(sus_sprite, sus_index, (sus_x * 2) + fake_shakeamount, sus_y * 2, 2, 2, 0, c_white, char_alpha);
    }
}