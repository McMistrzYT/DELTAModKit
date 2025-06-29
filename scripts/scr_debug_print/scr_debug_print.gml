function scr_debug_print(msg){
	array_push(mod_obj_mc_debug_controller.debug_messages, [5, msg]);
}

function print_message(msg) {
	array_push(mod_obj_mc_debug_controller.debug_messages, [5, msg]);
}

function debug_print(msg) {
	array_push(mod_obj_mc_debug_controller.debug_messages, [5, msg]);
}

function scr_debug_clear_all() {
	mod_obj_mc_debug_controller.debug_messages = [];
}