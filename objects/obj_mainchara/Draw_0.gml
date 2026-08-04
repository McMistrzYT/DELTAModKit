if (swordmode == 0) draw_self();

var hx = heartxoffset * image_xscale
var hy = heartyoffset * image_yscale

if (button1_p() && scr_debug()){
    draw_set_color(c_red);
	draw_rectangle(interactfacingrectanglebounds[0], interactfacingrectanglebounds[1], interactfacingrectanglebounds[2], interactfacingrectanglebounds[3], true); // Now it shows the Actual one as well, the draw for the dark one was inaccurate before due to the hardcoding using an old version of the hitbox size.    
    draw_set_color(c_white);
}

if (battlemode == 1){
    becamebattle = 1;
    
    if (battlealpha < 0.8 && drawbattlemode) battlealpha += 0.04;
    
    global.heartx = ((x + hx) - camerax()) * (darkmode ? 1 : 2);
    global.hearty = ((y + hy) - cameray()) * (darkmode ? 1 : 2);
}
else if (battlealpha > 0)
{
    battlealpha -= 0.08;
}

battleheart.image_alpha = battlealpha;

if (swordmode == 0) {
    if (fun == 0) {
		if !enable_battleautoheartoutline {
	        if (global.facing == 0) draw_sprite_ext(dsprite_heart, image_index, x, y, image_xscale, image_yscale, 0, image_blend, battlealpha);
	        if (global.facing == 1) draw_sprite_ext(rsprite_heart, image_index, x, y, image_xscale, image_yscale, 0, image_blend, battlealpha);
	        if (global.facing == 2) draw_sprite_ext(usprite_heart, image_index, x, y, image_xscale, image_yscale, 0, image_blend, battlealpha);
	        if (global.facing == 3) draw_sprite_ext(lsprite_heart, image_index, x, y, image_xscale, image_yscale, 0, image_blend, battlealpha);
			
		} else {
			scr_draw_battle_outline(heartoutlinecolor, battlealpha)	
		}
    }
    /*else if (sprite_index == spr_krisd_slide)
    {
        draw_sprite_ext(spr_krisd_slide_heart, image_index, x, y, image_xscale, image_yscale, 0, image_blend, battlealpha);
    }*/
    else {
        scr_draw_battle_outline(heartoutlinecolor, battlealpha);
    }
}

draw_sprite_ext(heartsprite, 0, x + hx, y + hy, 1, 1, 0, c_white, battlealpha * 2);
battleheart.x = x + hx;
battleheart.y = y + hy;

if (battlemode == 4){
    draw_set_color(c_lime);
    draw_set_alpha(0.5);
	var soulboxright = hx + (7.5 * image_xscale)
	var soulboxbottom = hy + (4.5 * image_yscale)
	var soullinesmiddle = hx + (3.5 * image_xscale)
	var soullinesright = hx + (7 * image_xscale)
	var soullinesbottom = hy + (8.5 * image_yscale)
	draw_rectangle(x + hx, y + hy, x + soulboxright, y + soulboxbottom, false)
	draw_line(x + hx, y + soulboxbottom, x + soullinesmiddle, y + soullinesbottom)
	draw_line(x + soullinesright, y + soulboxbottom, x + soullinesmiddle, y + soullinesbottom)
    draw_set_alpha(1);
}

if (swordmode == 1) {
    if (swordfacing == 1) draw_sprite_ext(swordsprite, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);    
    if (swordfacing == -1) draw_sprite_ext(swordsprite, image_index, x + sprite_width, y, -image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

if (scr_debug())
{
    if (keyboard_check(vk_control) && keyboard_check(vk_alt) && keyboard_check_pressed(ord("I"))) drawdebug = !drawdebug;
    
    if (drawdebug) {
        draw_set_color(c_white);
        draw_set_font(global.main_font);
        draw_text_outline(x + sprite_width, y, "floorheight=" + string(floorheight), c_black);
    }
}
