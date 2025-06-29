function c_cmd(arg0, arg1, arg2, arg3, arg4)
{
	show_debug_message("Trying to schedule command '" + arg0 + "'!");
	
    if (instance_exists(obj_cutscene_master))
    {
		show_debug_message("cutscene master is real!!")
        __cs_i = obj_cutscene_master.maximum_command - 1;
        obj_cutscene_master.command[__cs_i] = arg0;
        obj_cutscene_master.command_arg1[__cs_i] = arg1;
        obj_cutscene_master.command_arg2[__cs_i] = arg2;
        obj_cutscene_master.command_arg3[__cs_i] = arg3;
        obj_cutscene_master.command_arg4[__cs_i] = arg4;
        
        with (obj_cutscene_master)
            maximum_command++;
    }
}

function c_cmd_x(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    if (instance_exists(obj_cutscene_master))
    {
        __cs_i = obj_cutscene_master.maximum_command - 1;
        obj_cutscene_master.command[__cs_i] = arg0;
        obj_cutscene_master.command_arg1[__cs_i] = arg1;
        obj_cutscene_master.command_arg2[__cs_i] = arg2;
        obj_cutscene_master.command_arg3[__cs_i] = arg3;
        obj_cutscene_master.command_arg4[__cs_i] = arg4;
        obj_cutscene_master.command_arg5[__cs_i] = arg5;
        obj_cutscene_master.command_arg6[__cs_i] = arg6;
        
        with (obj_cutscene_master)
            maximum_command++;
    }
}


function c_sel(targ) { c_cmd("select", targ, 0, 0, 0); }
function c_wait(t) { c_cmd("wait", t, 0, 0, 0); }
function c_visible(is_visible) { c_cmd("visible", is_visible, 0, 0, 0); }
function c_autowalk(should_animate) { c_cmd("autowalk", should_animate, 0, 0, 0); }
function c_sprite(new_spr) { c_cmd("sprite", new_spr, 0, 0, 0); }
function c_imagespeed(new_speed) { c_cmd("imagespeed", new_speed, 0, 0, 0); }
function c_walk(dir, spd, t) { c_cmd("walk", dir, spd, t, 0); }
function c_actortokris() { c_cmd("actortokris", 0, 0, 0, 0); }
function c_actortocaterpillar() { c_cmd("actortocaterpillar", 0, 0, 0, 0); }
function c_terminatekillactors() { c_cmd("terminatekillactors", 0, 0, 0, 0); }
function c_pannable(is_pannable) { c_cmd("pannable", is_pannable, 0, 0, 0); }
function c_pan(arg0, arg1, arg2) { c_cmd("pan", arg0, arg1, arg2, 0); }
function c_panobj(arg0, arg1) { c_cmd("panobj", arg0, arg1, 0, 0); }
function c_fadeout(arg0) { c_cmd("fadeout", arg0, 0, 0, 0); }
function c_fadein(arg0) { c_cmd("fadeout", -arg0, 0, 0, 0); }
function c_delaycmd(time, command_name, arg1) { c_cmd_x("delaycmd", time, command_name, arg1, 0, 0, 0); }
function c_delaycmd4(time, command_name, arg1, arg2, arg3, arg4) { c_cmd_x("delaycmd", time, command_name, arg1, arg2, arg3, arg4); }
function c_walkdirect(xx, yy, t) { c_cmd("walkdirect", xx, yy, t, 0); }
function c_setxy(xx, yy) { c_cmd("setxy", xx, yy, 0, 0); }
function c_var_instance(inst, var_name, value) { c_cmd("var", inst, var_name, value, 0); }
function c_wait_if(inst, var_name, condition, value) { c_cmd("waitif", inst, var_name, condition, value); }
function c_customfunc(func, arg1 = -1) { with (obj_cutscene_master) { array_push(customfuncs, func); } c_cmd("customfunc", arg1, 0, 0, 0); }
function c_delay_customfunc(t, func, arg2 = -1) { c_cmd_x("delaycmd", t, "customfunc", arg2, func, 0, 0); }
function c_facing(dir) { c_cmd("facing", dir, 0, 0, 0); }

