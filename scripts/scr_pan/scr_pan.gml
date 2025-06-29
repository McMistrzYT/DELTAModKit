function scr_pan(arg0, arg1, arg2)
{
    panner = instance_create(0, 0, obj_panner);
    panner.panmax = arg2;
    panner.panx = arg0;
    panner.pany = arg1;
}

function scr_pan_lerp(arg0, arg1, arg2, arg3 = -1)
{
    panner = instance_create(arg0, arg1, obj_panner);
    panner.panmax = arg2;
    panner.type = 1;
    
    if (arg3 != -1)
        panner.locktype = arg3;
}

function scr_pan_to_obj(arg0, arg1)
{
    _panx = arg0.x - floor((__view_get(e__VW.WView, 0) / 2) - (arg0.sprite_width / 2));
    _pany = arg0.y - floor((__view_get(e__VW.HView, 0) / 2) - (arg0.sprite_height / 2));
    
    if (_panx < 0)
        _panx = 0;
    
    if (_panx >= (room_width - __view_get(e__VW.WView, 0)))
        _panx = room_width - __view_get(e__VW.WView, 0);
    
    if (_pany < 0)
        _pany = 0;
    
    if (_pany >= (room_height - __view_get(e__VW.HView, 0)))
        _pany = room_height - __view_get(e__VW.HView, 0);
    
    scr_pan_lerp(_panx, _pany, arg1);
}
