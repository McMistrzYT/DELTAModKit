draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if (customBox && growth && growcon != 2)
{
    var _scale = sizer * growscale;
    draw_sprite_ext(spr_custom_box, 0, x, y, _scale, _scale, image_angle, image_blend, image_alpha);
}
else
{
    draw_self();
}
