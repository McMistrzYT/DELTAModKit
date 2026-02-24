function scr_script_delayed(){
	var __scriptdelay = instance_create(0, 0, obj_script_delayed)
	__scriptdelay.script = argument[0]
	__scriptdelay.alarm[0] = argument[1]
	__scriptdelay.target = id
	
	for (var __i = 0; __i < (argument_count - 2); __i++)
		__scriptdelay.script_arg[__i] = argument[__i + 2]
	
	__scriptdelay.arg_count = argument_count - 2
	return __scriptdelay;
}

function scr_script_repeat() {
	var __scriptdelay = instance_create(0, 0, obj_script_delayed)
	__scriptdelay.script = argument[0]
	__scriptdelay.alarm[0] = -2
	__scriptdelay.max_time = argument[1]
	__scriptdelay.rate = argument[2]
	__scriptdelay.constant = true
	__scriptdelay.target = id
	
	for (var __i = 0; __i < (argument_count - 3); __i++)
		__scriptdelay.script_arg[__i] = argument[__i + 3]
	
	__scriptdelay.arg_count = argument_count - 3
	return __scriptdelay;
}

function scr_script_repeat_stop(){
	var _myid = id
	
	with (obj_script_delayed) if (target == _myid) {
			max_time = -300
			alarm[0] = -5
			instance_destroy()
	}
}

function scr_script_execute_name(argument0, argument1 = [], argument2 = 0) {
	var scriptname = argument0
	var scriptarguments = argument1
	var offset = argument2 
	var script = asset_get_index(scriptname)
	if (is_real(scriptname) || is_method(scriptname) || script_exists(scriptname)) && script == -1 script = scriptname
		
	if (script_exists(script))
		return script_execute_ext(script, scriptarguments, offset);
	else if is_method(script) {
		return method_call(method(self, script), scriptarguments, offset)
	} else return false;
}

