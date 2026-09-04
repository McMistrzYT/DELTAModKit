if (init == 0){
	if (issolid) {
		if (!i_ex(mysolid))
			mysolid = instance_create(x, y, obj_solidblock)
	}
	
	init = 1
}

if (issolid) {
	if (collision_lenient) {
		var xx = mysolid.x
		var yy = mysolid.y
		mysolid.x = x
		mysolid.y = y
		
		with (mysolid) {
			if (place_meeting(x, y, obj_mainchara))
			{
				x = xx
				y = yy
			}
		}
	} else {
		mysolid.x = x
		mysolid.y = y
	}
	
	mysolid.sprite_index = sprite_index
	mysolid.mask_index = mask_index
	mysolid.image_xscale = image_xscale
	mysolid.image_yscale = image_yscale
	mysolid.image_angle = image_angle
}

if (markerstick && i_ex(marker)) setxy(x - markerxoffset, y - markeryoffset, marker)
