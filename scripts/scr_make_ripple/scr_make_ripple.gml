function scr_make_ripple(x, y, lifetime = 60, color = c_white, radiusmax = 160, radiusstart = 1, thickness = 15, rippledepth = 1999000, hspeed = 0, vspeed = 0, friction = 0.1, curveid = 0, ratio_y = 1, blendmode = bm_normal, banding = 0, fading = true){
	var _ripple = noone
	var _found = false
	
	if instance_exists(obj_ripples) {
		with (obj_ripples) {
			if (depth == rippledepth) {
				_found = true
				_ripple = MakeRipple(x, y, radiusmax, radiusstart, thickness, color, hspeed, vspeed, friction, lifetime, curveid, ratio_y, blendmode, banding, fading)
				blend = blendmode
			}
		}
	}
	
	if (!_found) {
		with instance_create_depth(0, 0, rippledepth, obj_ripples) {
			_ripple = MakeRipple(x, y, radiusmax, radiusstart, thickness, color, hspeed, vspeed, friction, lifetime, curveid, ratio_y, blendmode, banding, fading)
			blend = blendmode
		}
	}
	
	return _ripple
}
