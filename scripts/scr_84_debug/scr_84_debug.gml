function scr_84_debug(stepmode) {
	if (!variable_global_exists("chemg_menu_depth")) {
		global.chemg_menu_console_active = 0
		global.chemg_menu_indices = array_create(0)
		global.chemg_menu_indices[0] = 0
		global.chemg_menu_depth = 0
		global.chemg_god_mode = 0
		global.chemg_show_room = 1
		global.chemg_font_test = 0
		var parent = ds_list_create()
		debug_log("init debug")
		var group = ds_list_create()
		
		var __createoptiondata = function(executemethod = function(item, name) { show_message("ERROR!") }, drawmethod = function(item, name) { return name }) {
			return {
				draw_text: drawmethod,
				execute: executemethod
			}
		}
		
		var groupdata = __createoptiondata(function(item, name) {
			global.chemg_menu_indices[global.chemg_menu_depth] = 0
			global.chemg_menu_depth += 1
		}, function(item, name) {
			return "[" + string(name) + "]"
		})
		
		langdata = __createoptiondata(
			function(item, name) {
					global.chemg_menu_depth = 0
					scr_change_language()
					debug_log("switch lang: " + string(global.lang))
					room_restart()
			},
			function(item, name) { 
				return "use " + (global.lang == "en" ? "japanese" : "english")
			}
		)
		
		var custom_editparty = __createoptiondata(function(item, name) {
				if (!is_array(item))
					item = [item, 0]
				
				global.char[item[1]] = item[0]			
			}			
		)
		
		scr_84_add_menu_item(parent, groupdata, group, "Options")
		scr_84_push(parent)
		parent = group
		
		scr_84_add_menu_item(parent, {
			draw_text: function(item, name) {	return name	
			}, execute: function(item) {
				var type = scr_84_lang_load()
				debug_log("loaded " + type + " lang file")
				show_message("loaded " + type + " lang file")
				global.chemg_menu_depth = 0					
			}
		}, "", "reload japanese")
		
		scr_84_add_menu_item(parent, langdata, "ja", "use japanese")
		
		scr_84_add_menu_item(parent, __createoptiondata(
			function(item, name) {
				global.chemg_show_room = !global.chemg_show_room
			},
			function(item, name) {
				return global.chemg_show_room ? "hide room name" : "show room name"
			}), "", "toggle room name")
		
		
		scr_84_add_menu_item(parent, __createoptiondata(function() {
				debug_log("restart room")
				room_restart()
				global.chemg_menu_depth = 0}), "", "restart room")
				
		scr_84_add_menu_item(parent, 
		__createoptiondata(function() { global.chemg_god_mode = 1 - global.chemg_god_mode }), 
		"", "god mode")
		
		group = ds_list_create()
		scr_84_add_menu_item(parent, groupdata, group, "Party")
		scr_84_push(parent)
		parent = group
		var chars = []
		
		for (var i = 0; i < array_length(global.char); i++) {
			group = ds_list_create()
			scr_84_add_menu_item(parent, groupdata, group, "CharSlot " + string(i + 1))
			scr_84_push(parent)
			parent = group
			
			for (var j = 0; j < array_length(global.charname); j++) scr_84_add_menu_item(parent, custom_editparty, [j, i], global.charname[j])
			
			parent = scr_84_pop()
		}
		
		parent = scr_84_pop()
		group = ds_list_create()
		scr_84_add_menu_item(parent, groupdata, group, "DefaultConfigs")
		scr_84_push(parent)
		parent = group
		/*
		scr_84_add_menu_item(parent, __createoptiondata(function(item, name) {
			
			event_perform_object(obj_initializer, ev_create, 0)
		} ), undefined, "DELTARUNE_GAMESTART_OLDDEBUG, (RUN old gamestart code, obj_initializer)")
		*/
		scr_84_add_menu_item(parent, __createoptiondata(function(item, name)
		{
			scr_gamestart()
		}), undefined, "DELTARUNE_GAMESTART_RELEASE (RUN scr_gamestart)")
		parent = scr_84_pop()
		group = ds_list_create()
		scr_84_add_menu_item(parent, groupdata, group, "give item")
		scr_84_push(parent)
		parent = group
		var name = "<undefined>"
		
		var countwithoutname = 0
		
		for (var i = 1; countwithoutname < 50; i++) {	
			itemid = i
			self.i = 0
			global.itemname[0] = " "
			scr_itemnamelist()
			name = global.itemname[0]
			
			if (name == " " || !is_string(name))
				countwithoutname++
			else {
				scr_84_add_menu_item(parent, __createoptiondata(function(item, name) { scr_itemget(item) }), i, string(name))
				countwithoutname = 0
			}
		}
		
		parent = scr_84_pop()
		group = ds_list_create()
		scr_84_add_menu_item(parent, groupdata, group, "give light item")
		scr_84_push(parent)
		parent = group
		
		name = "<undefined>"
		
		var truelitemzero = global.litem[0]
		
		var countwithoutname = 0
		
		for (var i = 1; countwithoutname < 50; i++) {	
			global.litem[0] = i
			global.litemname[0] = " "
			scr_litemname()
			name = global.litemname[0]
			
			if (name == " " || !is_string(name))
				countwithoutname++
			else {
				countwithoutname = 0
				scr_84_add_menu_item(parent, __createoptiondata(function(item, name) { scr_litemget(item) }), i, string(name))
			}
		}
		
		global.litem[0] = truelitemzero
		
		parent = scr_84_pop()
		group = ds_list_create()
		scr_84_add_menu_item(parent, groupdata, group, "give key item")
		scr_84_push(parent)
		parent = group
		name = "<undefined>"
		
		
		var countwithoutname = 0
		
		for (var i = 1; countwithoutname < 50; i++) {	
			itemid = i
			self.i = 0
			scr_keyiteminfo(i)
			name = tempkeyitemname
			
			if (name == " " || !is_string(name))
				countwithoutname++
			else {
				scr_84_add_menu_item(parent, __createoptiondata(function(item, name) { if (scr_keyitemcheck(item) == 0) scr_keyitemget(item) }), i, string(name))
				countwithoutname = 0
			}
		}
		
		for (var i = 1; name != " " && is_string(name); i++){
			scr_keyiteminfo(i)
			name = tempkeyitemname
			
			if (name == " ") continue
			
			scr_84_add_menu_item(parent, "[keyitem]", i, string(name))
		}
		
		parent = scr_84_pop()
		group = ds_list_create()
		scr_84_add_menu_item(parent, groupdata, group, "give weapon")
		scr_84_push(parent)
		parent = group
		name = "<undefined>"
		
		var countwithoutname = 0
		
		for (var i = 1; countwithoutname < 50; i++) {
			scr_weaponinfo(i)
			name = weaponnametemp
			
			if (name == " ") {
				countwithoutname++
				continue
			}
			
			countwithoutname = 0
			
			scr_84_add_menu_item(parent, __createoptiondata(function(item, name) {scr_weaponget(item)}), i, string(name))
		}
		
		parent = scr_84_pop()
		group = ds_list_create()
		scr_84_add_menu_item(parent, groupdata, group, "give armor")
		scr_84_push(parent)
		parent = group
		name = "<undefined>"
		
		var countwithoutname = 0
		
		for (var i = 1; countwithoutname < 50; i++) {
			scr_armorinfo(i)
			name = armornametemp
			
			if (name == " ") {
				countwithoutname++
				continue
			}
			
			countwithoutname = 0
			
			scr_84_add_menu_item(parent, __createoptiondata(function(item, name) {scr_armorget(item)}), i, string(name))
		}
		
		parent = scr_84_pop()
		
		var lightgold = __createoptiondata(function(item, name) { global.lgold = max(0, global.lgold + item) })
		var darkgold = __createoptiondata(function(item, name) { global.gold = max(0, global.gold + item) })
		
		//scr_84_add_menu_item(parent, __createoptiondata(function(item, name) {scr_phoneadd(202)}), "", "give phone number")
		scr_84_add_menu_item(parent, darkgold, 25, "+25 gold")
		scr_84_add_menu_item(parent, darkgold, -25, "-25 gold")
		scr_84_add_menu_item(parent, lightgold, 25, "+25 lgold")
		scr_84_add_menu_item(parent, lightgold, -25, "-25 lgold")
		scr_84_add_menu_item(parent, __createoptiondata(function(item, name) { global.charauto[2] = !global.charauto[2] }, function() { return (global.charauto[2] ? "Disable" : "Enable") + " Auto Sus"}), "", "Toggle Auto Sus")
		//scr_84_add_menu_item(parent, __createoptiondata(function(item, name) { global.flag[1311] = !global.flag[1311] }), "", "Toggle Ral Hat Ch5")
		parent = scr_84_pop()
		
		roomtransitiondata_light = __createoptiondata(function(item, name) {
			global.darkzone = 0
			room_goto(item)
			global.chemg_menu_depth = 0				
		})
		roomtransitiondata_dark = __createoptiondata(function(item, name) {
			global.darkzone = 1
			debug_log("room_goto: " + name)
			room_goto(item)
			global.chemg_menu_depth = 0			
		})
		
		__AUTOGENMACRO__84DEBUGROOMDATA__ // RERUN "updateautogeneratedmacros.js" TO UPDATE THIS, OR CHANGE TO MANUAL WAY
		
		if global.runtimeyear > "2023" {
		    group = ds_list_create();
		    scr_84_push(parent);
			var consoledata = __createoptiondata(function(item, name) { // Variable exists just for readability lol
				show_debug_log(true)
				global.chemg_menu_console_active = 1
			}, function(item, name) {
				return "{" + string(name) + "}"
			})
		
		    scr_84_add_menu_item(parent, consoledata, group, "Console");
		    parent = scr_84_pop();
		}
				
		global.chemg_menus = parent
	}
	
	var curdepth = global.chemg_menu_depth
	
	if (stepmode) return global.chemg_menu_depth > 0;
	
	if ((gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gp_stickr) && global.chemg_menu_depth == 0) || keyboard_check_pressed(ord("Q"))){
		global.chemg_menu_depth = 1
		global.chemg_interact = global.interact
		global.chemg_yoffset = 0
		global.interact = 0
	}
	
	if (global.chemg_menu_depth > 0) {
		var btn1press = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))
		var uppress = keyboard_check_pressed(vk_up)
		var leftpress = keyboard_check_pressed(vk_left)
		var rightpress = keyboard_check_pressed(vk_right)
		var downpress = keyboard_check_pressed(vk_down)
		var btn2press = keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"))
		var parent = global.chemg_menus
		var change = 0
		var depth_ndx = global.chemg_menu_depth - 1
		
		if global.chemg_menu_console_active {
			btn1press = 0
			uppress = 0
			leftpress = 0
			rightpress = 0
			downpress = 0
			btn2press = keyboard_check_pressed(vk_escape)
			var pressingesc = keyboard_check_direct(vk_escape)
			keyboard_clear(vk_anykey)
			if pressingesc keyboard_key_press(vk_escape)
			if btn2press {
				global.chemg_menu_console_active = 0
				show_debug_log(false)
				keyboard_clear(vk_escape)
			}
		} else {
			var i = 0
			var choice, choice_data, choice_name
		
			do
			{
				var choice_ndx = global.chemg_menu_indices[i]
				choice = ds_list_find_value(parent, choice_ndx * 3)
				choice_data = ds_list_find_value(parent, (choice_ndx * 3) + 1)
				choice_name = ds_list_find_value(parent, (choice_ndx * 3) + 2)
				i += 1
			
				if (i == global.chemg_menu_depth)
					break
			
				parent = choice_data
			}
			until (0)
		
			var num_choices = ds_list_size(parent) / 3
		
			if (uppress || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gp_padu))
			{
				change = -1
			}
			else if (downpress || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gp_padd))
			{
				change = 1
			}
			else if (btn1press || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gp_face2))
			{
				choice.execute(choice_data, choice_name)
			}
			else if (btn2press || gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gp_face1))
			{
				if (global.chemg_menu_depth > 0)
					global.chemg_menu_depth -= 1
			
				if (global.chemg_menu_depth == 0)
					global.interact = global.chemg_interact
			}
		
		}
		for (i = 0; i < array_length(global.input_pressed); i += 1) {
			global.input_pressed[i] = 0
			global.input_held[i] = 0
			global.input_released[i] = 0
		}
		
		if (uppress) keyboard_clear(vk_up)
		if (downpress) keyboard_clear(vk_down)
		if (leftpress) keyboard_clear(vk_left)
		if (rightpress) keyboard_clear(vk_right)
		if (btn2press) keyboard_clear(vk_escape)
		if (btn1press) keyboard_clear(vk_enter)
		
		if (change != 0) global.chemg_menu_indices[depth_ndx] = (global.chemg_menu_indices[depth_ndx] + num_choices + change) % num_choices
		
		draw_set_font(fnt_main)
		draw_set_colour(c_white)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		var yy = global.chemg_yoffset
		var vspacing = 15
		scr_84_draw_text_outline(10, yy, "====[ menu ]==== [ gold: " + string(global.gold) + " light gold: " + string(global.lgold) + " ]")
		yy += vspacing
		global.chemg_max_depth = -1
		global.chemg_cursor_y = 0
		scr_84_draw_menu(global.chemg_menus, 10, yy, vspacing, global.chemg_menu_indices, 0, global.chemg_menu_depth - 1)
		global.chemg_yoffset = min(10, 400 - (global.chemg_cursor_y - global.chemg_yoffset))
	}
	
	var chemg_room_name = room_get_name(room)
	
	if (global.chemg_god_mode > 0) chemg_room_name = chemg_room_name + "[god]"
	
	//chemg_room_name += "[testbuild]" // FunnyMod Leftover
	
	if (global.chemg_show_room) {
		draw_set_font(fnt_main)
		draw_set_colour(c_white)
		var chemg_x = 635 - string_width(chemg_room_name)
		var chemg_y = 5
		scr_84_draw_text_outline(chemg_x, chemg_y, chemg_room_name)
	}
}

