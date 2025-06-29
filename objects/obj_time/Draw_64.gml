if (quit_timer >= 1)
    draw_sprite_ext(spr_quitmessage, quit_timer / 7, 4, 4, 2, 2, 0, c_white, quit_timer / 15);
	
if scr_debug() {
	var prev_font = draw_get_font();
	var prev_color = draw_get_color();
	var prev_alpha = draw_get_alpha();
	var prev_align = draw_get_halign();
	
	draw_set_font(global.main_font);
	draw_set_color(c_white);
	draw_set_alpha(0.6);
	
	var th = string_height("Hello!");
	var thp = (th + 2); // th + padding
	var starty = 16;
	
	var xcent = __view_get(e__VW.WPort, 0) / 2;
	var balign = __view_get(e__VW.HPort, 0) - th - starty;
	
	draw_set_halign(textalign_center);
	
	var _t = string_hash_to_newline("DELTARUNE Ch. " + string(global.chapter) + " " + global.versionno + "#Running in Editor");
	draw_text(xcent, starty, _t);
	draw_text(xcent, balign, room_get_name(room));
	
	draw_set_font(prev_font);
	draw_set_color(prev_color);
	draw_set_alpha(prev_alpha);
	draw_set_halign(prev_align);
}