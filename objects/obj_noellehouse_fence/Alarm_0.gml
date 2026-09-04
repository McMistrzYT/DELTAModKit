debug_log("test")
snd_play(snd_wing)
snd_play(snd_paper_surf)

with (obj_readable_room1){
	if (x < 210) instance_destroy()
}

with (obj_sul){
	if (x < 220) instance_destroy()
}

slope_collider = instance_create(230, 120, obj_sul)
slope_collider.image_yscale = 2
scr_lerpvar_instance(fence_left, "x", x, x - 30, 40, 1, "out")
scr_lerpvar_instance(fence_left, "y", y, y + 30, 40, 1, "out")
scr_lerpvar("fence_right_xpos", x, x + 30, 40, 1, "out")
scr_lerpvar("fence_right_ypos", y, y - 30, 40, 1, "out")
leaf_counter = 0
alarm[3] = 5
