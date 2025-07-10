if scr_debug() {
	var prevfont = draw_get_font();
	
	draw_set_font(fnt_main); // i want the smaller font in the dark world to see more shit
	
	var labelheight = string_height("Sample String ABCDEFGHIJKLMNOPQRSTUVWXYZ!");
	draw_text(24, 24, "obj_battlecontroller");
	
	for (p = 0; p < array_length(global.monstertype); p++) {
		if global.monstertype[p] == DREnemy.None continue;
		draw_text(global.monstermakex[p], global.monstermakey[p] - labelheight - 8, stringsetsub("Enemy ID \#~1", global.monstertype[p]));
	}
	
	draw_set_font(prevfont);
}