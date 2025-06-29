if (global.hp[global.char[myself]] > 0)
{
    if (gachapondead)
    {
        gachapondead = false;
        x = xstart;
        y = ystart;
    }
    
    if (global.myfight == 3 && global.faceaction[myself] == 6 && state != 8)
        state = 6;
    
    if (state == 0 && hurt == 0)
    {
        acttimer = 0;
        thissprite = idlesprite;
        
        if (global.faceaction[myself] == 1)
            thissprite = attackreadysprite;
        
        if (global.faceaction[myself] == 3)
            thissprite = itemreadysprite;
        
        if (global.faceaction[myself] == 2)
            thissprite = spellreadysprite;
        
        var drawact = true;
        
        if (global.faceaction[myself] == 6 && drawact == true)
            thissprite = actreadysprite;
        
        if (global.charcond[myself] == 5)
        {
            thissprite = defeatsprite;
            global.faceaction[myself] = 9;
        }
        
        if (global.faceaction[myself] == 4)
        {
            thissprite = defendsprite;
            index = defendtimer;
            
            if (defendtimer < defendframes)
                defendtimer += 0.5;
        }
        else
        {
            defendtimer = 0;
            index = siner / 5;
        }
        
        siner += 1;
    }
    
    if (state == 1 && hurt == 0)
    {
        siner += 1;
        
        if (attacked == 0)
        {
            snd_stop(snd_laz_c);
            
            if (object_index == obj_herokris)
                snd_play(snd_laz_c);
            
            if (object_index == obj_heroralsei)
            {
                ls = snd_play(snd_laz_c);
                snd_pitch(ls, 1.15);
            }
            
            if (object_index == obj_herosusie)
            {
                ls = snd_play(snd_laz_c);
                snd_pitch(ls, 0.9);
            }
            
            if (object_index == obj_heronoelle)
            {
                ls = snd_play(snd_laz_c);
                snd_pitch(ls, 1.5);
            }
            
            if (points == 150)
            {
                snd_stop(snd_criticalswing);
                snd_play(snd_criticalswing);
                
                repeat (3)
                {
                    anim = instance_create(x + mywidth + random(50), y + 30 + random(30), obj_afterimage);
                    anim.sprite_index = spr_lightfairy;
                    anim.image_speed = 0.25;
                    anim.depth = -20;
                    anim.image_xscale = 2;
                    anim.image_yscale = 2;
                    anim.hspeed = 2 + random(4);
                    anim.friction = -0.25;
                }
            }
            
            attacked = 1;
            finishattacktimer = 11;
        }
        
        if (attacktimer < attackframes)
            image_index = attacktimer;
        else
            image_index = attackframes;
        
        thissprite = attacksprite;
        index = image_index;
        attacktimer += attackspeed;
        
        if (force == 1 && image_index == attackframes)
        {
            force = 0;
            state = 0;
            attacktimer = 0;
            attacked = 0;
        }
    }
    
    if (state == 2 && hurt == 0)
    {
        siner += 1;
        
        if (itemed == 0)
        {
            itemed = 1;
            spelltimer = 16;
        }
        
        if (attacktimer < spellframes && spellframes != 0)
            image_index = attacktimer;
        else
            image_index = spellframes;
        
        if (scr_monsterpop() == 0)
            attacktimer = 0;
        
        thissprite = spellsprite;
        index = image_index;
        attacktimer += 0.5;
        
        if (force == 1 && image_index == attackframes)
        {
            force = 0;
            state = 0;
            attacktimer = 0;
            itemed = 0;
        }
    }
    
    if (state == 4 && hurt == 0)
    {
        siner += 1;
        
        if (itemed == 0)
        {
            itemed = 1;
            spelltimer = 16;
        }
        
        if (attacktimer < itemframes)
            image_index = attacktimer;
        else
            image_index = itemframes;
        
        if (scr_monsterpop() == 0)
            attacktimer = 0;
        
        index = image_index;
        thissprite = itemsprite;
        attacktimer += 0.5;
    }
    
    if (state == 6)
    {
        if (global.myfight == 3)
        {
            if (acttimer < actframes)
                acttimer += 0.5;
        }
        else
        {
            acttimer += 0.5;
        }
        
        thissprite = actsprite;
        index = acttimer;
        
        if (acttimer >= actreturnframes)
        {
            acttimer = 0;
            state = 0;
            global.faceaction[myself] = 0;
        }
    }
    
    if (state == 7)
    {
        hurt = 0;
        hurttimer = 0;
        
        /*if (_sideb == 1 && _victoried == 0)
        {
            _victorysequence = instance_create(x, y, obj_noellevictory_example);
            _victorysequence.depth = depth - 1;
            _victoried = 1;
            image_alpha = 0;
        }*/
        
        if (victoryanim < victoryframes)
        {
            thissprite = victorysprite;
            index = victoryanim;
            victoryanim += 0.334;
        }
        else
        {
            thissprite = normalsprite;
            index = 0;
        }
    }
    
    if (state == 8)
    {
        if ((image_index + image_speed) >= maxframes && maxframes != 0)
        {
            state = 0;
            hurt = 0;
            attacktimer = 0;
            maxframes = 0;
        }
    }
    
    if (hurt == 1 && global.hp[global.char[myself]] > 0)
    {
        hurtindex = hurttimer / 2;
        
        if (hurtindex > 2)
            hurtindex = 2;
        
        if (global.charcond[myself] == 5)
        {
            global.faceaction[myself] = 5;
            global.charmove[myself] = 1;
            global.charcond[myself] = 0;
        }
        
        if (global.faceaction[myself] == 0)
            global.faceaction[myself] = 5;
        
        if (hurttimer > 15)
        {
            hurttimer = 0;
            hurt = 0;
            
            if (global.faceaction[myself] == 5)
                global.faceaction[myself] = 0;
        }
        
        hurttimer += 1;
    }
    
    if (gotupcon == 1)
    {
        gotupcon = 0;
    }
}
else
{
    global.charcond[myself] = 0;
    hurttimer = 0;
    hurt = 0;
    
    thissprite = defeatsprite;
    index = 0;
    siner += 1;
}

