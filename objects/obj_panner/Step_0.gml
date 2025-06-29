if (type == 0)
{
    __view_set(e__VW.XView, 0, __view_get(e__VW.XView, 0) + panx);
    __view_set(e__VW.YView, 0, __view_get(e__VW.YView, 0) + pany);
}

pantimer += 1;

if (type == 1)
{
    __view_set(e__VW.XView, 0, lerp(startx, finalx, pantimer / panmax));
    __view_set(e__VW.YView, 0, lerp(starty, finaly, pantimer / panmax));
}

if (pantimer >= panmax)
    instance_destroy();
