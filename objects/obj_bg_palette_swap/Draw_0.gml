if (shader_enabled && sprite_exists(palettespr)){
	if (!surface_exists(surf_recolour))
		surf_recolour = surface_create(surface_get_width(application_surface), surface_get_height(application_surface))
	
	surface_set_target(surf_recolour)
	draw_clear_alpha(c_black, 1)
	gpu_set_colorwriteenable(true, true, true, false)
	
	if (global.darkzone != 1)
		draw_surface_ext(application_surface, 0, 0, 0.5, 0.5, 0, c_white, 1)
	else
		draw_surface_ext(application_surface, 0, 0, 1, 1, 0, c_white, 1)
	
	gpu_set_colorwriteenable(true, true, true, true)
	surface_reset_target()
	pal_swap_set(palettespr, paletteindex)
	draw_surface(surf_recolour, camerax(), cameray())
	pal_swap_reset()
}
