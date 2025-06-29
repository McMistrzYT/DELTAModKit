function scr_doom(arg0 = id, arg1)
{
    with (instance_create_depth(0, 0, 0, obj_doom))
    {
        alarm[0] = arg1;
        target = arg0;
        persistent = arg0.persistent;
    }
}
