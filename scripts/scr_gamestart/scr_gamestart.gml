function scr_init_launch_parameters()
{
    var param_data = new launch_parameters();
    var p_num = parameter_count();
    
    if (p_num > 0)
    {
        for (var i = 0; i < p_num; i += 1)
        {
            var param = parameter_string(i + 1);
            
            if (param == "launcher")
            {
                param_data.is_launcher = true;
            }
            else if (string_pos("switch_", param) != 0)
            {
                var param_parts = string_split(param, "_");
                param_data.switch_id = real(param_parts[1]);
            }
        }
    }
    
    return param_data;
}

function launch_parameters() constructor
{
    is_launcher = false;
    switch_id = -1;
    returning = 0;
}

function get_chapter_switch_parameters()
{
    var launch_data = new launch_parameters();
    launch_data.is_launcher = global.launcher;
    
    //if (scr_is_switch_os() && variable_global_exists("switchlogin"))
    //    launch_data.switch_id = global.switchlogin;
    
    var parameters = [];
    parameters[0] = "launcher";
    parameters[1] = "switch_" + string(launch_data.switch_id);
    parameters[2] = "returning_" + string(global.chapter);
    var param_formatted = "";
    
    for (var i = 0; i < array_length(parameters); i++)
        param_formatted += (" " + string(parameters[i]));
    
    return param_formatted;
}


