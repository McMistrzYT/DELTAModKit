function scr_draw_hard_outline(sprite, subimg, x, y, xscale, yscale, angle, color, alpha, outlinewidth){
	var __surf = -1
	
	if (!surface_exists(__surf)) __surf = surface_create(x * 2, x * 2)
	
	surface_set_target(__surf)
	draw_clear_alpha(c_black, 0)
	var __xdirA = outlinewidth
	var __xdirB = 0
	var __ydirA = 0
	var __ydirB = outlinewidth
	draw_sprite_ext(sprite, subimg, x + __xdirA, y + __ydirA, xscale, yscale, 0, c_white, 1)
	draw_sprite_ext(sprite, subimg, x - __xdirA, y - __ydirA, xscale, yscale, 0, c_white, 1)
	draw_sprite_ext(sprite, subimg, x + __xdirB, y + __ydirB, xscale, yscale, 0, c_white, 1)
	draw_sprite_ext(sprite, subimg, x - __xdirB, y - __ydirB, xscale, yscale, 0, c_white, 1)
	surface_reset_target()
	gpu_set_fog(true, color, 0, 0)
	draw_surface_ext(__surf, x, y, 1, 1, angle, c_white, alpha)
	gpu_set_fog(false, c_white, 0, 0)
	
	if (surface_exists(__surf)) surface_free(__surf)
}

function scr_draw_battle_outline(color = c_red, alpha = 1, outlinewidth = global.darkzone ? 2 : 1, subtractmode = false){
	if (alpha <= 0) exit
	
	draw_set_blend_mode(bm_normal)
	var _xx = x
	var _yy = y
	var __surf
	
	if (alpha < 1 || subtractmode){
		_xx = outlinewidth
		_yy = outlinewidth
		__surf = -1
		
		if (!surface_exists(__surf)) __surf = surface_create(abs(sprite_width + (outlinewidth * 4) + abs(sprite_xoffset)) * 2, abs(sprite_height + (outlinewidth * 4) + abs(sprite_yoffset)) * 2)
		
		surface_set_target(__surf)
		draw_clear_alpha(c_black, 0)
	}
	
	d3d_set_fog(true, color, 0, 1)
	draw_sprite_ext(sprite_index, image_index, _xx, _yy - outlinewidth, image_xscale, image_yscale, 0, c_white, 1)
	draw_sprite_ext(sprite_index, image_index, _xx - outlinewidth, _yy, image_xscale, image_yscale, 0, c_white, 1)
	draw_sprite_ext(sprite_index, image_index, _xx, _yy + outlinewidth, image_xscale, image_yscale, 0, c_white, 1)
	draw_sprite_ext(sprite_index, image_index, _xx + outlinewidth, _yy, image_xscale, image_yscale, 0, c_white, 1)
	
	if (subtractmode) {
		draw_set_blend_mode(bm_subtract)
		draw_sprite_ext(sprite_index, image_index, _xx, _yy, image_xscale, image_yscale, 0, c_white, 1)
		draw_set_blend_mode(bm_normal)
	} else {
		d3d_set_fog(true, #202020, 0, 1)
		draw_sprite_ext(sprite_index, image_index, _xx, _yy, image_xscale, image_yscale, 0, c_white, 1)
	}
	
	d3d_set_fog(false, c_white, 0, 0)
	
	if (alpha < 1 || subtractmode){
		surface_reset_target()
		draw_surface_ext(__surf, x - outlinewidth, y - outlinewidth, 1, 1, image_angle, c_white, alpha)
		
		if (surface_exists(__surf)) surface_free(__surf)
	}
}
