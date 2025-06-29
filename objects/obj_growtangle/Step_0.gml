if (!init)
{
    if (visible && (maxxscale != 2 || maxyscale != 2) && sprite_index == spr_battlebg_0)
    {
        customBox = true;
        sprite_index = spr_battlebg_stretch_hitbox;
        
        if ((maxxscale % 2) != 0)
            maxxscale = round(maxxscale * 37.5) / 37.5;
        
        if ((maxyscale % 2) != 0)
            maxyscale = round(maxyscale * 37.5) / 37.5;
        
        image_xscale = maxxscale / 2;
        image_yscale = maxyscale / 2;
        var _tempxscale = sprite_width;
        var _tempyscale = sprite_height;
        var surf = surface_create(sprite_width, sprite_height);
        surface_set_target(surf);
        draw_clear_alpha(c_black, 0);
        draw_sprite_ext(spr_battlebg_stretch, 0, sprite_xoffset, sprite_yoffset, image_xscale, image_yscale, 0, c_white, 1);
        spr_custom_box = sprite_create_from_surface(surf, 0, 0, sprite_width, sprite_height, false, false, sprite_xoffset, sprite_yoffset);
        sprite_index = spr_battlebg_stretch_hitbox;
        surface_reset_target();
        surface_free(surf);
    }
    
    init = 1;
}

growth = 0;

if (timer < maxtimer && growcon == 1)
    growth = 1;

if (timer > 0 && growcon == 3)
    growth = 1;

if (growth == 1)
{
    if (growcon == 1)
        timer += 1;
    
    if (growcon == 3)
        timer -= 1;
    
    sizer = timer / maxtimer;
    image_xscale = maxxscale * sizer;
    image_yscale = maxyscale * sizer;
    image_angle = 180 + (180 * (timer / maxtimer)) + target_angle;
    image_alpha = 0.5 + ((timer / maxtimer) * 0.5);
    
    if (visible)
    {
        d = instance_create(x, y, obj_afterimage);
        d.sprite_index = spr_custom_box;
        var _scale = sizer * growscale;
        d.image_xscale = _scale;
        d.image_yscale = _scale;
        d.image_angle = image_angle;
        d.depth = depth - 1;
        d.image_blend = image_blend;
        d.image_alpha = (1 - image_alpha) + 0.1;
        d.image_speed = 0;
    }
    
    if (timer >= maxtimer && growcon == 1)
    {
        growcon = 2;
        image_angle = target_angle;
    }
    
    if (timer <= 0 && growcon == 3)
        instance_destroy();
}
