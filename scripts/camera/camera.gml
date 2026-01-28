// GET CAMERA 
function camerax(cameraid = 0) {
	return camera_get_view_x(view_camera[0]);
}

function cameray(cameraid = 0) {
	return camera_get_view_y(view_camera[cameraid]);
}

function camerawidth(cameraid = 0) {
	return camera_get_view_width(view_camera[cameraid]);
}

function cameraheight(cameraid = 0) {
	return camera_get_view_height(view_camera[cameraid]);
}

// SET CAMERA
function camerax_set(camx, cameraid = 0) {
	var __xpos = camx
	var __ypos = camera_get_view_y(view_camera[cameraid])
	camera_set_view_pos(view_camera[cameraid], __xpos, __ypos)
}

function cameray_set(camy, cameraid = 0) {
	var __xpos = camera_get_view_x(view_camera[cameraid])
	var __ypos = camy
	camera_set_view_pos(view_camera[cameraid], __xpos, __ypos)
}

function camerawidth_set(camwidth, cameraid = 0) {
	var __width = camwidth
	var __height = camwidth(cameraid)
	return camera_set_view_size(view_camera[cameraid], __width, __height);
}

function cameraheight_set(camheight, cameraid = 0) {
	var __width = camerawidth(cameraid)
	var __height = camheight
	return camera_set_view_size(view_camera[cameraid], __width, __height);
}
