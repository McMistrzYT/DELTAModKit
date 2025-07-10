function scr_debug_print(msg){
	show_debug_message(msg);
	//array_push(mod_obj_mc_debug_controller.debug_messages, [5, msg]);
}

function print_message(msg) {
	show_debug_message(msg);
	//array_push(mod_obj_mc_debug_controller.debug_messages, [5, msg]);
}

function debug_print(msg) {
	show_debug_message(msg);
	//array_push(mod_obj_mc_debug_controller.debug_messages, [5, msg]);
}

function scr_debug_clear_all() {
	//mod_obj_mc_debug_controller.debug_messages = [];
}

function scr_debug_keycheck(key)
{
    return scr_debug() && keyboard_check_pressed(key);
}
