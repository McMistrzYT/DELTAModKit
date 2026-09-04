held = false
frozen = false
can_use = true
custom_depth = false

/// @desc When Btn Pressed
on_press = function() {}
/// @desc When Btn Held
on_hold = function() {}
/// @desc When Btn Released
on_release = function() {}

xoffset = 0
yoffset = 0
override_facing = false
reflection_offset = 0

generaloffset = -20
x_scale = 1

if global.darkzone {
	scr_darksize()
	x_scale *= 2
	generaloffset *= 2
}
