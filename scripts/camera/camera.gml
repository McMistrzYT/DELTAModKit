function camerax()
{
    return camera_get_view_x(view_camera[0]);
}

function camerax_set(arg0)
{
    var __xpos = arg0;
    var __ypos = camera_get_view_y(view_camera[0]);
    camera_set_view_pos(view_camera[0], __xpos, __ypos);
}

function cameray()
{
    return camera_get_view_y(view_camera[0]);
}

function camerawidth() {
	return __view_get(e__VW.WView, 0);
}

function cameraheight() {
	return __view_get(e__VW.HView, 0);
}

function cameray_set(arg0)
{
    var __xpos = camera_get_view_x(view_camera[0]);
    var __ypos = arg0;
    camera_set_view_pos(view_camera[0], __xpos, __ypos);
}
