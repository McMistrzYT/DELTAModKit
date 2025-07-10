function instance_create(arg0, arg1, arg2){
	var myDepth = object_get_depth(arg2);
    return instance_create_depth(arg0, arg1, myDepth, arg2);
}

function d_make(arg0 = -1, arg1 = -1, arg2 = -1, arg3 = -1, arg4 = -1)
{
    var _____d = instance_create(0, 0, obj_dialoguer);
    
    if (arg0 != -1)
        _____d.side = arg0;
    
    if (arg1 != -1)
        _____d.zurasu = arg1;
    
    if (arg2 != -1)
        _____d.stay = arg2;
    
    if (arg3 != -1)
        _____d.runcheck = arg3;
    
    if (arg4 != -1)
        _____d.preventcskip = arg3;
    
    return _____d;
}

function scr_writetext(msc, msg1, fc, typer)
{
    global.fc = 0;
    global.msc = msc;
    
    if (msg1 != "x")
        global.msg[0] = msg1;
    
    if (fc != 0)
        global.fc = fc;
    
    global.typer = 5;
    
    if (typer != 0)
        global.typer = typer;
    
    instance_create(0, 0, obj_dialoguer);
}