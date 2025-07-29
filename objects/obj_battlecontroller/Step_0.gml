if (victory == 1 && victoried == 0)
{
    global.faceaction[0] = 0;
    global.faceaction[1] = 0;
    global.faceaction[2] = 0;
    global.battleend = 1;
    global.mnfight = -1;
    global.myfight = 7;
    
    with (battlewriter)
        instance_destroy();
    
    with (obj_face)
        instance_destroy();
    
    with (obj_smallface)
        instance_destroy();
    
    for (i = 0; i < 5; i += 1)
    {
        if (global.hp[i] < 1)
            global.hp[i] = round(global.maxhp[i] / 8);
    }
    
    lastbattlewriter = 32482473284732;
    
    if (skipvictory == 0)
    {
        global.monstergold[3] += floor(global.tension / 10) * global.chapter;
        
        if (global.charweapon[1] == DRWeapon.Trefoil)
            global.monstergold[3] += floor(global.monstergold[3] / 20);
        
        global.monstergold[3] *= 1 + (scr_armorcheck_equipped_party(DRArmor.SilverCard) * 0.05);
        global.monstergold[3] *= 1 + (scr_armorcheck_equipped_party(DRArmor.Dealmaker) * 0.3);
        global.monstergold[3] = floor(global.monstergold[3]);
        
        if (global.flag[37] == 1)
            global.monstergold[3] = 0;
        
        global.gold += global.monstergold[3];
        global.xp += global.monsterexp[3];
        
        if (global.gold < 0)
            global.gold = 0;
        
        global.fc = 0;
        global.fe = 0;
        global.battlemsg[0] = stringsetsub("* You won^1!&* Got ~1 EXP and ~2 D$./%", string(global.monsterexp[3]), string(global.monstergold[3]));
        
        if (global.flag[37] == 1)
            global.battlemsg[0] = "* You won the battle!/%";
        
        if (global.flag[63] == 1)
        {
            var gainedstats = scr_levelup();
            
            if (gainedstats)
            {
                global.battlemsg[0] = stringsetsub("* You won^1!&* Got ~1 D$^1.&* You became stronger./%", string(global.monstergold[3]));
                
                //if (scr_havechar(DRCharacter.Noelle))
                //    global.battlemsg[0] = stringsetsub("* You won^1!&* Got ~1 D$^1.&* Noelle became stronger./%", string(global.monstergold[3]));
                
                var lvsnd = snd_play_pitch(snd_dtrans_lw, 2);
                snd_volume(lvsnd, 0.7, 0);
            }
        }
        
        global.battletyper = 4;
        global.msg[0] = global.battlemsg[0];
        global.typer = global.battletyper;
        lastbattlewriter = scr_battletext();
        
        if (global.flag[38] == 1)
        {
            with (lastbattlewriter)
                instance_destroy();
        }
        
        for (i = 0; i < 3; i += 1)
        {
            with (global.charinstance[i])
            {
                state = 7;
                hurt = 0;
                hurttimer = 0;
            }
        }
    }
    
    victoried = 1;
    victortimer = 0;
    
    if (skipvictory == 1)
        victortimer = -20;
    
    with (obj_tensionbar)
    {
        alarm[5] = 15;
        hspeed = -10;
        friction = -0.4;
    }
}

if (victoried == 1)
{
    victortimer += 1;
    
    if (i_ex(lastbattlewriter) == false && victortimer >= 10)
    {
        intro = 2;
        
        if (bp <= 0)
            scr_endcombat();
    }
}

