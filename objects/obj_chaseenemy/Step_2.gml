if (alertcon >= 1 && frozen == 0 && ignoresolid == 0) {
	if (slide == 0)
	{
		if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_solidblock, false, true) || collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_solidenemy, false, true))
		{
			x -= hspeed
			y -= vspeed
			hspeed = 0
			vspeed = 0
		}
	}
	
	if (slide == 1)	{
		var repositioned = 0
		
		if (place_meeting(x, y, obj_solidblock) || place_meeting(x, y, obj_solidenemy)) {
			if (!place_meeting(x - hspeed, y, obj_solidblock) && !place_meeting(x - hspeed, y, obj_solidenemy)) {
				x -= hspeed
				repositioned = 1
			}
			
			if (!repositioned && !place_meeting(x, y - vspeed, obj_solidblock) && !place_meeting(x, y - vspeed, obj_solidenemy)) {
				y -= vspeed
				repositioned = 1
			}
			
			if (!repositioned) {
				x -= hspeed
				y -= vspeed
			}
		}
	}
}

if (pacetype == pacetype_followpath)
{
	if (global.interact == 0)
	{
		if (path_speed == 0)
			path_speed = pathSpeed
	}
	else
	{
		path_speed = 0
	}
}

var dobattle = false

if (touchtype == 0) {
	if (customhitbox == 1)
		hitvar = collision_rectangle(x + hitx1, y + hity1, x + hitx2, y + hity2, obj_mainchara, true, true)
	
	if ((place_meeting(x, y, obj_mainchara) && customhitbox == 0) || (customhitbox == 1 && hitvar != noone))
		dobattle = true
} else if (boxtype == 1) {
	var _xloc = x + 10
	var _yloc = y + 80
	var _w = 100
	var _h = 46
	
	if (i_ex(collision_rectangle(_xloc, _yloc, _xloc + _w, _yloc + _h, obj_mainchara, false, true)))
		dobattle = true
}

if (!(global.interact == 0 || global.interact == 4))
	dobattle = false

if (dobattle) {
	if (encounterflag > 0)
		global.flag[54] = encounterflag
	
	event_user(0)
}
