function c_cmd(command = "terminate", command_arg1 = 0, command_arg2 = 0, command_arg3 = 0, command_arg4 = 0){
	debug_log("Trying to schedule command '" + command + "'!");
	
    if (instance_exists(obj_cutscene_master)) {
		debug_log("cutscene master is real!!")
        __cs_i = obj_cutscene_master.maximum_command - 1;
        obj_cutscene_master.command[__cs_i] = command;
        obj_cutscene_master.command_arg1[__cs_i] = command_arg1 ?? 0;
        obj_cutscene_master.command_arg2[__cs_i] = command_arg2 ?? 0;
        obj_cutscene_master.command_arg3[__cs_i] = command_arg3 ?? 0;
        obj_cutscene_master.command_arg4[__cs_i] = command_arg4 ?? 0;
        
        with (obj_cutscene_master) maximum_command++;
    }
}

function c_cmd_x(command = "terminate", command_arg1 = 0, command_arg2 = 0, command_arg3 = 0, command_arg4 = 0, command_arg5 = 0, command_arg6 = 0){
    if (instance_exists(obj_cutscene_master)) {
        __cs_i = obj_cutscene_master.maximum_command - 1;
        obj_cutscene_master.command[__cs_i] = command;
        obj_cutscene_master.command_arg1[__cs_i] = command_arg1 ?? 0;
        obj_cutscene_master.command_arg2[__cs_i] = command_arg2 ?? 0;
        obj_cutscene_master.command_arg3[__cs_i] = command_arg3 ?? 0;
        obj_cutscene_master.command_arg4[__cs_i] = command_arg4 ?? 0;
        obj_cutscene_master.command_arg5[__cs_i] = command_arg5 ?? 0;
        obj_cutscene_master.command_arg6[__cs_i] = command_arg6 ?? 0;
        
        with (obj_cutscene_master) maximum_command++;
    }
}

function c_sel(target) { c_cmd("select", target, 0, 0, 0); }
function c_wait(time) { c_cmd("wait", time, 0, 0, 0); }
function c_visible(is_visible) { c_cmd("visible", is_visible, 0, 0, 0); }
function c_autowalk(should_animate) { c_cmd("autowalk", should_animate, 0, 0, 0); }
function c_sprite(new_spr) { c_cmd("sprite", new_spr, 0, 0, 0); }
function c_imagespeed(new_speed) { c_cmd("imagespeed", new_speed, 0, 0, 0); }
function c_imageindex(new_index){ c_cmd("imageindex", new_index, 0, 0, 0) }
function c_flip(sidetoflip) { c_cmd("flip", sidetoflip, 0, 0, 0) }
function c_spin(arg0) { c_cmd("spin", arg0, 0, 0, 0) }
function c_specialsprite(arg0) { c_cmd("specialsprite", arg0, 0, 0, 0) }
function c_delayfacing(time, dir){ c_cmd_x("delaycmd", time, "facing", dir, 0, 0, 0) }
function c_facing(dir) { c_cmd("facing", dir, 0, 0, 0); }

function c_walkdirect(xx, yy, t) { c_cmd("walkdirect", xx, yy, t, 0); }
function c_walkdirect_wait(xx, yy, time) { c_walkdirect(xx, yy, time); c_wait(time); }
function c_walkdirect_speed_wait(xx, yy, wait){ // ???
	c_cmd("walkdirect", xx, yy, -wait, 1)
}
function c_walk(dir, spd, time) { c_cmd("walk", dir, spd, time, 0); }
function c_actortokris() { c_cmd("actortokris", 0, 0, 0, 0); }
function c_actortocaterpillar() { c_cmd("actortocaterpillar", 0, 0, 0, 0); }
function c_terminatekillactors() { c_cmd("terminatekillactors", 0, 0, 0, 0); }

