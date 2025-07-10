function scr_complete_save_file()
{
    _remfilechoice = global.filechoice;
    global.filechoice += 3;
    scr_set_ini_value(global.chapter, global.filechoice, "SideB", 0 /*scr_sideb_active()*/);
    scr_save();
    global.filechoice = _remfilechoice;
}

function scr_chapter_save_file_exists(arg0)
{
    var _exists = false;
    
    for (var i = 0; i < 3; i++)
    {
        _exists = ossafe_file_exists("filech" + string(arg0) + "_" + string(i));
        
        if (_exists == true)
            break;
    }
    
    return _exists;
}

function scr_completed_chapter(arg0)
{
    return ossafe_file_exists("filech" + string(arg0) + "_" + string(global.filechoice + 3));
}

function scr_completed_chapter_any_slot(arg0)
{
    var _file_exists = false;
    
    for (var i = 0; i < 3; i++)
    {
        if (ossafe_file_exists("filech" + string(arg0) + "_" + string(i + 3)))
        {
            _file_exists = true;
            break;
        }
    }
    
    return _file_exists;
}

function scr_get_secret_boss_result(arg0)
{
    var fought_flag = scr_get_secret_boss_flag(arg0);
    return global.flag[fought_flag];
}

function scr_defeated_secret_boss_any_slot(arg0)
{
    var _fought_boss = scr_fought_secret_boss_any_slot(arg0);
    var _defeated = false;
    
    if (_fought_boss)
    {
        for (var i = 0; i < 3; i++)
        {
            var _slot = i;
            var _result = scr_get_ura_value(arg0, _slot);
            
            if (_result == 1 || _result == 3)
            {
                _defeated = true;
                break;
            }
        }
    }
    
    return _defeated;
}

function scr_spared_secret_boss_any_slot(arg0)
{
    var _fought_boss = scr_fought_secret_boss_any_slot(arg0);
    var _spared = false;
    
    if (_fought_boss)
    {
        for (var i = 0; i < 3; i++)
        {
            var _slot = i;
            var _result = scr_get_ura_value(arg0, _slot);
            
            if (_result >= 2)
            {
                _spared = true;
                break;
            }
        }
    }
    
    return _spared;
}

function scr_fought_secret_boss(arg0)
{
    return scr_get_secret_boss_result(arg0) > 0;
}

function scr_fought_secret_boss_any_slot(arg0)
{
    var _fought = false;
    
    for (var i = 0; i < 3; i++)
    {
        var _slot = i;
        var _result = scr_get_ura_value(arg0, _slot);
        
        if (_result > 0)
        {
            _fought = true;
            break;
        }
    }
    
    return _fought;
}

function scr_get_secret_boss_flag(chapterid)
{
    var fought_flag = 241;
    
    switch (chapterid)
    {
        case 1:
            fought_flag = 241;
            break;
        
        case 2:
            fought_flag = 571;
            break;
        
        case 3:
            fought_flag = 1047;
            break;
        
        default:
            break;
    }
    
    return fought_flag;
}

function scr_enable_chapter_skip(chapterid)
{
    var _skip_flag = 38;
    
    switch (chapterid)
    {
        case 2:
            _skip_flag = 39;
            break;
        
        case 3:
            _skip_flag = 40;
            break;
        
        default:
            break;
    }
    
    global.tempflag[_skip_flag] = 1;
}

function scr_get_knight_total_loss_count()
{
    var _times_lost = 0;
    var _chapter = 3;
    var _fought_boss = scr_fought_secret_boss_any_slot(_chapter);
    
    if (_fought_boss)
    {
        for (var i = 0; i < 3; i++)
        {
            var _slot = i;
            var _result = scr_get_ura_value(_chapter, _slot);
            
            if (_result == 2)
                _times_lost++;
        }
    }
    
    return _times_lost;
}

function scr_get_knight_total_attempts()
{
    var _times_attempted = 0;
    var _chapter = 3;
    var _fought_boss = scr_fought_secret_boss_any_slot(_chapter);
    
    if (_fought_boss)
    {
        for (var i = 0; i < 3; i++)
        {
            var _slot = i;
            var _result = scr_get_ura_value(_chapter, _slot);
            
            if (_result > 0)
                _times_attempted++;
        }
    }
    
    return _times_attempted;
}