function scr_84_add_menu_item() {
    var list = argument[0];
    
    for (var i = 1; i < argument_count; i += 1) ds_list_add(list, argument[i]);
}

function scr_84_draw_menu(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	var array = argument0
	var xx = argument1
	var yy = argument2
	var vspacing = argument3
	var selection_indices = argument4
	var func_depth = argument5
	var menu_depth = argument6
	var length = ds_list_size(array)
	
	for (var i = 0; i < length; i += 3)
	{
		var ndx = i / 3
		var handler = ds_list_find_value(array, i)
		
		if (is_string(handler))
			continue
		
		var item = ds_list_find_value(array, i + 1)
		var name = ds_list_find_value(array, i + 2)
		var selected = false
		var prefix = "  "
		
		if (ndx == selection_indices[func_depth])
			selected = true
		
		draw_set_colour(c_white)
		
		if (selected)
		{
			draw_set_colour(c_yellow)
			prefix = "> "
			
			if (func_depth > global.chemg_max_depth)
			{
				global.chemg_max_depth = func_depth
				global.chemg_cursor_y = yy
			}
		}
		
		var draw_handler = variable_struct_get(handler, "draw_text")
		var oldname = name
		
		if (draw_handler)
			name = draw_handler(item, name)
		
		if (is_undefined(name))
			show_message(oldname)
		
		scr_84_draw_text_outline(xx, yy, prefix + name)
		yy += vspacing
		
		if (func_depth < menu_depth && ndx == selection_indices[func_depth])
			yy = scr_84_draw_menu(item, xx + 20, yy, vspacing, selection_indices, func_depth + 1, menu_depth)
	}
	
	return yy;
}

