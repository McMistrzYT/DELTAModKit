if (active == 1)
{
    if (drawkris == 1)
        draw_self();
    
    if (ballcon == 1)
    {
        xballtimer += (xballtimer + 1);
        yballtimer++;
        balltimer++;
        cenx = x + 18;
        ceny = y + 57;
        draw_set_color(c_white);
        draw_ellipse(cenx - xballtimer, ceny - 1, cenx + xballtimer, ceny + 1, false);
        
        if (xballtimer >= 80)
        {
            balltimer = 0;
            yballtimer = 1;
            ballcon = 2;
            whitecolor = 16777215;
        }
    }
    
    if (ballcon == 2)
    {
        balltimer++;
        
        if (balltimer > 90)
            inverttimer++;
        
        if (inverttimer >= 90)
            releasetimer++;
        
        if (inverttimer >= 0 && inverttimer < 60)
            whitecolor = merge_color(c_white, c_black, inverttimer / 60);
        
        xballtimer *= 0.5;
        
        if (releasetimer <= 0)
        {
            if (xballtimer <= 20)
                xballtimer = 20;
            
            if (xballtimer < (yballtimer / 6))
                xballtimer = yballtimer / 6;
            
            if (yballtimer >= 98)
                yballtimer = 99 + random(5);
            
            yballtimer *= 3;
        }
        else
        {
            yballtimer *= 3;
            instance_create(cenx, ceny, obj_fountainball);
            
            if (releasetimer == 1)
                con = 64;
            
            if (releasetimer >= 10)
            {
                ballcon = 3;
                fountain_sound = audio_play_sound(snd_deep_noise, 50, 1);
            }
        }
        
        draw_set_color(c_white);
        draw_ellipse(cenx - xballtimer - 2, ceny - yballtimer, cenx + xballtimer + 2, ceny + 1, false);
        draw_set_color(whitecolor);
        draw_ellipse(cenx - xballtimer, ceny - yballtimer, cenx + xballtimer, ceny + 1, false);
        
        if (releasetimer <= 0)
        {
            if (balltimer >= 6)
                draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.3 - (1 / ((balltimer / 2) + 1)));
            
            if (inverttimer >= 1)
                draw_sprite_ext(spr_kris_make_fountain_invert, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1 - (30 / inverttimer));
        }
        
        if (releasetimer <= 0)
        {
            if ((balltimer % 5) == 0)
            {
                afterimage = instance_create(cenx - 4, ceny + 4, obj_afterimage);
                afterimage.sprite_index = spr_kris_make_fountain_flash;
                afterimage.image_speed = 0;
                afterimage.image_xscale = 4;
                afterimage.image_yxscale = 0.5;
                afterimage.image_alpha = 0.8;
            }
        }
        
        with (obj_afterimage)
        {
            image_xscale *= (1.15 + random(0.02));
            image_yscale *= (1.05 + random(0.02));
            y += 0.4;
            x -= 0.4;
        }
    }
    
    if (ballcon == 3)
    {
        instance_create(cenx, ceny, obj_fountainball);
        ceiltimer++;
        
        if (ceilheight < 120)
            ceilheight += (sin(ceiltimer / 18) + 0.3);
        
        if (ceilheight >= 120)
            ceilheight += 0.5;
        
        for (i = 0; i < 12; i++)
        {
            ceilballx[i] = ((ceiltimer + (i * 40)) % 400) + -40 + camerax();
            draw_sprite_ext(spr_kris_fountain_ball, 0, ceilballx[i], (ceilheight - 80) + (sin(i + (ceiltimer / 8)) * 7), 1.05, 1.05, 0, c_white, 1);
        }
        
        for (i = 0; i < 12; i++)
            draw_sprite_ext(spr_kris_fountain_ball, 0, ceilballx[i], (ceilheight - 80) + (sin(i + (ceiltimer / 8)) * 7), 1, 1, 0, c_black, 1);
        
        draw_set_color(c_black);
        draw_rectangle(-10, ceilheight - 80, 999, -90, false);
    }
}
