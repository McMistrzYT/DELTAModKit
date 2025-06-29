if (t >= 6 && t <= 26)
{
    afterimage += 1;
    gpu_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(sprite_index, image_index, x + (afterimage * 4), y, image_xscale, image_yscale, 0, image_blend, 0.7 - (afterimage / 25));
    draw_sprite_ext(sprite_index, image_index, x + (afterimage * 8), y, image_xscale, image_yscale, 0, image_blend, 0.4 - (afterimage / 30));
    gpu_set_fog(false, c_black, 0, 0);
}

if (t < 6)
{
    if (t < 5)
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, 1 - (neotone / 4));
    
    gpu_set_fog(true, c_white, 0, 1);
    maxwhite = t / 5;
    
    if (maxwhite > 1)
        maxwhite = 1;
    
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, maxwhite - (tone / 5));
    gpu_set_fog(false, c_black, 0, 0);
}

if (t >= 1 && t <= 5)
{
    for (i = 0; i < 2; i += 1)
    {
        var range_width = x + random(sprite_width);
        var range_height = y + random(sprite_height);
        
        star[starcount] = instance_create(range_width, range_height, obj_marker);
        
        with (star[starcount])
        {
            image_xscale = 2;
            image_yscale = 2;
            sprite_index = spr_sparestar_anim;
            image_alpha = 2;
            image_speed = 0.25;
            hspeed = -3;
            gravity = 0.5;
            gravity_direction = 0;
        }
        
        starcount += 1;
    }
}

if (t >= 5 && t <= 30)
{
    for (i = 0; i < starcount; i += 1)
    {
        with (star[i])
        {
            image_angle += 10;
            image_alpha -= 0.1;
            
            if (image_alpha <= 0)
                instance_destroy();
        }
    }
}

if (t >= 5 && t < 10)
    tone += 1;

if (t >= 9)
{
    neotone += 1;
    
    if (neotone >= 30)
    {
        for (i = 0; i < starcount; i += 1)
        {
            with (star[i])
                instance_destroy();
        }
        
        instance_destroy();
    }
}

t += 1;