function c_pan_fancy(arg0, arg1, arg2, arg3 = { doround: true, easetype: "default" }) { c_cmd("panfancy", arg0, arg1, arg2, arg3) }
function c_panobj_fancy(arg0, arg1, arg2 = { doround: true, easetype: "default" }) { c_cmd("panfancyobj", arg0, arg1, arg2) }
function c_pannable(is_pannable) { c_cmd("pannable", is_pannable, 0, 0, 0); }
function c_pan(xx, yy, lerpspeed) { c_cmd("pan", xx, yy, lerpspeed, 0); }
function c_panspeed(pandiffx, pandiffy, time) { c_cmd("panspeed", pandiffx, pandiffy, time, 0) }
function c_panspeed_wait(pandiffx, pandiffy, time) { c_cmd("panspeed", pandiffx, pandiffy, time, 0); c_wait(time) }
function c_panobj(instance, time) { c_cmd("panobj", instance, time, 0, 0); }

function c_fadeout(time) { c_cmd("fadeout", time, 0, 0, 0); }
function c_fadein(time) { c_cmd("fadeout", -time, 0, 0, 0); }
function c_fadeout_color(time, color) { c_cmd("fadeout", time, color, 0, 0) }
function c_fadein_color(time, color) { c_cmd("fadeout", -time, color, 0, 0) }

function c_delaycmd(time, command_name, arg1) { c_cmd_x("delaycmd", time, command_name, arg1, 0, 0, 0); }
function c_delaycmd4(time, command_name, arg1, arg2, arg3, arg4) { c_cmd_x("delaycmd", time, command_name, arg1, arg2, arg3, arg4); }
function c_setxy(xx, yy) { c_cmd("setxy", xx, yy, 0, 0); }
function c_addxy(xx, yy) { c_cmd("addxy", xx, yy, 0, 0) }
function c_setxy_instance(instance, xx, yy) { c_var_instance(instance, "x", xx); c_var_instance(instance, "y", yy); }
function c_arg_objectxy(arg0, arg1, arg2) { c_cmd("arg_objectxy", arg0, arg1, arg2, 0) }


function c_wait_if(inst, var_name, condition, value) { c_cmd("waitif", inst, var_name, condition, value); }

function c_customfunc(func, arg1 = -1) { with (obj_cutscene_master) { array_push(customfuncs, func); } c_cmd("customfunc", arg1, 0, 0, 0); }
function c_delay_customfunc(t, func, arg2 = -1) { c_cmd_x("delaycmd", t, "customfunc", arg2, func, 0, 0); }
function c_script_instance(){
	if (argument_count == 3) c_cmd_x("script", argument[0], argument[1], argument[2], -pi, -pi, -pi)	
	if (argument_count == 4) c_cmd_x("script", argument[0], argument[1], argument[2], argument[3], -pi, -pi)	
	if (argument_count == 5) c_cmd_x("script", argument[0], argument[1], argument[2], argument[3], argument[4], -pi)	
	if (argument_count == 6) c_cmd_x("script", argument[0], argument[1], argument[2], argument[3], argument[4], argument[5])
}
function c_script_instance_stop(arg0, arg1){ c_cmd_x("script", arg0, arg1, -10, 0, 0, 0) }



// ch3
function c_tenna_sprite(sprite) { c_cmd("tenna", "sprite", sprite, 0, 0); }
function c_tenna_preset(preset) { c_cmd("tenna", "preset", preset, 0, 0); }

function c_msgset(idx, msg) { c_cmd("msgset", idx, msg, 0, 0); }
function c_msgnext(msg) { c_cmd("msgnext", msg, 0, 0, 0); }
function c_msgsetloc(idx, msg, loc_id) { c_msgset(idx, msg); }
function c_msgnextloc(msg, loc_id) { c_msgnext(msg); }
function c_msgside(side) { c_cmd("msgside", side, 0, 0, 0); }
function c_msgzurasu(active){
	if (active == 1)
		c_cmd("msgside", "zurasuon", 0, 0, 0)
	else
		c_cmd("msgside", "zurasuoff", 0, 0, 0)
}
function c_msc(idx) { c_cmd("msc", idx, 0, 0, 0); }
function c_speaker(speak) { c_cmd("speaker", speak, 0, 0, 0); }
function c_facenext(speakerchar, emotionid) { c_cmd("msgfacenext", speakerchar, emotionid, 0, 0); }
function c_talk() { c_cmd("talk", 0, 0, 0, 0); }
function c_waittalk() { c_cmd("waitdialoguer", 0, 0, 0, 0); }
function c_wait_talk() { c_cmd("waitdialoguer", 0, 0, 0, 0) }

