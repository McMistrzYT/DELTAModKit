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

function scr_marker_ext(x, y, sprite, arg3 = 1, arg4 = 1, arg5 = 0, arg6 = 0, arg7 = c_white, arg8 = depth, arg9 = false, arg10 = -1, arg11 = 1, fancy = false)
{
	var objinst = obj_marker
	
	if (fancy) objinst = obj_marker_fancy
	
	var thismarker = instance_create(x, y, objinst)
	
	with (thismarker) {
		depth = arg8
		sprite_index = sprite
		image_speed = arg5
		image_xscale = arg3
		image_yscale = arg4
		image_index = arg6
		image_blend = arg7
		image_alpha = arg11
		
		if (arg9)
			scr_depth_alt()
	}
	
	if (arg10 > 0)
		scr_doom(thismarker, arg10)
	
	return thismarker;
}

function scr_marker_fromasset(arg0, arg1 = depth, arg2 = false, fancy = false)
{
	if (is_undefined(arg0))
	{
		debug_message("Warning: scr_marker_fromasset() sprite_instance didn't exist")
		return -4;
	}
	
	var sprite = layer_sprite_get_sprite(arg0)
	var index = layer_sprite_get_index(arg0)
	var imagespeed = layer_sprite_get_speed(arg0)
	var xscale = layer_sprite_get_xscale(arg0)
	var yscale = layer_sprite_get_yscale(arg0)
	var angle = layer_sprite_get_angle(arg0)
	var blend = layer_sprite_get_blend(arg0)
	var alpha = layer_sprite_get_alpha(arg0)
	var xloc = layer_sprite_get_x(arg0)
	var yloc = layer_sprite_get_y(arg0)
	var markertype = obj_marker
	
	if (fancy) markertype = obj_marker_fancy
	
	var thismarker = instance_create_depth(xloc, yloc, arg1, markertype)
	
	with (thismarker) {
		sprite_index = sprite
		image_index = index
		image_speed = imagespeed
		image_xscale = xscale
		image_yscale = yscale
		image_angle = angle
		image_blend = blend
		image_alpha = alpha
		
		if (arg2) scr_depth_alt(id, arg2)
	}
	
	return thismarker;
}

function scr_assetgetinfo(arg0)
{
	var sprite = layer_sprite_get_sprite(arg0)
	var index = layer_sprite_get_index(arg0)
	var xloc = layer_sprite_get_x(arg0)
	var yloc = layer_sprite_get_y(arg0)
	var xscale = layer_sprite_get_xscale(arg0)
	var yscale = layer_sprite_get_yscale(arg0)
	var angle = layer_sprite_get_angle(arg0)
	var blend = layer_sprite_get_blend(arg0)
	var alpha = layer_sprite_get_alpha(arg0)
	var imagespeed = layer_sprite_get_speed(arg0)
	return [sprite, index, xloc, yloc, xscale, yscale, angle, blend, alpha, imagespeed];
}
