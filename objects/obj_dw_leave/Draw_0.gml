pillarsiner++;
dist = 0;

if (instance_exists(obj_mainchara))
    dist = point_distance(x, y, obj_mainchara.x + 20, obj_mainchara.y + 30) - 30;

if (dist < 0)
    dist = 0;

alphadist = dist / 1500;

if (alphadist >= 0.3)
    alphadist = 0.3;

for (i = 0; i < 3; i++)
{
    sinoff = sin((i / 4) + (pillarsiner / 10));
    
    if (bottom == 1)
        draw_sprite_ext(sprite_index, 0, x, y, (image_xscale - (0.3 * i)) + (sin(sinoff) * 0.1), image_yscale, 0, c_white, ((0.7 - alphadist) + (sin(sinoff) * 0.01) + pillaralpha) / 2);
    
    if (top == 1)
        draw_sprite_ext(sprite_index, 1, x, y, (pillarscale - (0.3 * i)) + (sin(sinoff) * 0.1), image_yscale, 0, c_white, ((0.4 - alphadist) + (sin(sinoff) * 0.01) + pillaralpha) / 3);
}

gpu_set_blendmode(bm_normal);

if (top == 1)
{
    particletimer++;
    
    if (particletimer >= 2)
    {
        instance_create(random_range(x - (sprite_width / 2), x + (sprite_width / 2)), y - random(sprite_height), obj_dw_transition_particle);
        particletimer = 0;
    }
    
    if (con == 1)
    {
        snd_play(snd_dtrans_lw);
        
        with (obj_dw_leave)
        {
            if (bottom == 1)
            {
                draw_kris = 1;
                fake_v = 1;
            }
        }
        
        con = 2;
        alphab = 0;
        fake_v = -10;
    }
    
    if (con == 2)
    {
        alphab += 0.001;
        fake_v += (0.5 + (alphab * 20));
        gpu_set_blendmode(bm_add);
        draw_sprite_ext(sprite_index, 1, x, y, 99, 99, 0, c_white, fake_v / 80);
        gpu_set_blendmode(bm_normal);
        
        if ((fake_v / 80) > 0)
        {
            if (!border_fade)
            {
                border_fade = true;
            }
        }
        
        if ((fake_v / 80) >= 1.2)
        {
            pers = instance_create(0, 0, obj_persistentfadein);
            pers.image_blend = c_white;
            global.interact = 3;
            global.entrance = 24;
            snd_free(global.currentsong[0]);
            
            if (!unlock_mode)
                scr_become_light();
            else
                global.tempflag[58] = 1;
            
            room_goto(nextroom);
        }
    }
}

if (bottom == 1)
{
    if (draw_kris == 1)
    {
        fake_v -= 0.2;
        kris_y += fake_v;
        sus_y += fake_v;
        siner += (1 + (siner / 60));
        
        if (kris_only == 0)
            draw_sprite_ext(spr_susie_dw_fall_d, siner / 6, sus_x, sus_y, 2, 2, 0, c_white, 1);
        
        draw_sprite_ext(spr_kris_fall_d_dw, siner / 6, kris_x, kris_y, 2, 2, 0, c_white, 1);
    }
}
