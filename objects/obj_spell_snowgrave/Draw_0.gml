xx = __view_get(e__VW.XView, 0);
yy = __view_get(e__VW.YView, 0);

if (init == 0)
{
    init = 1;
    fncon = 0;
    siner = 0;
    
    if (altpath == 1)
    {
        timer = -270;
        
        with (global.cinstance[caster])
            visible = 0;
        
        fn = scr_dark_marker(global.cinstance[caster].x, global.cinstance[caster].y, global.cinstance[caster].spellsprite);
        fn.depth = global.cinstance[caster].depth;
        fn.image_index = 0;
        fncon = 0;
    }
}

timer++;

/*if (altpath == 1)
{
    if (fncon == 0)
    {
        fn.image_index += 0.25;
        
        if (fn.image_index >= 8)
        {
            fntimer = 0;
            fncon = 0.5;
            mus_volume(global.batmusic[1], 0, 90);
        }
    }
    
    if (fncon == 0.5)
    {
        fntimer++;
        
        if (fntimer >= 120)
        {
            with (fn)
                scr_oflash();
            
            fn.sprite_index = spr_noelleb_spell_special;
            fn.image_speed = 0.5;
            fncon = 0.8;
            fntimer = 0;
            amplitude = 0;
            
            with (obj_berdlyb2_enemy)
                visible = 0;
            
            fb = scr_dark_marker(obj_berdlyb2_enemy.x, obj_berdlyb2_enemy.y, spr_berdlyb_idle_shocked);
            fb.depth = obj_berdlyb2_enemy.depth;
        }
    }
    
    if (fncon == 0.8)
    {
        fntimer++;
        
        if (fntimer >= 30)
        {
            fntimer = 0;
            fncon = 1;
        }
    }
    
    if (fncon == 1 || fncon == 2)
    {
        if (amplitude < 1)
            amplitude += 0.03;
        
        if (fn.y > (fn.ystart - 70))
        {
            fn.y -= amplitude;
            fn.x += amplitude * 2.94;
        }
        
        fn.x += sin(timer / 3) * amplitude;
        fn.y += cos(timer / 3) * amplitude;
        
        if ((timer % 4) == 0 && timer < 70)
        {
            dustsnd = snd_play(snd_bell);
            snd_volume(dustsnd, 0.5, 0);
            snd_pitch(dustsnd, 0.5 + random(0.3));
            dust = instance_create(fn.x + 50, fn.y + 10 + 10, obj_afterimage_grow);
            dust.speed = random(2) + 1;
            dust.direction = random_range(0, 180);
            dust.gravity = 0.2 + random(0.3);
            dust.gravity_direction = random_range(70, 110);
            dust.image_xscale = 1;
            dust.image_yscale = 1;
            dust.sprite_index = spr_shine;
            dust.image_speed = 0.5;
            dust.image_alpha = 3;
        }
        
        if (timer >= 210)
        {
            fn.sprite_index = spr_noelleb_spell;
            fn.image_index = 2;
            fn.image_speed = 0;
            fn.gravity = 1;
            fncon = 3;
        }
    }
    
    if (fncon == 3)
    {
        if (fn.y >= (ystart - 6))
        {
            fn.y = ystart;
            fn.sprite_index = spr_noelleb_defeat;
            fn.speed = 0;
            fn.gravity = 0;
            
            with (fn)
                scr_shakeobj();
            
            fncon = 4;
        }
    }
}*/

if (timer > 0)
{
    draw_set_alpha(bgalpha);
    draw_rectangle_colour(xx - 10, yy - 10, xx + 700, yy + 500, c_white, c_white, c_blue, c_blue, false);
}

draw_background_tiled_ext(bg_snowfall, snowspeed / 1.5, timer * 6, 2, 2, c_white, bgalpha);
draw_background_tiled_ext(bg_snowfall, snowspeed, timer * 8, 2, 2, c_white, bgalpha * 2);

if (timer <= 10 && timer >= 0)
{
    if (bgalpha < 0.5)
        bgalpha += 0.05;
}

if (timer >= 0)
    snowspeed += (20 + (timer / 5));

if (timer == 1)
    audio_play_sound(snd_snowgrave, 50, 0);

if (timer >= 20 && timer <= (75 + (altpath * 30)))
{
    stimer++;
    snowflake[0] = instance_create(xx + 455, yy + 560, obj_spell_snowgrave_snowflake);
    snowflake[1] = instance_create(xx + 500, yy + 600, obj_spell_snowgrave_snowflake);
    snowflake[2] = instance_create(xx + 545, yy + 520, obj_spell_snowgrave_snowflake);
    
    for (i = 0; i < 3; i++)
    {
        snowflake[i].gravity = -2;
        snowflake[i].vspeed = sin(timer / 2) * 0.5;
        snowflake[i].siner = timer / 2;
    }
    
    if (stimer >= 8)
        stimer = 0;
}

/*if (timer == 70 && altpath == 1)
{
    fb.sprite_index = spr_berdly_ice;
    fb.x -= 22;
    fb.y -= 48;
}*/

if (timer == (95 + (altpath * 30)) && damage > 0 && global.fighting == 1)
{
    for (i = 0; i < 3; i++)
    {
        if (global.monster[i])
        {
            if (i_ex(global.monsterinstance[i]))
            {
                global.hittarget[i] = 0;
                global.monsterinstance[i].fatal = 1;
                
                if (altpath == 0)
                {
                    scr_damage_enemy(i, damage + round(random(100)));
                }
                else
                {
                    global.hittarget[i] = 0;
                    dm = instance_create(global.monsterx[i], (global.monstery[i] + 20) - (global.hittarget[i] * 20), obj_dmgwriter);
                    dm.damage = damage + round(random(100));
                    dm.type = 6;
                }
                
                if (global.monsterhp[i] > 0 && altpath == 0)
                {
                    global.monsterinstance[i].fatal = 0;
                    
                    with (global.monsterinstance[i])
                        __of = scr_oflash();
                }
                
                if (altpath)
                {
                    with (fb)
                        scr_oflash();
                }
            }
        }
    }
}

if (timer >= (90 + (altpath * 30)))
{
    if (altpath == 0)
    {
        if (bgalpha > 0)
            bgalpha -= 0.02;
    }
    
    if (altpath == 1)
        bgalpha -= 0.005;
}

if (timer == (120 + (altpath * 150)))
{
    /*if (altpath)
    {
        with (obj_berdlyb2_enemy)
            sidebcon = 1;
        
        obj_berdlyb2_enemy.fn = fn;
        obj_berdlyb2_enemy.fb = fb;
    }*/
    
    instance_destroy();
}
