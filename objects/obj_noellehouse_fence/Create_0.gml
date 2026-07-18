depth = 980000
is_closed = true
open_fence = false
close_fence = false
hide_fence = false
fence_left = scr_marker(x, y, bg_noellefence_left)
fence_left.depth = 9700
fence_left_sprite = bg_noellefence_left
fence_left_ypos = y

fence_right_sprite = bg_noellefence_right
fence_right_xpos = x
fence_right_ypos = y

test_timer = 0
slope_collider = noone
leaf_counter = 0

opened_state = function(){
	is_closed = false
	
	with (obj_readable_room1){
		if (x < 210) instance_destroy()
	}
	
	with (obj_sul){
		if (x < 220) instance_destroy()
	}
	
	slope_collider = instance_create(230, 120, obj_sul)
	slope_collider.image_yscale = 2
	fence_left.x = x - 30
	fence_left.y = y + 30
	fence_right_xpos = x + 30
	fence_right_ypos = y - 30
}