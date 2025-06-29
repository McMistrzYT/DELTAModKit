image_alpha -= 0.1;
image_xscale += mag;
image_yscale += mag;
x += ((1 - sprite_width) * mag) / 2.7;
x += ((1 - sprite_height) * mag) / 2.5;

if image_alpha < 0
	instance_destroy();