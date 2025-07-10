function scr_litemremove(arg0)
{
    for (i = 0; i < 8; i += 1)
    {
        if (global.litem[i] == arg0)
            script_execute(scr_litemshift, i, 0);
    }
}

function scr_litemget(arg0)
{
    i = 0;
    loop = 1;
    noroom = 0;
    global.litem[8] = 999;
    
    while (loop == 1)
    {
        if (global.litem[i] == 0)
        {
            global.litem[i] = arg0;
            break;
        }
        
        if (i == 8)
        {
            noroom = 1;
            break;
        }
        
        i += 1;
    }
    
    scr_litemname();
}

function scr_litemname() {
	global.litemname[0] = " ";
	
	for (i = 0; i < 8; i++)
		global.litemname[i] = scr_lightitem_name(global.litem[i]);	
}

function scr_litemshift(arg0, arg1)
{
    global.litem[8] = arg1;
    
    for (i = arg0; i < 8; i += 1)
        global.litem[i] = global.litem[i + 1];
    
    script_execute(scr_litemname);
}

function scr_litemcheck(arg0)
{
    haveit = 0;
    itemcount = 0;
    
    for (i = 0; i < 8; i += 1)
    {
        if (global.litem[i] == arg0)
            haveit = 1;
        
        if (global.litem[i] == arg0)
            itemcount += 1;
    }
    
    return haveit;
}

function scr_lweapon_can_equip(arg0)
{
    var weapon = get_weapon_by_lw_id(arg0);
    var have_dw_weapon = false;
    
    if (weapon == -4)
        show_debug_message("Error: couldn't find light world weapon by id " + string(arg0));
    else
        have_dw_weapon = scr_weaponcheck_inventory(weapon.dw_id) || scr_weaponcheck_equipped_any(weapon.dw_id) >= 1;
    
    return have_dw_weapon;
}

function scr_equip_dw_weapon_by_lw_id(arg0)
{
    var weapon = get_weapon_by_lw_id(arg0);
    var old_equip = global.charweapon[1];
    global.charweapon[1] = weapon.dw_id;
    
    for (var i = 0; i < array_length_1d(global.weapon); i++)
    {
        if (global.weapon[i] == weapon.dw_id)
        {
            global.weapon[i] = old_equip;
            break;
        }
    }
    
    scr_weaponinfo_mine();
    scr_weaponinfo_all();
}

function scr_equip_lw_weapon_by_dw_id(arg0)
{
    var weapon = get_weapon_by_dw_id(arg0);
    global.lweapon = weapon.lw_id;
    var weapon_list = get_lw_dw_weapon_list();
    
    for (var i = 0; i < array_length_1d(global.litem); i++)
    {
        for (var j = 0; j < array_length_1d(weapon_list); j++)
        {
            if (global.litem[i] == weapon_list[j].lw_id)
                scr_litemremove(global.litem[i]);
        }
    }
}

function get_weapon_by_lw_id(arg0)
{
    var weapon = -4;
    var weapon_id = arg0;
    var weapon_list = get_lw_dw_weapon_list();
    
    for (var i = 0; i < array_length(weapon_list); i++)
    {
        if (weapon_id == weapon_list[i].lw_id)
        {
            weapon = weapon_list[i];
			show_debug_message("{0} == {1}, light world weapon found", weapon_id, weapon_list[i].lw_id);
            break;
        }
    }
    
	// tf?????????
    //if (weapon == -4)
    //    weapon = weapon_list[0];
    
    return weapon;
}

function get_weapon_by_dw_id(arg0)
{
    var weapon = -4;
    var weapon_id = arg0;
    var weapon_list = get_lw_dw_weapon_list();
    
    for (var i = 0; i < array_length_1d(weapon_list); i++)
    {
        if (weapon_id == weapon_list[i].dw_id)
        {
            weapon = weapon_list[i];
            break;
        }
    }
    
    //if (weapon == -4)
    //    weapon = weapon_list[0];
    
    return weapon;
}

function get_lw_weapon_strength(arg0)
{
    return get_weapon_by_lw_id(arg0).lw_strength;
}

function lw_dw_weapon(arg0, arg1, arg2 = 1) constructor
{
    lw_id = arg0;
    dw_id = arg1;
    lw_strength = arg2;
}

function scr_lweaponeq(idx, wId)
{
    if (idx >= 0)
        global.litem[idx] = global.lweapon;
    
    global.lweapon = wId;
    global.lwstrength = get_lw_weapon_strength(global.lweapon);
    script_execute(scr_litemname);
}

function scr_lrecoitem(arg0)
{
    scr_lrecover(arg0);
    global.item[8] = recovered;
    
    if (maxedout == 1)
        global.item[8] = 9999;
    
    global.msg[0] += " &";
    
    if (global.item[8] < 999)
        global.msg[0] += stringsetsub("* You recovered ~1 HP!/%", string(global.item[8]));
    else
        global.msg[0] += "* Your HP was maxed out./%";
    
    script_execute(scr_writetext, 0, "x", 0, 0);
}

function scr_lrecover(arg0)
{
    recovered = arg0;
    maxedout = 0;
    
    if (global.lhp < global.lmaxhp)
        global.lhp += arg0;
    else
        maxedout = 1;
    
    if (global.lhp >= global.lmaxhp && maxedout == 0)
    {
        global.lhp = global.lmaxhp;
        maxedout = 1;
    }
}