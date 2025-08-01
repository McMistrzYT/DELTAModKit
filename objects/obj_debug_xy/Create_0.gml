if (instance_number(object_index) > 1)
{
    instance_destroy();
}

selected_object = noone;
mouse_held = 0;
mouse_held_r = 0;
siner = 0;
show_invisible = false;
show_all_object_xy = false;
xy_camera_relative = 0;
actor_debug_x = 0;
actor_debug_y = 0;
actor_debug_xstart = 0;
actor_debug_ystart = 0;
gridsize = 20;

if (global.darkzone == false)
{
    gridsize = 10;
}

main_focus = true;
mousebuffer = 3;
copybuffer = 0;
totalstring = " ";
actor_selected_before = false;
actor_previously_selected = -1;
panremx = camerax();
panremy = cameray();
enable_mouse_wheel = false;
old_right_click = false;
