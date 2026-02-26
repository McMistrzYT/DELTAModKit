function distance_to_object_bbox(arg0 = id, arg1, arg2 = 0)
{
    var point1x = arg0.bbox_left + ((arg0.bbox_right - arg0.bbox_left) / 2);
    var point1y = arg0.bbox_top + ((arg0.bbox_bottom - arg0.bbox_top) / 2);
    var point2x = arg1.bbox_left + ((arg1.bbox_right - arg1.bbox_left) / 2);
    var point2y = arg1.bbox_top + ((arg1.bbox_bottom - arg1.bbox_top) / 2);
    
    if (arg2)
    {
        if (scr_debug())
        {
            var memcol = draw_get_color();
            var memalpha = draw_get_alpha();
            draw_set_color(c_red);
            draw_set_alpha(0.8);
            draw_line(point1x, point1y, point2x, point2y);
            ossafe_fill_rectangle(arg0.bbox_left, arg0.bbox_top, arg0.bbox_right + 1, arg0.bbox_bottom + 1, 0);
            ossafe_fill_rectangle(arg1.bbox_left, arg1.bbox_top, arg1.bbox_right + 1, arg1.bbox_bottom + 1, 0);
            draw_set_color(memcol);
            draw_set_alpha(memalpha);
        }
    }
    
    return point_distance(point1x, point1y, point2x, point2y);
}

function direction_to_object_bbox(arg0 = id, arg1, arg2 = false, arg3 = 0)
{
    var point1x = arg0.bbox_left + ((arg0.bbox_right - arg0.bbox_left) / 2);
    var point1y = arg0.bbox_top + ((arg0.bbox_bottom - arg0.bbox_top) / 2);
    var point2x = arg1.bbox_left + ((arg1.bbox_right - arg1.bbox_left) / 2);
    var point2y = arg1.bbox_top + ((arg1.bbox_bottom - arg1.bbox_top) / 2);
    
    if (arg3)
    {
        if (scr_debug())
        {
            var memcol = draw_get_color();
            var memalpha = draw_get_alpha();
            draw_set_color(c_red);
            draw_set_alpha(0.8);
            draw_line(point1x, point1y, point2x, point2y);
            ossafe_fill_rectangle(arg0.bbox_left, arg0.bbox_top, arg0.bbox_right + 1, arg0.bbox_bottom + 1, 0);
            ossafe_fill_rectangle(arg1.bbox_left, arg1.bbox_top, arg1.bbox_right + 1, arg1.bbox_bottom + 1, 0);
            draw_set_color(memcol);
            draw_set_alpha(memalpha);
        }
    }
    
    var dir = point_direction(point1x, point1y, point2x, point2y);
    
    if (arg2)
    {
        dir += 90;
        
        if (dir > 360)
            dir -= 360;
        
        dir = round(dir / 90);
        
        if (dir == 4)
            dir = 0;
    }
    
    return dir;
}
