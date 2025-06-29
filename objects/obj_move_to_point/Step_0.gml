if (i_ex(target))
{
    if (moved == 0)
    {
        x = target.x;
        y = target.y;
        dist = distance_to_point(movex, movey);
        dir = point_direction(x, y, movex, movey);
        amt = dist / movemax;
        xadd = lengthdir_x(amt, dir);
        yadd = lengthdir_y(amt, dir);
        moved = 1;
    }
    
    target.x += xadd;
    target.y += yadd;
    
    if (target.object_index == obj_actor)
    {
        target.fake_speed = amt;
        target.fake_direction = dir;
    }
    
    movetimer += 1;
    target.x = lerp(x, movex, movetimer / movemax);
    target.y = lerp(y, movey, movetimer / movemax);
    
    if (movetimer >= movemax)
    {
        if (target.object_index == obj_actor)
            target.fake_speed = 0;
        
        if (charmarker == 1)
            target.fun = 0;
        
        if (charmarker == 2)
        {
            with (target)
            {
                follow = 1;
                fun = 0;
                scr_caterpillar_interpolate();
            }
        }
        
        instance_destroy();
    }
    
    if (target == obj_move_to_point)
        instance_destroy();
}
else
{
    instance_destroy();
}
