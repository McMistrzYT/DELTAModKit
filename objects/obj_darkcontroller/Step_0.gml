if (global.interact == 5) { // If Menu is Open
    charcon = true;
    
    if (global.submenu == 5 || global.submenu == 22) {
        global.charselect = global.submenucoord[global.submenu];
        global.faceaction[0] = 0;
        global.faceaction[1] = 0;
        global.faceaction[2] = 0;
        global.faceaction[global.charselect] = 7;
        
		var moveamt = 0
		
        if (left_p()) { // Go Left!
            movenoise = true;
            moveamt--
        }
        
        if (right_p()) { // Go Right!
            movenoise = true;
            moveamt++
        }
		if abs(moveamt) > 0 && chartotal > 0 {
			global.submenucoord[global.submenu] = scr_wrap_newer(global.submenucoord[global.submenu] + moveamt, 0, chartotal - 1)
		}
        
        if (button1_p() && onebuffer < 0 && twobuffer < 0) {
            onebuffer = 2;
            
            if (global.submenu == 5) {
                scr_itemuse(global.item[global.submenucoord[2]]);
                
                if (usable == true) {
                    //with (obj_event_manager)
                    //    trigger_event(TrophySystem.AwardTrophy, TrophySystem.TrophyItemCh3);
                }
                
                if (usable == 1 && replaceable == 0)
                    scr_itemshift(global.submenucoord[2], 0);
                else if (replaceable > 0)
                    global.item[global.submenucoord[2]] = replaceable;
                
                scr_itemdesc();
                global.submenu = 2;
                global.faceaction[global.charselect] = 0;
                global.charselect = -1;
            }
            
            if (global.submenu == 22) {
				// unused
				if script_exists(asset_get_index("scr_spell_overworld")) {
					scr_spell_overworld(global.spell[global.char[global.submenucoord[20]]][global.submenucoord[21]]);
	                global.tension -= global.spellcost[global.char[global.submenucoord[20]]][global.submenucoord[21]];
				} else {
					global.submenu = 21
					snd_play(snd_error)
				}
            }
        }
        
        close = 0;
        
        if (button2_p() && twobuffer < 0 && onebuffer < 0)
            close = 1;
        
        if (global.submenu == 22) {
            if (global.spellcost[global.char[global.submenucoord[20]]][global.submenucoord[21]] > global.tension)
                close = 1;
        }
        
        if (close == 1)
        {
            cancelnoise = 1;
            global.faceaction[global.charselect] = 0;
            global.charselect = -1;
            twobuffer = 2;
            
            if (global.submenu == 5)
                global.submenu = 2;
            
            if (global.submenu == 22)
                global.submenu = 21;
        }
    }
    
    if (global.submenu == 6 || global.submenu == 7 || global.menuno == 3) {
        global.charselect = 3;
        global.faceaction[0] = 7;
        global.faceaction[1] = 7;
        global.faceaction[2] = 7;
        
        if (button1_p() && onebuffer < 0 && global.submenu == 6) { } // Moved [Item Use]
        
        if (button1_p() && onebuffer < 0 && global.submenu == 7) { } // Moved [Item Toss]
        
        if (button1_p() && onebuffer < 0 && global.menuno == 3)
        {
            twobuffer = 2;
            onebuffer = 2;
            global.faceaction[0] = 0;
            global.faceaction[1] = 0;
            global.faceaction[2] = 0;
            global.charselect = -1;
            global.interact = 6;
            //scr_talkroom(); // this is unused lmao
            global.menuno = -1;
            charcon = 0;
        }
        
        if (button2_p() && twobuffer < 0)
        {
            cancelnoise = 1;
            twobuffer = 2;
            global.faceaction[0] = 0;
            global.faceaction[1] = 0;
            global.faceaction[2] = 0;
            
            if (global.submenu == 6) global.submenu = 2;            
            if (global.submenu == 7) global.submenu = 3;            
            if (global.menuno == 3) global.menuno = 0;
            
            global.charselect = -1;
        }
    }
    
    if (global.menuno == 5)
    {
        if (global.submenu == 30)
        {
            sndbuffer = 0;
            m_quit = 0;
            
            if (up_p())
            {
                movenoise = 1;
                global.submenucoord[30] -= 1;
                
                if (global.submenucoord[30] < 0)
                    global.submenucoord[30] = 0;
            }
            
            if (down_p())
            {
                movenoise = 1;
                global.submenucoord[30] += 1;
                
                if (global.submenucoord[30] > 6)
                    global.submenucoord[30] = 6;
            }
            
            if (button1_p() && onebuffer < 0)
            {
                upbuffer = 2;
                downbuffer = 2;
                onebuffer = 2;
                twobuffer = 2;
                selectnoise = 1;
                
                if (global.submenucoord[30] == 0)
                    global.submenu = 33;
                
                if (global.submenucoord[30] == 1)
                {
                    global.submenu = 35;
                    global.submenucoord[35] = 0;
                    control_select_con = 0;
                    control_flash_timer = 0;
                }
                
                if (global.submenucoord[30] == 2)
                {
                    if (global.flag[8] == 0)
                        global.flag[8] = 1;
                    else
                        global.flag[8] = 0;
                }
                
                if (global.is_console)
                {
                    if (global.submenucoord[30] == 3)
                    {
                        if (global.flag[11] == 0)
                            global.flag[11] = 1;
                        else
                            global.flag[11] = 0;
                    }
                    
                    if (global.submenucoord[30] == 4)
                    {
                        if (global.disable_border)
                        {
                            selectnoise = 0;
                        }
                        else
                        {
                            global.submenu = 36;
                            check_border = 1;
                            border_select = 0;
                        }
                    }
                    
                    if (global.submenucoord[30] == 5)
                        global.submenu = 34;
                    
                    if (global.submenucoord[30] == 6)
                    {
                        m_quit = 1;
                        cancelnoise = 1;
                    }
                }
                else
                {
                    if (global.submenucoord[30] == 3)
                    {
                        with (obj_time)
                            fullscreen_toggle = 1;
                    }
                    
                    if (global.submenucoord[30] == 4)
                    {
                        if (global.flag[11] == 0)
                            global.flag[11] = 1;
                        else
                            global.flag[11] = 0;
                    }
                    
                    if (global.submenucoord[30] == 5)
                        global.submenu = 34;
                    
                    if (global.submenucoord[30] == 6)
                    {
                        m_quit = 1;
                        cancelnoise = 1;
                    }
                }
            }
            
            if (button2_p() && twobuffer < 0)
            {
                m_quit = 1;
                cancelnoise = 1;
            }
            
            if (m_quit == 1)
            {
                onebuffer = 2;
                twobuffer = 2;
                global.menuno = 0;
                global.submenu = 0;
            }
        }
        
        if (global.submenu == 31 || global.submenu == 32 || global.submenu == 33)
        {
            se_select = 0;
            sndbuffer -= 1;
            muschange = 0;
            sndchange = 0;
            audchange = 0;
            
            if (right_h())
            {
                if (global.submenu == 31)
                {
                    sndchange = 1;
                    
                    if (global.flag[15] < 1)
                        global.flag[15] += 0.05;
                }
                
                if (global.submenu == 32)
                {
                    muschange = 1;
                    
                    if (global.flag[16] < 1)
                        global.flag[16] += 0.05;
                }
                
                if (global.submenu == 33)
                {
                    if (global.flag[17] < 1)
                        global.flag[17] += 0.02;
                    
                    audchange = 1;
                }
            }
            
            if (left_h())
            {
                if (global.submenu == 31)
                {
                    sndchange = 1;
                    
                    if (global.flag[15] > 0)
                        global.flag[15] -= 0.05;
                }
                
                if (global.submenu == 32)
                {
                    muschange = 1;
                    
                    if (global.flag[16] > 0)
                        global.flag[16] -= 0.05;
                }
                
                if (global.submenu == 33)
                {
                    audchange = 1;
                    
                    if (global.flag[17] >= 0.02)
                        global.flag[17] -= 0.02;
                }
            }
            
            if (sndchange == 1 && sndbuffer < 0)
            {
                audio_group_set_gain(1, global.flag[15], 0);
                snd_play(snd_noise);
                sndbuffer = 2;
            }
            
            if (muschange == 1)
            {
                if (snd_is_playing(global.currentsong[1]))
                    mus_volume(global.currentsong[1], getmusvol * global.flag[16], 0);
            }
            
            if (audchange == 1 && sndbuffer < 0)
            {
                snd_play(snd_noise);
                sndbuffer = 2;
                audio_set_master_gain(0, global.flag[17]);
            }
            
            if (button1_p() && onebuffer < 0)
                se_select = 1;
            
            if (button2_p() && twobuffer < 0)
                se_select = 1;
            
            if (se_select == 1)
            {
                selectnoise = 1;
                onebuffer = 2;
                twobuffer = 2;
                global.submenu = 30;
            }
        }
        
        if (global.submenu == 34)
        {
            global.submenucoord[34]++;
            
            if (global.submenucoord[34] == 1)
            {
                snd_free_all();
                var lastfade = instance_create(camerax(), cameray(), obj_fadeout);
                lastfade.fadespeed = 0.05;
                lastfade.x = camerax() - 20;
                lastfade.y = cameray() - 20;
                lastfade.image_xscale *= 3;
                lastfade.image_yscale *= 2;
                lastfade.depth = -900000;
                
                //with (obj_border_controller)
                //    hide_border(0.05);
            }
            
            if (global.submenucoord[34] >= 50)
                game_restart_true();
        }
        
        if (global.submenu == 35)
        {
            control_select_timer = 0;
            control_flash_timer -= 1;
            controls_quitmenu = 0;
            
            if (!global.is_console)
            {
                gamepad_exists = false;// obj_gamecontroller.gamepad_active;
                gamepad_id = 0;
            }
            
            if (control_select_con == 1)
            {
                gamepad_accept = -1;
                new_gamepad_key = -1;
                key_accept = -1;
                new_key = -1;
                
                if (!global.is_console)
                {
                    if (sunkus_kb_check_pressed(1))
                    {
                        for (var i = 48; i <= 90; i += 1)
                        {
                            if (sunkus_kb_check_pressed(i))
                            {
                                new_key = i;
                                control_select_con = 2;
                            }
                        }
                        
                        if (sunkus_kb_check_pressed(59))
                        {
                            new_key = 59;
                            control_select_con = 2;
                        }
                        
                        if (sunkus_kb_check_pressed(44))
                        {
                            new_key = 44;
                            control_select_con = 2;
                        }
                        
                        if (sunkus_kb_check_pressed(46))
                        {
                            new_key = 46;
                            control_select_con = 2;
                        }
                        
                        if (sunkus_kb_check_pressed(47))
                        {
                            new_key = 47;
                            control_select_con = 2;
                        }
                        
                        if (sunkus_kb_check_pressed(92))
                        {
                            new_key = 92;
                            control_select_con = 2;
                        }
                        
                        if (sunkus_kb_check_pressed(93))
                        {
                            new_key = 93;
                            control_select_con = 2;
                        }
                        
                        if (sunkus_kb_check_pressed(91))
                        {
                            new_key = 91;
                            control_select_con = 2;
                        }
                        
                        if (sunkus_kb_check_pressed(96))
                        {
                            new_key = 96;
                            control_select_con = 2;
                        }
                        
                        if (sunkus_kb_check_pressed(45))
                        {
                            new_key = 45;
                            control_select_con = 2;
                        }
                        
                        if (sunkus_kb_check_pressed(61))
                        {
                            new_key = 61;
                            control_select_con = 2;
                        }
                        
                        if (sunkus_kb_check_pressed(37))
                        {
                            new_key = 37;
                            control_select_con = 2;
                        }
                        
                        if (sunkus_kb_check_pressed(39))
                        {
                            new_key = 39;
                            control_select_con = 2;
                        }
                        
                        if (sunkus_kb_check_pressed(38))
                        {
                            new_key = 38;
                            control_select_con = 2;
                        }
                        
                        if (sunkus_kb_check_pressed(40))
                        {
                            new_key = 40;
                            control_select_con = 2;
                        }
                        
                        if (sunkus_kb_check_pressed(8))
                        {
                            new_key = 8;
                            control_select_con = 2;
                        }
                        
                        if (sunkus_kb_check_pressed(18))
                        {
                            new_key = 18;
                            control_select_con = 2;
                        }
                        
                        if (os_type == os_windows)
                        {
                            if (string(keyboard_key) == "91" || string(keyboard_key) == "92")
                            {
                                new_key = -1;
                                control_select_con = 0;
                            }
                        }
                        
                        if (sunkus_kb_check_pressed(13))
                        {
                            new_key = -1;
                            control_select_con = 0;
                        }
                        
                        if (sunkus_kb_check_pressed(16))
                        {
                            new_key = -1;
                            control_select_con = 0;
                        }
                        
                        if (sunkus_kb_check_pressed(17))
                        {
                            new_key = -1;
                            control_select_con = 0;
                        }
                        
                        if (sunkus_kb_check_pressed(27))
                        {
                            new_key = -1;
                            control_select_con = 0;
                        }
                    }
                }
                
                /*if (obj_gamecontroller.gamepad_active && control_select_con == 1)
                {
                    for (var i = 0; i < array_length(gamepad_controls); i++)
                    {
                        if (gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gamepad_controls[i]))
                        {
                            new_gamepad_key = gamepad_controls[i];
                            control_select_con = 2;
                        }
                    }
                }*/
            }
            
            if (button1_p() && control_select_con == 0 && onebuffer < 0)
            {
                onebuffer = 2;
                
                if (global.submenucoord[35] < 7)
                {
                    control_select_con = 1;
                    keyboard_lastkey = -1;
                    selectnoise = 1;
                }
                
                if (global.submenucoord[35] == 7)
                {
                    snd_play(snd_levelup);
                    scr_controls_default();
                    control_flash_timer = 10;
                }
                
                if (global.submenucoord[35] == 8)
                {
                    cancelnoise = 1;
                    controls_quitmenu = 1;
                }
            }
            
            if (control_select_con == 0)
            {
                if (down_p() && controls_quitmenu == 0 && downbuffer < 0)
                {
                    if (global.submenucoord[35] < 8)
                    {
                        global.submenucoord[35] += 1;
                        movenoise = 1;
                    }
                }
                
                if (up_p() && controls_quitmenu == 0 && upbuffer < 0)
                {
                    if (global.submenucoord[35] > 0)
                    {
                        global.submenucoord[35] -= 1;
                        movenoise = 1;
                    }
                }
                
                if (button1_p() && controls_quitmenu == 0 && onebuffer < 2)
                {
                    onebuffer = 2;
                    twobuffer = 2;
                }
            }
            
            if (control_select_con == 2)
            {
                if (new_key != -1)
                {
                    dupe = -1;
                    
                    for (var i = 0; i < 7; i += 1)
                    {
                        if (global.input_k[i] == new_key)
                            dupe = i;
                    }
                    
                    if (dupe >= 0)
                        global.input_k[dupe] = global.input_k[global.submenucoord[35]];
                    
                    global.input_k[global.submenucoord[35]] = new_key;
                    entercancel = -1;
                    shiftcancel = -1;
                    ctrlcancel = -1;
                    
                    for (var i = 0; i < 7; i += 1)
                    {
                        if (global.input_k[i] == vk_enter)
                        {
                            global.input_k[7] = -1;
                            entercancel = 1;
                        }
                        
                        if (global.input_k[i] == vk_shift)
                        {
                            global.input_k[8] = -1;
                            shiftcancel = 1;
                        }
                        
                        if (global.input_k[i] == vk_control)
                        {
                            global.input_k[9] = -1;
                            ctrlcancel = 1;
                        }
                    }
                    
                    if (entercancel == -1)
                        global.input_k[7] = vk_enter;
                    
                    if (shiftcancel == -1)
                        global.input_k[8] = vk_shift;
                    
                    if (ctrlcancel == -1)
                        global.input_k[9] = vk_control;
                }
                else
                {
                    dupe = -1;
                    
                    //if (new_gamepad_key == gp_shoulderlb)
                    //    obj_gamecontroller.gamepad_shoulderlb_reassign = 1;
                    
                    for (var i = 0; i < 7; i += 1)
                    {
                        if (global.input_g[i] == new_gamepad_key)
                            dupe = i;
                    }
                    
                    if (dupe >= 0)
                        global.input_g[dupe] = global.input_g[global.submenucoord[35]];
                    
                    global.input_g[global.submenucoord[35]] = new_gamepad_key;
                    
                    /*if (global.is_console || (i_ex(obj_gamecontroller) && obj_gamecontroller.gamepad_active))
                    {
                        global.button0 = global.input_g[4];
                        global.button1 = global.input_g[5];
                        global.button2 = global.input_g[6];
                    }*/
                }
                
                upbuffer = 2;
                downbuffer = 2;
                onebuffer = 2;
                twobuffer = 2;
                selectnoise = 1;
                control_select_con = 0;
            }
            
            if (controls_quitmenu == 1)
            {
                selectnoise = 1;
                onebuffer = 2;
                twobuffer = 2;
                ini_open("config_" + string(global.filechoice) + ".ini");
                
                for (var i = 0; i < 10; i += 1)
                    ini_write_real("KEYBOARD_CONTROLS", string(i), global.input_k[i]);
                
                for (var i = 0; i < 10; i += 1)
                    ini_write_real("GAMEPAD_CONTROLS", string(i), global.input_g[i]);
                
                ini_write_real("SHOULDERLB_REASSIGN", "SHOULDERLB_REASSIGN", 0/*obj_gamecontroller.gamepad_shoulderlb_reassign*/);
                ini_close();
                controls_quitmenu = 0;
                control_select_con = 0;
                global.submenucoord[35] = 0;
                global.submenu = 30;
            }
        }
        
        if (global.is_console && global.submenu == 36)
        {
            if (right_p())
            {
                if (selected_border < (array_length(border_options) - 1))
                {
                    selected_border++;
                    check_border = 1;
                }
            }
            
            if (left_p())
            {
                if (selected_border > 0)
                {
                    selected_border--;
                    check_border = 1;
                }
            }
            
            if (check_border == 1)
            {
                var _border = border_options[selected_border];
                
                if (_border == border_options[2])
                    scr_enable_screen_border(false);
                else
                    scr_enable_screen_border(true);
                
                global.screen_border_id = border_options[selected_border];
                global.tempflag[95] = 1;
                
                //with (obj_border_controller)
                //    init_border();
                
                check_border = 0;
            }
            
            if (button1_p() && onebuffer < 0)
                border_select = 1;
            
            if (button2_p() && twobuffer < 0)
                border_select = 1;
            
            if (border_select == 1)
            {
                onebuffer = 2;
                twobuffer = 2;
                ossafe_ini_open("config_" + string(global.filechoice) + ".ini");
                ini_write_string("BORDER", "TYPE", global.screen_border_id);
                ossafe_ini_close();
                ossafe_savedata_save();
                control_select_con = 0;
                global.submenu = 30;
            }
        }
    }
    
    if (global.menuno == 4)
    {
        if (global.submenu == 21)
        {
            charcoord = global.char[global.submenucoord[20]];
            
            if (up_p())
            {
                if (global.submenucoord[21] > 0)
                {
                    global.submenucoord[21] -= 1;
                    movenoise = 1;
                }
            }
            
            if (down_p())
            {
                if (global.submenucoord[21] < 5)
                {
                    if (global.spell[charcoord][global.submenucoord[21] + 1] != DRSpell.None)
                    {
                        global.submenucoord[21] += 1;
                        movenoise = 1;
                    }
                }
            }
            
            if (button1_p() && onebuffer < 0)
            {
                if (global.spellusable[charcoord][global.submenucoord[21]] == 1 && global.tension >= global.spellcost[charcoord][global.submenucoord[21]])
                {
                    if (global.spelltarget[charcoord][global.submenucoord[21]] == 1)
                    {
                        global.submenu = 22;
                        onebuffer = 2;
                        twobuffer = 2;
                    }
                }
                else
                {
                }
            }
            
            if (button2_p() && twobuffer < 0)
            {
                cancelnoise = 1;
                deschaver = 0;
                onebuffer = 2;
                twobuffer = 2;
                global.submenucoord[21] = 0;
                global.submenu = 20;
            }
        }
        
        if (global.submenu == 20)
        {
            if (left_p())
            {
                movenoise = 1;
                global.submenucoord[20] -= 1;
                
                if (global.submenucoord[20] < 0)
                    global.submenucoord[20] = chartotal - 1;
                
                if (chartotal >= 2)
                    dograndom = ceil(random(100));
            }
            
            if (right_p())
            {
                movenoise = 1;
                global.submenucoord[20] += 1;
                
                if (global.submenucoord[20] > (chartotal - 1))
                    global.submenucoord[20] = 0;
                
                if (chartotal >= 2)
                    dograndom = ceil(random(100));
            }
            
            global.charselect = global.submenucoord[20];
            
            if (button1_p() && onebuffer < 0)
            {
                selectnoise = 1;
                deschaver = 1;
                global.submenu = 21;
                onebuffer = 2;
            }
            
            if (button2_p() && twobuffer < 0)
            {
                cancelnoise = 1;
                twobuffer = 2;
                global.menuno = 0;
                global.submenu = 0;
                global.charselect = -1;
            }
        }
    }
    
    if (global.menuno == 1) {        
		var menudata = _itemmenuslist[global.submenucoord[1]]
		var menu = menudata.name
        var currentsubmenu = global.submenu
			
        if (global.submenu == 1){
			var moveamt = 0
            if (left_p()){
                moveamt -= 1;
                movenoise = 1;
            }
            
            if (right_p()){
                moveamt += 1;
                movenoise = 1;
            }
			
			if abs(moveamt) > 0 {
				global.submenucoord[1] = scr_wrap_newer(global.submenucoord[1] + moveamt, 0, _itemmenussize - 1)
			}
            
            if (button1_p()) {
                global.submenu = 2;
                global.submenucoord[global.submenu] = 0
                
                onebuffer = 3;
                
                menudata.init()
            }
            
            if (button2_p() && onebuffer < 0 && twobuffer < 0)
            {
                cancelnoise = 1;
                twobuffer = 2;
                global.menuno = 0;
                global.submenu = 0;
                global.charselect = -1;
            }
        }
	
		if (global.submenu == 2) {
            forcecloseitemmenu = 0
            var moveamt = $0
            
            var pos = global.submenucoord[2]
            var side = floor(pos % 2)
            
            var inputted = 0
            
            if right_p() { inputted = 1; moveamt += side == 0 ? 1 : -1; side *= -1 }
            if left_p()  { inputted = 1; moveamt += side == 0 ? 1 : -1; side *= -1 }
            if up_p()    {
                inputted = 1 
                moveamt -= 2
                if menudata.getvariable(pos + moveamt) <= 0 {
                    moveamt += 14
                }
                
            }
            
            if down_p()                 { 
                inputted = 1 
                moveamt += 2
                if menudata.getvariable(pos + moveamt) <= 0 {
                    moveamt = -pos
                    moveamt += side
                }
            }
            
            if (button1_p() && onebuffer < 0) {
                onebuffer = 2;
                twobuffer = 1;
                with menudata {
                    slot = global.submenucoord[2]
                    hovereditemdata = iteminfo(getvariable(slot))
                    usable = hovereditemdata.usable
                    button1()
                }
            }
            
            if inputted movenoise = 1
            
            _updatemenupos = 0
            
            if abs(moveamt) > 0 {
                _updatemenupos = 1
                pos += moveamt
            }
            
            if currentsubmenu != global.submenu || menudata.getvariable(pos) == 0 _updatemenupos = 1
            
            if _updatemenupos {
                while menudata.getvariable(pos) <= 0 {
                    if pos <= 0 { // Failed
                        forcecloseitemmenu = 1
                        break
                    }
                    pos--
                }
                global.submenucoord[2] = pos
            }
            
            if (button2_p() && twobuffer < 0) || forcecloseitemmenu {
                cancelnoise = 1;
                twobuffer = 2;
                deschaver = 0;
                global.submenu = 1;
            }
            
        }
    }
	
	if (global.menuno == 2)
    {
        if (global.submenu == 12 || global.submenu == 13 || global.submenu == 14)
        {
            _up_pressed = 0;
            
            if (up_h())
            {
                if (up_p())
                    _up_pressed = 1;
                
                hold_up += 1;
                
                if (hold_up >= 8)
                {
                    _up_pressed = 1;
                    hold_up = 6;
                }
                
                if (_up_pressed == 1)
                {
                    if (global.submenucoord[global.submenu] > 0)
                    {
                        global.submenucoord[global.submenu] -= 1;
                        movenoise = 1;
                    }
                    
                    if (global.submenu == 12)
                    {
                        if (global.submenucoord[global.submenu] < pagemax[0])
                        {
                            pagemax[0] -= 1;
                            movenoise = 1;
                        }
                    }
                    
                    if (global.submenu == 13 || global.submenu == 14)
                    {
                        if (global.submenucoord[global.submenu] < pagemax[1])
                        {
                            movenoise = 1;
                            pagemax[1] -= 1;
                        }
                    }
                }
            }
            else
            {
                hold_up = 0;
            }
            
            _down_pressed = 0;
            
            if (down_h())
            {
                if (down_p() == 1)
                    _down_pressed = 1;
                
                hold_down += 1;
                
                if (hold_down >= 8){
                    _down_pressed = 1;
                    hold_down = 6;
                }
                
                var __equipmenumax = (INVENTORYMAX_ARMORANDWEAPONS - 1);
                
                if (global.submenucoord[global.submenu] < __equipmenumax && _down_pressed == 1){
                    movenoise = 1;
                    
                    if (global.submenu == 12) nextone = global.weapon[global.submenucoord[global.submenu + 1]];
                    if (global.submenu == 13 || global.submenu == 14) nextone = global.armor[global.submenucoord[global.submenu + 1]];
                    
                    global.submenucoord[global.submenu] += 1;
                    
                    if (global.submenu == 12)
                    {
                        if (global.submenucoord[global.submenu] > (pagemax[0] + 5) && pagemax[0] < __equipmenumax)
                        {
                            pagemax[0] += 1;
                            movenoise = 1;
                        }
                    }
                    
                    if (global.submenu == 13 || global.submenu == 14)
                    {
                        if (global.submenucoord[global.submenu] > (pagemax[1] + 5) && pagemax[1] < __equipmenumax)
                        {
                            pagemax[1] += 1;
                            movenoise = 1;
                        }
                    }
                }
            }
            else
            {
                hold_down = 0;
            }
            
            if (button1_p() && onebuffer < 0)
            {
                onebuffer = 5;
                canequip = 0;
                wwho = global.char[global.submenucoord[10]];
                wmsg = " ";
                
                if (global.submenu == 12)
                {
                    scr_weaponinfo(global.weapon[global.submenucoord[global.submenu]]);
                    
					wmsg = wmessagetemp[wwho];
					canequip = weaponchartemp[wwho] == true;
                }
                
                if (global.submenu == 13 || global.submenu == 14)
                {
                    scr_armorinfo(global.armor[global.submenucoord[global.submenu]]);
                    
					wmsg = amessagetemp[wwho];
					canequip = armorchartemp[wwho] == true;
                }
                
                if (canequip == 1)
                {
                    hold_up = 0;
                    hold_down = 0;
                    snd_play(snd_equip);
                    
                    if (global.submenu == 12)
                    {
                        oldequip = global.charweapon[wwho];
                        newequip = global.weapon[global.submenucoord[global.submenu]];
                        global.charweapon[wwho] = newequip;
                        global.weapon[global.submenucoord[global.submenu]] = oldequip;
                        scr_weaponinfo_mine();
                        scr_weaponinfo_all();
                        twobuffer = 2;
                        global.submenu = 11;
                    }
                    
                    if (global.submenu == 13 || global.submenu == 14)
                    {
                        if (global.submenu == 13)
                            oldequip = global.chararmor1[wwho];
                        
                        if (global.submenu == 14)
                            oldequip = global.chararmor2[wwho];
                        
                        newequip = global.armor[global.submenucoord[global.submenu]];
                        
                        if (global.submenu == 13)
                            global.chararmor1[wwho] = newequip;
                        
                        if (global.submenu == 14)
                            global.chararmor2[wwho] = newequip;
                        
                        global.armor[global.submenucoord[global.submenu]] = oldequip;
                        scr_armorinfo_mine();
                        scr_armorinfo_all();
                        
                        if (wwho == 3 && newequip == 26)
                        {
                            if (global.flag[1037] < 15)
                                global.flag[1037]++;
                        }
                        
                        twobuffer = 2;
                        scr_dmenu_armor_selection_match();
                        global.submenu = 11;
                        
                        if (newequip != 0)
                        {
                            //with (obj_event_manager)
                            //    trigger_event(GameEvent.Zero, GameEvent.Sixteen);
                        }
                    }
                }
                else
                {
                    snd_play(snd_cantselect);
                }
                
                scr_itemcomment(global.submenucoord[10], wmsg);
            }
            
            if (button2_p() && twobuffer < 0)
            {
                cancelnoise = 1;
                hold_up = 0;
                hold_down = 0;
                twobuffer = 2;
                scr_dmenu_armor_selection_match();
                global.submenu = 11;
            }
        }
        
        if (global.submenu == 11)
        {
            if (up_p())
            {
                movenoise = 1;
                global.submenucoord[11] -= 1;
                
                if (global.submenucoord[11] == -1)
                    global.submenucoord[11] = 2;
            }
            
            if (down_p())
            {
                movenoise = 1;
                global.submenucoord[11] += 1;
                
                if (global.submenucoord[11] == 3)
                    global.submenucoord[11] = 0;
            }
            
            if (button1_p() && onebuffer < 0)
            {
                selectnoise = 1;
                onebuffer = 2;
                global.submenu = 12 + global.submenucoord[11];
                scr_dmenu_armor_selection_match();
            }
            
            if (button2_p() && twobuffer < 0)
            {
                cancelnoise = 1;
                deschaver = 0;
                twobuffer = 2;
                global.submenu = 10;
            }
        }
        
        if (global.submenu == 10)
        {
            if (left_p())
            {
                movenoise = 1;
                global.submenucoord[10] -= 1;
                
                if (global.submenucoord[10] < 0)
                    global.submenucoord[10] = chartotal - 1;
            }
            
            if (right_p())
            {
                movenoise = 1;
                global.submenucoord[10] += 1;
                
                if (global.submenucoord[10] > (chartotal - 1))
                    global.submenucoord[10] = 0;
            }
            
            global.charselect = global.submenucoord[10];
            
            if (button1_p() && onebuffer < 0)
            {
                selectnoise = 1;
                deschaver = 1;
                global.submenucoord[11] = 0;
                global.submenu = 11;
                onebuffer = 2;
            }
            
            if (button2_p() && twobuffer < 0)
            {
                cancelnoise = 1;
                twobuffer = 2;
                global.menuno = 0;
                global.submenu = 0;
                global.charselect = -1;
            }
        }
    }
    
    if (global.menuno == 0)
    {
        global.submenu = 0;
        
        if (left_p())
        {
            if (global.menucoord[0] == 0)
            {
                global.menucoord[0] = 4;
                movenoise = 1;
            }
            else
            {
                global.menucoord[0] -= 1;
                
                if (global.menucoord[0] == 2)
                    global.menucoord[0] -= 1;
                
                movenoise = 1;
            }
        }
        
        if (right_p())
        {
            if (global.menucoord[0] == 4)
            {
                global.menucoord[0] = 0;
                movenoise = 1;
            }
            else
            {
                global.menucoord[0] += 1;
                
                if (global.menucoord[0] == 2)
                    global.menucoord[0] += 1;
                
                movenoise = 1;
            }
        }
        
        if (button1_p() && onebuffer < 0 && twobuffer < 0)
        {
            selectnoise = 1;
            onebuffer = 2;
            global.menuno = global.menucoord[0] + 1;
            
            if (global.menuno == 1)
            {
				if _itemmenussize > 0 global.submenu = 1; else snd_play(snd_error)
                global.submenucoord[1] = 0;
                global.submenucoord[2] = 0;
                global.submenucoord[3] = 0;
                global.submenucoord[4] = 0;
            }
            
            if (global.menuno == 2)
            {
                scr_weaponinfo_all();
                scr_armorinfo_all();
                scr_weaponinfo_mine();
                scr_armorinfo_mine();
                global.submenucoord[10] = 0;
                global.submenucoord[11] = 0;
                global.submenucoord[12] = 0;
                global.submenucoord[13] = 0;
                global.submenucoord[14] = 0;
                pagemax[0] = 0;
                pagemax[1] = 0;
                global.submenu = 10;
                global.charselect = global.submenucoord[10];
            }
            
            if (global.menuno == 3)
                global.menuno = 0;
            
            if (global.menuno == 4)
            {
                global.submenu = 20;
                scr_spellinfo_all();
            }
            
            if (global.menuno == 5)
            {
                global.submenu = 30;
                global.submenucoord[30] = 0;
            }
        }
        
        close = false;
        if (button2_p() && twobuffer < 0) close = true;
        if (button3_p() && threebuffer < 0) close = true;
        
        if (close == true) {
            if (global.menuno == 0) {
                global.menuno = -1;
                global.interact = 0;
                charcon = 0;
                deschaver = 0;
                
                with (obj_mainchara) {
                    threebuffer = 2;
                    twobuffer = 2;
                }
            }
        }
    }
}

