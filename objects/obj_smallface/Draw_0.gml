//if (instance_exists(obj_plat_player) && obj_plat_player.targetmode) exit

var drawsurf = 0

if (global.darkzone == 0) drawsurf = 1

var cxoff = 0
var cyoff = 0
var __cx = camerax()
var __cy = cameray()
/*
if (instance_exists(obj_plat_camera) && instance_exists(obj_dialoguer_plat))
{
	__cx = x - 320
	__cy = y - 240
	var fam = 0
	
	for (fam = 0; fam < array_length(global.sminstance); fam++)
	{
		with (obj_writer)
		{
			if (dialoguer)
			{
				other.x = (writingx + other.remx) - 100
				other.y = writingy + other.remy + 20
			}
		}
	}
}
*/
if (drawsurf) {
	if (!surface_exists(surf)) surf = surface_create(640, 480)
	
	surface_set_target(surf)
	draw_clear_alpha(c_black, 0)
	cxoff = -__cx
	cyoff = -__cy
	
	if (i_ex(writergod) && writergod.y < (__cy + 120))
		cyoff -= 153
}

var truex = x + cxoff
var truey = y + cyoff

if (facealpha < 1) facealpha += 0.2

draw_sprite_ext(sprite_index, image_index, truex, truey, image_xscale, image_yscale, image_angle, image_blend, facealpha)
draw_set_alpha(facealpha)

if (type == 0 || type == 3) {
	scr_84_set_draw_font("main")
	draw_set_color(mycolor)
	draw_text(truex + 70, truey + 10, string_hash_to_newline(mystring))
}

if (type == 1 && active == 1 && getrid == 0) {
	scr_84_set_draw_font("main")
	draw_set_color(mycolor)
	draw_text(truex + 70, truey + 15, string_hash_to_newline(mystring))
	finished = 1
}

if (type == 2 || type == 4) {
	if (active == 1) {
		scr_84_set_draw_font("main")
		draw_set_color(mycolor)
		
		if (finished == 0) {
			partstring += string_char_at(mystring, part)
			part += 1
			
			if (part >= (string_length(mystring) + 1))
				finished = 1
		}
		
		draw_text(truex + 70 + random(1), truey + 15 + random(1), string_hash_to_newline(partstring))
	}
}

draw_set_alpha(1)

if (drawsurf) {
	surface_reset_target()
	
	if (i_ex(writergod)) draw_surface_ext(surf, __cx, __cy, 0.5, 0.5, 0, c_white, 1)
	
	surface_free(surf)
}

if (i_ex(writergod)) {
	if (finished == 1 && getrid == 0) finished = 2
} else {
	instance_destroy()
}

if (getrid == 1) {
	direction = -nowdir
	speed += 2
	
	if (type == 3 || type == 4) instance_destroy()
}
