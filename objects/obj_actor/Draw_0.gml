if (sprite_palette != -1)
{
	// sorry not doing allat
    //pal_swap_set(sprite_palette, current_pal, false);
    
    if (sprite_exists(sprite_index))
        draw_sprite_ext(sprite_index, image_index, x + sinerx + shakex, y + sinery + shakey, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    
    //pal_swap_reset();
}
else if (sprite_exists(sprite_index))
{
    draw_sprite_ext(sprite_index, image_index, x + sinerx + shakex, y + sinery + shakey, image_xscale, image_yscale, image_angle, color_blend, image_alpha);
}
