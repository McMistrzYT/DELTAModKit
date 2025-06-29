if (global.flag[12] == 0)
{
    __view_set(e__VW.XView, camera_, mycamerax + (shakex * shakesign));
    __view_set(e__VW.YView, camera_, mycameray + (shakey * shakesign));
}

if (permashake == 0)
{
    if (shakex > 0)
        shakex -= 1;
    
    if (shakey > 0)
        shakey -= 1;
}

shakesign = -shakesign;
alarm[0] = shakespeed;

if (shakex == 0 && shakey == 0)
    instance_destroy();