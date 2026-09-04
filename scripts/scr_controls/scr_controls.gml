function scr_controls_default(){
    global.button0 = gp_face1;
    global.button1 = gp_face2;
    global.button2 = gp_face4;
    
    if (os_type == os_ps4 || os_type == os_ps5)
    {
        var os_map = os_get_info();
        var ps4_confirm_button = undefined;
        
        if (os_map != -1)
        {
            var mapsize = ds_map_size(os_map);
            var key = ds_map_find_first(os_map);
            
            for (var i = 0; i < (mapsize - 1); i++)
            {
                if (key == "enter_button_assign")
                    ps4_confirm_button = ds_map_find_value(os_map, key);
                else
                    key = ds_map_find_next(os_map, key);
            }
            
            ds_map_destroy(os_map);
        }
        
        if (ps4_confirm_button == 0)
        {
            global.button0 = gp_face2;
            global.button1 = gp_face1;
        }
        else
        {
            global.button0 = gp_face1;
            global.button1 = gp_face2;
        }
        
        global.button2 = gp_face4;
    }
    //else if (scr_is_switch_os())
    //{
    //    global.button0 = gp_face2;
    //    global.button1 = gp_face1;
    //    global.button2 = gp_face4;
    //}
    
    global.default_button0 = global.button0;
    global.default_button1 = global.button1;
    global.default_button2 = global.button2;
    global.input_k[0] = vk_down;
    global.input_k[1] = vk_right;
    global.input_k[2] = vk_up;
    global.input_k[3] = vk_left;
    global.input_k[4] = ord("Z");
    global.input_k[5] = ord("X");
    global.input_k[6] = ord("C");
    global.input_k[7] = vk_enter;
    global.input_k[8] = vk_shift;
    global.input_k[9] = vk_control;
    global.input_g[0] = gp_padd;
    global.input_g[1] = gp_padr;
    global.input_g[2] = gp_padu;
    global.input_g[3] = gp_padl;
    global.input_g[4] = global.button0;
    global.input_g[5] = global.button1;
    global.input_g[6] = global.button2;
    global.input_g[7] = 999;
    global.input_g[8] = 999;
    global.input_g[9] = 999;
    
    if (!i_ex(obj_gamecontroller)) instance_create(0, 0, obj_gamecontroller);    
    with (obj_gamecontroller) gamepad_shoulderlb_reassign = 0;
}

function scr_input_manager_init()
{
    global.kbdPressedMap = ds_map_create();
    global.kbdRepeatDelaySec = 0.4166666666666667;
    global.kbdRepeatDurationSec = 0.1;
}

function scr_input_manager_process(){ global.kbdBlocked = false; }

function sunkus_kb_block(){ global.kbdBlocked = true; }

function sunkus_kb_check(key) { return global.kbdBlocked ? false : keyboard_check(key); }

function sunkus_kb_check_pressed_with_repeat(key)
{
    if (global.kbdBlocked)
        return false;
    
    if (keyboard_check_pressed(key))
    {
        ds_map_set(global.kbdPressedMap, key, global.kbdRepeatDelaySec);
        return true;
    }
    
    if (keyboard_check(key))
    {
        var time = ds_map_find_value(global.kbdPressedMap, key) - (delta_time / 1000000);
        
        if (time < 0)
        {
            ds_map_set(global.kbdPressedMap, key, global.kbdRepeatDurationSec);
            return true;
        }
        
        ds_map_set(global.kbdPressedMap, key, time);
    }
    
    return false;
}

function sunkus_kb_check_pressed(key){ return global.kbdBlocked ? false : keyboard_check_pressed(key); }
function sunkus_kb_check_released(key){ return global.kbdBlocked ? false : keyboard_check_released(key); }
function sunkus_kb_check_direct(key){ return global.kbdBlocked ? false : keyboard_check_direct(key); }
function sunkus_kb_clear(key) { return global.kbdBlocked ? false : keyboard_clear(key); }

