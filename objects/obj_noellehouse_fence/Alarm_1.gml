snd_play(snd_wing)
snd_play(snd_paper_surf)

if (slope_collider != noone)
	instance_destroy(slope_collider)

readable_1 = instance_create(190, 152, obj_readable_room1)
readable_2 = instance_create(200, 130, obj_readable_room1)
readable_3 = instance_create(208, 110, obj_readable_room1)
closed_slope_collider_1 = instance_create(218, 108, obj_sul)
closed_slope_collider_1.image_yscale = 2
closed_slope_collider = instance_create(200, 148, obj_sul)
closed_slope_collider.image_yscale = 2
scr_lerpvar_instance(fence_left, "x", x - 30, x, 40, 1, "out")
scr_lerpvar_instance(fence_left, "y", y + 30, y, 40, 1, "out")
scr_lerpvar("fence_right_xpos", x + 30, x, 40, 1, "out")
scr_lerpvar("fence_right_ypos", y - 30, y, 40, 1, "out")
leaf_counter = 0
alarm[3] = 1
alarm[2] = 40
