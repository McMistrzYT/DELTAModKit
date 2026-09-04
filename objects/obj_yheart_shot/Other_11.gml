myanim = instance_create(x, y, obj_animation)

with (myanim) {
	f = 2
	image_speed = 0.25 * f
	image_index = 0
	sprite_index = spr_yheart_shot_hit_noeffect
}

instance_destroy()
