function instance_create(x, y, object){
	var myDepth = object_get_depth(object);
    return instance_create_depth(x, y, myDepth, object);
}

function d_make(side = -1, zurasu = -1, stay = -1, runcheck = -1, preventcskip = -1){
    var _____d = instance_create(0, 0, obj_dialoguer);
    
    if (side != -1) _____d.side = side;    
    if (zurasu != -1) _____d.zurasu = zurasu;    
    if (stay != -1) _____d.stay = stay;    
    if (runcheck != -1) _____d.runcheck = runcheck;    
    if (preventcskip != -1) _____d.preventcskip = preventcskip; // This is normally broken in deltarune due to an copy and paste error
    
    return _____d;
}

function k_d(time = 0){
	with (obj_dialoguer) {
		if (time > 0) {
			var _stayer = instance_create_depth(x, y, depth + 1, obj_writer_stay)
			_stayer.side = side
			_stayer.xoff = xoff
			_stayer.yoff = yoff
			_stayer.boxwidth = boxwidth
			_stayer.boxheight = boxheight
			_stayer.cur_jewel = cur_jewel
			_stayer.doom = time
			_stayer.c_border = c_border
			_stayer.c_inner = c_inner
		}
		
		instance_destroy()
	}
	
	with (obj_writer)
		instance_destroy()
	
	with (obj_choicer_neo)
		instance_destroy()
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