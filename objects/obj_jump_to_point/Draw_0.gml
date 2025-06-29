if (drawshadow == 1 && con == 2 && init == 1 && i_ex(body_obj))
    draw_sprite_ext(body_obj.sprite_index, body_obj.image_index, x + shadowoffx, y + (shadowheight * (image_yscale + 1)) + shadowoffy, body_obj.image_xscale, body_obj.image_yscale / 4, 0, c_black, image_alpha);
