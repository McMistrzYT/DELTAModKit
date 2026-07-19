con = -1

overlay = instance_create(0, 0, obj_backgrounder_sprite)
	
with (obj_mainchara) bg = 1
	
with (overlay) {
	image_alpha = 0.4
	ss = 0.1
	sprite_index = spr_graveyard_overlay
	depth = 1000
}