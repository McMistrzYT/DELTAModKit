function scr_fadeout(arg0)
{
    __fadeouter = instance_create(camerax() - 200, cameray() - 200, obj_fadeout);
    __fadeouter.fadespeed = 1 / arg0;
    __fadeouter.depth = 3;
    return __fadeouter;
}
