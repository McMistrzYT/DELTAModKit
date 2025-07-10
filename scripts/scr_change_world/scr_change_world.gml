function scr_become_dark()
{
    global.darkzone = 1;
    scr_equip_dw_weapon_by_lw_id(global.lweapon);
    
    for (var i = 0; i < 8; i++)
    {
        var weapon = get_weapon_by_lw_id(global.litem[i]);
        
        if (weapon != -4)
        {
            if (!scr_weaponcheck_inventory(weapon.dw_id) && !scr_weaponcheck_equipped_any(weapon.dw_id))
                scr_weaponget(weapon.dw_id);
        }
    }
    
    global.hp[DRCharacter.Kris] = ceil((global.lhp / global.lmaxhp) * global.maxhp[DRCharacter.Kris]);
    
    if (global.hp[DRCharacter.Kris] < 1)
        global.hp[DRCharacter.Kris] = 1;
    
    if (global.hp[DRCharacter.Kris] > global.maxhp[DRCharacter.Kris])
        global.hp[DRCharacter.Kris] = global.maxhp[DRCharacter.Kris];
}

function scr_become_light()
{
    if !scr_litemcheck(DRLightItem.BallOfJunk)
        scr_litemget(DRLightItem.BallOfJunk);
    
    if scr_keyitemcheck(DRKeyItem.Egg)
    {
        if !scr_litemcheck(DRLightItem.Egg)
            scr_litemget(DRLightItem.Egg);
    }
    else
        scr_litemremove(DRLightItem.Egg);
    
    if scr_keyitemcheck(DRKeyItem.ShadowCrystal)
    {
        if !scr_litemcheck(DRLightItem.Glass)
            scr_litemget(DRLightItem.Glass);
    }
    else
        scr_litemremove(DRLightItem.Glass);
    
    global.lhp = ceil((global.hp[DRCharacter.Kris] / global.maxhp[DRCharacter.Kris]) * global.lmaxhp);
    
    if global.lhp < 1
        global.lhp = 1;
    
    if global.lhp > global.lmaxhp
        global.lhp = global.lmaxhp;
    
    scr_equip_lw_weapon_by_dw_id(global.charweapon[DRCharacter.Kris]);
    global.lwstrength = get_lw_weapon_strength(global.lweapon);
    
    if scr_weaponcheck_inventory(DRWeapon.BlackShard) > 0 || scr_weaponcheck_equipped_any(DRWeapon.BlackShard) > 0
    {
        if !scr_litemcheck(DRLightItem.BlackShard) && global.lweapon != DRLightItem.BlackShard
            scr_litemget(DRLightItem.BlackShard);
    }
    
    var armorconverted = 0;
    
    if scr_armorcheck_equipped(DRCharacter.Kris, DRArmor.SilverWatch) > 0
    {
        armorconverted = 1;
        global.larmor = DRLightItem.Wristwatch;
    }
    
    if (armorconverted == 1)
        global.ladef = 1;
    else
        global.ladef = 0;
    
    global.darkzone = 0;
}