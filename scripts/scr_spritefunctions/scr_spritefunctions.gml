function draw_sprite_ext_centerscale(sprite, subimg, x, y, xscale, yscale, rot, col, alpha){
	var _xoff = sprite_get_xoffset(sprite) * image_xscale
	var _yoff = sprite_get_yoffset(sprite) * image_yscale
	var _sprite_width = sprite_get_width(sprite) * image_xscale
	var _sprite_height = sprite_get_height(sprite) * image_yscale
	draw_sprite_ext(sprite, subimg, x - (((_sprite_width - _xoff) * (xscale - image_xscale)) / 2), y - (((_sprite_height - _yoff) * (yscale - image_yscale)) / 2), xscale, yscale, rot, col, alpha)
}


function scr_draw_outline_ext(sprite, subimg, x, y, xscale, yscale, rot, outlinecolor, alpha, size){
	gpu_set_fog(true, outlinecolor, 0, 0)
	var __xdirA = size
	var __xdirB = 0
	var __ydirA = 0
	var __ydirB = size
	
	if ((rot % 90) != 0) {
		__xdirA = lengthdir_x(size, rot)
		__xdirB = lengthdir_x(size, rot + 90)
		__ydirA = lengthdir_y(size, rot + 90)
		__ydirB = lengthdir_y(size, rot)
	}
	
	draw_sprite_ext(sprite, subimg, x + __xdirA, y + __ydirA, xscale, yscale, rot, c_white, alpha)
	draw_sprite_ext(sprite, subimg, x - __xdirA, y - __ydirA, xscale, yscale, rot, c_white, alpha)
	draw_sprite_ext(sprite, subimg, x + __xdirB, y + __ydirB, xscale, yscale, rot, c_white, alpha)
	draw_sprite_ext(sprite, subimg, x - __xdirB, y - __ydirB, xscale, yscale, rot, c_white, alpha)
	gpu_set_fog(false, c_white, 0, 0)
}
