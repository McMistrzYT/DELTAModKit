if DEBUGMODE {
	draw_set_alpha(NPCSIGNDEBUGBOUNDSDISPLAYALPHA)
	draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)
}
if sprite_exists(sprite_index) draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)
