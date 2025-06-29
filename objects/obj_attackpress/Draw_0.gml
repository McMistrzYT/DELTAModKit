maxdelaytimer += 1;

if (spelluse == 1)
{
    if (scr_monsterpop() > 0)
    {
        for (xyz = 0; xyz < 3; xyz += 1)
        {
            if (maxdelaytimer == spelldelay[xyz])
            {
                if (charitem[xyz] == 1)
                {
                    with (global.charinstance[xyz])
                        state = 4;
                }
                
                if (charspell[xyz] == 1)
                {
                    with (global.charinstance[xyz])
                        state = 2;
                }
            }
        }
    }
}

if (maxdelaytimer >= maxdelay)
    active = 1;

if (active == 1)
{
    for (i = 0; i < 3; i += 1)
    {
        if (havechar[0] == 1 || havechar[1] == 1 || havechar[2] == 1)
        {
            draw_set_color(bcolor);
            
            if (i == 1 || i == 2)
                draw_rectangle(x + 77, y + (38 * i), x + 300, y + (38 * i) + 1, false);
        }
        
        if (global.char[i] != DRCharacter.None && global.charauto[global.char[i]] == 0 && havechar[i] == 1)
        {
            draw_set_color(bcolor);
            j = global.char[i];
            fullbox = 0;
			
			var _col = scr_hero_get_color(j - 1);
			draw_set_color(_col);
			
			if (pressbuffer[clamp(j, 0, 3)])
				draw_set_color(merge_color(_col, c_white, pressbuffer[clamp(j, 0, 3)] / 5));
            
            draw_rectangle(x + 78, y + (38 * i), x + 80 + (15 * boltspeed), y + (38 * i) + 36, true);
            draw_rectangle(x + 79, y + (38 * i) + 2, (x + 80 + (15 * boltspeed)) - 1, y + (38 * i) + 35, true);
            //draw_sprite(spr_pressfront, j - 1, x, y + (38 * i));
			
			scr_hero_get_nameplate(j - 1);
			draw_sprite(headspr, 0, x + 4, y + (38 * i) + 7);
            
            if (global.flag[13] == 0)
                draw_sprite(spr_pressfront_b, 0, x, y + (38 * i));
            
            if (global.flag[13] == 1)
                draw_sprite(spr_pressfront_b, i, x, y + (38 * i));
            
            //draw_sprite(spr_pressspot, j - 1, x + 80, y + (38 * i));
			draw_sprite(spr_pressspot, 4, x + 80, y + (38 * i));
        }
    }
    
    boltcount[0] = 0;
    boltcount[1] = 0;
    boltcount[2] = 0;
    
    if (my_method == 1)
    {
        for (i = 0; i < bolttotal; i += 1)
        {
            offset = boltchar[i];
            
            if ((boltframe[i] - boltx) < -5)
                boltalive[i] = 0;
            
            boltalpha = 1;
            
            if ((boltframe[i] - boltx) < 0)
            {
                boltalpha = 1 + ((boltframe[i] - boltx) / 3);
            }
            else if (imagetimer == 0 && boltalive[i] == 1)
            {
                img = instance_create((x + 80 + (boltframe[i] * boltspeed)) - (boltx * boltspeed), y + (38 * offset), obj_afterimage);
                
                with (img)
                {
                    sprite_index = spr_attackspot;
                    image_alpha = 0.4;
                }
            }
            
            if (boltalive[i] == 1)
            {
                draw_sprite_ext(spr_attackspot, 0, (x + 80 + (boltframe[i] * boltspeed)) - (boltx * boltspeed), y + (38 * offset), 1, 1, 0, c_white, boltalpha);
                boltcount[boltchar[i]] += 1;
            }
        }
        
        for (i = 0; i < 3; i += 1)
        {
            if (boltcount[i] == 0 && havechar[i] == 1 && attacked[i] == 0)
            {
                attacked[i] = 1;
                target = i;
                event_user(1);
            }
        }
    }
    
    if (scr_monsterpop() > 0)
    {
        if (global.flag[13] == 1)
        {
            if (button1_p() && havechar[0] == 1)
                scr_boltcheck(0);
            
            if (button2_p() && havechar[1] == 1)
                scr_boltcheck(1);
            
            if (button3_p() && havechar[2] == 1)
                scr_boltcheck(2);
        }
        else if (button1_p())
        {
            scr_boltcheck_onebutton();
        }
    }
    else
    {
        fakefade = 1;
        
        if (posttimer < (timermax - 35))
            posttimer = timermax - 34;
    }
    
    imagetimer += 1;
    boltx += 1;
    pressbuffer[0] -= 1;
    pressbuffer[1] -= 1;
    pressbuffer[2] -= 1;
    pressbuffer[3] -= 1;
    
    if (imagetimer > 1)
        imagetimer = 0;
    
    goahead = 0;
    
    if (attacked[0] == 1 || havechar[0] == 0)
    {
        if (attacked[1] == 1 || havechar[1] == 0)
        {
            if (attacked[2] == 1 || havechar[2] == 0)
                goahead = 1;
        }
    }
    
    if (scr_monsterpop() == 0)
        goahead = 1;
    
    if (goahead == 1)
    {
        posttimer += 1;
        
        if (posttimer > (timermax - 35) && haveauto == 1 && autoed == 0 && scr_monsterpop() > 0)
        {
            global.charinstance[sus].points = 160;
            
            if (global.automiss[global.chartarget[sus]] == 1)
                global.charinstance[sus].points = 0;
            
            with (global.charinstance[sus])
            {
                state = 1;
                attacktimer = 0;
                is_auto_susie = 1;
            }
            
            posttimer -= 25;
            autoed = 1;
        }
        
        if (posttimer > timermax)
        {
            fade = 1;
            
            with (obj_heroparent)
            {
                if (state == 1)
                    state = 0;
                
                attacked = 0;
                itemed = 0;
            }
            
            techwon = 0;
            
            if (scr_monsterpop() == 0)
                techwon = 1;
            
            if (techwon == 1)
                scr_wincombat();
            
            if (techwon == 0)
            {
                if (global.mnfight != 1.5 && global.mnfight != 2)
                    global.mnfight = 1;
                
                global.myfight = -1;
            }
        }
    }
    
    if (fade == 1 || fakefade == 1)
    {
        fadeamt += 0.08;
        draw_set_color(c_black);
        draw_set_alpha(fadeamt);
        draw_rectangle(x - 1, y, x + 640, y + 300, false);
        draw_set_alpha(1);
        
        if (fade == 1)
        {
            if (fadeamt > 1)
                instance_destroy();
        }
    }
}