function scr_84_pop(){
    if (!variable_global_exists("chemg_stack")) {
        global.chemg_stack = array_create(0);
        global.chemg_stack[0] = 0;
    }
    
    var top_ndx = global.chemg_stack[0];
    
    if (top_ndx <= 0) show_error("stack empty", true);
    
    global.chemg_stack[0] = top_ndx - 1;
    return global.chemg_stack[top_ndx];
}

function scr_84_push(){
    if (!variable_global_exists("chemg_stack")) {
        global.chemg_stack = array_create(0);
        global.chemg_stack[0] = 0;
    }
    
    var top_ndx = global.chemg_stack[0];
    
    for (var i = 0; i < argument_count; i += 1) global.chemg_stack[top_ndx + i + 1] = argument[i];
    
    global.chemg_stack[0] = top_ndx + argument_count;
}

function scr_84_set_draw_font(font){
    global.chemg_font = font;
    draw_set_font(scr_84_get_font(font));
}

function scr_84_get_sound(soundname) {
    var sound_file_name = soundname;
    
    if (global.lang == "ja") sound_file_name += "_ja";
    
    return asset_get_index(sound_file_name);
}

function scr_84_get_sprite(spritename) { return ds_map_find_value(global.chemg_sprite_map, spritename); }
function scr_84_is_digit(letter) { return letter >= "0" && letter <= "9"; }