if (global.myfight == 0)
{
    if (global.bmenuno == 0) // Default
    {
        var can_input = true;
        var play_battlemsg = true;
        
        if (((!i_ex(battlewriter) && play_battlemsg == true) || (global.chapter == 2 && !i_ex(battlewriter))) && play_battlemsg == true)
        {
            global.msg[0] = global.battlemsg[0];
            global.typer = global.battletyper;
            scr_battletext();
        }
        
        if (left_p() == 1 && lbuffer < 0 && can_input == true)
        {
            if (global.bmenucoord[0][global.charturn] == 0)
                global.bmenucoord[0][global.charturn] = 4;
            else
                global.bmenucoord[0][global.charturn] -= 1;
            
            movenoise = 1;
            rbuffer = 1;
            
            if (disablesusieact == 1 && global.charturn == 1 && global.bmenucoord[0][global.charturn] == 1)
                global.bmenucoord[0][global.charturn] = 0;
        }
        
        if (right_p() == 1 && rbuffer < 0 && can_input == true)
        {
            if (global.bmenucoord[0][global.charturn] == 4)
                global.bmenucoord[0][global.charturn] = 0;
            else
                global.bmenucoord[0][global.charturn] += 1;
            
            movenoise = 1;
            lbuffer = 1;
            
            if (disablesusieact == 1 && global.charturn == 1 && global.bmenucoord[0][global.charturn] == 1)
                global.bmenucoord[0][global.charturn] = 2;
        }
        
        if (button1_p() == 1 && rouxlserrorcon == 1 && dogcon < 1)
        {
        }
        else if (button1_p() == 1 && twobuffer < 0 && can_input == true)
        {
            onebuffer = 1;
            selnoise = 1;
			
			switch (global.bmenucoord[0][global.charturn]) {
				case 0: // FIGHT
					global.bmenuno = 1;
					break;
					
				case 1: // ACT / SPELL
					onebuffer = 1;
					global.bmenuno = scr_character_has_magic(global.char[global.charturn]) ? 2 : 11; // spells (2) vs acts (11)
					break;
					
				case 2: // ITEM
					if (tempitem[0][global.charturn] == 0) break;
					onebuffer = 1;
	                global.bmenuno = 4;
	                scr_iteminfo_temp(global.charturn);
                
	                for (i = 0; i < 12; i += 1)
	                {
	                    if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 0 && global.bmenucoord[4][global.charturn] > 0)
	                        global.bmenucoord[4][global.charturn] -= 1;
	                }
					break;
				
				case 3: // SPARE
					onebuffer = 1;
					global.bmenuno = 12;
					break;
					
				case 4: // DEFEND
					scr_tensionheal(40);
                
	                global.faceaction[global.charturn] = 4;
	                global.charaction[global.charturn] = 10;
	                scr_nexthero();
					break;
			}
        }
        
        if (button2_p() == 1 && onebuffer < 0 && global.charturn > 0)
        {
            twobuffer = 1;
            movenoise = 1;
            scr_prevhero();
        }
        
        with (battlewriter)
            depth = 3;
        
        with (obj_face)
            depth = 3;
        
        with (obj_smallface)
            depth = 3;
    }
    
    if (global.bmenuno == 2 && global.flag[34] == 1) // Spells
    {
        with (battlewriter)
            skipme = 1;
        
        with (battlewriter)
            depth = 10;
        
        with (obj_face)
            depth = 10;
        
        with (obj_smallface)
            depth = 10;
        
        thischar = global.char[global.charturn];
        
        if (right_p() || left_p())
        {
            cango = 1;
            spellcoord = global.bmenucoord[2][global.charturn];
            
            if (spellcoord < 11)
            {
                if (global.spell[thischar][global.bmenucoord[2][global.charturn] + 1] == 0)
                {
                    cango = 0;
                    
                    if ((spellcoord % 2) == 1 && spellcoord > 0)
                        global.bmenucoord[2][global.charturn] -= 1;
                }
            }
            else
            {
                global.bmenucoord[2][global.charturn] -= 1;
                cango = 0;
            }
            
            if (cango == 1)
            {
                if ((spellcoord % 2) == 0)
                    global.bmenucoord[2][global.charturn] += 1;
                else
                    global.bmenucoord[2][global.charturn] -= 1;
            }
        }
        
        if (down_p())
        {
            spellcoord = global.bmenucoord[2][global.charturn];
            cango = 1;
            
            if (spellcoord >= 10)
            {
                cango = 0;
            }
            else
            {
                if (global.spell[thischar][spellcoord + 2] == DRSpell.None)
                    cango = 0;
                
                if (spellcoord == 5 && global.spell[thischar][6] != DRSpell.None && global.spell[thischar][7] == DRSpell.None)
                    cango = 2;
            }
            
            if (cango != 0)
            {
                if (cango == 1)
                    global.bmenucoord[2][global.charturn] += 2;
                
                if (cango == 2)
                    global.bmenucoord[2][global.charturn] = 6;
            }
        }
        
        if (up_p())
        {
            spellcoord = global.bmenucoord[2][global.charturn];
            cango = 1;
            
            if (spellcoord <= 1)
                cango = 0;
            
            if (cango == 1)
                global.bmenucoord[2][global.charturn] -= 2;
        }
        
        global.tensionselect = global.spellcost[thischar][global.bmenucoord[2][global.charturn]];
        
        if (button1_p() && global.spell[thischar][global.bmenucoord[2][global.charturn]] != DRSpell.None && onebuffer < 0)
        {
            if (global.spellcost[thischar][global.bmenucoord[2][global.charturn]] <= global.tension)
            {
                onebuffer = 2;
                global.bmenuno = 0;
                selnoise = 1;
                scr_spellinfo(global.spell[thischar][global.bmenucoord[2][global.charturn]]);
                
                if (spelltarget == 0)
                    scr_spellconsumeb();
                
                if (spelltarget == 1)
                    global.bmenuno = 8;
                
                if (spelltarget == 2)
                    global.bmenuno = 3;
            }
        }
        
        if (button2_p() && onebuffer < 0)
        {
            global.tensionselect = 0;
            twobuffer = 1;
            global.bmenuno = 0;
            movenoise = 1;
        }
    }
    
    if (global.bmenuno == 2 && global.flag[34] == 0) // Spells (?)
    {
        with (battlewriter)
            skipme = 1;
        
        with (battlewriter)
            depth = 10;
        
        with (obj_face)
            depth = 10;
        
        with (obj_smallface)
            depth = 10;
        
        thischar = global.charturn;
        
        if (right_p() || left_p())
        {
            cango = 1;
            spellcoord = global.bmenucoord[2][global.charturn];
            
            if (spellcoord < 11)
            {
                if (global.battlespell[thischar][global.bmenucoord[2][global.charturn] + 1] == DRSpell.None)
                {
                    cango = 0;
                    
                    if ((spellcoord % 2) == 1 && spellcoord > 0)
                        global.bmenucoord[2][global.charturn] -= 1;
                }
            }
            else
            {
                global.bmenucoord[2][global.charturn] -= 1;
                cango = 0;
            }
            
            if (cango == 1)
            {
                if ((spellcoord % 2) == 0)
                    global.bmenucoord[2][global.charturn] += 1;
                else
                    global.bmenucoord[2][global.charturn] -= 1;
            }
        }
        
        if (down_p())
        {
            spellcoord = global.bmenucoord[2][global.charturn];
            cango = 1;
            
            if (spellcoord >= 10)
            {
                cango = 0;
            }
            else
            {
                if (global.battlespell[thischar][spellcoord + 2] == DRSpell.None)
                    cango = 0;
                
                if (spellcoord == 5 && global.battlespell[thischar][6] != DRSpell.None && global.battlespell[thischar][7] == DRSpell.None)
                    cango = 2;
            }
            
            if (cango != 0)
            {
                if (cango == 1)
                    global.bmenucoord[2][global.charturn] += 2;
                
                if (cango == 2)
                    global.bmenucoord[2][global.charturn] = 6;
            }
        }
        
        if (up_p())
        {
            spellcoord = global.bmenucoord[2][global.charturn];
            cango = 1;
            
            if (spellcoord <= 1)
                cango = 0;
            
            if (cango == 1)
                global.bmenucoord[2][global.charturn] -= 2;
        }
        
        global.tensionselect = global.battlespellcost[thischar][global.bmenucoord[2][global.charturn]];
        var _confirm = true;
        
        if (button1_p() && global.battlespell[thischar][global.bmenucoord[2][global.charturn]] != DRSpell.None && onebuffer < 0 && _confirm == true)
        {
            if (global.battlespellcost[thischar][global.bmenucoord[2][global.charturn]] <= global.tension)
            {
                onebuffer = 2;
                global.bmenuno = 0;
                selnoise = 1;
                
                if (global.battlespell[thischar][global.bmenucoord[2][global.charturn]] != -1)
                {
                    scr_spellinfo(global.battlespell[thischar][global.bmenucoord[2][global.charturn]]);
                    
                    if (spelltarget == 0)
                        scr_spellconsumeb();
                    
                    if (spelltarget == 1)
                        global.bmenuno = 8;
                    
                    if (spelltarget == 2)
                        global.bmenuno = 3;
                    
                    if (spelltarget == 3)
                        global.bmenuno = 99;
                }
                else
                {
                    global.bmenuno = 13;
                }
            }
        }
        
        if (button2_p() && onebuffer < 0)
        {
            global.tensionselect = 0;
            twobuffer = 1;
            global.bmenuno = 0;
            movenoise = 1;
        }
    }
    
    if (global.bmenuno == 4) // Items
    {
        with (battlewriter)
            skipme = 1;
        
        with (battlewriter)
            depth = 10;
        
        with (obj_face)
            depth = 10;
        
        with (obj_smallface)
            depth = 10;
        
        if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 0)
            global.bmenucoord[4][global.charturn] -= 1;
        
        if (right_p())
        {
            cango = 1;
            itemcoord = global.bmenucoord[4][global.charturn];
            
            if (itemcoord < 11)
            {
                if (tempitem[global.bmenucoord[4][global.charturn] + 1][global.charturn] == 0)
                {
                    cango = 0;
                    
                    if ((itemcoord % 2) == 1 && itemcoord > 0)
                        global.bmenucoord[4][global.charturn] -= 1;
                }
            }
            else
            {
                global.bmenucoord[4][global.charturn] -= 1;
                cango = 0;
            }
            
            if (cango == 1)
            {
                if ((itemcoord % 2) == 0)
                    global.bmenucoord[4][global.charturn] += 1;
                else
                    global.bmenucoord[4][global.charturn] -= 1;
            }
        }
        
        if (left_p())
        {
            cango = 1;
            itemcoord = global.bmenucoord[4][global.charturn];
            
            if (tempitem[1][global.charturn] != 0)
            {
                if ((itemcoord % 2) == 0)
                    global.bmenucoord[4][global.charturn] += 1;
                else
                    global.bmenucoord[4][global.charturn] -= 1;
            }
        }
        
        if (down_p())
        {
            itemcoord = global.bmenucoord[4][global.charturn];
            cango = 1;
            
            if (itemcoord >= 10)
            {
                cango = 0;
            }
            else
            {
                if (tempitem[itemcoord + 2][global.charturn] == 0)
                    cango = 0;
                
                if (itemcoord == 5 && tempitem[6][global.charturn] != 0 && tempitem[7][global.charturn] == 0)
                    cango = 2;
            }
            
            if (cango != 0)
            {
                if (cango == 1)
                    global.bmenucoord[4][global.charturn] += 2;
                
                if (cango == 2)
                    global.bmenucoord[4][global.charturn] = 6;
            }
        }
        
        if (up_p())
        {
            itemcoord = global.bmenucoord[4][global.charturn];
            cango = 1;
            
            if (itemcoord <= 1)
                cango = 0;
            
            if (cango == 1)
                global.bmenucoord[4][global.charturn] -= 2;
        }
        
        if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 0)
            global.bmenucoord[4][global.charturn] -= 1;
        
        if (button1_p() && tempitem[global.bmenucoord[4][global.charturn]][global.charturn] != 0 && onebuffer < 0)
        {
            onebuffer = 2;
            global.bmenuno = 0;
            selnoise = 1;
            scr_iteminfo(tempitem[global.bmenucoord[4][global.charturn]][global.charturn]);
            
            if (itemtarget == 0 || itemtarget == 2)
            {
                var item_use = false;
                var _tensionhealed = 0;
                
				// tension items here
                if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == DRItem.TensionBit)
                {
                    scr_tensionheal(80);
                    _tensionhealed = 1;
                    item_use = true;
                }
                
                if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == DRItem.TensionGem)
                {
                    scr_tensionheal(ceil(global.maxtension / 2));
                    _tensionhealed = 1;
                    item_use = true;
                }
                
                if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == DRItem.TensionMax)
                {
                    scr_tensionheal(ceil(global.maxtension));
                    _tensionhealed = 1;
                    item_use = true;
                }
                
                if (_tensionhealed)
                {
                    var _drivenoise = snd_play(snd_cardrive);
                    snd_pitch(_drivenoise, 1.4);
                    snd_volume(_drivenoise, 0.8, 0);
                    
                    with (global.charinstance[global.charturn])
                    {
                        ha = instance_create(x, y, obj_healanim);
                        ha.target = id;
                        ha.particlecolor = c_orange;
                    }
                    
                    scr_itemshift_temp(global.bmenucoord[4][global.charturn], global.charturn);
                    scr_nexthero();
                }
                
                if (!_tensionhealed)
                    scr_itemconsumeb();
            }
            
            if (itemtarget == 1)
                global.bmenuno = 7;
        }
        
        if (button2_p() && onebuffer < 0)
        {
            twobuffer = 1;
            global.bmenuno = 0;
            movenoise = 1;
        }
    }
    
    if (global.bmenuno == 9) // ACTs (from spell)
    {
        thisenemy = global.bmenucoord[11][global.charturn];
        scr_actinfo_temp(thisenemy);
        
        if (right_p())
        {
            cango = 1;
            actcoord = global.bmenucoord[9][global.charturn];
            
            if (actcoord < 5)
            {
                if (canact[global.bmenucoord[9][global.charturn] + 1] == 0)
                {
                    cango = 0;
                    
                    if ((actcoord % 2) == 1 && actcoord > 0)
                        global.bmenucoord[9][global.charturn] -= 1;
                }
            }
            else
            {
                global.bmenucoord[9][global.charturn] -= 1;
                cango = 0;
            }
            
            if (cango == 1)
            {
                if ((actcoord % 2) == 0)
                    global.bmenucoord[9][global.charturn] += 1;
                else
                    global.bmenucoord[9][global.charturn] -= 1;
            }
        }
        
        if (left_p())
        {
            cango = 1;
            actcoord = global.bmenucoord[9][global.charturn];
            
            if ((actcoord % 2) == 0)
            {
                if (canact[actcoord + 1] != 0)
                    global.bmenucoord[9][global.charturn] += 1;
            }
            else
            {
                global.bmenucoord[9][global.charturn] -= 1;
            }
        }
        
        if (down_p())
        {
            actcoord = global.bmenucoord[9][global.charturn];
            cango = 1;
            
            if (actcoord >= 4)
                cango = 0;
            else if (canact[actcoord + 2] == 0)
                cango = 0;
            
            if (cango != 0)
            {
                if (cango == 1)
                    global.bmenucoord[9][global.charturn] += 2;
            }
        }
        
        if (up_p())
        {
            actcoord = global.bmenucoord[9][global.charturn];
            cango = 1;
            
            if (actcoord <= 1)
                cango = 0;
            
            if (cango == 1)
                global.bmenucoord[9][global.charturn] -= 2;
        }
        
        global.tensionselect = acttpcost[global.bmenucoord[9][global.charturn]];
        canpress = 1;
        
        var _confirm = true;
        
        if (canpress == 1)
        {
            if (button1_p() && global.canact[global.char[global.charturn]][thisenemy][global.bmenucoord[9][global.charturn]] == 1 && global.tension >= global.tensionselect && _confirm && onebuffer < 0)
            {
                onebuffer = 2;
                global.bmenuno = 0;
                selnoise = 1;
                global.actingchoice[global.charturn] = global.bmenucoord[9][global.charturn];
                global.tension -= acttpcost[global.bmenucoord[9][global.charturn]];
                global.tensionselect = 0;
                scr_actselect(thisenemy, global.bmenucoord[9][global.charturn]);
                global.bmenucoord[9][global.charturn] = 0;
                scr_nexthero();
            }
        }
        
        if (button2_p() && onebuffer < 0)
        {
            global.bmenucoord[9][global.charturn] = 0;
            global.tensionselect = 0;
            twobuffer = 1;
            global.bmenuno = 11;
            movenoise = 1;
        }
    }
    
    if (global.bmenuno == 7 || global.bmenuno == 1 || global.bmenuno == 8 || global.bmenuno == 3 || global.bmenuno == 11 || global.bmenuno == 12 || global.bmenuno == 13)
    {
        with (battlewriter)
            skipme = 1;
        
        with (battlewriter)
            depth = 10;
        
        with (obj_face)
            depth = 10;
        
        with (obj_smallface)
            depth = 10;
        
        if (button2_p() && onebuffer < 0)
        {
            twobuffer = 1;
            
            if (global.bmenuno == 1 || global.bmenuno == 11 || global.bmenuno == 12)
                global.bmenuno = 0;
            
            if (global.bmenuno == 7)
                global.bmenuno = 4;
            
            if (global.bmenuno == 8 || global.bmenuno == 3 || global.bmenuno == 13)
                global.bmenuno = 2;
            
            movenoise = 1;
        }
        
        if (global.bmenuno == 7 || global.bmenuno == 1 || global.bmenuno == 8 || global.bmenuno == 3 || global.bmenuno == 11 || global.bmenuno == 12 || global.bmenuno == 13)
        {
            if (global.bmenuno == 7 || global.bmenuno == 8)
            {
                for (i = 0; i < 3; i += 1)
                {
                    ht[i] = 0;
                    
                    if (global.char[i] > 0)
                        ht[i] = 1;
                }
            }
            
            if (global.bmenuno == 1 || global.bmenuno == 3 || global.bmenuno == 11 || global.bmenuno == 12 || global.bmenuno == 13)
            {
                for (i = 0; i < 3; i += 1)
                    ht[i] = global.monster[i];
            }
            
            if (global.bmenucoord[global.bmenuno][global.charturn] == 2 && ht[2] == 0)
                global.bmenucoord[global.bmenuno][global.charturn] = 0;
            
            if (global.bmenucoord[global.bmenuno][global.charturn] == 0 && ht[0] == 0)
                global.bmenucoord[global.bmenuno][global.charturn] = 1;
            
            if (global.bmenucoord[global.bmenuno][global.charturn] == 1 && ht[1] == 0)
                global.bmenucoord[global.bmenuno][global.charturn] = 0;
            
            if (global.bmenucoord[global.bmenuno][global.charturn] == 0 && ht[0] == 0)
                global.bmenucoord[global.bmenuno][global.charturn] = 2;
            
            if (down_p() == 1)
            {
                if (global.bmenucoord[global.bmenuno][global.charturn] == 0)
                {
                    if (ht[1] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 1;
                    }
                    else if (ht[2] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 2;
                    }
                }
                else if (global.bmenucoord[global.bmenuno][global.charturn] == 1)
                {
                    if (ht[2] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 2;
                    }
                    else if (ht[0] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 0;
                    }
                }
                else if (global.bmenucoord[global.bmenuno][global.charturn] == 2)
                {
                    if (ht[0] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 0;
                    }
                    else if (ht[1] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 1;
                    }
                }
            }
            
            if (up_p() == 1)
            {
                if (global.bmenucoord[global.bmenuno][global.charturn] == 0)
                {
                    if (ht[2] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 2;
                    }
                    else if (ht[1] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 1;
                    }
                }
                else if (global.bmenucoord[global.bmenuno][global.charturn] == 1)
                {
                    if (ht[0] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 0;
                    }
                    else if (ht[2] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 2;
                    }
                }
                else if (global.bmenucoord[global.bmenuno][global.charturn] == 2)
                {
                    if (ht[1] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 1;
                    }
                    else if (ht[0] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 0;
                    }
                }
            }
            
            if (button1_p() && onebuffer < 0)
            {
                onebuffer = 1;
                selnoise = 1;
                
                if (global.bmenuno == 1)
                {
                    global.chartarget[global.charturn] = global.bmenucoord[global.bmenuno][global.charturn];
                    global.faceaction[global.charturn] = 1;
                    global.charaction[global.charturn] = 1;
                    scr_nexthero();
                }
                
                if (global.bmenuno == 7)
                {
                    global.chartarget[global.charturn] = global.bmenucoord[global.bmenuno][global.charturn];
                    scr_itemconsumeb();
                }
                
                if (global.bmenuno == 8 || global.bmenuno == 3)
                {
                    global.chartarget[global.charturn] = global.bmenucoord[global.bmenuno][global.charturn];
                    scr_spellconsumeb();
                }
                
                if (global.bmenuno == 11)
                {
                    global.bmenuno = 9;
                    actcoord = global.bmenucoord[9][global.charturn];
                    thisenemy = global.bmenucoord[11][global.charturn];
                    
                    for (i = 0; i < 6; i += 1)
                    {
                        if (global.canact[global.char[global.charturn]][thisenemy][actcoord] == 0)
                        {
                            if (actcoord > 0)
                                global.bmenucoord[9][global.charturn] -= 1;
                        }
                    }
                    
                    onebuffer = 1;
                }
                
                if (global.bmenuno == 12)
                {
                    global.faceaction[global.charturn] = 10;
                    global.chartarget[global.charturn] = global.bmenucoord[global.bmenuno][global.charturn];
                    global.charaction[global.charturn] = 2;
                    global.charspecial[global.charturn] = 100;
                    scr_nexthero();
                }
                
                if (global.bmenuno == 13)
                {
                    onebuffer = 2;
                    global.bmenuno = 0;
                    selnoise = 1;
                    global.actingchoice[global.charturn] = global.bmenucoord[2][global.charturn];
                    global.tension -= global.battlespellcost[thischar][global.bmenucoord[2][global.charturn]];
                    global.tensionselect = 0;
                    scr_actinfo_temp(global.bmenucoord[13][global.charturn]);
                    scr_actselect(global.bmenucoord[13][global.charturn], global.bmenucoord[2][global.charturn]);
                    scr_nexthero();
                }
            }
        }
    }
}

