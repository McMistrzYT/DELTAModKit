if (typingstyle == 0)
{
    draw_sprite_ext(sprite_index, image_index, x + random_range(-charshake, charshake), y + random_range(-charshake, charshake), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else if (typingstyle == 1)
{
    for (var ti = 0; ti < charmax; ti++)
        draw_sprite_ext(sprite_index, ti, x + random_range(-charshake, charshake), y + random_range(-charshake, charshake), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else
{
    draw_self();
}
