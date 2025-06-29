function scr_load_prev_chapter_file(arg0 = 0)
{
    var _chapter = arg0;
    
    switch (_chapter)
    {
        case 1:
            scr_load_chapter1();
            break;
        
        case 2:
            scr_load_chapter2();
            break;
        
        default:
            break;
    }
}

function scr_load_chapter1()
{
    snd_free_all();
    filechoicebk = global.filechoice;
    scr_gamestart();
    global.filechoice = filechoicebk;
    file = "filech1_" + string(global.filechoice);
    myfileid = ossafe_file_text_open_read(file);
    global.truename = ossafe_file_text_read_string(myfileid);
    ossafe_file_text_readln(myfileid);
    
    if (global.is_console)
    {
        var othername_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(othername_list); i += 1)
            global.othername[i] = ds_list_find_value(othername_list, i);
        
        ds_list_destroy(othername_list);
        ossafe_file_text_readln(myfileid);
    }
    else
    {
        for (i = 0; i < 6; i += 1)
        {
            global.othername[i] = ossafe_file_text_read_string(myfileid);
            ossafe_file_text_readln(myfileid);
        }
    }
    
    global.char[0] = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.char[1] = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.char[2] = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.gold = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.xp = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.lv = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.inv = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.invc = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.darkzone = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    
    if (global.is_console)
    {
        var hp_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(hp_list); i += 1)
            global.hp[i] = ds_list_find_value(hp_list, i);
        
        ds_list_destroy(hp_list);
        ossafe_file_text_readln(myfileid);
        var maxhp_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(maxhp_list); i += 1)
            global.maxhp[i] = ds_list_find_value(maxhp_list, i);
        
        ds_list_destroy(maxhp_list);
        ossafe_file_text_readln(myfileid);
        var at_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(at_list); i += 1)
            global.at[i] = ds_list_find_value(at_list, i);
        
        ds_list_destroy(at_list);
        ossafe_file_text_readln(myfileid);
        var df_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(df_list); i += 1)
            global.df[i] = ds_list_find_value(df_list, i);
        
        ds_list_destroy(df_list);
        ossafe_file_text_readln(myfileid);
        var mag_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(mag_list); i += 1)
            global.mag[i] = ds_list_find_value(mag_list, i);
        
        ds_list_destroy(mag_list);
        ossafe_file_text_readln(myfileid);
        var guts_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(guts_list); i += 1)
            global.guts[i] = ds_list_find_value(guts_list, i);
        
        ds_list_destroy(guts_list);
        ossafe_file_text_readln(myfileid);
        var charweapon_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(charweapon_list); i += 1)
            global.charweapon[i] = ds_list_find_value(charweapon_list, i);
        
        ds_list_destroy(charweapon_list);
        ossafe_file_text_readln(myfileid);
        var chararmor1_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(chararmor1_list); i += 1)
            global.chararmor1[i] = ds_list_find_value(chararmor1_list, i);
        
        ds_list_destroy(chararmor1_list);
        ossafe_file_text_readln(myfileid);
        var chararmor2_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(chararmor2_list); i += 1)
            global.chararmor2[i] = ds_list_find_value(chararmor2_list, i);
        
        ds_list_destroy(chararmor2_list);
        ossafe_file_text_readln(myfileid);
        var weaponstyle_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(weaponstyle_list); i += 1)
            global.weaponstyle[i] = ds_list_find_value(weaponstyle_list, i);
        
        ds_list_destroy(weaponstyle_list);
        ossafe_file_text_readln(myfileid);
    }
    
    for (i = 0; i < 4; i += 1)
    {
        if (!global.is_console)
        {
            global.hp[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.maxhp[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.at[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.df[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.mag[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.guts[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.charweapon[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.chararmor1[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.chararmor2[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.weaponstyle[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
        }
        
        for (q = 0; q < 4; q += 1)
        {
            global.itemat[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.itemdf[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.itemmag[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.itembolts[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.itemgrazeamt[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.itemgrazesize[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.itemboltspeed[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.itemspecial[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
        }
        
        for (j = 0; j < 12; j += 1)
        {
            global.spell[i][j] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
        }
    }
    
    global.boltspeed = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.grazeamt = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.grazesize = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    
    if (global.is_console)
    {
        var item_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(item_list); i += 1)
            global.item[i] = ds_list_find_value(item_list, i);
        
        ds_list_destroy(item_list);
        ossafe_file_text_readln(myfileid);
        var keyitem_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(keyitem_list); i += 1)
            global.keyitem[i] = ds_list_find_value(keyitem_list, i);
        
        ds_list_destroy(keyitem_list);
        ossafe_file_text_readln(myfileid);
        var weapon_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(weapon_list); i += 1)
            global.weapon[i] = ds_list_find_value(weapon_list, i);
        
        ds_list_destroy(weapon_list);
        ossafe_file_text_readln(myfileid);
        var armor_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(armor_list); i += 1)
            global.armor[i] = ds_list_find_value(armor_list, i);
        
        ds_list_destroy(armor_list);
        ossafe_file_text_readln(myfileid);
    }
    else
    {
        for (j = 0; j < 13; j += 1)
        {
            global.item[j] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.keyitem[j] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.weapon[j] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.armor[j] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
        }
    }
    
    global.weapon[12] = 0;
    global.armor[12] = 0;
    global.tension = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.maxtension = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.lweapon = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.larmor = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.lxp = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.llv = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.lgold = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.lhp = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.lmaxhp = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.lat = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.ldf = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.lwstrength = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.ladef = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    
    if (global.is_console)
    {
        var litem_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < (ds_list_size(litem_list) - 1); i += 1)
            global.litem[i] = ds_list_find_value(litem_list, i);
        
        ds_list_destroy(litem_list);
        ossafe_file_text_readln(myfileid);
        var phone_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < (ds_list_size(phone_list) - 1); i += 1)
            global.phone[i] = ds_list_find_value(phone_list, i);
        
        ds_list_destroy(phone_list);
        ossafe_file_text_readln(myfileid);
        var flag_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < (ds_list_size(flag_list) - 1); i += 1)
            global.flag[i] = ds_list_find_value(flag_list, i);
        
        ds_list_destroy(flag_list);
        ossafe_file_text_readln(myfileid);
    }
    else
    {
        for (i = 0; i < 8; i += 1)
        {
            global.litem[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.phone[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
        }
        
        for (i = 0; i < 9999; i += 1)
        {
            global.flag[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
        }
    }
    
    global.plot = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.currentroom = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.time = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    ossafe_file_text_close(myfileid);
    global.lastsavedtime = global.time;
    global.lastsavedlv = global.lv;
    scr_gamestart_chapter_override();
    
    if (global.is_console && global.game_won == 1)
        global.darkzone = 0;
    
    scr_tempsave();
    audio_group_set_gain(1, global.flag[15], 0);
    audio_set_master_gain(0, global.flag[17]);
}

function scr_load_chapter2()
{
    snd_free_all();
    filechoicebk = global.filechoice;
    scr_gamestart();
    global.filechoice = filechoicebk;
    file = "filech2_" + string(global.filechoice);
    myfileid = ossafe_file_text_open_read(file);
    global.truename = ossafe_file_text_read_string(myfileid);
    ossafe_file_text_readln(myfileid);
    
    if (global.is_console)
    {
        var othername_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(othername_list); i += 1)
            global.othername[i] = ds_list_find_value(othername_list, i);
        
        ds_list_destroy(othername_list);
        ossafe_file_text_readln(myfileid);
    }
    else
    {
        for (i = 0; i < 6; i += 1)
        {
            global.othername[i] = ossafe_file_text_read_string(myfileid);
            ossafe_file_text_readln(myfileid);
        }
    }
    
    global.char[0] = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.char[1] = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.char[2] = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.gold = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.xp = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.lv = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.inv = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.invc = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.darkzone = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    
    if (global.is_console)
    {
        var hp_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(hp_list); i += 1)
            global.hp[i] = ds_list_find_value(hp_list, i);
        
        ds_list_destroy(hp_list);
        ossafe_file_text_readln(myfileid);
        var maxhp_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(maxhp_list); i += 1)
            global.maxhp[i] = ds_list_find_value(maxhp_list, i);
        
        ds_list_destroy(maxhp_list);
        ossafe_file_text_readln(myfileid);
        var at_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(at_list); i += 1)
            global.at[i] = ds_list_find_value(at_list, i);
        
        ds_list_destroy(at_list);
        ossafe_file_text_readln(myfileid);
        var df_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(df_list); i += 1)
            global.df[i] = ds_list_find_value(df_list, i);
        
        ds_list_destroy(df_list);
        ossafe_file_text_readln(myfileid);
        var mag_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(mag_list); i += 1)
            global.mag[i] = ds_list_find_value(mag_list, i);
        
        ds_list_destroy(mag_list);
        ossafe_file_text_readln(myfileid);
        var guts_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(guts_list); i += 1)
            global.guts[i] = ds_list_find_value(guts_list, i);
        
        ds_list_destroy(guts_list);
        ossafe_file_text_readln(myfileid);
        var charweapon_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(charweapon_list); i += 1)
            global.charweapon[i] = ds_list_find_value(charweapon_list, i);
        
        ds_list_destroy(charweapon_list);
        ossafe_file_text_readln(myfileid);
        var chararmor1_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(chararmor1_list); i += 1)
            global.chararmor1[i] = ds_list_find_value(chararmor1_list, i);
        
        ds_list_destroy(chararmor1_list);
        ossafe_file_text_readln(myfileid);
        var chararmor2_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(chararmor2_list); i += 1)
            global.chararmor2[i] = ds_list_find_value(chararmor2_list, i);
        
        ds_list_destroy(chararmor2_list);
        ossafe_file_text_readln(myfileid);
        var weaponstyle_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(weaponstyle_list); i += 1)
            global.weaponstyle[i] = ds_list_find_value(weaponstyle_list, i);
        
        ds_list_destroy(weaponstyle_list);
        ossafe_file_text_readln(myfileid);
    }
    
    for (i = 0; i < 5; i += 1)
    {
        if (!global.is_console)
        {
            global.hp[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.maxhp[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.at[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.df[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.mag[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.guts[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.charweapon[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.chararmor1[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.chararmor2[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.weaponstyle[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
        }
        
        for (q = 0; q < 4; q += 1)
        {
            global.itemat[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.itemdf[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.itemmag[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.itembolts[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.itemgrazeamt[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.itemgrazesize[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.itemboltspeed[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.itemspecial[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.itemelement[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.itemelementamount[i][q] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
        }
        
        for (j = 0; j < 12; j += 1)
        {
            global.spell[i][j] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
        }
    }
    
    global.boltspeed = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.grazeamt = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.grazesize = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    
    if (global.is_console)
    {
        var item_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(item_list); i += 1)
            global.item[i] = ds_list_find_value(item_list, i);
        
        ds_list_destroy(item_list);
        ossafe_file_text_readln(myfileid);
        var keyitem_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(keyitem_list); i += 1)
            global.keyitem[i] = ds_list_find_value(keyitem_list, i);
        
        ds_list_destroy(keyitem_list);
        ossafe_file_text_readln(myfileid);
        var weapon_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(weapon_list); i += 1)
            global.weapon[i] = ds_list_find_value(weapon_list, i);
        
        ds_list_destroy(weapon_list);
        ossafe_file_text_readln(myfileid);
        var armor_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(armor_list); i += 1)
            global.armor[i] = ds_list_find_value(armor_list, i);
        
        ds_list_destroy(armor_list);
        ossafe_file_text_readln(myfileid);
        var pocket_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < ds_list_size(pocket_list); i += 1)
            global.pocketitem[i] = ds_list_find_value(pocket_list, i);
        
        ds_list_destroy(pocket_list);
        ossafe_file_text_readln(myfileid);
    }
    else
    {
        for (j = 0; j < 13; j += 1)
        {
            global.item[j] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.keyitem[j] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
        }
        
        for (j = 0; j < 48; j += 1)
        {
            global.weapon[j] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.armor[j] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
        }
        
        for (j = 0; j < 72; j += 1)
        {
            global.pocketitem[j] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
        }
    }
    
    global.tension = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.maxtension = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.lweapon = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.larmor = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.lxp = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.llv = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.lgold = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.lhp = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.lmaxhp = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.lat = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.ldf = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.lwstrength = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.ladef = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    
    if (global.is_console)
    {
        var litem_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < (ds_list_size(litem_list) - 1); i += 1)
            global.litem[i] = ds_list_find_value(litem_list, i);
        
        ds_list_destroy(litem_list);
        ossafe_file_text_readln(myfileid);
        var phone_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < (ds_list_size(phone_list) - 1); i += 1)
            global.phone[i] = ds_list_find_value(phone_list, i);
        
        ds_list_destroy(phone_list);
        ossafe_file_text_readln(myfileid);
        var flag_list = scr_ds_list_read(myfileid);
        
        for (i = 0; i < (ds_list_size(flag_list) - 1); i += 1)
            global.flag[i] = ds_list_find_value(flag_list, i);
        
        ds_list_destroy(flag_list);
        ossafe_file_text_readln(myfileid);
    }
    else
    {
        for (i = 0; i < 8; i += 1)
        {
            global.litem[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
            global.phone[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
        }
        
        for (i = 0; i < 2500; i += 1)
        {
            global.flag[i] = ossafe_file_text_read_real(myfileid);
            ossafe_file_text_readln(myfileid);
        }
    }
    
    global.plot = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.currentroom = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    global.time = ossafe_file_text_read_real(myfileid);
    ossafe_file_text_readln(myfileid);
    ossafe_file_text_close(myfileid);
    global.lastsavedtime = global.time;
    global.lastsavedlv = global.lv;
    scr_gamestart_chapter_override();
    global.darkzone = 1;
    scr_tempsave();
    audio_group_set_gain(1, global.flag[15], 0);
    audio_set_master_gain(0, global.flag[17]);
}