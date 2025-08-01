_selected_string = "No object!#MouseL:Choose&Drag#MouseR:Drag From Anchor";

if (i_ex(selected_object))
{
    so = selected_object;
    sox = selected_object.x;
    soy = selected_object.y;
    
    if (xy_camera_relative == 1)
    {
        sox -= camerax()
    }
    
    if (xy_camera_relative == 1)
    {
        soy -= cameray()
    }
    
    if (xy_camera_relative == 2)
    {
        sox -= so.xstart;
    }
    
    if (xy_camera_relative == 2)
    {
        soy -= so.ystart;
    }
    
    _selected_string = object_get_name(selected_object.object_index);
    _selected_string += (" X: " + string(sox) + " Y: " + string(soy));
    _selected_string += ("#Depth: " + string(selected_object.depth));
    _selected_string += "#Arrows: Move Precisely";
}

draw_set_font(fnt_mainbig);
draw_set_color(c_black);
draw_rectangle(0, 40, 120, 0, false);
draw_set_color(c_white);
scr_84_draw_text_outline(0, 0, string_hash_to_newline(_selected_string));
draw_set_font(fnt_main);
draw_text(330, 0, string_hash_to_newline(stringsetloc("PgDown: Show All Info", "obj_debug_xy_slash_Draw_74_gml_26_0")));
draw_text(330, 20, string_hash_to_newline(stringsetsub("CameraX: ~1 CameraY: ~2", string(camerax()), string(cameray()), "obj_debug_xy_slash_Draw_74_gml_27_0")));

if (show_invisible == true)
{
    draw_text(330, 40, string_hash_to_newline(stringsetloc("Show Invisible", "obj_debug_xy_slash_Draw_74_gml_28_0")));
}

draw_text(330, 60, string_hash_to_newline(stringsetsub("instance_count: ~1", string(instance_count), "obj_debug_xy_slash_Draw_74_gml_29_0_b")));
draw_text(480, 0, string_hash_to_newline(stringsetloc("PgUp: XY Camera-Relative", "obj_debug_xy_slash_Draw_74_gml_29_0")));

if (xy_camera_relative >= 1)
{
    draw_set_color(c_yellow);
    
    if (xy_camera_relative == 1)
    {
        draw_text(480, 20, string_hash_to_newline(stringsetloc("XY is camera-relative!", "obj_debug_xy_slash_Draw_74_gml_33_0")));
    }
    
    if (xy_camera_relative == 2)
    {
        draw_text(480, 20, string_hash_to_newline(stringsetloc("XY is StartXY relative!", "obj_debug_xy_slash_Draw_74_gml_34_0")));
    }
}