function scr_set_ini_value(arg0, arg1, arg2, arg3)
{
    var iniwrite = ossafe_ini_open("dr.ini");
    ini_write_real(scr_ini_chapter(arg0, arg1), arg2, arg3);
    ossafe_ini_close();
}

function scr_get_ini_value_all_slots(arg0, arg1)
{
    var _ini_file = ossafe_ini_open("dr.ini");
    var _list = [];
    
    for (var i = 0; i < 6; i++)
    {
        var _slot = i;
        var _value = ini_read_real(scr_ini_chapter(arg0, _slot), arg1, 0);
        _list[i][0] = _slot;
        _list[i][1] = _value;
    }
    
    ossafe_ini_close();
    return _list;
}

function scr_get_ini_value(arg0, arg1, arg2)
{
    var _ini_file = ossafe_ini_open("dr.ini");
    var _ini_value = ini_read_real(scr_ini_chapter(arg0, arg1), arg2, 0);
    ossafe_ini_close();
    return _ini_value;
}

function scr_get_ura_value(arg0, arg1)
{
    var _ini_file = ossafe_ini_open("dr.ini");
    var _ini_value = ini_read_real("URA", string(arg0) + "_" + string(arg1), 0);
    ossafe_ini_close();
    return _ini_value;
}

function scr_set_ura_value(arg0, arg1, arg2)
{
    var _ini_file = ossafe_ini_open("dr.ini");
    var _ini_value = ini_write_real("URA", string(arg0) + "_" + string(arg1), arg2);
    ossafe_ini_close();
    return _ini_value;
}

function scr_store_ura_result(arg0, arg1, arg2)
{
    if (arg2 == 0)
        exit;
    
    var slot = arg1;
    
    if (slot > 2)
        slot -= 3;
    
    var current_result = scr_get_ura_value(arg0, slot);
    var new_result = arg2;
    
    if ((arg2 + current_result) == 3)
        new_result = 3;
    
    scr_set_ura_value(arg0, slot, new_result);
}

function scr_get_vhs_ini_value()
{
    var _ini_file = ossafe_ini_open("dr.ini");
    var _ini_value = ini_read_real("VHS", "watched", 0);
    ossafe_ini_close();
    return _ini_value;
}

function scr_set_vhs_ini_value(has_watched)
{
    var iniwrite = ossafe_ini_open("dr.ini");
    ini_write_real("VHS", "watched", has_watched);
    ossafe_ini_close();
}

function scr_save()
{
    scr_saveprocess(global.filechoice);
    filechoicebk2 = global.filechoice;
    global.filechoice = 9;
    scr_saveprocess(9);
    global.filechoice = filechoicebk2;
    iniwrite = ossafe_ini_open("dr.ini");
    ini_write_string(scr_ini_chapter(global.chapter, global.filechoice), "Name", global.truename);
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Level", global.lv);
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Love", global.llv);
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Time", global.time);
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Date", date_current_datetime());
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Room", scr_get_id_by_room_index(room));
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "InitLang", global.flag[912]);
    var uraboss = 0;
    
    if (global.chapter == 1)
    {
        if (global.flag[241] == 6)
            uraboss = 1;
        else if (global.flag[241] == 7)
            uraboss = 2;
    }
    else
    {
        uraboss = scr_get_secret_boss_result(global.chapter);
    }
    
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "UraBoss", uraboss);
    ini_write_string(scr_ini_chapter(global.chapter, global.filechoice), "Version", string(global.versionno));
    ossafe_ini_close();
    scr_store_ura_result(global.chapter, global.filechoice, uraboss);
    ossafe_ini_open("config_" + string(global.filechoice) + ".ini");
    
    for (i = 0; i < 10; i += 1)
        ini_write_real("KEYBOARD_CONTROLS", string(i), global.input_k[i]);
    
    for (i = 0; i < 10; i += 1)
        ini_write_real("GAMEPAD_CONTROLS", string(i), global.input_g[i]);
    
    ini_write_real("SHOULDERLB_REASSIGN", "SHOULDERLB_REASSIGN", 0/*obj_gamecontroller.gamepad_shoulderlb_reassign*/);
    ossafe_ini_close();
    ossafe_savedata_save();
}

