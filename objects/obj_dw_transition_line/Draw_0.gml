if !global.darkzone
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);

if global.darkzone
    draw_sprite_ext(sprite_index, image_index, x * 2, y * 2, image_xscale * 2, image_yscale * 2, 0, c_white, image_alpha);
