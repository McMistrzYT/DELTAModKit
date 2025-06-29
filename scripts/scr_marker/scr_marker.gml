function scr_marker(arg0, arg1, arg2)
{
    thismarker = instance_create(arg0, arg1, obj_marker);
    
    with (thismarker)
    {
        sprite_index = arg2;
        image_speed = 0;
    }
    
    return thismarker;
}

function scr_dark_marker(arg0, arg1, arg2)
{
    thismarker = instance_create(arg0, arg1, obj_marker);
    
    with (thismarker)
    {
        sprite_index = arg2;
        image_speed = 0;
        image_xscale = 2;
        image_yscale = 2;
    }
    
    return thismarker;
}
