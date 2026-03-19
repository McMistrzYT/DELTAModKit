tsiner = 0;
global.tensionselect = 0;
apparent = global.tension;
current = global.tension;
change = 0;
changetimer = 15;
red = 0;
redtimer = 0;
xx = camerax();
yy = cameray();
y = yy + 40;
x = xx - 40;
hspeed = 13;
friction = 1;
flashsiner = 0;
maxed = 0;
healthbar_surf = surface_create(96, 250);
yoffset = 0;
bluebar = 0

barcolors = []

setcolor = function(colorid) {
	try {
		barcolortype = colorid
		if global.barcolors[barcolortype % array_length(global.barcolors)] == false barcolortype = 0
		
		with global.barcolors[barcolortype % array_length(global.barcolors)] {
			other.barcolors = [
				usedtp,
				currenttp,
				glow,
				maxtp,
				backing,
				name
			]
			show_debug_message("***** TensionBar Color set to (" + string(colorid) + ") | " + name)
			return self
		}
	}
	catch (ex) {
		show_debug_message(ex)	
		return noone // FAILED.
	}
}

setcolor(global.defaultbarcolor)