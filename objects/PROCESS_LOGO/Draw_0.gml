if (PHASE == 0)
{
    siner += 1;
    factor -= (0.003 + (siner / 900));
    
    if (factor < 0)
    {
        factor = 0;
        PHASE = 1;
    }
    
    for (i = 0; i < h; i += 1)
    {
        ia = (siner / 25) - (abs(i - mid) * 0.05);
        xoff = 40 * sin((siner / 5) + (i / 3)) * factor;
        xoff2 = 40 * sin((siner / 5) + (i / 3) + 0.6) * factor;
        xoff3 = 40 * sin((siner / 5) + (i / 3) + 1.2) * factor;
        draw_sprite_part_ext(sprite_index, image_index, 0, i, w, 2, x + xoff, y + i, 1, 1, c_white, (1 - factor) / 2);
        draw_sprite_part_ext(sprite_index, image_index, 0, i, w, 2, x + xoff2, y + i, 1, 1, c_white, (1 - factor) / 2);
        draw_sprite_part_ext(sprite_index, image_index, 0, i, w, 2, x + xoff3, y + i, 1, 1, c_white, (1 - factor) / 2);
        draw_sprite_part_ext(chsprite, chnum, 0, i, w, 2, 95 + xoff, (y + i + chyoffset) - 9, 1, 1, c_white, (1 - factor) / 2);
        draw_sprite_part_ext(chsprite, chnum, 0, i, w, 2, 95 + xoff2, (y + i + chyoffset) - 9, 1, 1, c_white, (1 - factor) / 2);
        draw_sprite_part_ext(chsprite, chnum, 0, i, w, 2, 95 + xoff3, (y + i + chyoffset) - 9, 1, 1, c_white, (1 - factor) / 2);
    }
}

if (PHASE == 1)
{
    draw_self();
    draw_sprite(chsprite, chnum, 160, y + chyoffset);
    PHASETIMER += 1;
    
    if (PHASETIMER >= 30)
    {
        siner = 0;
        factor = 0;
        PHASE = 2;
        scr_windowcaption("DELTARUNE");
        global.tempflag[10] = 1;
    }
}

if (PHASE == 2)
{
    if (PHASEPLUS == 0)
        siner += 0.5;
    
    if (siner >= 20)
        PHASEPLUS = 1;
    
    if (PHASEPLUS == 1)
    {
        siner += 0.5;
        AA -= 0.02;
        AB -= 0.08;
    }
    
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, AB);
    draw_sprite_ext(chsprite, chnum, 160, y + chyoffset, image_xscale, image_yscale, 0, c_white, AB);
    mina = siner / 30;
    
    if (mina >= 0.14)
        mina = 0.14;
    
    factor2 += 0.05;
    
    for (i = 0; i < 10; i += 1)
    {
        draw_sprite_ext(IMAGE_LOGO_CENTER, image_index, (x + (w / 2)) - (sin((siner / 8) + (i / 2)) * (i * factor2)), (y + (h / 2)) - (cos((siner / 8) + (i / 2)) * (i * factor2)), image_xscale, image_yscale, 0, c_white, mina * AA);
        draw_sprite_ext(IMAGE_LOGO_CENTER, image_index, x + (w / 2) + (sin((siner / 8) + (i / 2)) * (i * factor2)), (y + (h / 2)) - (cos((siner / 8) + (i / 2)) * (i * factor2)), image_xscale, image_yscale, 0, c_white, mina * AA);
        draw_sprite_ext(IMAGE_LOGO_CENTER, image_index, (x + (w / 2)) - (sin((siner / 8) + (i / 2)) * (i * factor2)), y + (h / 2) + (cos((siner / 8) + (i / 2)) * (i * factor2)), image_xscale, image_yscale, 0, c_white, mina * AA);
        draw_sprite_ext(IMAGE_LOGO_CENTER, image_index, x + (w / 2) + (sin((siner / 8) + (i / 2)) * (i * factor2)), y + (h / 2) + (cos((siner / 8) + (i / 2)) * (i * factor2)), image_xscale, image_yscale, 0, c_white, mina * AA);
        draw_sprite_ext(chsprite, chnum, (x + (w / 2)) - (sin((siner / 8) + (i / 2)) * (i * factor2)), ((chyoffset - 17) + y + (h / 2)) - (cos((siner / 8) + (i / 2)) * (i * factor2)), image_xscale, image_yscale, 0, c_white, mina * AA);
        draw_sprite_ext(chsprite, chnum, x + (w / 2) + (sin((siner / 8) + (i / 2)) * (i * factor2)), ((chyoffset - 17) + y + (h / 2)) - (cos((siner / 8) + (i / 2)) * (i * factor2)), image_xscale, image_yscale, 0, c_white, mina * AA);
        draw_sprite_ext(chsprite, chnum, (x + (w / 2)) - (sin((siner / 8) + (i / 2)) * (i * factor2)), (chyoffset - 17) + y + (h / 2) + (cos((siner / 8) + (i / 2)) * (i * factor2)), image_xscale, image_yscale, 0, c_white, mina * AA);
        draw_sprite_ext(chsprite, chnum, x + (w / 2) + (sin((siner / 8) + (i / 2)) * (i * factor2)), (chyoffset - 17) + y + (h / 2) + (cos((siner / 8) + (i / 2)) * (i * factor2)), image_xscale, image_yscale, 0, c_white, mina * AA);
    }
    
    draw_sprite_ext(IMAGE_LOGO_CENTER_HEART, image_index, x, y, image_xscale, image_yscale, 0, c_white, AA);
    
    if (AA <= -0.46)
        room_speed = 30;
    
    if (AA <= -0.5 && skipped == 0)
    {
        //if (ingame == 1)
        //    room_goto(room_ed);
        //else
            room_goto(PLACE_MENU);
    }
}

if (ingame == 0)
{
    if (button1_p() && skipped == 0)
    {
        fade = instance_create(0, 0, obj_fadeout);
        
        with (fade)
            fadespeed = 0.04;
        
        snd_volume(NOISE, 0, 20);
        skipped = 1;
    }
    
    if (skipped == 1)
    {
        skiptimer += 1;
        
        if (skiptimer >= 28)
            room_speed = 30;
        
        if (skiptimer >= 30)
            room_goto(PLACE_MENU);
    }
}
