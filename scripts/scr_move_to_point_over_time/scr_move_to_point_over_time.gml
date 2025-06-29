function scr_move_to_point_over_time(arg0, arg1, arg2)
{
    _mmm = instance_create(x, y, obj_move_to_point);
    _mmm.target = id;
    _mmm.movex = arg0;
    _mmm.movey = arg1;
    _mmm.movemax = arg2;
    return _mmm;
}
