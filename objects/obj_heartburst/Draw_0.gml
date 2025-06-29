burst += 1;
draw_sprite_ext(spr_heartoutline2, 0, xstart + 9, ystart + 9, 0.25 + burst, 0.25 + (burst / 2), 0, c_white, 0.8 - (burst / 6));
draw_sprite_ext(spr_heartoutline, 0, xstart + 9, ystart + 9, 0.25 + (burst / 1.5), 0.25 + (burst / 3), 0, c_white, 1 - (burst / 6));
draw_sprite_ext(spr_heartoutline, 0, xstart + 9, ystart + 9, 0.2 + (burst / 2.5), 0.2 + (burst / 5), 0, c_white, 1.2 - (burst / 6));

if (burst > 10)
    instance_destroy();
