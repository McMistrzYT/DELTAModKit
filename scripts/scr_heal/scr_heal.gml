function scr_revive(char)
{
    global.charmove[char] = 1;
    global.charcantarget[char] = 1;
    global.chardead[char] = 0;
}

function scr_heal(char, amnt)
{
    abovemaxhp = 0;
    belowzero = 0;
    hltarget = global.char[char];
    _curhp = global.hp[hltarget];
    
    if (global.hp[hltarget] <= 0)
        belowzero = 1;
    
    if (global.hp[hltarget] > global.maxhp[hltarget])
        abovemaxhp = 1;
    
    if (abovemaxhp == 0)
    {
        global.hp[hltarget] += amnt;
        
        if (global.hp[hltarget] > global.maxhp[hltarget])
            global.hp[hltarget] = global.maxhp[hltarget];
    }
    
    if (belowzero == 1 && global.hp[hltarget] >= 0)
    {
        if (global.hp[hltarget] < ceil(global.maxhp[hltarget] / 6))
            global.hp[hltarget] = ceil(global.maxhp[hltarget] / 6);
        
        scr_revive(char);
    }
    
    snd_stop(snd_power);
    snd_play(snd_power);
    return global.hp[hltarget] - _curhp;
}

function scr_healall(amnt)
{
    for (i = 0; i < 3; i += 1)
    {
        if (global.char[i] != 0)
            scr_heal(i, amnt);
    }
}

function scr_heal_amount_modify_by_equipment(arg0)
{
    var ___healAmount = arg0;
    var ___healAdd = 0;
    
    if (global.chararmor1[global.char[caster]] == DRArmor.BlueRibbon)
        ___healAdd += ceil(___healAmount / 8);
    
    if (global.chararmor2[global.char[caster]] == DRArmor.BlueRibbon)
        ___healAdd += ceil(___healAmount / 8);
    
    return ___healAmount + ___healAdd;
}

function scr_healitemspell(healamnt)
{
    var __healAmount = scr_heal_amount_modify_by_equipment(healamnt);
    scr_heal(star, __healAmount);
    global.spelldelay = 15;
    
    with (global.charinstance[star])
    {
        ha = instance_create(x, y, obj_healanim);
        ha.target = id;
        dmgwr = scr_dmgwriter_selfchar();
        
        with (dmgwr)
        {
            delay = 8;
            type = 3;
            damage = __healAmount;
        }
        
        if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
        {
            with (dmgwr)
                specialmessage = 3;
        }
        
        tu += 1;
        return ha;
    }
}

function scr_healallitemspell(healamnt)
{
    var __healAmount = scr_heal_amount_modify_by_equipment(healamnt);
    scr_healall(__healAmount);
    
    for (i = 0; i < 3; i += 1)
    {
        with (global.charinstance[i])
        {
            ha = instance_create(x, y, obj_healanim);
            ha.target = id;
            dmgwr = scr_dmgwriter_selfchar();
            
            with (dmgwr)
            {
                delay = 8;
                type = 3;
                damage = __healAmount;
            }
            
            if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
            {
                with (dmgwr)
                    specialmessage = 3;
            }
            
            tu += 1;
        }
    }
    
    global.spelldelay = 20;
}