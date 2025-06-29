variable = 0;
varname = "variable";
pointa = 0;
pointb = 0;
time = 0;
maxtime = 30;
target = -1;
init = 0;
easetype = 0;
easeinout = "out";
respectglobalinteract = false;

function lerp_ease_out(arg0, arg1, arg2, arg3)
{
    return lerp(arg0, arg1, scr_ease_out(arg2, arg3));
}

function lerp_ease_in(arg0, arg1, arg2, arg3)
{
    return lerp(arg0, arg1, scr_ease_in(arg2, arg3));
}

function lerp_ease_inout(arg0, arg1, arg2, arg3)
{
    return lerp(arg0, arg1, scr_ease_inout(arg2, arg3));
}