function c_wait_box(box_idx) { c_cmd("waitbox", box_idx, 0, 0, 0); }
function c_talk_wait() { c_talk(); c_waittalk(); }

function c_var_lerp_instance(){
	if (argument_count < 6)
		c_cmd_x("var", argument[0], argument[1], argument[2], argument[3], argument[4], 0)
	else if (argument_count == 6)
		c_cmd_x("var", argument[0], argument[1], argument[2], argument[3], argument[4], argument[5])
	else if (argument_count == 7)
		c_cmd_x("var", argument[0], argument[1], argument[2], argument[3], argument[4], string(argument[5]) + string(argument[6]))
}

function c_lerp_var_instance(){
	if (argument_count >= 6)
		c_var_lerp_instance(argument0, argument1, argument2, argument3, argument4, argument5)
	else if (argument_count >= 7)
		c_var_lerp_instance(argument0, argument1, argument2, argument3, argument4, argument5, argument6)
	else
		c_var_lerp_instance(argument0, argument1, argument2, argument3, argument4)
}

function c_lerpvar_instance(){
	if (argument_count >= 6)
		c_var_lerp_instance(argument0, argument1, argument2, argument3, argument4, argument5)
	else if (argument_count >= 7)
		c_var_lerp_instance(argument0, argument1, argument2, argument3, argument4, argument5, argument6)
	else
		c_var_lerp_instance(argument0, argument1, argument2, argument3, argument4)
}
function c_var_instance(inst, var_name, value) { c_cmd("var", inst, var_name, value, 0); }
function c_var(varname, value){ c_cmd_x("var", 0, varname, value, 0, 0, 0) }
function c_var_lerp(){
	if (argument_count < 5)
		c_cmd_x("var", 0, argument[0], argument[1], argument[2], argument[3], 0)
	else if (argument_count == 5)
		c_cmd_x("var", 0, argument[0], argument[1], argument[2], argument[3], argument[4])
	else
		c_cmd_x("var", 0, argument[0], argument[1], argument[2], argument[3], string(argument[4]) + string(argument[5]))
}
function c_var_add(arg0, arg1){ c_cmd_x("varadd", 0, arg0, 0, arg1, 0, 0) }
function c_var_add_instance(arg0, arg1, arg2){ c_cmd_x("varadd", arg0, arg1, 0, arg2, 0, 0)}

function c_var_lerp_add(){
	if (argument_count < 4)
		c_cmd_x("varadd", 0, argument[0], 0, argument[1], argument[2], 0)
	else if (argument_count == 4)
		c_cmd_x("varadd", 0, argument[0], 0, argument[1], argument[2], argument[3])
	else if (argument_count == 5)
		c_cmd_x("varadd", 0, argument[0], 0, argument[1], argument[2], string(argument[3]) + string(argument[4]))
}

function c_var_lerp_add_instance(){
	if (argument_count < 5)
		c_cmd_x("varadd", argument[0], argument[1], 0, argument[2], argument[3], 0)
	else if (argument_count == 5)
		c_cmd_x("varadd", argument[0], argument[1], 0, argument[2], argument[3], argument[4])
	else if (argument_count == 6)
		c_cmd_x("varadd", argument[0], argument[1], 0, argument[2], argument[3], string(argument[4]) + string(argument[5]))
}

