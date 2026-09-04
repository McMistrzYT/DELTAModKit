if (drawself)
{
	if (palette_sprite == noone)
	{
		draw_self()
	}
	else
	{
		pal_swap_set(palette_sprite, palette_index, false)
		draw_self()
		pal_swap_reset()
	}
}

wave_siner += 1

if (mode == 0){
	for (i = 0; i < wave_max; i += 1)
	{
		if (palette_sprite == noone)
		{
			draw_sprite_part(sprite_index, 0, i, 0, 1, sprite_height, x + i + (sin((wave_siner + i) / 30) * 2), y)
		}
		else
		{
			pal_swap_set(palette_sprite, palette_index, false)
			draw_sprite_part(sprite_index, 0, i, 0, 1, sprite_height, x + i + (sin((wave_siner + i) / 30) * 2), y)
			pal_swap_reset()
		}
	}
}

if (mode == 1){
	wave_max = sprite_height
	
	for (i = 0; i < wave_max; i += thickness)
	{
		if (palette_sprite == noone)
		{
			draw_sprite_part(sprite_index, 0, 0, i * thickness, sprite_width, thickness, x + i + (sin((wave_siner + i) / 30) * 2), y)
		}
		else
		{
			pal_swap_set(palette_sprite, palette_index, false)
			draw_sprite_part(sprite_index, 0, 0, i * thickness, sprite_width, thickness, x + i + (sin((wave_siner + i) / 30) * 2), y)
			pal_swap_reset()
		}
	}
}

if (palette_sprite == noone){
	draw_sprite(bg_beach_edge, 0, 358, 0)
}
else
{
	pal_swap_set(spr_palette_beach_edge, palette_index, false)
	draw_sprite(bg_beach_edge, 0, 358, 0)
	pal_swap_reset()
}