function scr_ascii_input_names(){
    global.asc_def[8] = "Backspace";
    global.asc_def[9] = "Tab";
    global.asc_def[12] = "Numpad 5 (nmlk off)";
    global.asc_def[13] = "Enter";
    global.asc_def[19] = "Pause";
    global.asc_def[20] = "Caps lock";
    global.asc_def[27] = "Escape";
    global.asc_def[32] = "Space";
    global.asc_def[33] = "Page up";
    global.asc_def[34] = "Page down";
    global.asc_def[35] = "End";
    global.asc_def[36] = "Home";
    global.asc_def[37] = "Left";
    global.asc_def[38] = "Up";
    global.asc_def[39] = "Right";
    global.asc_def[40] = "Down";
    global.asc_def[45] = "Insert";
    global.asc_def[46] = "Delete";
    global.asc_def[48] = "0";
    global.asc_def[49] = "1";
    global.asc_def[50] = "2";
    global.asc_def[51] = "3";
    global.asc_def[52] = "4";
    global.asc_def[53] = "5";
    global.asc_def[54] = "6";
    global.asc_def[55] = "7";
    global.asc_def[56] = "8";
    global.asc_def[57] = "9";
    global.asc_def[65] = "A";
    global.asc_def[66] = "B";
    global.asc_def[67] = "C";
    global.asc_def[68] = "D";
    global.asc_def[69] = "E";
    global.asc_def[70] = "F";
    global.asc_def[71] = "G";
    global.asc_def[72] = "H";
    global.asc_def[73] = "I";
    global.asc_def[74] = "J";
    global.asc_def[75] = "K";
    global.asc_def[76] = "L";
    global.asc_def[77] = "M";
    global.asc_def[78] = "N";
    global.asc_def[79] = "O";
    global.asc_def[80] = "P";
    global.asc_def[81] = "Q";
    global.asc_def[82] = "R";
    global.asc_def[83] = "S";
    global.asc_def[84] = "T";
    global.asc_def[85] = "U";
    global.asc_def[86] = "V";
    global.asc_def[87] = "W";
    global.asc_def[88] = "X";
    global.asc_def[89] = "Y";
    global.asc_def[90] = "Z";
    global.asc_def[91] = "Windows";
    global.asc_def[96] = "Numpad 0";
    global.asc_def[97] = "Numpad 1";
    global.asc_def[98] = "Numpad 2";
    global.asc_def[99] = "Numpad 3";
    global.asc_def[100] = "Numpad 4";
    global.asc_def[101] = "Numpad 5";
    global.asc_def[102] = "Numpad 6";
    global.asc_def[103] = "Numpad 7";
    global.asc_def[104] = "Numpad 8";
    global.asc_def[105] = "Numpad 9";
    global.asc_def[106] = "Numpad *";
    global.asc_def[107] = "Numpad +";
    global.asc_def[109] = "Numpad -";
    global.asc_def[110] = "Numpad .";
    global.asc_def[111] = "Numpad /";
    global.asc_def[112] = "F1";
    global.asc_def[113] = "F2";
    global.asc_def[114] = "F3";
    global.asc_def[115] = "F4";
    global.asc_def[116] = "F5";
    global.asc_def[117] = "F6";
    global.asc_def[118] = "F7";
    global.asc_def[119] = "F8";
    global.asc_def[120] = "F9";
    global.asc_def[121] = "F10";
    global.asc_def[122] = "F11";
    global.asc_def[123] = "F12";
    global.asc_def[144] = "Num Lock";
    global.asc_def[145] = "Scroll Lock";
    global.asc_def[160] = "Shift (left)";
    global.asc_def[161] = "Shift (right)";
    global.asc_def[162] = "Ctrl (left)";
    global.asc_def[163] = "Ctrl (right)";
    global.asc_def[164] = "Alt (left)";
    global.asc_def[165] = "Alt (right)";
    global.asc_def[186] = ";";
    global.asc_def[187] = "=";
    global.asc_def[188] = ",";
    global.asc_def[189] = "-";
    global.asc_def[190] = ".";
    global.asc_def[191] = "?";
    global.asc_def[192] = "~";
    global.asc_def[219] = "[";
    global.asc_def[220] = "\\";
    global.asc_def[221] = "]";
    global.asc_def[222] = "'";
    global.asc_def[16] = "Shift";
    global.asc_def[17] = "Control";
    global.asc_def[18] = "Alt";
}

function scr_gamepad_check_pressed_any(){
	var button_pressed
	
	if (!i_ex(obj_gamecontroller)) return false;
	else {
		button_pressed = false
		
		for (var i = 0; i < 10; i += 1) {
			if (gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, global.input_g[i])) {
				button_pressed = true
				break
			}
		}
	}
	
	return button_pressed;
}

function scr_gamepad_axis_check(gamepadid, axis){
	axis_value = obj_time.axis_value
	__returnvalue = 0
	
	if (axis == 0) {
		if (gamepad_axis_value(gamepadid, gp_axislv) >= axis_value)
			__returnvalue = 1
	}
	
	if (axis == 1) {
		if (gamepad_axis_value(gamepadid, gp_axislh) >= axis_value)
			__returnvalue = 1
	}
	
	if (axis == 2) {
		if (gamepad_axis_value(gamepadid, gp_axislv) <= -axis_value)
			__returnvalue = 1
	}
	
	if (axis == 3) {
		if (gamepad_axis_value(gamepadid, gp_axislh) <= -axis_value)
			__returnvalue = 1
	}
	
	return __returnvalue;
}

function scr_gamepad_check_any(){
	var any_input
	
	if (!i_ex(obj_gamecontroller))
	{
		return false;
	}
	else
	{
		any_input = false
		
		for (var i = 0; i < 4; i += 1)
		{
			if (scr_gamepad_axis_check(obj_gamecontroller.gamepad_id, i)) {
				any_input = true
				break
			}
		}
		
		for (var i = 0; i < 10; i += 1)
		{
			if (gamepad_button_check(obj_gamecontroller.gamepad_id, global.input_g[i]))
			{
				any_input = true
				break
			}
		}
	}
	
	return any_input;
}
