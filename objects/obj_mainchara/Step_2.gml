if (global.darkzone == true) {
    if object_exists(asset_get_index("obj_camera_advanced")) && (instance_exists(obj_camera_advanced)) {
        obj_camera_advanced.cutscene = cutscene;
        
        with (obj_camera_advanced)
            event_user(0);
    } else if (cutscene == false && !instance_exists(obj_shake)) {
        wd = x - floor((camerawidth() / 2) - (initwd / 2));
        ht = y - floor((cameraheight() / 2) - (initht / 2));
        camerax_set(wd);
        cameray_set(ht);
        
        if camerax() < 0 camerax_set(0)
        if camerax() > (room_width - camerawidth()) camerax_set(room_width - camerawidth());
        
        if cameray() < 0 cameray_set(0)
        if cameray() > (room_height - cameraheight()) cameray_set(room_height - cameraheight());
    }
}

if (global.darkzone == false) {
    if (global.plot >= 245 || global.chapter >= 2) {
        if object_exists(asset_get_index("obj_camera_advanced")) && (instance_exists(obj_camera_advanced)) {
	        obj_camera_advanced.cutscene = cutscene;
        
	        with (obj_camera_advanced)
	            event_user(0);
		} else if (cutscene == false && !instance_exists(obj_shake)) {
            __view_set(e__VW.Object, 0, noone);
            wd = (x - floor(camerawidth() / 2)) + 11;
            ht = (y - floor(cameraheight() / 2)) + 17;
	        camerax_set(wd);
	        cameray_set(ht);
			
	        if camerax() < 0 camerax_set(0)
	        if camerax() > (room_width - camerawidth()) camerax_set(room_width - camerawidth());
			
	        if cameray() < 0 cameray_set(0)
	        if cameray() > (room_height - cameraheight()) cameray_set(room_height - cameraheight());
        }
    }
}

if (bg == true) && object_exists(asset_get_index("obj_backgrounderparent")) {
    with (obj_backgrounderparent)
        event_user(0);
}