if (movenoise == 1)
{
    snd_play(snd_menumove);
    movenoise = 0;
}

if (grazenoise == 1)
{
    snd_play(snd_graze);
    grazenoise = 0;
}

if (selnoise == 1)
{
    snd_play(snd_select);
    selnoise = 0;
}

if (damagenoise == 1)
{
    snd_play(snd_damage);
    damagenoise = 0;
}

if (laznoise == 1)
{
    snd_play(snd_laz_c);
    laznoise = 0;
}

onebuffer -= 1;
twobuffer -= 1;
lbuffer -= 1;
rbuffer -= 1;

if (global.mnfight == 2 && timeron == 1)
{
    global.turntimer -= 1;
    
    if (global.turntimer <= 0 && reset == 0)
    {
        with (obj_bulletparent)
            instance_destroy();
        
        with (obj_bulletgenparent)
            instance_destroy();
        
        with (obj_darkener)
            darken = 0;
        
        with (obj_heart)
        {
            instance_create(x, y, obj_returnheart);
            instance_destroy();
        }
        
        reset = 1;
        
        if (noreturn == 0)
            alarm[2] = 15;
    }
}

if (global.myfight == 3)
{
    if (scr_monsterpop() == 0 && !instance_exists(obj_writer))
    {
        scr_combat_result();
        
        if (global.myfight == 3)
            scr_endturn();
    }
}