if (global.targeted[myself] != 1)
{
    if (combatdarken == 1 && instance_exists(obj_darkener))
    {
        if (darkify == 1)
        {
            if (darkentimer < 15)
                darkentimer += 1;
            
            image_blend = merge_color(c_white, c_black, darkentimer / 30);
        }
    }
}

if (darkify == 0)
{
    if (darkentimer > 0)
        darkentimer -= 3;
    
    image_blend = merge_color(c_white, c_black, darkentimer / 30);
}

if (poisonamount > 0)
{
    poisontimer++;
    
    if (poisontimer >= 10)
    {
        if (global.hp[global.char[myself]] > 1)
        {
            global.hp[global.char[myself]]--;
            poisonamount--;
        }
        else
        {
            poisonamount = 0;
        }
        
        poisontimer = 0;
    }
}

if (finishattacktimer > 0)
{
    finishattacktimer--;
    
    if (finishattacktimer == 0)
    {
        global.faceaction[myself] = 0;
        scr_retarget(myself);
        
        if (cancelattack == 0)
        {
            damage = round(((global.battleat[myself] * points) / 20) - (global.monsterdf[global.chartarget[myself]] * 3));
            
            scr_damage_enemy(global.chartarget[myself], damage);
            dm.type = char - 1;
            
            if (char == 4)
                dm.type = 6;
            
            dm.delay = 8;
            
            if (damage > 0)
            {
                scr_tensionheal(round(points / 10));
                attack = instance_create(global.monsterx[global.chartarget[myself]] + random(6), global.monstery[global.chartarget[myself]] + random(6), obj_basicattack);
                    
                if (object_index == obj_herosusie)
                {
                    attack.sprite_index = spr_attack_mash2;
                    attack.image_speed = 0.5;
                    attack.maxindex = 4;
                    snd_play(snd_impact);
                    instance_create(0, 0, obj_shake);
                }
                    
                if (object_index == obj_heroralsei)
                {
                    attack.sprite_index = spr_attack_slap1;
                    attack.maxindex = 4;
                    attack.image_speed = 0.5;
                }
                    
                if (object_index == obj_heronoelle)
                {
                    attack.sprite_index = spr_attack_slap2;
                    attack.maxindex = 4;
                    attack.image_speed = 0.5;
                }
                   
				// Black Shard
                if (global.charweapon[global.char[myself]] == 26)
                {
                    attack.sprite_index = spr_attack_shard;
                    attack.image_speed = 0.334;
                }
                    
                if (points == 150)
                {
                    attack.image_xscale = 2.5;
                    attack.image_yscale = 2.5;
                }
            }
        }
    }
}

if (spelltimer > 0)
{
    spelltimer--;
    
    if (spelltimer == 0)
    {
        if (spellframes > 0)
            global.faceaction[myself] = 0;
        
        if (scr_monsterpop() > 0)
            scr_spell(global.charspecial[myself], myself);
        
        state = 0;
        attacktimer = 0;
    }
}
