if (big == 1){
	damage = 4
	image_alpha += (0.1 * f)
	
	if (image_xscale < 1) image_xscale += (0.1 * f)	
	if (image_yscale > 1) image_yscale -= (0.1 * f)
}

if (x >= (camerax() + 700)) instance_destroy()
if (y >= (cameray() + 520)) instance_destroy()
if (y <= (cameray() - 40)) instance_destroy()

if (trail == 1)
{
	trail_timer++
	
	if (trail_timer == 2)
	{
		trail_timer = 0
		
		after = scr_afterimage()
		after.x = x - 10
		after.fadeSpeed = 0.1
		after.image_speed = 0
		after.sprite_index = spr_yheart_bigshot_trail
		after.image_xscale = 0.8
		after.image_yscale = 0.5
		after.image_index = image_index
		after.speed = 0
		after.friction = 0
		after.depth = depth
		after.direction = 180
	}
}