if (global.myfight == 5)
{
    myfightreturntimer--;
    
    if (myfightreturntimer <= 0)
    {
        scr_mnendturn();
        global.spelldelay = 10;
        
        with (obj_heroparent)
        {
            attacktimer = 0;
            image_index = 0;
            index = 0;
            itemed = 0;
            acttimer = 0;
            defendtimer = 0;
            state = 0;
            flash = 0;
            siner = 0;
            fsiner = 0;
            alarm[4] = -1;
        }
        
        with (obj_spellphase)
        {
            with (spellwriter)
                instance_destroy();
            
            instance_destroy();
        }
    }
}

if (global.charweapon[DRCharacter.Noelle] == DRWeapon.ThornRing)
{
    if ((t_siner % 6) == 0)
    {
        if (global.hp[DRCharacter.Noelle] > round(global.maxhp[DRCharacter.Noelle] / 3))
            global.hp[DRCharacter.Noelle]--;
    }
}

t_siner++;

if (scr_debug())
{
    scr_turn_skip();
    
    if (scr_debug_keycheck(vk_f2))
        scr_debug_fullheal();
    
    if (scr_debug_keycheck(vk_f3))
        scr_raise_party();
    
    if (scr_debug_keycheck(vk_f5))
        scr_wincombat();
    
    if (scr_debug_keycheck(vk_f6))
        scr_weaken_enemies();
    
    if (scr_debug_keycheck(vk_f8))
        scr_weaken_party(true);
    
    if (scr_debug_keycheck(vk_f9))
    {
        global.tension = 0;
        scr_debug_print("TP set to 0%");
    }
    
    if (scr_debug_keycheck(vk_f10))
    {
        global.tension = 250;
        scr_debug_print("TP maxed out!!");
    }
}

var dolose = false;

if (scr_debug())
{
    if (keyboard_check_pressed(vk_f11))
        dolose = true;
}