image_alpha += fadespeed;
draw_sprite_ext(sprite_index, image_index, x, y, length, height, 0, image_blend, image_alpha);

if (fadein == 1 && image_alpha <= 0)
    instance_destroy();
