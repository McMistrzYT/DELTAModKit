if darkmode {
	overlay = scr_marker(-10, -10, spr_whitepixel)
	overlay.image_xscale = (room_width + 20) + 2
	overlay.image_yscale = (room_height + 20) + 2
	overlay.image_blend = merge_color(c_black, c_navy, 0.5)
	overlay.image_alpha = 0.4
	overlay.depth = 990
}


counter = scr_marker(20, 103, spr_flowershop_counter)
with (counter) scr_depth()

flowera = scr_marker(177, 136, spr_flowershop_flowers)
flowerb = scr_marker(177, 82, spr_flowershop_flowers)

with (flowera) scr_depth()
with (flowerb) scr_depth()
