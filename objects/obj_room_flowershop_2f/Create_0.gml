if darkmode {
	overlay = scr_marker(-10, -10, spr_whitepixel)
	overlay.image_xscale = (room_width + 20) + 2
	overlay.image_yscale = (room_height + 20) + 2
	overlay.image_blend = merge_color(c_black, c_navy, 0.5)
	overlay.image_alpha = 0.4
	overlay.depth = 990
}
if loweredlights {
	var light_x_pos = 106
	var light_x_interval = 20
	var light_colors = [
		#E2A8FC,
		#86A7FF,
		#84F9FF,
		#F9EC00,
		#FFF8A1,
		#FFAC87,
		#AEFFBC,
	]
	var light_objects = [
		instance_create_depth(light_x_pos, 0, 6000, obj_flowershop_hanging_light), 
		instance_create_depth(light_x_pos, -20, 6010, obj_flowershop_hanging_light), 
		instance_create_depth(light_x_pos + light_x_interval, -30, 6010, obj_flowershop_hanging_light), 
		instance_create_depth(light_x_pos + (light_x_interval * 2) + 10, -30, 6010, obj_flowershop_hanging_light),
		instance_create_depth(light_x_pos + (light_x_interval * 3) + 20, -30, 6010, obj_flowershop_hanging_light), 
		instance_create_depth(light_x_pos + (light_x_interval * 4) + 20, -20, 6010, obj_flowershop_hanging_light), 
		instance_create_depth(light_x_pos + (light_x_interval * 4) + 20, 0, 6000, obj_flowershop_hanging_light)
	]

	for (var i = 0; i < array_length(light_colors); i++){
		var light = light_objects[i]
		
		light.set_color(light_colors[i])
	}
}