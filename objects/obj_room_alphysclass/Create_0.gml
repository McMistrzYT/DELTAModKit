con = -1

if (scr_flag_get(1324) == 0)
{
	var sunset = scr_marker(3, 0, spr_torielclass_sunsetoverlay)
	
	with (sunset)
	{
		image_alpha = 0.4
		depth = 2000
	}
}

var door = scr_marker(236, 26, spr_classdoor)
with (door) {
	//scr_depth()
	depth = 900000
}

var doorb = instance_create(242, 48, obj_doorB)

with (doorb) {
	doorFacing = 0
	doorPreset = 1
}

var wallpaper_readable = instance_create(167, 92, obj_readable_room1)

with (wallpaper_readable) {
	extflag = "alphysclass_wallpaper"
	image_xscale = 0.9
	image_yscale = 0.45
}

var quotes_readable = instance_create(45, 47, obj_readable_room1)

with (quotes_readable) {
	extflag = "alphysclass_quotes"
	image_xscale = 1
	image_yscale = 1
}

var roses_readable = instance_create(103, 89, obj_readable_room1)

with (roses_readable) {
	extflag = "alphysclass_roses"
	image_xscale = 0.55
	image_yscale = 0.368421
}

var clock_readable = instance_create(211, 52, obj_readable_room1)

with (clock_readable) {
	extflag = "alphysclass_clock"
	image_xscale = 0.9473684
	image_yscale = 0.9
}

with obj_readable_room1 {
	USECUSTOMFUNC = true
	CUSTOM_TEXT = "%%";
	CUSTOM_FUNC = function() {	
		skip = 1
		myinteract = 0;
		with obj_room_alphysclass {
			show_convo(other.extflag, other.read)
		}
	}	
}

show_convo = function(extflag, readcount = 0){
	switch (extflag) {
		case "alphysclass_wallpaper":
			con = 10			
			if (global.facing == 2) con = 14
			
			break
		
		case "alphysclass_quotes":
			con = 30			
			if (readcount > 0) con = 32
			
			break
		
		case "alphysclass_roses":
			con = 40
			break
		
		case "alphysclass_clock":
			con = 50
			break
	}
}
