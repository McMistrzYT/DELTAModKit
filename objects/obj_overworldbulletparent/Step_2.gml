if (destroyoffscreen == true){
	if (!scr_onscreen_tolerance(id, tolerance))
		instance_destroy()
}

if (camera_lock) {
	var _cx = camerax()
	var _cy = cameray()
	
	if (camera_lock_xwas == -1) {
		camera_lock_xwas = _cx
		camera_lock_ywas = _cy
	}
	
	if (camera_lock_xwas != _cx || camera_lock_ywas != _cy) {
		x += (_cx - camera_lock_xwas)
		y += (_cy - camera_lock_ywas)
	}
	
	camera_lock_xwas = _cx
	camera_lock_ywas = _cy
}
