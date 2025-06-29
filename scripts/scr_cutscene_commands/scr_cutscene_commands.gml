function scr_cutscene_make() {
	_cutscene_master = instance_create(0, 0, obj_cutscene_master);
	_cutscene_master.master_object = id;
	show_debug_message("i maded :+1:");
	return _cutscene_master;
}

function scr_cutscene_commands()
{
	show_debug_message("CUTSCENE COMMANDS: Now processing '" + _c + "'!!");
	
    if (_c == "delaycmd")
    {
        delaycmd = instance_create(0, 0, obj_cutscene_delaycmd);
        delaycmd.master_object = master_object;
        delaycmd.command_actor[0] = command_actor[i];
        delaycmd.alarm[0] = command_arg1[i];
        delaycmd._c = command_arg2[i];
        delaycmd.command_arg1[0] = command_arg3[i];
        delaycmd.command_arg2[0] = command_arg4[i];
        delaycmd.command_arg3[0] = command_arg5[i];
        delaycmd.command_arg4[0] = command_arg6[i];
        
        if (instant)
        {
            delaycmd.alarm[0] = 0;
            delaycmd.instant = 1;
            
            with (delaycmd)
                event_user(0);
        }
    }
    
    if (_c == "walk")
    {
        if (!instant)
        {
            actor_move = instance_create(0, 0, obj_move_actor);
            actor_move.target = command_actor[i];
            actor_move.direction_word = command_arg1[i];
            actor_move.speed = command_arg2[i];
            actor_move.time = command_arg3[i];
            
            with (actor_move)
                event_user(8);
        }
        else
        {
            command_actor[i].x += lengthdir_x(command_arg2[i] * command_arg3[i], (scr_facing_letter_to_number(command_arg1[i]) * 90) - 90);
            command_actor[i].y += lengthdir_y(command_arg2[i] * command_arg3[i], (scr_facing_letter_to_number(command_arg1[i]) * 90) - 90);
        }
    }
    
    if (_c == "walkto")
    {
        var _object = command_arg1[i];
        var _tx = _object.x + command_arg2[i];
        var _ty = _object.y + command_arg3[i];
        
        if (command_arg5[i] == true && command_arg6[i] == true)
        {
            var _yyoff1 = command_actor[i].sprite_height - command_actor[i].sprite_yoffset;
            var _yyoff2 = _object.sprite_height - _object.sprite_yoffset;
            var _xxoff1 = (command_actor[i].sprite_width / 2) - command_actor[i].sprite_xoffset;
            var _xxoff2 = (_object.sprite_width / 2) - _object.sprite_xoffset;
            _ty += (_yyoff2 - _yyoff1);
            _tx += (_xxoff1 - _xxoff2);
        }
        else if (command_arg5[i] == true && command_arg6[i] == false)
        {
            _tx -= ((command_actor[i].sprite_width / 2) - command_actor[i].sprite_xoffset);
            _ty -= (command_actor[i].sprite_height - command_actor[i].sprite_yoffset);
        }
        
        command_arg1[i] = _tx;
        command_arg2[i] = _ty;
        command_arg3[i] = command_arg4[i];
        _c = "walkdirect";
    }
    
    if (_c == "walkdirect")
    {
        if (!instant)
        {
            actor_move = instance_create(0, 0, obj_move_to_point);
            actor_move.target = command_actor[i];
            actor_move.movex = command_arg1[i];
            actor_move.movey = command_arg2[i];
            
            if (command_arg1[i] == 0)
                actor_move.movex = command_actor[i].x;
            
            if (command_arg2[i] == 0)
                actor_move.movey = command_actor[i].y;
            
            if (command_arg3[i] >= 0)
            {
                actor_move.movemax = command_arg3[i];
            }
            else
            {
                var __walktime = point_distance(command_actor[i].x, command_actor[i].y, command_arg1[i], command_arg2[i]) / -command_arg3[i];
                
                if (__walktime < 1)
                    __walktime = 1;
                
                actor_move.movemax = __walktime;
                
                if (command_arg4[i] == 1)
                {
                    cs_wait_amount = ceil(__walktime);
                    
                    if (instant)
                        cs_wait_amount = 1;
                    
                    cs_wait_timer = 0;
                    waiting = 1;
                    breakme = 1;
                }
            }
        }
        else
        {
            command_actor[i].x = command_arg1[i];
            command_actor[i].y = command_arg2[i];
        }
    }
    
    if (_c == "msgset")
        msgset(command_arg1[i], command_arg2[i]);
    
    if (_c == "msgnext")
        msgnext(command_arg1[i]);
    
    if (_c == "talk")
    {
        if (!instant)
        {
			// i dread dialogue in this game
            mydialoguer = instance_create(0, 0, obj_dialoguer);
            
            if (msgside >= 0)
                mydialoguer.side = msgside;
            
            if (stay)
                mydialoguer.stay = stay;
            
            if (runcheck)
                mydialoguer.runcheck = runcheck;
            
            if (preventcskip)
                mydialoguer.preventcskip = preventcskip;
            
            mydialoguer.zurasu = zurasu;
            stay = 0;
        }
    }
    
    //if (_c == "msgface")
    //  scr_anyface(command_arg1[i], command_arg2[i], command_arg3[i]);
    
    //if (_c == "msgfacenext")
    //    scr_anyface_next(command_arg1[i], command_arg2[i]);
    
    if (_c == "msgside")
    {
        if (command_arg1[i] == "any")
            msgside = -1;
        
        if (command_arg1[i] == "top")
            msgside = 0;
        
        if (command_arg1[i] == "bottom")
            msgside = 1;
        
        if (command_arg1[i] == "zurasuon")
            zurasu = 1;
        
        if (command_arg1[i] == "zurasuoff")
            zurasu = 0;
    }
    
    if (_c == "msgstay")
        stay = command_arg1[i];
    
    if (_c == "msgruncheck")
        runcheck = command_arg1[i];
    
    if (_c == "msgpreventcskip")
        preventcskip = command_arg1[i];
    
    if (_c == "emote")
    {
        if (!instant)
        {
            command_actor[i].__arg0 = command_arg1[i];
            command_actor[i].__arg1 = command_arg2[i];
            command_actor[i].__arg2 = command_arg3[i];
            command_actor[i].__arg3 = command_arg4[i];
            
            if (command_arg3[i] == 0)
            {
                with (command_actor[i])
                    scr_emote(__arg0, __arg1);
            }
            else
            {
                with (command_actor[i])
                    scr_emote(__arg0, __arg1, __arg2, __arg3);
            }
        }
    }
    
    if (_c == "speaker")
        scr_speaker(command_arg1[i]);
    
    if (_c == "fe") // fein fein fein fein fein
    {
        global.fe = command_arg1[i];
        
        if (command_arg2[i] != -2)
            global.fc = command_arg2[i];
    }
    
    if (_c == "msc")
    {
        global.msc = command_arg1[i];
        scr_text(global.msc);
    }
    
    if (_c == "instancecreate")
    {
        _instance = instance_create(command_arg1[i], command_arg2[i], command_arg3[i]);
        
        if (i_ex(master_object))
            master_object.cutscene_instance = _instance;
    }
    
    if (_c == "varadd")
    {
        __chosenid = 0;
        
        if (command_arg1[i] == 0)
            __chosenid = command_actor[i];
        else
            __chosenid = command_arg1[i];
        
        var _varstart = variable_instance_get(__chosenid, command_arg2[i]);
        
        if (command_arg5[i] == 0)
        {
            command_arg3[i] = _varstart + command_arg3[i];
        }
        else
        {
            command_arg3[i] += _varstart;
            command_arg4[i] += _varstart;
        }
        
        _c = "var";
    }
    
    if (_c == "varto")
    {
        __chosenid = 0;
        
        if (command_arg1[i] == 0)
            __chosenid = command_actor[i];
        else
            __chosenid = command_arg1[i];
        
        command_arg3[i] = variable_instance_get(__chosenid, command_arg2[i]);
        _c = "var";
    }
    
    if (_c == "var")
    {
        if (instant)
        {
            if (command_arg5[i] != 0)
            {
                command_arg3[i] = command_arg4[i];
                command_arg5[i] = 0;
            }
        }
        
        __chosenid = 0;
        
        if (command_arg1[i] == 0)
            __chosenid = command_actor[i];
        else
            __chosenid = command_arg1[i];
        
        if (command_arg5[i] == 0)
        {
            variable_instance_set(__chosenid, command_arg2[i], command_arg3[i]);
        }
        else if (command_arg6[i] == 0)
        {
            scr_lerpvar_instance(__chosenid, command_arg2[i], command_arg3[i], command_arg4[i], command_arg5[i]);
        }
        else if (!is_string(command_arg6[i]))
        {
            scr_lerpvar_instance(__chosenid, command_arg2[i], command_arg3[i], command_arg4[i], command_arg5[i], command_arg6[i], "in");
        }
        else
        {
            var __easetype = real(string_digits(command_arg6[i]));
            
            if (string_char_at(command_arg6[i], 1) == "-")
            {
                __easetype *= -1;
                command_arg6[i] = string_delete(command_arg6[i], 1, 1);
            }
            
            command_arg6[i] = string_delete(command_arg6[i], 1, 1);
            scr_lerpvar_instance(__chosenid, command_arg2[i], command_arg3[i], command_arg4[i], command_arg5[i], __easetype, command_arg6[i]);
        }
    }
    
    if (_c == "script")
    {
        if (command_arg3[i] != -10)
        {
            var __sarg1 = command_arg2[i];
            var __sarg2 = command_arg3[i];
            var __sarg3 = command_arg4[i];
            var __sarg4 = command_arg5[i];
            var __sarg5 = command_arg6[i];
            var __sarg_counted = 3;
            
            if (command_arg4[i] == -3.14)
                __sarg_counted--;
            
            if (command_arg5[i] == -3.14)
                __sarg_counted--;
            
            if (command_arg6[i] == -3.14)
                __sarg_counted--;
            
            if (command_arg3[i] == 0)
            {
                if (__sarg_counted == 0)
                {
                    with (command_arg1[i])
                        script_execute(__sarg1);
                }
                
                if (__sarg_counted == 1)
                {
                    with (command_arg1[i])
                        script_execute(__sarg1, __sarg3);
                }
                
                if (__sarg_counted == 2)
                {
                    with (command_arg1[i])
                        script_execute(__sarg1, __sarg3, __sarg4);
                }
                
                if (__sarg_counted == 3)
                {
                    with (command_arg1[i])
                        script_execute(__sarg1, __sarg3, __sarg4, __sarg5);
                }
            }
            else
            {
                if (__sarg_counted == 0)
                {
                    with (command_arg1[i])
                        scr_script_repeat(__sarg1, -1, __sarg2);
                }
                
                if (__sarg_counted == 1)
                {
                    with (command_arg1[i])
                        scr_script_repeat(__sarg1, -1, __sarg2, __sarg3);
                }
                
                if (__sarg_counted == 2)
                {
                    with (command_arg1[i])
                        scr_script_repeat(__sarg1, -1, __sarg2, __sarg3, __sarg4);
                }
                
                if (__sarg_counted == 3)
                {
                    with (command_arg1[i])
                        scr_script_repeat(__sarg1, -1, __sarg2, __sarg3, __sarg4, __sarg5);
                }
            }
        }
        else
        {
            var __commandtarget = command_arg1[i];
            var __commandscript = command_arg2[i];
            
            with (obj_script_delayed)
            {
                if (script == __commandscript && target == __commandtarget)
                {
                    instance_destroy();
                    alarm[0] = -5;
                    max_time = -300;
                }
            }
        }
    }
    
    if (_c == "globalvar")
        variable_global_set(command_arg1[i], command_arg2[i]);
    
    if (_c == "autowalk")
    {
        command_actor[i].auto_facing = command_arg1[i];
        command_actor[i].auto_walk = command_arg1[i];
    }
    
    if (_c == "autofacing")
        command_actor[i].auto_facing = command_arg1[i];
    
    if (_c == "autodepth")
        command_actor[i].auto_depth = command_arg1[i];
    
    if (_c == "depth")
        command_actor[i].depth = command_arg1[i];
    
    if (_c == "depthobject")
        command_actor[i].depth = command_arg1[i].depth + command_arg2[i];
    
    if (_c == "flip")
    {
        command_actor[i].__flipvalue = command_arg1[i];
        
        with (command_actor[i])
            scr_flip(__flipvalue);
    }
    
    if (_c == "facing")
    {
        if (command_arg1[i] == "l" || command_arg1[i] == "d" || command_arg1[i] == "r" || command_arg1[i] == "u")
        {
            scr_actor_facing(command_actor[i], command_arg1[i]);
        }
        else
        {
            command_actor[i]._setfacing = command_arg1[i];
            
            with (command_actor[i])
                scr_set_facing_sprites(_setfacing);
        }
    }
    
    if (_c == "halt")
    {
        with (command_actor[i])
            scr_halt();
    }
    
    if (_c == "spin")
    {
        if (i_ex(command_actor[i]))
            command_actor[i].spinspeed = command_arg1[i];
    }
    
    if (_c == "stick")
    {
        if (command_arg1[i] == "on")
        {
            var _stickobj = command_arg2[i];
            var _stickdepth = command_arg3[i];
            
            with (command_actor[i])
                scr_stickto(_stickobj, _stickdepth);
        }
        else
        {
            with (command_actor[i])
                scr_stickto_stop();
        }
    }
    
    if (_c == "sprite")
        command_actor[i].sprite_index = command_arg1[i];
    
    if (_c == "specialsprite")
    {
        command_actor[i].sprite_index = command_actor[i].specialsprite[command_arg1[i]];
        command_actor[i].specialspriteno = command_arg1[i];
    }
    
    if (_c == "tenna")
    {
        if (i_ex(obj_actor_tenna))
        {
            var targetTenna = obj_actor_tenna;
            
            if (command_actor[i].object_index == obj_actor_tenna)
                targetTenna = command_actor[i];
            
            if (command_arg1[i] == "preset")
                targetTenna.preset = command_arg2[i];
            
            if (command_arg1[i] == "sprite")
            {
                targetTenna.bounce = 1;
                targetTenna.sprite_index = command_arg2[i];
            }
        }
    }
    
    if (_c == "visible")
        command_actor[i].visible = command_arg1[i];
    
    if (_c == "imagespeed")
        command_actor[i].image_speed = command_arg1[i];
    
    if (_c == "imageindex")
        command_actor[i].image_index = command_arg1[i];
    
    if (_c == "animate")
    {
        if (i_ex(command_actor[i]) && !instant)
        {
            command_actor[i].__arg0 = command_arg1[i];
            command_actor[i].__arg1 = command_arg2[i];
            command_actor[i].__arg2 = command_arg3[i];
            
            with (command_actor[i])
                scr_animate(__arg0, __arg1, __arg2);
        }
    }
    
    if (_c == "soundplay")
    {
        if (!instant)
        {
            var _snd = snd_play(command_arg1[i]);
            
            if (command_arg2[i] != 0)
                snd_volume(_snd, command_arg2[i], 0);
            
            if (command_arg2[i] != 0)
                snd_pitch(_snd, command_arg3[i]);
        }
    }
    
    if (_c == "mus" || _c == "music")
    {
        if (command_arg1[i] == "loop")
            mus_loop(global.currentsong[1]);
        
        if (command_arg1[i] == "play")
            mus_play(global.currentsong[1]);
        
        if (command_arg1[i] == "stop")
            snd_stop(global.currentsong[1]);
        
        if (command_arg1[i] == "free_all")
            snd_free_all();
        
        if (command_arg1[i] == "free")
            snd_free(global.currentsong[0]);
        
        if (command_arg1[i] == "pause")
            snd_pause(global.currentsong[1]);
        
        if (command_arg1[i] == "resume")
            snd_resume(global.currentsong[1]);
        
        if (command_arg1[i] == "init")
            global.currentsong[0] = snd_init(command_arg2[i]);
        
        if (command_arg1[i] == "initplay")
            mus_initplay(command_arg2[i]);
        
        if (command_arg1[i] == "initloop")
            mus_initloop(command_arg2[i]);
        
        if (command_arg1[i] == "volume")
            mus_volume(global.currentsong[1], command_arg2[i], command_arg3[i]);
        
        if (command_arg1[i] == "pitch")
            snd_pitch(global.currentsong[1], command_arg2[i]);
        
        if (command_arg1[i] == "pitchtime")
            snd_pitch_time(global.currentsong[1], command_arg2[i], command_arg3[i]);
        
        if (command_arg1[i] == "loopsfx")
            mysound = snd_loop(command_arg2[i]);
        
        if (command_arg1[i] == "loopsfxpitch")
            snd_pitch(mysound, command_arg2[i]);
        
        if (command_arg1[i] == "loopsfxpitchtime")
            snd_pitch_time(mysound, command_arg2[i], command_arg3[i]);
        
        if (command_arg1[i] == "loopsfxstop")
            snd_stop(mysound);
        
        if (command_arg1[i] == "loopsfxvolume")
            snd_volume(mysound, command_arg2[i], command_arg3[i]);
    }
    
    if (_c == "fadeout")
    {
        if (command_arg1[i] > 0)
        {
            __fadeouter = scr_fadeout(command_arg1[i]);
            
            if (command_arg2[i] != 0)
                __fadeouter.image_blend = command_arg2[i];
        }
        
        if (command_arg1[i] < 0)
        {
            if (instance_exists(obj_fadeout))
            {
                obj_fadeout.image_alpha = 1;
                obj_fadeout.fadespeed = 1 / command_arg1[i];
                obj_fadeout.fadein = 1;
            }
        }
    }
    
    if (_c == "panspeed")
    {
        if (!instant)
        {
            scr_pan(command_arg1[i], command_arg2[i], command_arg3[i]);
        }
        else
        {
            camerax_set(camerax() + (command_arg1[i] * command_arg3[i]));
            cameray_set(cameray() + (command_arg2[i] * command_arg3[i]));
        }
    }
    
    if (_c == "pan")
    {
        if (!instant)
        {
            scr_pan_lerp(command_arg1[i], command_arg2[i], command_arg3[i]);
        }
        else
        {
            camerax_set(command_arg1[i]);
            cameray_set(command_arg2[i]);
        }
    }
    
    if (_c == "panobj")
    {
        scr_pan_to_obj(command_arg1[i], command_arg2[i]);
        
        if (instant)
        {
            with (obj_panner)
            {
                camerax_set(finalx);
                cameray_set(finaly);
                instance_destroy();
            }
        }
    }
    
    if (_c == "pannable")
    {
        if (instance_exists(obj_mainchara))
            obj_mainchara.cutscene = command_arg1[i];
    }
    
    if (_c == "shake")
    {
        if (!instant)
            instance_create(0, 0, obj_shake);
    }
    
    if (_c == "shakex")
    {
        if (!instant)
        {
            myshake = instance_create(0, 0, obj_shake);
            myshake.shakex = command_arg1[i];
            myshake.shakey = command_arg2[i];
            myshake.shakespeed = command_arg3[i];
        }
    }
    
    if (_c == "shakeobj")
    {
        if (command_arg1[i] == 0)
        {
            if (!instant)
            {
                with (command_actor[i])
                    scr_shakeobj();
            }
        }
        else
        {
            var _shakeamt = command_arg1[i];
            var _shakespeed = command_arg2[i];
            var _shakereduct = command_arg3[i];
            
            if (!instant)
            {
                with (command_actor[i])
                    scr_shakeobj_x(_shakeamt, _shakespeed, _shakereduct);
            }
        }
    }
    
    if (_c == "jump")
    {
        if (i_ex(command_actor[i]))
        {
            command_actor[i].__arg0 = command_arg1[i];
            command_actor[i].__arg1 = command_arg2[i];
            command_actor[i].__arg2 = command_arg3[i];
            command_actor[i].__arg3 = command_arg4[i];
            
            if (!instant)
            {
                with (command_actor[i])
                    scr_jump_to_point(__arg0, __arg1, __arg2, __arg3);
            }
            else
            {
                command_actor[i].x = command_arg1[i];
                command_actor[i].y = command_arg2[i];
            }
        }
    }
    
    if (_c == "jumpinplace")
    {
        if (i_ex(command_actor[i]))
        {
            command_actor[i].__arg0 = command_arg1[i];
            command_actor[i].__arg1 = command_arg2[i];
            
            if (!instant)
            {
                with (command_actor[i])
                    scr_jump_in_place(__arg0, __arg1);
            }
        }
    }
    
    if (_c == "jumpsprite")
    {
        if (i_ex(command_actor[i]))
        {
            command_actor[i].__arg0 = command_arg1[i];
            command_actor[i].__arg1 = command_arg2[i];
            command_actor[i].__arg2 = command_arg3[i];
            command_actor[i].__arg3 = command_arg4[i];
            command_actor[i].__arg4 = command_arg5[i];
            command_actor[i].__arg5 = command_arg6[i];
            
            if (!instant)
            {
                with (command_actor[i])
                    scr_jump_to_point_sprite(__arg0, __arg1, __arg2, __arg3, __arg4, __arg5);
            }
            else
            {
                command_actor[i].x = command_arg1[i];
                command_actor[i].y = command_arg2[i];
            }
        }
    }
    
    if (_c == "addxy")
    {
        command_actor[i].x += command_arg1[i];
        command_actor[i].y += command_arg2[i];
    }
    
    if (_c == "setxy")
    {
        command_actor[i].x = command_arg1[i];
        command_actor[i].y = command_arg2[i];
    }
    
    if (_c == "arg_objectxy")
    {
        command_arg1[i + 1] = command_arg1[i].x + command_arg2[i];
        command_arg2[i + 1] = command_arg1[i].y + command_arg3[i];
    }
    
    if (_c == "actortoobject")
    {
        instance_create(command_actor[i].x, command_actor[i].y, command_arg1[i]);
        command_actor[i].visible = 0;
    }
    
    if (_c == "actortokris")
    {
        for (jjj = 0; jjj < 20; jjj++)
        {
            if (actor_name[jjj] == "kris" && i_ex(actor_id[jjj]))
            {
                obj_mainchara.x = actor_id[jjj].x;
                obj_mainchara.y = actor_id[jjj].y;
                obj_mainchara.visible = 1;
                actor_id[jjj].visible = 0;
                
                if (actor_id[jjj].facing == "d")
                    global.facing = 0;
                
                if (actor_id[jjj].facing == "r")
                    global.facing = 1;
                
                if (actor_id[jjj].facing == "u")
                    global.facing = 2;
                
                if (actor_id[jjj].facing == "l")
                    global.facing = 3;
            }
        }
    }
    
    if (_c == "actortocaterpillar")
    {
        _caterpillar_moved = 0;
        
        for (lll = 0; lll < 2; lll++)
        {
            if (i_ex(global.cinstance[lll]))
            {
                for (jjj = 0; jjj < 20; jjj++)
                {
                    if (actor_name[jjj] == global.cinstance[lll].name && i_ex(actor_id[jjj]))
                    {
                        if (global.cinstance[lll].x != actor_id[jjj].x)
                        {
                            global.cinstance[lll].x = actor_id[jjj].x;
                            _caterpillar_moved = 1;
                        }
                        
                        if (global.cinstance[lll].y != actor_id[jjj].y)
                        {
                            global.cinstance[lll].y = actor_id[jjj].y;
                            _caterpillar_moved = 1;
                        }
                        
                        scr_caterpillar_facing_single(actor_name[jjj], actor_id[jjj].facing);
                        global.cinstance[lll].visible = 1;
                        actor_id[jjj].visible = 0;
                    }
                }
            }
        }
        
        if (_caterpillar_moved == 1)
        {
            with (obj_caterpillarchara)
                scr_caterpillar_interpolate();
        }
    }
    
    if (_c == "saveload")
    {
        //if (command_arg1[i] == "save")
        //    scr_cutscene_savestate();
        
        //if (command_arg1[i] == "load")
        //    scr_cutscene_loadstate();
    }
    
    if (_c == "select")
    {
        actor_selected = actor_name[command_arg1[i]];
        actor_selected_id = actor_id[command_arg1[i]];
    }
    
    if (_c == "waitcustom")
    {
        with (master_object)
            customcon = 1;
        
        cs_wait_custom = 1;
        waiting = 1;
        breakme = 1;
    }
    
    if (_c == "waitdialoguer")
    {
        if (!instant)
        {
            waiting = 1;
            cs_wait_dialogue = 1;
            breakme = 1;
        }
    }
    
    if (_c == "waitbox")
    {
        if (!instant)
        {
            waiting = 1;
            cs_wait_box = command_arg1[i];
            breakme = 1;
        }
    }
    
    if (_c == "waitboxend")
    {
        if (!instant)
        {
            waiting = 1;
            cs_wait_box = command_arg1[i];
            cs_wait_box_end = true;
            breakme = 1;
        }
    }
    
    if (_c == "waitif")
    {
        cs_wait_if = 1;
        cs_wait_if_objectid = command_arg1[i];
        cs_wait_if_varname = command_arg2[i];
        cs_wait_if_operator = command_arg3[i];
        cs_wait_if_varvalue = command_arg4[i];
        waiting = 1;
        breakme = 1;
    }
    
    if (_c == "wait")
    {
        cs_wait_amount = command_arg1[i];
        
        if (instant)
            cs_wait_amount = 1;
        
        cs_wait_timer = 0;
        waiting = 1;
        breakme = 1;
    }
    
    if (_c == "terminate")
    {
        terminate_this_frame = 1;
        breakme = 1;
    }
    
    if (_c == "terminatekillactors")
    {
        kill_actors = 1;
        terminate_this_frame = 1;
        breakme = 1;
    }
    
    if (_c == "debug_print")
        debug_print(command_arg1[i]);
    
    if (_c == "customfunc")
    {
        if (object_index == obj_cutscene_delaycmd)
        {
            if (command_arg1[i] != -1)
                command_arg2[i](command_arg1[i]);
            else
                command_arg2[i]();
        }
        else if (array_length(customfuncs) > 0)
        {
            if (command_arg1[i] != -1)
                customfuncs[0](command_arg1[i]);
            else
                customfuncs[0]();
            
            array_delete(customfuncs, 0, 1);
        }
    }
}
