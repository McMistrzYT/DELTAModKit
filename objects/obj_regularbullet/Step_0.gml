if (wall_destroy == 1)
{
    if (x < (__view_get(e__VW.XView, 0) - 80))
        instance_destroy();
    
    if (x > (__view_get(e__VW.XView, 0) + 760))
        instance_destroy();
    
    if (y < (__view_get(e__VW.YView, 0) - 80))
        instance_destroy();
    
    if (y > (__view_get(e__VW.YView, 0) + 580))
        instance_destroy();
}

if (updateimageangle == 1)
    image_angle = direction;

if (spin == 1)
    image_angle += spinspeed;

if (bottomfade != 0)
{
    if (y > (cameray() + bottomfade))
        image_alpha *= 0.8;
}