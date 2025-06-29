function scr_caterpillar_interpolate(arg0 = "none")
{
    if (arg0 == "all")
    {
        with (obj_caterpillarchara)
            scr_caterpillar_interpolate_old();
    }
    else if (arg0 == "none")
    {
        if (object_index == obj_caterpillarchara)
            scr_caterpillar_interpolate_old();
    }
    else
    {
        with (obj_caterpillarchara)
        {
            if (name == arg0)
                scr_caterpillar_interpolate_old();
        }
    }
}

function scr_caterinterp(arg0 = "none")
{
    scr_caterpillar_interpolate(arg0);
}

function scr_caterpillar_interpolate_old()
{
    _newfacing = scr_facing_letter_to_number(scr_get_cardinal_direction(point_direction(x, y, obj_mainchara.x, obj_mainchara.y)));
    remx[0] = obj_mainchara.x;
    remy[0] = obj_mainchara.y;
    facing[0] = _newfacing;
    
    for (_iaia = target; _iaia > 0; _iaia -= 1)
    {
        remx[_iaia] = lerp(obj_mainchara.x, x, _iaia / target);
        
        if (global.darkzone == 1)
            remy[_iaia] = lerp(obj_mainchara.y, y + 16, _iaia / target);
        else
            remy[_iaia] = lerp(obj_mainchara.y, y + 6, _iaia / target);
        
        facing[_iaia] = _newfacing;
    }
}

function scr_caterpillar_facing_single(arg0, arg1)
{
    with (obj_caterpillarchara)
    {
        if (name == arg0)
        {
            for (i = 0; i < 25; i += 1)
                facing[i] = scr_facing_letter_to_number(arg1);
        }
    }
}
