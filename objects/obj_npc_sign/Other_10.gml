/// @desc Dialogue is Added Here Normally, but as this is DMK not DR it will usually be done via Variables!
global.msc = 0;
global.typer = 5;
if (global.darkzone == 1) global.typer = 6;

global.fc = 0;
global.fe = 0;
global.interact = 1;
global.msg[0] = stringsetloc("* You can't read these symbols...&* Or maybe it's the handwriting./%", "obj_npc_sign_slash_Other_10_gml_8_0");

if !is_undefined(CUSTOM_TEXT) {
	if USECUSTOMFUNC
		CUSTOM_FUNC()
	else {
		if !is_array(CUSTOM_TEXT) CUSTOM_TEXT = [CUSTOM_TEXT]
		for (var i = 0; i <= array_length(CUSTOM_TEXT); i++){
			if i >= array_length(CUSTOM_TEXT) {
				global.msg[i] = "%%"
			} else {
				global.msg[i] = string(CUSTOM_TEXT[i])
			}
		}
	}
}

read += 1;
myinteract = 3;
mydialoguer = instance_create(0, 0, obj_dialoguer);