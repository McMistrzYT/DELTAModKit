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