function scr_damage()
{
	if global.inv > 0 return;
	
    scr_damage_cache();
    var __element = 0;
        
    if (variable_instance_exists(id, "element") && is_real(element))
        __element = element;
        
    if (target < 3)
    {
        var skipthis = false;
            
        if (!skipthis)
        {
            if (global.hp[global.char[target]] <= 0)
            {
                scr_randomtarget_old();
                target = mytarget;
                    
                with (global.charinstance[target])
                {
                    image_blend = c_white;
                    darkify = 0;
                }
            }
        }
    }
        
    var __remtarget = -1;
        
    if (target == 4)
    {
        __remtarget = 4;
        scr_randomtarget_old();
        target = mytarget;
        var getList = array_length(global.char);
            
        if ((global.hp[global.char[target]] / global.maxhp[global.char[target]]) < (scr_party_hpaverage() / 2))
        {
            scr_randomtarget_old();
            target = mytarget;
        }
            
        if ((global.hp[global.char[target]] / global.maxhp[global.char[target]]) < (scr_party_hpaverage() / 2))
        {
            scr_randomtarget_old();
            target = mytarget;
        }
            
        if (target == 0 && (global.hp[global.char[target]] / global.maxhp[global.char[target]]) < 0.35)
        {
            scr_randomtarget_old();
            target = mytarget;
        }
            
        with (global.charinstance[target])
        {
            image_blend = c_white;
            darkify = 0;
        }
    }
        
    chartarget = 3;
        
    tdamage = damage;
    var oldcalculation = 0;
        
    if (target < 3)
    {
        if (oldcalculation)
            tdamage = ceil(tdamage - (global.battledf[target] * 3));
        else
            tdamage = scr_damage_calculation(tdamage, target);
            
        chartarget = global.char[target];
            
        if (global.charaction[target] == 10) // DEFEND
            tdamage = ceil((2 * tdamage) / 3);
            
        tdamage = ceil(tdamage * scr_element_damage_reduction(__element, global.char[target]));
        show_debug_message("The element is: " + string(__element));
            
        if (tdamage < 1)
            tdamage = 1;
    }
        
    if (!instance_exists(obj_shake))
        instance_create(0, 0, obj_shake);
        
    with (global.charinstance[target])
    {
        hurt = 1;
        hurttimer = 0;
    }
        
    hpdiff = tdamage;
        
    with (obj_dmgwriter)
    {
        if (delaytimer >= 1)
            killactive = 1;
    }
        
    doomtype = -1;
        
    with (obj_heart)
        dmgnoise = 1;
        
    if (target < 3)
    {
        if (global.hp[chartarget] <= 0)
        {
            doomtype = 4;
            global.hp[chartarget] -= round(tdamage / 4);
            hpdiff = round(tdamage / 4);
        }
        else
        {
            global.hp[chartarget] -= tdamage;
                
            if (global.hp[chartarget] <= 0)
            {
                hpdiff = abs(global.hp[chartarget] - (global.maxhp[chartarget] / 2));
                doomtype = 4;
                global.hp[chartarget] = round(-global.maxhp[chartarget] / 2);
                scr_dead(target);
            }
        }
            
        var __targx = -1;
        var __targy = -1;
            
        if (__targx == -1)
        {
            __targx = global.charinstance[target].x;
            __targy = (global.charinstance[target].y + global.charinstance[target].myheight) - 24;
        }
            
        dmgwriter = instance_create(__targx, __targy, obj_dmgwriter);
        dmgwriter.damage = hpdiff;
        dmgwriter.type = doomtype;
    }
        
    if (target == 3)
    {
        for (hpi = 0; hpi < 3; hpi += 1)
        {
            chartarget = global.char[hpi];
                
            if (global.hp[chartarget] >= 0)
            {
                if (oldcalculation)
                    tdamage = ceil(tdamage - (global.battledf[hpi] * 3));
                else
                    tdamage = scr_damage_calculation(tdamage, hpi);
                    
                tdamage = ceil(tdamage * scr_element_damage_reduction(__element, chartarget));
                    
                if (global.charaction[hpi] == 10)
                    global.hp[chartarget] -= ceil((3 * tdamage) / 4);
                else
                    global.hp[chartarget] -= tdamage;
                    
                if (global.hp[chartarget] <= 0)
                    global.hp[chartarget] = round(-global.maxhp[0] / 2);
            }
        }
    }
        
    global.inv = global.invc * 40;
        
    scr_damage_check();
    gameover = true;
	
	for (var i = 0; i < array_length(global.char); i++) {
		if global.char[i] != DRCharacter.None && global.hp[global.char[i]] > 0 {
			gameover = false;
			break;	
		}
	}
        
    if gameover
        scr_gameover();
        
    if (__remtarget != -1)
        target = __remtarget;
}

