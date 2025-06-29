if (grazetimer > 0)
{
    draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, grazetimer / 6);
    draw_sprite_ext(sprite_index, 3, x, y, 1, 1, 0, c_white, (grazetimer / 6) - 0.2);
    
    if (image_xscale > 1)
    {
        draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, grazetimer / 6);
        draw_sprite_ext(sprite_index, 3, x, y, image_xscale, image_yscale, 0, c_white, (grazetimer / 6) - 0.2);
    }
}

grazetimer -= 1;