/// @arg FileName
function scr_84_load_map_json(argument0){
	var filename = argument0
	
	if (file_exists(filename))
	{
		var file_buffer = buffer_load(filename)
		var json = buffer_read(file_buffer, buffer_string)
		buffer_delete(file_buffer)
		return json_decode(json);
	}
	else
	{
		debug_log("file: " + filename + "does not exist")
		return json_decode("{}");
	}
}


function scr_84_lang_load(){
	var name = "lang_" + global.lang + ".json"
	var orig_filename = working_directory + "lang/" + name
	var new_filename = working_directory + "lang-new/" + name
	var filename = orig_filename
	var type = "orig"
	var orig_map = json_decode("{}")
	
	if (!is_english()) {
		debug_log("loading lang: " + orig_filename)
		orig_map = scr_84_load_map_json(orig_filename)
		
		if (file_exists(new_filename)) {
			var new_map = scr_84_load_map_json(new_filename)
			var new_date = real(ds_map_find_value(new_map, "date"))
			var orig_date = real(ds_map_find_value(orig_map, "date"))
			debug_log("orig_date: " + string(orig_date))
			debug_log(" new_date: " + string(new_date))
			
			if (new_date > orig_date) {
				debug_log("using new language file")
				ds_map_destroy(orig_map)
				orig_map = new_map
				filename = new_filename
				type = "new(" + string(new_date) + ")"
			} else {
				debug_log("using orig language file")
			}
		}
		
		ds_map_destroy(global.lang_map)
		global.lang_map = orig_map
		
		if (!is_english()) {
			global.jp_data_loaded = true
			debug_log("loaded: " + filename + ", entries: " + string(ds_map_size(global.lang_map)))
		}
	}
	
	return type;
}
