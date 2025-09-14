if (init == 0)
{
    if (myself >= 0)
    {
        if (global.monster[myself] == 1)
        {
            if (global.monsterstatus[myself] == 1)
                success = 1;
        }
    }
}

if (initdelay == 0)
{
    audio_play_sound(snd_ghostappear, 50, 0);
    
    if (success == 1)
        audio_play_sound(snd_spell_pacify, 50, 0);
}

initdelay--;

if (initdelay <= 0)
{
    siner++;
    image_alpha = (sin(siner / 9) - 0.3) + (success * 0.3);
    amp = sin(siner / 9) * 30;
    draw_sprite_ext(sprite_index, image_index, x + (sin(siner / 6) * amp), y + ((cos(siner / 6) * amp) / 2), image_xscale, image_yscale, image_angle, image_blend, image_alpha * 0.8);
    draw_sprite_ext(sprite_index, image_index, x - (sin(siner / 6) * amp), y - ((cos(siner / 6) * amp) / 2), image_xscale, image_yscale, image_angle, image_blend, image_alpha * 0.8);
    stimer++;
    
    if (siner == 12)
    {
        if (success == 1)
        {
            with (target)
            {
                global.flag[51 + myself] = 3;
                event_user(10);
                scr_monsterdefeat();
            }
        }
    }
    
    if (stimer >= 3 && siner <= 24)
    {
        stimer = 0;
        
        if (success == 1)
        {
            hex = instance_create((x - (sprite_width / 2)) + random(sprite_width), (y - (sprite_height / 2)) + random(sprite_height), obj_icespell_hexagon);
            hex.image_xscale = 0.5;
            hex.image_yscale = 0.5;
            hex.con = 1;
            hex.rotspeed = random(5);
            hex.sprite_index = spr_icespell_snowflake;
        }
    }
    
    if (siner >= 40)
        instance_destroy();
}
