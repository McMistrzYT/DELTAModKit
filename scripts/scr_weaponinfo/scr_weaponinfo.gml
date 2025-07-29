function scr_weaponinfo_mine()
{
    for (i = 0; i < 6; i += 1)
    {
        scr_weaponinfo(global.charweapon[i]);
        charweaponname[i] = weaponnametemp;
        charweapondesc[i] = weapondesctemp;
        charweaponat[i] = weaponattemp;
        charweapondf[i] = weapondftemp;
        charweaponmag[i] = weaponmagtemp;
        charweaponbolts[i] = weaponboltstemp;
        charweaponstyle[i] = weaponstyletemp;
        charweapongrazeamt[i] = weapongrazeamttemp;
        charweapongrazesize[i] = weapongrazesizetemp;
        charweaponability[i] = weaponabilitytemp;
        charweaponabilityicon[i] = weaponabilityicontemp;
        charweaponicon[i] = weaponicontemp;
        global.itemat[i][0] = weaponattemp;
        global.itemdf[i][0] = weapondftemp;
        global.itemmag[i][0] = weaponmagtemp;
        global.itembolts[i][0] = weaponboltstemp;
        global.itemgrazeamt[i][0] = weapongrazeamttemp;
        global.itemgrazesize[i][0] = weapongrazesizetemp;
    }
}

function scr_weaponinfo_all()
{
    for (i = 0; i < 48; i += 1)
    {
        scr_weaponinfo(global.weapon[i]);
        weaponname[i] = weaponnametemp;
        weapondesc[i] = weapondesctemp;
        for (p = 0; p < DRCharacter.__MAX__; p++) {
            wmessage[i][p] = wmessagetemp[p];
            weaponchar[i][p] = weaponchartemp[p];
        }
        weaponat[i] = weaponattemp;
        weapondf[i] = weapondftemp;
        weaponmag[i] = weaponmagtemp;
        weaponbolts[i] = weaponboltstemp;
        weaponstyle[i] = weaponstyletemp;
        weapongrazeamt[i] = weapongrazeamttemp;
        weapongrazesize[i] = weapongrazesizetemp;
        weaponvalue[i] = value;
        weaponability[i] = weaponabilitytemp;
        weaponabilityicon[i] = weaponabilityicontemp;
        weaponicon[i] = weaponicontemp;
    }
}

function scr_weaponcheck_inventory(arg0)
{
    haveit = 0;
    itemcount = 0;
    
    for (i = 0; i < 48; i += 1)
    {
        if (global.weapon[i] == arg0)
            haveit = 1;
        
        if (global.weapon[i] == arg0)
            itemcount += 1;
    }
    
    return haveit;
}

function scr_weaponcheck_equipped(arg0, arg1)
{
    var __equipped = 0;
    
    if (global.charweapon[arg0] == arg1)
        __equipped++;
    
    return __equipped;
}

function scr_weaponcheck_equipped_any(arg0)
{
    var __totalwearing = 0;
    
    for (var __weari = 0; __weari < array_length(global.charweapon); __weari++)
        __totalwearing += scr_weaponcheck_equipped(__weari, arg0);
    
    return __totalwearing;
}

function scr_weaponget(arg0)
{
    noroom = 0;
    var legacy = 0;
    var __i = 0;
    
    if (legacy == 0)
    {
        var __itemcount = 0;
        __weapon[0] = arg0;
        
        for (__i = 0; __i < 48; __i++)
        {
            if (global.weapon[__i] != 0)
            {
                __weapon[__itemcount + 1] = global.weapon[__i];
                __itemcount++;
            }
        }
        
        if (__itemcount >= 48)
        {
            noroom = 1;
        }
        else
        {
            for (__i = 0; __i < 48; __i++)
            {
                if (__i <= __itemcount)
                    global.weapon[__i] = __weapon[__i];
                else
                    global.weapon[__i] = 0;
            }
        }
    }
    else if (legacy)
    {
        loop = 1;
        global.weapon[48] = 999;
        
        while (loop == 1)
        {
            if (global.weapon[__i] == 0)
            {
                global.weapon[__i] = arg0;
                break;
            }
            
            if (__i == 48)
            {
                noroom = 1;
                break;
            }
            
            __i += 1;
        }
    }
    
    script_execute(scr_weaponinfo_all);
}