function scr_damage_cache()
{
    global.damage_cache = [];
    
    for (var i = 0; i < 3; i++)
        global.damage_cache[array_length(global.damage_cache)] = global.hp[global.char[i]];
}

function scr_damage_check()
{
    if (!variable_global_exists("damage_cache"))
        global.damage_cache = [];
    
    var took_damage = false;
    
    for (var i = 0; i < array_length(global.damage_cache); i++)
    {
        var hp_cache = global.damage_cache[i];
        
        if (global.hp[global.char[i]] < hp_cache)
        {
            took_damage = true;
            break;
        }
    }
}

function scr_party_hpaverage()
{
    var _totalhp = 0;
    var _totalmaxhp = 0;
    var _members = 0;
    
    for (var _hpi = 0; _hpi < array_length(global.char); _hpi++)
    {
        if (global.char[_hpi] > 0)
        {
            _members++;
            _totalhp += global.hp[global.char[_hpi]];
            _totalmaxhp += global.maxhp[global.char[_hpi]];
        }
    }
    
    if (_totalhp > 0)
        return floor(_totalhp / _totalmaxhp);
    else
        return 0;
}

function scr_damage_calculation(arg0, arg1)
{
    var _tdamage = arg0;
    var _tdef = global.battledf[arg1];
    var _tmaxhp = global.maxhp[global.char[arg1]];
    var _finaldamage = 1;
    var _hpthresholda = _tmaxhp / 5;
    var _hpthresholdb = _tmaxhp / 8;
    
    for (var _di = 0; _di < _tdef; _di++)
    {
        if (_tdamage > _hpthresholda)
            _tdamage -= 3;
        else if (_tdamage > _hpthresholdb)
            _tdamage -= 2;
        else
            _tdamage -= 1;
    }
    
    return max(_tdamage, _finaldamage);
}

function scr_element_damage_reduction(arg0, arg1)
{
    var ___element = arg0;
    var ___char = arg1;
    var ___reduction = 1;
    
    if (___element != 0)
    {
        for (var ___itemi = 0; ___itemi < 2; ___itemi++)
        {
            if (global.itemelement[___char][___itemi + 1] != 0)
            {
                if (global.itemelement[___char][___itemi + 1] == ___element)
                    ___reduction -= global.itemelementamount[___char][___itemi + 1];
                
                if (global.itemelement[___char][___itemi + 1] == 9)
                {
                    if (___element == 2 || ___element == 8)
                        ___reduction -= global.itemelementamount[___char][___itemi + 1];
                }
                
                if (global.itemelement[___char][___itemi + 1] == 10)
                    ___reduction -= global.itemelementamount[___char][___itemi + 1];
            }
        }
    }
    
    if (___reduction < 0.25)
        ___reduction = 0.25;
    
    return ___reduction;
}

function scr_damage_all(arg0 = 1)
{
    if (global.inv < 0)
    {
        remdamage = damage;
        _temptarget = target;
        
        for (ti = 0; ti < array_length(global.char); ti += 1)
        {
            global.inv = -1;
            damage = remdamage;
            var _inverse_proportion = 1 - arg0;
            var _damscale = global.hp[global.char[ti]] / global.maxhp[global.char[ti]];
            var _dammod = (_damscale * _inverse_proportion) + (1 * arg0);
            damage *= _dammod;
            target = ti;
            
            if (global.hp[global.char[ti]] > 0 && global.char[ti] != DRCharacter.None)
                scr_damage();
        }
        
        global.inv = global.invc * 40;
        target = _temptarget;
    }
}