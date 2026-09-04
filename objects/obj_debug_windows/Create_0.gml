enum ____DEBUGWINDOWS__BUTTONSTATES {
	Base,
	Hovered,
	Held,
	Released
}

enum ____DEBUGWINDOWS__TYPES {
	ObjectSelected,
	NoObject,
}

worldmultw = (640 / camerawidth())
worldmulth = (480 / cameraheight())

mx = (mouse_x - camerax()) * worldmultw;
my = (mouse_y - cameray()) * worldmulth;
remmx = mx;
remmy = my;

xx = remmx - (40 * worldmultw);
yy = remmy - (20 * worldmulth);
minx = 20
miny = 20
maxx = 500
maxy = 300
xx = clamp(xx, minx, maxx);
yy = clamp(yy, miny, maxy);
type = ____DEBUGWINDOWS__TYPES.ObjectSelected;

_addbutton = function(name, execute = function(mydata) {}, init = function(mydata) {}) {
	button_text[button_amount] = name
	button_clicked[button_amount] = false
	button_state[button_amount] = ____DEBUGWINDOWS__BUTTONSTATES.Base
	button_data[button_amount] = {}
	button_data[button_amount].execute = execute
	button_data[button_amount].init = init
	button_data[button_amount].hover = function(mydata) {
		var index = mydata.index
		button_state[index] = ____DEBUGWINDOWS__BUTTONSTATES.Hovered;
		replacedcur = true
		//show_message(index)
		window_set_cursor(cr_handpoint);
        if (mouse_check_button(mb_left)) { button_state[index] = ____DEBUGWINDOWS__BUTTONSTATES.Held; }            
        if (mouse_check_button_released(mb_left)) { button_state[index] = ____DEBUGWINDOWS__BUTTONSTATES.Released; button_clicked[mydata.index] = true; }
	}
	button_data[button_amount].update = undefined
	button_data[button_amount].index = button_amount
	init(button_data[button_amount])
	button_amount++
}

button_text = []
button_data = []
button_clicked = []
button_state = []
button_amount = 0
_addbutton("Drag Window!", function(button_data) {
	if (mouse_check_button(mb_left)) {
	    xx += (mx - remmx);
	    yy += (my - remmy);
		return false; // If Held, return false [Do not automatically set as unclicked]
	}
}, function(mydata) {
	mydata.hover = function(mydata) {
		var index = mydata.index
        button_state[index] = ____DEBUGWINDOWS__BUTTONSTATES.Hovered;
            
        if (mouse_check_button(mb_left)) { button_clicked[index] = true; button_state[index] = ____DEBUGWINDOWS__BUTTONSTATES.Released; }
	}
})

basebuttonamount = button_amount

event_user(15);

_process_stringtype = function(value, forcetype = "") {
	var type = forcetype
	var onlynumbers = true
	var onlyspaces = true
	var originalvalue = value
	var processedstring = ""
	
	for (var i = 1; i <= string_length(value); i++) {
		var char = string_char_at(value, i)
		var include = true
		if !((char >= "0" && char <= "9") || (char == "." || char == "-") || char == " ") onlynumbers = false;
		if onlyspaces == true {
			onlyspaces = false
			switch char {
				case " ": include = false; onlyspaces = true break
				case "\"":
				case "'":
					if type == "" || type == "string" {
						type = "string"
						include = false;
					}
				break
				case "[":
					if type == "" || type == "array" {
						type = "array"
						include = false
						var endingpos = string_length(value) - string_last_pos("]", value)
						value = string_delete(value, string_length(value), endingpos + 1)
						value = string_delete(value, 1, i)
						processedstring = []
						var split = string_split(value, ",", true) // I'll have to rework this later...
						show_debug_message(split)
						for (var j = 0; j < array_length(split); j++) {
								
							array_push(processedstring, _process_stringtype(split[j]))
						}
					}
				break
			}
		}
		if type == "string" {
			if i == string_last_pos("\"", value) { include = false }
		}
		if type == "array" { break; }
		
		if include processedstring += char
	}
	value = processedstring
	
	if forcetype == "" {
		if originalvalue == "true" || originalvalue == "false" {
			value = (originalvalue == "true") ? true : false
			type = "boolean"
		}
		if onlynumbers && forcetype == "" type = "number"
	}
		
	
	switch type {
		default: break;
		case "real":
		case "number":
		case "num":
			var sanitized = ""
			var containsnumbers = false
			for (var i = 1; i <= string_length(value); i++) {
				var char = string_char_at(value, i)
				var good = false
				if (char >= "0" && char <= "9") { good = true containsnumbers = true }
				if (char == "." || char == "-") { good = true }
				
				if good sanitized += char
			}
			value = 0
			if containsnumbers { value = real(sanitized) }
		break;
		case "arr":
		case "array":
			if !is_array(value) value = [value]
		break;
	}
	return value
}

_stringgettype = function(str, def = "", forcetype = "") {
	var value = get_string(str, def)
	
	return _process_stringtype(value, forcetype)
}
/*
var processtest_string = _process_stringtype("\"Process Test String!\"")
var processtest_array = _process_stringtype("[\"Process\", \"Test\", \"Array\"]")
var processtest_number = _process_stringtype("12251225")

show_message(
string(@"PROCESS TEST, 
	String: {0},
	Array: {1},
	Number: {2}
	",
	processtest_string,
	processtest_array,
	processtest_number,
	)
)
show_debug_message(processtest_array)
*/
