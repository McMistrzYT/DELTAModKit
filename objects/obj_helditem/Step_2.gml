if (!held) exit

var target = obj_mainchara

with (obj_actor) {
	if (name == "kris")	{
		target = self
		break
	}
}

if (!instance_exists(target)) exit

var xx = 0
var yy = 0
var cutscene = false

if (i_ex(obj_mainchara)) cutscene = obj_mainchara.cutscene

if (!cutscene && !override_facing)
{
	if (global.facing == 0) { }
	
	if (global.facing == 2) { }
	
	if (global.facing == 1) image_xscale = x_scale	
	if (global.facing == 3) image_xscale = -x_scale
}

x = target.bbox_left + (0.5 * (target.bbox_right - target.bbox_left)) + xx + (xoffset * sign(image_xscale))
y = ((target.bbox_top + yy) + generaloffset) + yoffset
reflection_offset = -generaloffset

if (!custom_depth) depth = target.depth - 1
