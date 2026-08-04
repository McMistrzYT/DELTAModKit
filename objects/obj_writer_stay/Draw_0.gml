if (i_ex(obj_dialoguer) && obj_dialoguer.active)
{
	obj_dialoguer.cur_jewel = cur_jewel
	exit
}

//if (global.tempflag[19] == 0){
	xxx = camerax() + xoff
	yyy = cameray() + yoff
	
	if (global.darkzone == 0)
	{
		var sidemod = side * 155
		var boxwidth_real = 288
		
		if (boxwidth != -1)
			boxwidth_real = boxwidth
		
		var hei = (((yyy + 80) - 54) + (18 * boxheight) + sidemod) - (yyy + 5 + sidemod)
		draw_sprite_ext(spr_pxwhite, 0, xxx + 16, yyy + 5 + sidemod, boxwidth_real + 1, hei + 1, 0, c_border, 1)
		var wid = (xxx + 13 + boxwidth_real) - (xxx + 19)
		hei = (((yyy + 77) - 54) + (18 * boxheight) + sidemod) - (yyy + 8 + sidemod)
		draw_sprite_ext(spr_pxwhite, 0, xxx + 19, yyy + 8 + sidemod, wid + 1, hei + 1, 0, c_inner, 1)
	}
	
	if (global.darkzone == 1)
	{
		var boxwidth_real = 592
		
		if (boxwidth != -1)
			boxwidth_real = boxwidth
		
		var sidemod = side * 310
		scr_darkbox_black(xxx + 24, yyy + 2 + sidemod, xxx + 24 + boxwidth_real, ((yyy + 168) - 108) + (36 * boxheight) + sidemod)
		draw_set_alpha(1)
	}
//}
