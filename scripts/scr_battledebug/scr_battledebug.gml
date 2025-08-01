function scr_debug_fullheal()
{
	caster = 0;
    with (obj_dmgwriter)
    {
        if (delaytimer >= 1)
        {
            killactive = true;
        }
    }
    
    scr_healallitemspell(999);
    
    for (i = 0; i < 3; i++)
    {
        with (global.charinstance[i])
        {
            tu--;
        }
    }
}

function scr_raise_party()
{
	caster = 0;
    with (obj_dmgwriter)
    {
        if (delaytimer >= 1)
        {
            killactive = true;
        }
    }
    
    for (i = 0; i < 3; i++)
    {
        if (global.char[i] == 0)
        {
            continue;
        }
        
        var _hltarget = global.char[i];
        var _curhp = global.hp[_hltarget];
        var _healpower;
        
        if (_curhp <= 0)
        {
            _healpower = -_curhp + 5;
        }
        else
        {
            _healpower = 1;
        }
        
        scr_heal(i, _healpower);
        
        with (global.charinstance[i])
        {
            ha = instance_create(x, y, obj_healanim);
            ha.target = id;
            dmgwr = scr_dmgwriter_selfchar();
            
            with (dmgwr)
            {
                delay = 8;
                type = 3;
                damage = _healpower;
            }
            
            if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
            {
                with (dmgwr)
                {
                    specialmessage = 3;
                }
            }
            
            tu += 1;
        }
    }
    
    for (i = 0; i < 3; i++)
    {
        with (global.charinstance[i])
        {
            tu--;
        }
    }
}

function scr_weaken_enemies()
{
    for (i = 0; i < 3; i++)
    {
        if (!global.monster[i])
        {
            continue;
        }
        
        dm = instance_create(global.monsterx[i], (global.monstery[i] + 20) - (global.hittarget[i] * 20), obj_dmgwriter);
        dm.damage = global.monsterhp[i] - 1;
        var _miss = global.monsterhp[i] == 1;
        global.monsterhp[i] = 1;
        
        with (global.monsterinstance[i])
        {
			if sprite_exists(asset_get_index("spr_realisticexplosion"))
			{
	            var _ex = instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_animation_dx);
	            _ex.sprite_index = spr_realisticexplosion;
	            _ex.image_xscale = 2;
	            _ex.image_yscale = 2;
	            _ex.depth = obj_dmgwriter.depth + 1;
			}
			
            if (!_miss)
            {
                shakex = 9;
                state = 3;
                hurttimer = 30;
            }
        }
    }
}

function scr_weaken_party()
{
    var _writedamage = false;
    
    if (argument_count == 1 && argument[0] == true)
    {
        _writedamage = true;
    }
    
    var _didhit = false;
    
    if (_writedamage)
    {
        with (obj_dmgwriter)
        {
            if (delaytimer >= 1)
            {
                killactive = true;
            }
        }
    }
    
    for (i = 0; i < 3; i++)
    {
        if (global.char[i] == 0)
        {
            continue;
        }
        
        var _chartarget = global.char[i];
        
        if (_writedamage)
        {
            var __hpdiff = max(0, global.hp[_chartarget] - 1);
            
            if (__hpdiff > 0)
            {
                with (global.charinstance[i])
                {
                    hurt = true;
                    hurttimer = 0;
                }
            }
            
            dmgwriter = instance_create(global.charinstance[i].x, (global.charinstance[i].y + global.charinstance[i].myheight) - 24, obj_dmgwriter);
            dmgwriter.damage = __hpdiff;
            
            if (__hpdiff > 0)
            {
                _didhit = true;
            }
        }
        
        if (global.hp[_chartarget] > 0)
        {
            global.hp[_chartarget] = 1;
        }
    }
    
    global.inv = global.invc * 40;
    
    if (_didhit)
    {
        snd_play(snd_hurt1);
        
        if (!instance_exists(obj_shake))
        {
            instance_create(0, 0, obj_shake);
        }
    }
}

function scr_turn_skip()
{
    if (scr_debug && scr_debug_keycheck(ord("V")) && global.turntimer > 0 && instance_exists(obj_growtangle) && scr_isphase("bullets"))
    {
        global.turntimer = 0;
        scr_debug_print("Attack skipped");
    }
}
