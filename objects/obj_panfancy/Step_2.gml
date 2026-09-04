if (!init) {
	if (variable_instance_exists(camstruct, "doround")) doround = camstruct.doround	
	if (variable_instance_exists(camstruct, "dofloor")) dofloor = camstruct.dofloor	
	if (variable_instance_exists(camstruct, "doeven")) doeven = camstruct.doeven	
	if (variable_instance_exists(camstruct, "doeven")) doeven = camstruct.doeven	
	if (variable_instance_exists(ignoreshake, "doeven")) ignoreshake = camstruct.ignoreshake	
	if (variable_instance_exists(camstruct, "easetype")) easetype = camstruct.easetype	
	if (variable_instance_exists(camstruct, "easenumber")) easenumber = camstruct.easenumber
	
	if (variable_instance_exists(camstruct, "func")) {
		if (camstruct.func != noone) {
			dofunc = true
			camstruct.easetype = "func"
		}
	}
	
	init = true
}

timer++
var _cam = scr_getcam()
var newcam = { x: _cam.x, y: _cam.y }
var shake = { x: 0, y: 0 }

with (obj_shake) {
	shake.x = shakex * shakesign
	shake.y = shakey * shakesign
}

if (dofunc) {
	newcam = camstruct.func(camstart, camx, camy, timer, targtime)
} else {
	switch (easetype)
	{
		case "ease_inout_quint":
		case "easeinoutquint":
			newcam.x = lerp(camstart.x, camx, ease_inout_quint(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_inout_quint(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "ease_inout_quart":
		case "easeinoutquart":
			newcam.x = lerp(camstart.x, camx, ease_inout_quart(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_inout_quart(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "ease_inout_quad":
		case "easeinoutquad":
			newcam.x = lerp(camstart.x, camx, ease_inout_quad(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_inout_quad(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "ease_inout_expo":
		case "easeinoutexpo":
			newcam.x = lerp(camstart.x, camx, ease_inout_expo(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_inout_expo(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "ease_inout_elastic":
		case "easeinoutelastic":
			newcam.x = lerp(camstart.x, camx, ease_inout_elastic(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_inout_elastic(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "easeinoutcubic":
		case "ease_inout_cubic":
			newcam.x = lerp(camstart.x, camx, ease_inout_cubic(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_inout_cubic(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "easeinoutcirc":
		case "ease_inout_circ":
			newcam.x = lerp(camstart.x, camx, ease_inout_circ(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_inout_circ(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "easeinoutbounce":
		case "ease_inout_bounce":
			newcam.x = lerp(camstart.x, camx, ease_inout_bounce(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_inout_bounce(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "easeinoutback":
		case "ease_inout_back":
			newcam.x = lerp(camstart.x, camx, ease_inout_back(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_inout_back(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "ease_out_qunit":
		case "easeoutquint":
			newcam.x = lerp(camstart.x, camx, ease_out_quint(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_out_quint(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "ease_out_quart":
		case "easeoutquart":
			newcam.x = lerp(camstart.x, camx, ease_out_quart(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_out_quart(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "ease_out_quad":
		case "easeoutquad":
			newcam.x = lerp(camstart.x, camx, ease_out_quad(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_out_quad(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "ease_out_expo":
		case "easeoutexpo":
			newcam.x = lerp(camstart.x, camx, ease_out_expo(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_out_expo(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "ease_out_elastic":
		case "easeoutelastic":
			newcam.x = lerp(camstart.x, camx, ease_out_elastic(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_out_elastic(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "easeoutcubic":
		case "ease_out_cubic":
			newcam.x = lerp(camstart.x, camx, ease_out_cubic(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_out_cubic(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "easeoutcirc":
		case "ease_out_circ":
			newcam.x = lerp(camstart.x, camx, ease_out_circ(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_out_circ(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "easeoutbounce":
		case "ease_out_bounce":
			newcam.x = lerp(camstart.x, camx, ease_out_bounce(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_out_bounce(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "easeoutback":
		case "ease_out_back":
			newcam.x = lerp(camstart.x, camx, ease_out_back(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_out_back(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "ease_in_quint":
		case "easeinquint":
			newcam.x = lerp(camstart.x, camx, ease_in_quint(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_in_quint(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "ease_in_quart":
		case "easeinquart":
			newcam.x = lerp(camstart.x, camx, ease_in_quart(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_in_quart(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "ease_in_quad":
		case "easeinquad":
			newcam.x = lerp(camstart.x, camx, ease_in_quad(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_in_quad(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "ease_in_expo":
		case "easeinexpo":
			newcam.x = lerp(camstart.x, camx, ease_in_expo(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_in_expo(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "ease_in_elastic":
		case "easeinelastic":
			newcam.x = lerp(camstart.x, camx, ease_in_elastic(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_in_elastic(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "easeincubic":
		case "ease_in_cubic":
			newcam.x = lerp(camstart.x, camx, ease_in_cubic(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_in_cubic(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "easeincirc":
		case "ease_in_circ":
			newcam.x = lerp(camstart.x, camx, ease_in_circ(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_in_circ(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "easeinbounce":
		case "ease_in_bounce":
			newcam.x = lerp(camstart.x, camx, ease_in_bounce(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_in_bounce(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		case "easeinback":
		case "ease_in_back":
			newcam.x = lerp(camstart.x, camx, ease_in_back(clamp(timer / targtime, 0, 1), 0, 1, 1))
			newcam.y = lerp(camstart.y, camy, ease_in_back(clamp(timer / targtime, 0, 1), 0, 1, 1))
			break
		
		default:
			newcam.x = lerp(camstart.x, camx, clamp(timer / targtime, 0, 1))
			newcam.y = lerp(camstart.y, camy, clamp(timer / targtime, 0, 1))
			break
	}
}

newcam.x += shake.x
newcam.y += shake.y

if (timer >= targtime) {
	camera_set_view_pos(view_camera[0], camx, camy)
	instance_destroy()
} else {
	if (doround) {
		newcam.x = round(newcam.x)
		newcam.y = round(newcam.y)
	} else if (doeven) {
		newcam.x = round(newcam.x / 2) * 2
		newcam.y = round(newcam.y / 2) * 2
	} else if (dofloor) {
		newcam.x = floor(newcam.x)
		newcam.y = floor(newcam.y)
	}
	
	camera_set_view_pos(view_camera[0], newcam.x, newcam.y)
}
