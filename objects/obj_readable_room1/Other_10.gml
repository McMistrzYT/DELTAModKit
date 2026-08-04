/// @desc Dialogue is Added Here Normally, but as this is DMK not DR it will usually be done via Variables!
myinteract = 3
_unfreeze = -1
global.msc = 0
global.typer = 5
if (global.darkzone == 1) global.typer = 6

global.fe = 0
global.fc = 0
global.interact = 1

with (obj_darkcontroller) charcon = 0

global.msg[0] = stringsetloc("* Suddenly^1, your body seizes up^1.&* What are you looking at?/%", "obj_readable_room1_slash_Other_10_gml_13_0")

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


if (skip == 0) mydialoguer = instance_create(0, 0, obj_dialoguer)

read += 1

if _unfreeze == -1 _unfreeze = skip

if (_unfreeze == 1){
	global.interact = 0
	skip = 0
}