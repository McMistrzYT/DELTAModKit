if (open_fence){
	is_closed = false
	open_fence = false
	alarm[0] = 1
}

if (close_fence){
	is_closed = false
	close_fence = false
	alarm[1] = 1
}

if (hide_fence){
	hide_fence = false
	
	if (fence_left != noone){
		if (fence_left.visible == 1)
			fence_left.visible = 0
	}
}

if DEBUGMODE {
	if scr_debug() && keyboard_check_pressed(ord("P"))	 {
		if alarm[2] <= 0 && alarm[3] <= 0 {
			if is_closed open_fence = true else close_fence = true
		}
	}
}