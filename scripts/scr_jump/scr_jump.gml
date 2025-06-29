function scr_jump_to_point_sprite(arg0, arg1, arg2, arg3, arg4, arg5)
{
    __jump_to_point = instance_create(x, y, obj_jump_to_point);
    __jump_to_point.target = id;
    
    with (__jump_to_point)
    {
        startx = x;
        starty = y;
        endx = arg0;
        endy = arg1;
        jumpspeed = arg2;
        jumptime = arg3;
        jumpsprite = arg4;
        landsprite = arg5;
        
        if (arg4 > 0)
            usesprites = 1;
        
        drawshadow = 0;
    }
    
    return __jump_to_point;
}

function scr_jump_to_point(arg0, arg1, arg2, arg3, arg4 = 0)
{
    var ___jump = scr_jump_to_point_sprite(arg0, arg1, arg2, arg3, 0, 0);
    
    with (___jump)
    {
        trackalpha = arg4;
        trackblend = arg4;
        trackindex = arg4;
        tracksprite = arg4;
        trackangle = arg4;
    }
    
    return ___jump;
}

function scr_jump_in_place(arg0, arg1)
{
    scr_jump_to_point(x, y, arg0, arg1);
}
