if (wall_destroy == 1)
{
    if (x < (camerax() - 80))
        instance_destroy();
    
    if (x > (camerax() + 760))
        instance_destroy();
    
    if (y < (cameray() - 80))
        instance_destroy();
    
    if (y > (cameray() + 580))
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