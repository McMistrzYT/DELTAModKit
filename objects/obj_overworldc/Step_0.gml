hasitems = global.litem[0] != DRLightItem.None;

if (global.interact == 5)
{
    currentmenu = global.menuno;
    
    if (global.menuno < 6)
        currentspot = global.menucoord[global.menuno];
    
    if (button1_p())
    {
        if (global.menuno == 5)
        {
            if (global.menucoord[5] == 0)
            {
                global.menuno = 9;
                script_execute(scr_litemuseb, global.menucoord[1], global.litem[global.menucoord[1]]);
            }
            
            if (global.menucoord[5] == 1)
            {
                global.menuno = 9;
                script_execute(scr_litemdesc, global.litem[global.menucoord[1]]);
                script_execute(scr_writetext, 0, "x", 0, 0);
            }
            
            if (global.menucoord[5] == 2)
            {
                dontthrow = 0;
                dontthrowtype = 0;
                global.menuno = 9;
                
                if (global.litem[global.menucoord[1]] == DRLightItem.BallOfJunk)
                    dontthrow = 1;
                
                if (global.litem[global.menucoord[1]] == DRLightItem.Cards)
                {
                    dontthrow = 1;
                    dontthrowtype = 1;
                }
                
                if (global.litem[global.menucoord[1]] == DRLightItem.Glass)
                {
                    dontthrow = 1;
                    dontthrowtype = 2;
                }
                
                var is_weapon_type = get_weapon_by_lw_id(global.litem[global.menucoord[1]]) != -4;
                
                if (is_weapon_type)
                {
                    dontthrow = 1;
                    dontthrowtype = 3;
                }
                
                if (dontthrow == 0)
                {
                    i = round(random(30));
                    
                    if (i == 0)
                        global.msg[0] = stringsetsub("* You bid a quiet farewell to the ~1.", global.litemname[global.menucoord[1]]);
                    
                    if (i == 1)
                        global.msg[0] = stringsetsub("* You put the ~1 on the ground and gave it a little pat.", global.litemname[global.menucoord[1]]);
                    
                    if (i == 2)
                        global.msg[0] = stringsetsub("* You threw the ~1 on the ground like the piece of trash it is.", global.litemname[global.menucoord[1]]);
                    
                    if (i == 3)
                        global.msg[0] = stringsetsub("* You abandoned the ~1.", global.litemname[global.menucoord[1]]);
                    
                    if (i > 3)
                        global.msg[0] = stringsetsub("* The ~1 was thrown away.", global.litemname[global.menucoord[1]]);
                    
                    global.msg[0] += "/%";
                    
                    if (global.litem[global.menucoord[1]] == DRLightItem.Egg)
                    {
                        global.msg[0] = "* What Egg?/%";
                        
                        if (global.flag[263] == 0)
                            global.flag[263] = 1;
                    }
                    
                    script_execute(scr_writetext, 0, "x", 0, 0);
                    script_execute(scr_litemshift, global.menucoord[1], 0);
                }
                
                if (dontthrow == 1)
                {
                    if (dontthrowtype == 0)
                    {
                        global.msc = 10;
                        scr_text(global.msc);
                        script_execute(scr_writetext, 10, "x", 0, 0);
                    }
                    else if (dontthrowtype == 1)
                    {
                        msgset(0, "* (You fumbled and caught them^1. You can't throw these away!)/%");
                        script_execute(scr_writetext, 0, "x", 0, 0);
                    }
                    else if (dontthrowtype == 2)
                    {
                        msgset(0, "* (For some reason you felt like if you throw it away...)/");
                        msgnext("* (It would be like throwing away someone's..^1. ???)/");
                        msgnext("* (..^1. But you didn't fully understand it.)/%");
                        script_execute(scr_writetext, 0, "x", 0, 0);
                    }
                    else if (dontthrowtype == 3)
                    {
                        msgset(0, "* (Recently, seems like weapons can't be thrown away so easily.)/%");
                        script_execute(scr_writetext, 0, "x", 0, 0);
                    }
                }
            }
        }
        
        if (global.menuno == 3)
        {
            global.menuno = 9;
            script_execute(scr_litemuseb, global.menucoord[3], global.phone[global.menucoord[3]]);
        }
        
        if (global.menuno == 1)
        {
            global.menuno = 5;
            global.menucoord[5] = 0;
        }
        
        if (global.menuno == 0)
            global.menuno += (global.menucoord[0] + 1);
        
        if (global.menuno == 3)
        {
            if (global.chapter == 4 && global.plot >= 67)
            {
                scr_speaker("no_name");
                msgset(0, "* (You checked your phone's contacts and recent dials.)/");
                msgnext("* (..^1. but everything has been deleted.)/%");
                d_make();
                global.menuno = 9;
            }
            else
            {
                script_execute(scr_phonename);
                global.menucoord[3] = 0;
            }
        }
        
        if (global.menuno == 1)
        {
            if (global.litem[0] != DRLightItem.None)
            {
                global.menucoord[1] = 0;
                script_execute(scr_litemname);
            }
            else
            {
                global.menuno = 0;
            }
        }
    }
    
    if (up_p())
    {
        if (global.menuno == 0)
        {
            if (global.menucoord[0] != 0)
                global.menucoord[0] -= 1;
        }
        
        if (global.menuno == 1)
        {
            if (global.menucoord[1] != 0)
                global.menucoord[1] -= 1;
        }
        
        if (global.menuno == 3)
        {
            if (global.menucoord[3] != 0)
                global.menucoord[3] -= 1;
        }
    }
    
    if (down_p())
    {
        if (global.menuno == 0)
        {
            if (global.menucoord[0] != 2)
                global.menucoord[0] += 1;
        }
        
        if (global.menuno == 1)
        {
            if (global.menucoord[1] != 7)
            {
                if (global.litem[global.menucoord[1] + 1] != 0)
                    global.menucoord[1] += 1;
            }
        }
        
        if (global.menuno == 3)
        {
            if (global.menucoord[3] != 7)
            {
                if (global.phone[global.menucoord[3] + 1] != 0)
                    global.menucoord[3] += 1;
            }
        }
    }
    
    if (button2_p() && buffer >= 0)
    {
        if (global.menuno == 0)
        {
            global.menuno = -1;
            global.interact = 0;
        }
        else if (global.menuno <= 3)
        {
            global.menuno = 0;
        }
        
        if (global.menuno == 5)
            global.menuno = 1;
    }
    
    if (right_p())
    {
        if (global.menuno == 5)
        {
            if (global.menucoord[5] != 2)
                global.menucoord[5] += 1;
        }
    }
    
    if (left_p())
    {
        if (global.menuno == 5)
        {
            if (global.menucoord[5] != 0)
                global.menucoord[5] -= 1;
        }
    }
    
    if (button3_p() && threebuffer <= 0)
    {
        if (global.menuno == 0)
        {
            global.menuno = -1;
            global.interact = 0;
            
            with (obj_mainchara)
                threebuffer = 2;
        }
    }
    
    if (currentmenu < global.menuno && global.menuno != 9)
    {
        selnoise = 1;
    }
    else if (global.menuno >= 0 && global.menuno < 6)
    {
        if (currentspot != global.menucoord[global.menuno])
            movenoise = 1;
    }
}

if (global.menuno == 9 && instance_exists(obj_dialoguer) == false)
{
    global.menuno = -1;
    global.interact = 0;
}

if (selnoise == 1)
{
    snd_play(snd_select);
    selnoise = 0;
}

if (movenoise == 1)
{
    snd_play(snd_menumove);
    movenoise = 0;
}

/*if (scr_debug())
{
    if (sunkus_kb_check_pressed(83))
        instance_create(0, 0, obj_savemenu);
    
    if (sunkus_kb_check_pressed(70))
        room_speed = 58;
    
    if (sunkus_kb_check_pressed(76))
        scr_load();
    
    if (sunkus_kb_check_pressed(82) && sunkus_kb_check(8))
        game_restart_true();
    
    if (sunkus_kb_check_pressed(82))
    {
        room_restart();
        global.interact = 0;
    }
}*/

threebuffer--;