function c_var_lerp_to(){
	if (argument_count < 4)
		c_cmd_x("varto", 0, argument[0], 0, argument[1], argument[2], 0)
	else
		c_cmd_x("varto", 0, argument[0], 0, argument[1], argument[2], argument[3])
}

function c_var_lerp_to_instance(){
	if (argument_count < 5)
		c_cmd_x("varto", argument[0], argument[1], 0, argument[2], argument[3], 0)
	else if (argument_count == 5)
		c_cmd_x("varto", argument[0], argument[1], 0, argument[2], argument[3], argument[4])
	else if (argument_count == 6)
		c_cmd_x("varto", argument[0], argument[1], 0, argument[2], argument[3], string(argument[4]) + string(argument[5]))
}




function c_emote(){
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

function c_walk_wait(dir, spd, time) { c_walk(dir, spd, time); c_wait(time) }
function c_walkwait(dir, spd, time){ c_walk_wait(dir, spd, time) }

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

function c_walkto_object(obj, offx, offy, arg3, arg4 = true) { c_cmd_x("walkto", obj, offx, offy, arg3, arg4, false); }

function c_debugprint(msg) { if DEBUGMODE { c_cmd("debug_print", string(msg)) } }

function c_shakestep_x(arg0, arg1, arg2, arg3, arg4, arg5){
	c_autowalk(0)
	c_imageindex(1)
	c_addxy(arg0, arg1)
	
	if (arg5 == 1)
		c_var("stepsound", 1)
	
	c_delaycmd(arg2, "imageindex", 0)
	c_shakeobj()
	
	if (arg4 > 1)
	{
		for (__argi = 1; __argi < arg4; __argi++)
		{
			c_delaycmd(__argi * arg3, "imageindex", 1)
			c_delaycmd4(__argi * arg3, "addxy", arg0, arg1, 0, 0)
			
			if (arg5 == 1)
				c_delaycmd4(__argi * arg3, "var", 0, "stepsound", 1, 0)
			
			c_delaycmd((__argi * arg3) + arg2, "imageindex", 0)
			c_delaycmd(__argi * arg3, "shakeobj", 0)
		}
	}
}

function c_shakex(arg0, arg1, arg2){ c_cmd("shakex", arg0, arg1, arg2, 0) }
function c_shakestep(arg0, arg1){
	c_autowalk(0)
	c_imageindex(1)
	c_addxy(arg0, arg1)
	c_var("stepsound", 1)
	c_delaycmd(15, "imageindex", 0)
	c_shakeobj()
}
function c_shake(){ c_cmd("shake", 0, 0, 0, 0) }
function c_shakeobj(){ c_cmd("shakeobj", 0, 0, 0, 0) }
function c_shakeobj_instance(instance){ c_cmd("shakeobj_instance", instance, 0, 0, 0) }

function c_soundplay(audio){ c_cmd("soundplay", audio, 0, 0, 0) }
function c_sndplay(audio){ c_soundplay(audio) }
function c_snd_play(audio){ c_soundplay(audio) }
function c_sound_play(audio){ c_soundplay(audio) }

function c_soundplay_x(audio, volume, pitch){ c_cmd("soundplay", audio, volume, pitch, 0) }
function c_snd_play_x(audio, volume, pitch){ c_soundplay_x(audio, volume, pitch) }
function c_sndplay_x(audio, volume, pitch){ c_soundplay_x(audio, volume, pitch) }
function c_sound_play_x(audio, volume, pitch){ c_soundplay_x(audio, volume, pitch) }
function c_mus(type){ c_cmd("mus", type, 0, 0, 0) }
/// @desc c_mus except for ones with additional arguments
function c_mus2(type, typearg1 = 0, typearg2 = 0){ 	c_cmd("mus", type, typearg1, typearg2, 0) }

function c_soundplay_wait(audio){ c_cmd("soundplay", audio, 0, 0, 0) c_wait(round(audio_sound_length(audio) * room_speed)) }
function c_playsound_wait(audio){ c_soundplay_wait(audio) }
