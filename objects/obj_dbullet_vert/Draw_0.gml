if (dont == 0)
{
    if (active == 0)
    {
        draw_sprite_ext(sprite_index, 0, x, y, 3 - (image_alpha * 2), 3 - (image_alpha * 2), 0, c_white, image_alpha);
        
        if (image_alpha < 1)
        {
            image_alpha += 0.1;
            
            if (type == 1)
            {
                vspeed = 3;
                gravity = -0.5;
            }
        }
        else
        {
            if (type == 0)
            {
                if ((obj_heart.y + 8) < y)
                {
                    vspeed = 1;
                    gravity = -0.2;
                }
                else
                {
                    vspeed = -2;
                    gravity = 1;
                }
            }
            
            active = 1;
        }
    }
    
    draw_sprite_ext(sprite_index, 0, x, y, 2 - image_alpha, 2 - image_alpha, 0, c_white, image_alpha);
    
    if (type == 0)
    {
        if (speed > 8)
            speed = 8;
    }
    
    if (y > (__view_get(e__VW.YView, 0) + 500))
        instance_destroy();
    
    if (y < (__view_get(e__VW.YView, 0) - 20))
        instance_destroy();
}

dont = 0;