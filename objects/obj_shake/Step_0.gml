if (active == 0)
{
    beenset = 1;
    mycamerax = __view_get(e__VW.XView, camera_);
    mycameray = __view_get(e__VW.YView, camera_);
    
    if (global.flag[12] == 0)
    {
        __view_set(e__VW.XView, camera_, mycamerax + shakex);
        __view_set(e__VW.YView, camera_, mycameray + shakey);
    }
    
    shakesign = -shakesign;
    active = 1;
    alarm[0] = shakespeed;
}
