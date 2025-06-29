function scr_shakeobj()
{
    var _shakeobj = instance_create(x, y, obj_shakeobj);
    _shakeobj.target = id;
    
    if (argument_count >= 1)
    {
        if (i_ex(argument0))
            _shakeobj.target = argument0;
    }
    
    if (argument_count >= 2)
    {
        if (argument1 != -1)
            _shakeobj.shakeamt = argument1;
    }
    
    if (argument_count >= 3)
    {
        if (argument2 != -1)
            _shakeobj.shakereduct = argument2;
    }
    
    with (_shakeobj)
        event_user(0);
}

function scr_shakeobj_x()
{
    shakeobj = instance_create(x, y, obj_shakeobj);
    shakeobj.target = id;
    
    if (argument_count >= 1)
        shakeobj.shakeamt = argument[0];
    
    if (argument_count >= 2)
        shakeobj.shakespeed = argument[1];
    
    if (argument_count == 3)
        shakeobj.shakespeed = argument[2];
    
    with (shakeobj)
        event_user(0);
    
    return shakeobj;
}
