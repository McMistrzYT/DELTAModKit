if (i_ex(target))
{
    image_index = target.image_index;
    sprite_index = target.sprite_index;
    
    if (follow)
    {
        x = target.x;
        y = target.y;
    }
}

siner += flashspeed;
gpu_set_fog(true, flashcolor, 0, 1);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, sin(siner / 3));
gpu_set_fog(false, c_black, 0, 0);

if (siner > 4 && sin(siner / 3) < 0)
    instance_destroy();