function scr_saveprocess(arg0)
{
    global.lastsavedtime = global.time;
    global.lastsavedlv = global.lv;
    file = "filech" + string(global.chapter) + "_" + string(arg0);
    myfileid = ossafe_file_text_open_write(file);
    ossafe_file_text_write_string(myfileid, global.truename);
    ossafe_file_text_writeln(myfileid);
    
    if (global.is_console)
    {
        scr_ds_list_write(global.othername, 6);
        ossafe_file_text_writeln(myfileid);
    }
    else
    {
        for (i = 0; i < 6; i += 1)
        {
            ossafe_file_text_write_string(myfileid, global.othername[i]);
            ossafe_file_text_writeln(myfileid);
        }
    }
    
    ossafe_file_text_write_real(myfileid, global.char[0]);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.char[1]);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.char[2]);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.gold);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.xp);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.lv);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.inv);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.invc);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.darkzone);
    ossafe_file_text_writeln(myfileid);
    
    if (global.is_console)
    {
        var stats_amount = 5;
        scr_ds_list_write(global.hp, stats_amount);
        ossafe_file_text_writeln(myfileid);
        scr_ds_list_write(global.maxhp, stats_amount);
        ossafe_file_text_writeln(myfileid);
        scr_ds_list_write(global.at, stats_amount);
        ossafe_file_text_writeln(myfileid);
        scr_ds_list_write(global.df, stats_amount);
        ossafe_file_text_writeln(myfileid);
        scr_ds_list_write(global.mag, stats_amount);
        ossafe_file_text_writeln(myfileid);
        scr_ds_list_write(global.guts, stats_amount);
        ossafe_file_text_writeln(myfileid);
        scr_ds_list_write(global.charweapon, stats_amount);
        ossafe_file_text_writeln(myfileid);
        scr_ds_list_write(global.chararmor1, stats_amount);
        ossafe_file_text_writeln(myfileid);
        scr_ds_list_write(global.chararmor2, stats_amount);
        ossafe_file_text_writeln(myfileid);
        scr_ds_list_write(global.weaponstyle, stats_amount);
        ossafe_file_text_writeln(myfileid);
    }
    
    for (i = 0; i < 5; i += 1)
    {
        if (!global.is_console)
        {
            ossafe_file_text_write_real(myfileid, global.hp[i]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.maxhp[i]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.at[i]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.df[i]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.mag[i]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.guts[i]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.charweapon[i]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.chararmor1[i]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.chararmor2[i]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.weaponstyle[i]);
            ossafe_file_text_writeln(myfileid);
        }
        
        for (q = 0; q < 4; q += 1)
        {
            ossafe_file_text_write_real(myfileid, global.itemat[i][q]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.itemdf[i][q]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.itemmag[i][q]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.itembolts[i][q]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.itemgrazeamt[i][q]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.itemgrazesize[i][q]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.itemboltspeed[i][q]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.itemspecial[i][q]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.itemelement[i][q]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.itemelementamount[i][q]);
            ossafe_file_text_writeln(myfileid);
        }
        
        for (j = 0; j < 12; j += 1)
        {
            ossafe_file_text_write_real(myfileid, global.spell[i][j]);
            ossafe_file_text_writeln(myfileid);
        }
    }
    
    ossafe_file_text_write_real(myfileid, global.boltspeed);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.grazeamt);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.grazesize);
    ossafe_file_text_writeln(myfileid);
    
    if (global.is_console)
    {
        scr_ds_list_write(global.item, 13);
        ossafe_file_text_writeln(myfileid);
        scr_ds_list_write(global.keyitem, 13);
        ossafe_file_text_writeln(myfileid);
        scr_ds_list_write(global.weapon, 48);
        ossafe_file_text_writeln(myfileid);
        scr_ds_list_write(global.armor, 48);
        ossafe_file_text_writeln(myfileid);
        scr_ds_list_write(global.pocketitem, 72);
        ossafe_file_text_writeln(myfileid);
    }
    else
    {
        for (j = 0; j < 13; j += 1)
        {
            ossafe_file_text_write_real(myfileid, global.item[j]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.keyitem[j]);
            ossafe_file_text_writeln(myfileid);
        }
        
        for (j = 0; j < 48; j++)
        {
            ossafe_file_text_write_real(myfileid, global.weapon[j]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.armor[j]);
            ossafe_file_text_writeln(myfileid);
        }
        
        for (j = 0; j < 72; j++)
        {
            ossafe_file_text_write_real(myfileid, global.pocketitem[j]);
            ossafe_file_text_writeln(myfileid);
        }
    }
    
    ossafe_file_text_write_real(myfileid, global.tension);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.maxtension);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.lweapon);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.larmor);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.lxp);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.llv);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.lgold);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.lhp);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.lmaxhp);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.lat);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.ldf);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.lwstrength);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.ladef);
    ossafe_file_text_writeln(myfileid);
    
    if (global.is_console)
    {
        scr_ds_list_write(global.litem, 8);
        ossafe_file_text_writeln(myfileid);
        scr_ds_list_write(global.phone, 8);
        ossafe_file_text_writeln(myfileid);
        scr_ds_list_write(global.flag, 2500);
        ossafe_file_text_writeln(myfileid);
    }
    else
    {
        for (i = 0; i < 8; i += 1)
        {
            ossafe_file_text_write_real(myfileid, global.litem[i]);
            ossafe_file_text_writeln(myfileid);
            ossafe_file_text_write_real(myfileid, global.phone[i]);
            ossafe_file_text_writeln(myfileid);
        }
        
        for (i = 0; i < 2500; i += 1)
        {
            ossafe_file_text_write_real(myfileid, global.flag[i]);
            ossafe_file_text_writeln(myfileid);
        }
    }
    
    ossafe_file_text_write_real(myfileid, global.plot);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.currentroom);
    ossafe_file_text_writeln(myfileid);
    ossafe_file_text_write_real(myfileid, global.time);
    ossafe_file_text_close(myfileid);
}