function scr_gamestart()
{
	__global_object_depths();
	global.main_font = fnt_main;
	global.mainbig_font = fnt_mainbig;
	
    global.darkzone = 1;
    global.filechoice = 0;
    global.plot = 0;
    global.truename = "";
    global.othername[0] = "";
    global.othername[1] = "";
    global.othername[2] = "";
    global.othername[3] = "";
    global.othername[4] = "";
    global.othername[5] = "";
    global.othername[6] = "";
    global.townname = " ";
    global.time = 0;
    global.fighting = 0;
	
    global.char[0] = DRCharacter.Kris;
    global.char[1] = DRCharacter.Susie;
    global.char[2] = DRCharacter.Ralsei;
	
	global.lang = "en";
	
    global.gold = 0;
    global.xp = 0;
    global.lv = 1;
    global.inv = 0;
    global.invc = 1;
    global.charselect = -1;
    global.encounterno = 1;
    global.specialbattle = 0;
    global.ambush = 0;
    global.tension = 0;
    global.maxtension = 250;
    
    for (i = 0; i < 3; i += 1)
    {
        global.heromakex[i] = 100;
        global.heromakey[i] = 200;
        global.charauto[i] = 0;
        global.charmove[i] = 0;
        global.charcantarget[i] = 0;
        global.chardead[i] = 0;
        global.invincible[i] = 1;
        global.charaction[i] = 0;
        global.faceaction[i] = 0;
        global.charcond[i] = 0;
    }
    
    global.item[0] = DRItem.None;
    global.item[1] = DRItem.None;
    global.item[2] = DRItem.None;
    global.item[3] = DRItem.None;
    global.item[4] = DRItem.None;
    global.item[5] = DRItem.None;
    global.item[6] = DRItem.None;
    global.item[7] = DRItem.None;
    global.item[8] = DRItem.None;
    global.item[9] = DRItem.None;
    global.item[10] = DRItem.None;
    global.item[11] = DRItem.None;
    global.item[12] = DRItem.None;
    
    for (i = 0; i < 72; i++)
        global.pocketitem[i] = DRItem.None;
    
    for (i = 0; i < 48; i++)
    {
        global.weapon[i] = DRWeapon.None;
        global.armor[i] = DRArmor.None;
    }
    
    global.keyitem[0] = DRKeyItem.CellPhone;
    global.keyitem[1] = DRKeyItem.None;
    global.keyitem[2] = DRKeyItem.None;
    global.keyitem[3] = DRKeyItem.None;
    global.keyitem[4] = DRKeyItem.None;
    global.keyitem[5] = DRKeyItem.None;
    global.keyitem[6] = DRKeyItem.None;
    global.keyitem[7] = DRKeyItem.None;
    global.keyitem[8] = DRKeyItem.None;
    global.keyitem[9] = DRKeyItem.None;
    global.keyitem[10] = DRKeyItem.None;
    global.keyitem[11] = DRKeyItem.None;
    global.keyitem[12] = DRKeyItem.None;
    
    for (i = 0; i < DRCharacter.__MAX__; i += 1)
    {
        global.hp[i] = 200;
        global.maxhp[i] = 250;
        global.at[i] = 10;
        global.df[i] = 2;
        global.mag[i] = 0;
        global.guts[i] = 0;
        global.charweapon[i] = DRWeapon.WoodBlade;
        global.chararmor1[i] = DRArmor.None;
        global.chararmor2[i] = DRArmor.None;
        global.weaponstyle[i] = 0;
        global.charname[i] = " ";
		global.charauto[i] = false;
        
        for (q = 0; q < 4; q += 1)
        {
            global.itemat[i][q] = 0;
            global.itemdf[i][q] = 0;
            global.itemmag[i][q] = 0;
            global.itembolts[i][q] = 0;
            global.itemgrazeamt[i][q] = 0;
            global.itemgrazesize[i][q] = 0;
            global.itemboltspeed[i][q] = 0;
            global.itemspecial[i][q] = 0;
            global.itemelement[i][q] = 0;
            global.itemelementamount[i][q] = 0;
        }
        
        for (j = 0; j < 12; j += 1)
            global.spell[i][j] = DRSpell.None;
    }
    
    global.boltspeed = 100;
    global.grazeamt = 100;
    global.grazesize = 100;
    
    for (i = 0; i < 9999; i += 1)
        global.flag[i] = 0;
    
    global.charweapon[0] = DRWeapon.None;
    global.chararmor1[0] = DRArmor.None;
    global.chararmor2[0] = DRArmor.None;
    global.hp[0] = 0;
    global.maxhp[0] = 0;
	
	for (i = 1; i < DRCharacter.__MAX__; i++) {
		scr_character_get_base_stats(i);
		
		global.hp[i] = __hp;
		global.maxhp[i] = __hp;
		for (si = 0; si < array_length(__spells); si++)
			global.spell[i][si] = __spells[si];
		global.at[i] = __atk;
		global.df[i] = __def;
		global.charweapon[i] = __weapon;
		global.chararmor1[i] = __armors[0];
		global.chararmor2[i] = __armors[1];
		global.guts[i] = __guts;
		
		if scr_character_has_magic(i)
			global.mag[i] = __mag;
	}
	
	scr_character_set_names();
    
	scr_weaponinfo_mine();
    scr_armorinfo_mine();
    scr_iteminfo_all();
    global.grazetotal = 0;
    global.grazeturn = 0;
    
    for (i = 0; i < 3; i += 1)
    {
        global.monstermakex[i] = 500;
        global.monstermakey[i] = 240;
        global.monsterinstancetype[i] = 2283728;
        global.monster[i] = 1;
        global.monstername[i] = "TERUTERUBOUZU";
        global.monstertype[i] = 1;
        global.monsterat[i] = 3;
        global.monsterdf[i] = 2;
        global.monsterhp[i] = 20;
        global.monstermaxhp[i] = 20;
        global.sparepoint[i] = 0;
        global.monsterattackname[i] = " ";
    }
    
    global.bmenuno = 0;
    
    for (i = 0; i < 20; i += 1)
    {
        for (j = 0; j < 20; j += 1)
            global.bmenucoord[i][j] = 0;
    }
    
    global.myfight = 0;
    global.mnfight = 0;
    draw_set_color(c_white);
    global.fc = 0;
    global.fe = 0;
    global.typer = 5;
    global.battletyper = 4;
    global.msg = " ";
    global.msc = 0;
    global.msgno = 0;
    
    for (i = 0; i < 10; i += 1)
    {
        global.writersnd[i] = snd_noise;
        global.writerimg[i] = spr_btact;
        global.writerobj[i] = obj_funnytext;
        global.writerobjsettinga[i] = 0;
        global.writerobjsettingb[i] = 0;
        global.writerobjx[i] = 0;
        global.writerobjy[i] = 0;
        global.smdir[i] = 90;
        global.smspeed[i] = 2;
        global.smsprite[i] = spr_smallface_s0;
        global.smalarm[i] = 20;
        global.smtype[i] = 0;
        global.smxx[i] = 100;
        global.smyy[i] = 110;
        global.smimage[i] = 0;
        global.smimagespeed[i] = 0;
        global.sminstance[i] = 4384738473;
        global.smcolor[i] = c_white;
        global.smstring[i] = " ";
    }
    
    global.smalarm[1] = 15;
    global.smyy[1] = 70;
    global.smxx[1] = 700;
    global.smdir[1] = 180;
    global.smspeed[1] = 40;
    global.smtype[1] = 3;
    global.smsprite[1] = 0;
    global.smcolor[1] = c_white;
    global.smstring[1] = " ";
    
    for (i = 0; i < 100; i += 1)
        global.msg[i] = "%%";
    
    global.msg[0] = " ";
    global.msg[1] = " ";
    global.msg[2] = " ";
    global.msg[3] = " ";
    global.msg[4] = " ";
    global.currentsong[0] = 0;
    global.currentsong[1] = 0;
    global.batmusic[0] = 0;
    global.batmusic[1] = 0;
    global.fc = 0;
    global.fe = 0;
    global.choice = -1;
    global.seriousbattle = 0;
    global.turntimer = 0;
    global.mnfight = 0;
    global.myfight = 0;
    global.interact = 0;
    global.entrance = 0;
    
    for (i = 0; i < 9; i += 1)
    {
        global.litem[i] = 0;
        global.litemname[i] = "";
        global.phone[i] = 0;
        global.phonename[i] = "";
    }
    
    for (i = 0; i < 20; i += 1)
        global.menucoord[i] = 0;
    
    for (i = 0; i < 100; i += 1)
        global.msg[i] = " ";
    
    global.choicemsg[0] = "Yes";
    global.choicemsg[1] = "No";
    global.choicemsg[2] = "Maybe";
    global.choicemsg[3] = "Don't know";
	
    global.litem[0] = DRLightItem.None;
	
    global.phone[0] = DRPhoneNumbers.Home;
	
    global.lcharname = "Kris";
    global.lweapon = DRLightItem.Pencil;
    global.larmor = DRLightItem.Bandage;
	
    global.lxp = 0;
    global.llv = 1;
    global.lgold = 2;
    global.lhp = 20;
    global.lmaxhp = 20;
    global.lat = 10;
    global.ldf = 10;
    global.lwstrength = 1;
    global.ladef = 0;
    global.facing = 0;
    global.flag[15] = 1;
    global.flag[16] = 0.85;
    global.flag[17] = 0.6;
    
    for (i = 0; i < 10; i += 1)
    {
        global.input_pressed[i] = 0;
        global.input_held[i] = 0;
        global.input_released[i] = 0;
    }
    
    global.flag[220] = choose(0, 1, 2, 3);
    global.flag[221] = choose(0, 1, 2, 3);
    global.flag[222] = choose(0, 1, 2, 3);
    global.flag[223] = floor(random(31));
    global.flag[224] = floor(random(31));
    global.flag[225] = floor(random(31));
    
    if (global.chapter >= 2)
    {
        global.flag[605] = 1;
        global.flag[606] = 1;
        global.flag[611] = 1;
        global.flag[613] = 1;
        global.flag[614] = 1;
        global.flag[615] = 1;
        global.flag[622] = 1;
        global.flag[623] = 1;
        global.flag[800] = 15;
        global.flag[801] = 5;
        global.flag[802] = 6;
        global.flag[803] = 5;
    }
    
    if (global.chapter >= 3)
    {
        global.flag[457] = 1;
        global.flag[632] = 1;
        global.flag[633] = 1;
        global.flag[636] = 1;
        global.flag[642] = 1;
        global.flag[654] = 1;
        global.flag[656] = 1;
        global.flag[657] = 1;
        global.flag[659] = 1;
        global.flag[660] = 1;
        global.flag[661] = 1;
    }
    
    scr_gamestart_chapter_override();
    audio_set_master_gain(0, global.flag[17]);
    global.cinstance[0] = 4854845464869464;
    global.cinstance[1] = 48548454648694644;
    global.cinstance[2] = 48548454648694649;
}