// ch3
function c_tenna_sprite(sprite) { c_cmd("tenna", "sprite", sprite, 0, 0); }
function c_tenna_preset(preset) { c_cmd("tenna", "preset", preset, 0, 0); }

function c_msgset(idx, msg) { c_cmd("msgset", idx, msg, 0, 0); }
function c_msgnext(msg) { c_cmd("msgnext", msg, 0, 0, 0); }
function c_msgsetloc(idx, msg, loc_id) { c_msgset(idx, msg); }
function c_msgnextloc(msg, loc_id) { c_msgnext(msg); }
function c_msgside(side) { c_cmd("msgside", side, 0, 0, 0); }
function c_msc(idx) { c_cmd("msc", idx, 0, 0, 0); }

function c_speaker(speak) { c_cmd("speaker", speak, 0, 0, 0); }
function c_talk() { c_cmd("talk", 0, 0, 0, 0); }
function c_waittalk() { c_cmd("waitdialoguer", 0, 0, 0, 0); }
function c_wait_box(box_idx) { c_cmd("waitbox", box_idx, 0, 0, 0); }
function c_talk_wait() { c_talk(); c_waittalk(); }

function c_emote()
{
    if (argument_count == 0)
        c_cmd("emote", "!", 30, 0, 0);
    else if (argument_count == 1)
        c_cmd("emote", argument[0], 30, 0, 0);
    else if (argument_count == 2)
        c_cmd("emote", argument[0], argument[1], 0, 0);
    else if (argument_count == 3)
        c_cmd("emote", argument[0], argument[1], argument[2], 0);
    else if (argument_count == 4)
        c_cmd("emote", argument[0], argument[1], argument[2], argument[3]);
}

function c_actormoveparty(t)
{
    __mcactor = scr_findactor("kris");
    
    if (__mcactor >= 0)
    {
        c_sel(__mcactor);
        c_walkdirect(obj_mainchara.x, obj_mainchara.y, t);
    }
    
    for (__jj = 0; __jj < 2; __jj++)
    {
        if (i_ex(global.cinstance[__jj]))
        {
            __mcactor = scr_findactor(global.cinstance[__jj].name);
            
            if (__mcactor >= 0)
            {
                c_sel(__mcactor);
                c_cmd("walkdirect", global.cinstance[__jj].x, global.cinstance[__jj].y, t, 0);
            }
        }
    }
}

function c_walktoobject(obj, offx, offy, t)
{
    var _targetx = obj.x + offx;
    var _targety = obj.y + offy;
    c_cmd("walkdirect", _targetx, _targety, t, 0);
}

function c_delaywalktoobject(delay_t, obj, offx, offy, t)
{
    var _targetx = obj.x + offx;
    var _targety = obj.y + offy;
    c_cmd_x("delaycmd", delay_t, "walkdirect", _targetx, _targety, t, 0);
}

function c_walktoobject_wait(obj, offx, offy, t)
{
    c_walktoobject(obj, offx, offy, t);
    c_wait(t);
}

function c_delaywalktoobject_wait(delay_t, obj, offx, offy, t)
{
    c_delaywalktoobject(delay_t, obj, offx, offy, t);
    c_wait(delay_t + t);
}

function c_walkto_actor(actor_id_or_obj, offx, offy, arg3, arg4 = true)
{
    var _actorObj;
    
    if (array_length(obj_cutscene_master.actor_id) > actor_id_or_obj)
        _actorObj = obj_cutscene_master.actor_id[actor_id_or_obj];
    else
        _actorObj = actor_id_or_obj;
    
    c_cmd_x("walkto", _actorObj, offx, offy, arg3, arg4, arg4);
}

function c_walkto_object(obj, offx, offy, arg3, arg4 = true)
{
    c_cmd_x("walkto", obj, offx, offy, arg3, arg4, false);
}
