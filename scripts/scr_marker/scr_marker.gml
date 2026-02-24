function scr_marker(x, y, sprite){
	thismarker = instance_create(x, y, obj_marker);
    
	with (thismarker){
		sprite_index = sprite;
		image_speed = 0;
	}
    
	return thismarker;
}

function scr_dark_marker(x, y, sprite){
	thismarker = scr_marker(x, y, sprite);
	scr_darksize(thismarker)
    
	return thismarker;
}
