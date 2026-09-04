function scr_debug_print(msg){
    if !scr_debug() exit;
	
    if (!instance_exists(obj_debug_gui)) {
        instance_create(__view_get(0, 0) + 10, __view_get(1, 0) + 10, obj_debug_gui);
        obj_debug_gui.depth = -9999;
    }
    
    obj_debug_gui.newtext = string(msg);
    
    with (obj_debug_gui) {
        message[messagecount] = newtext;
        newtext = "";
        timer[messagecount] = 90 - totaltimer;
        totaltimer += timer[messagecount];
        messagecount++;
        debugmessage = message[0];
        
        for (i = 1; i < messagecount; i++) debugmessage += ("#" + message[i]);
    }
    debug_log(msg)
}

function print_message(msg) { show_message(msg) }
function debug_print(msg)	{ return scr_debug_print(msg); }
function scr_debug_clear_all() { if (!scr_debug()) { exit; } scr_debug_clear_persistent(); }
function scr_debug_keycheck(key) { return scr_debug() && keyboard_check_pressed(key); }

function scr_debug_print_persistent(persistname, msg){
    if !scr_debug() exit;
    
    if (!instance_exists(obj_debug_gui_persistent)){
        instance_create(__view_get(0, 0) + 10, __view_get(1, 0) + 10, obj_debug_gui_persistent);
        obj_debug_gui_persistent.depth = -9999;
    }
    
    obj_debug_gui_persistent.newtext = string(msg);
    
    with (obj_debug_gui_persistent) {
        message[messagecount] = newtext;
        newtext = "";
        timer[messagecount] = 90 - totaltimer;
        totaltimer += timer[messagecount];
        messagecount++;
        debugmessage = message[0];
        
        for (i = 1; i < messagecount; i++) debugmessage += ("#" + message[i]);
        
        name = persistname;
    }
}

function debug_print_persistent(persistname, msg) { scr_debug_print_persistent(persistname, msg) }

function scr_debug_delete_persistent(persistname, deleteall = false){
    with (obj_debug_gui_persistent) {
		if deleteall
			instance_destroy()
		else if (name == persistname)
            instance_destroy();
    }
}

function scr_debug_clear_persistent(){
    with (obj_debug_gui) {
        message[0] = "";
        debugmessage = "";
        newtext = "";
        timer[0] = 90;
        messagecount = 0;
        totaltimer = 0;
    }
    
    with (obj_debug_gui_persistent) {
        message[0] = "";
        debugmessage = "";
        newtext = "";
        timer[0] = 90;
        messagecount = 0;
        totaltimer = 0;
    }
}


function debug_printline(str, yoff){
    if (scr_debug()) {
        draw_set_font(fnt_small);
        draw_set_color(c_black);
        yy = 480 - (8 * yoff);
        xx = 2;
		draw_text(xx + 1, yy, str);
		draw_text(xx - 1, yy, str);
		draw_text(xx, yy + 1, str);
		draw_text(xx, yy - 1, str);
        draw_set_color(c_white);
		draw_text(xx, yy, str);
    }
}

/// @desc Draws debug text in the position you tell it to go [Ch5+]
function draw_text_debug(x, y, str, angle = 0, blend = c_white){
    if scr_debug() {
        var col = draw_get_color()
        draw_set_color(blend)
        draw_text_transformed(x, y, str, 1, 1, angle)
        draw_set_color(col)
    }
}

/// @argument Message
/// @desc a replica of GMS2-Beta's show_debug_message, allows you to still use the GMS2-Beta style even if you're trying to have compatability with other versions of GameMaker
function debug_log(){
	var arguments = argument_count - 1
	var main = string(argument[0])
	for (var i = 0; i < arguments; i++) {
		main = string_replace_all(main, "{" + string(i) + "}", string(argument[i + 1]))
	}
	show_debug_message(main)
}

/// @desc Draws the value you request like this: "[name] = [value]" in the position you want [Ch5+]
function showval(x, y, valuename){
    if (scr_debug()) {
        var _debugstring = valuename + " = " + string(variable_instance_get(self, valuename))
        draw_text_debug(x, y, _debugstring)
    }
}

/// @desc prints the value you request like this: "[name] = [value]" [Ch5+]
function printval(valuename){
    if (scr_debug()) {
        var _debugstring = valuename + " = " + string(variable_instance_get(self, valuename))
        scr_debug_print(_debugstring)
    }
}

/// @desc Arguments get combined together and then get printed.
function show_debug_message_concat(){
	var msg = ""
	for (var i = 0; i < argument_count; i++) {
		msg += string(argument[i])
	}
	debug_log(msg)
}