function scr_load()
{
    snd_free_all();
    filechoicebk = global.filechoice;
    scr_gamestart();
    global.filechoice = filechoicebk;
    file = "filech" + string(global.chapter) + "_" + string(global.filechoice);
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
    
    audio_group_set_gain(1, global.flag[15], 0);
    audio_set_master_gain(0, global.flag[17]);
    var room_id = global.currentroom;
    
    if (room_id < 10000)
    {
        room_id = scr_get_id_by_room_index(global.currentroom);
        
        if (room_id == -1)
            room_id += (global.currentroom + (global.chapter * 10000));
        
        global.currentroom = room_id;
    }
    
    __loadedroom = scr_get_room_by_id(global.currentroom);
    
    //if (scr_dogcheck())
    //    __loadedroom = 83;
    
    scr_tempsave();
    
    if (global.is_console)
        global.tempflag[95] = 1;
    
    if (scr_debug())
    {
        if (room_exists(__loadedroom))
        {
            room_goto(__loadedroom);
        }
        else
        {
            snd_play(snd_error);
            print_message("LOAD FAILED: ROOM [" + string(__loadedroom) + "] DOESN'T EXIST");
        }
    }
    else
    {
        room_goto(__loadedroom);
    }
}

function scr_tempsave()
{
    filechoicebk2 = global.filechoice;
    global.filechoice = 9;
    scr_saveprocess(global.filechoice);
    global.filechoice = filechoicebk2;
}

function scr_ini_chapter(arg0, arg1)
{
    if (arg0 >= 2)
        return "G_" + string(arg0) + "_" + string(arg1);
    else
        return "G" + string(arg1);
}

function scr_get_room_by_id(arg0)
{
    var room_id = arg0;
    var rooms = scr_get_room_list();
    
    if (room_id < 10000)
        room_id += (global.chapter * 10000);
    
    var room_index = -1;
    
    for (var i = 0; i < array_length_1d(rooms); i++)
    {
        if (rooms[i].room_id == room_id)
        {
            room_index = rooms[i].room_index;
            break;
        }
    }
    
    if (room_index == -1)
    {
    }
    
    return room_index;
}

function scr_get_id_by_room_index(arg0)
{
    var room_index = arg0;
    var rooms = scr_get_room_list();
    var room_id = -1;
    
    for (var i = 0; i < array_length_1d(rooms); i++)
    {
        if (rooms[i].room_index == room_index)
        {
            room_id = rooms[i].room_id;
            break;
        }
    }
    
    if (room_id == -1)
    {
    }
    
    return room_id;
}

function scr_room(arg0, arg1) constructor
{
    room_index = arg0;
    room_id = arg1;
}

function scr_tempload() {
	filechoicebk3 = global.filechoice;
	global.filechoice = 9;
	scr_load();
	global.filechoice = filechoicebk3;
}