if (global.interact == 6 && !instance_exists(obj_dialoguer)) // If State == MenuTextbox without any Textboxes, Free Kris from their Prison of standing still.
	global.interact = false;

if (charcon == true) {
    drawchar = true; // Render Character Bar
    bpy = 60; // Set Target Character Bar y
    tpy = 80; // Set Target TensionBar Y
    
    if (global.interact == 5) {
        if (tp < (tpy - 1)) {
            if ((tpy - tp) <= 40)
                tp += round((tpy - tp) / 2.5);
            else
                tp += 30;
        }
        else tp = tpy;
    }
    
    if (bp < (bpy - 1)) { // Slide Chars Onscreen
        if ((bpy - bp) <= 40)
            bp += round((bpy - bp) / 2.5);
        else
            bp += 30;
    }
    else bp = bpy;
}

if (charcon == false) {
    if (tp > 0) { // If TP Bar is Visible (Despite DMK having that ability commented out) Slide out of View
        if (tp >= 80)
            tp -= round(tp / 2.5);
        else
            tp -= 30;
    } else  tp = 0;
    
    if (bp > 0) { // Slide CharBar offscreen
        if (bp >= 40)
            bp -= round(bp / 2.5);
        else
            bp -= 30;
    } else bp = 0;
    
    if (bp == 0) drawchar = false;
}

if (movenoise == true) {
    snd_play(snd_menumove);
    movenoise = false;
}

if (selectnoise == true) {
    snd_play(snd_select);
    selectnoise = false;
}

if (cancelnoise == true) {
    snd_play(snd_smallswing);
    cancelnoise = false;
}

onebuffer -= 1;
twobuffer -= 1;
threebuffer -= 1;
upbuffer -= 1;
downbuffer -= 1;