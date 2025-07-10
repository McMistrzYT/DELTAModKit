if (active == 1)
{
    if (con == 50)
    {
        image_index = 0;
        image_speed = 0.1;
        con = 51;
        alarm[4] = 70;
    }
    
    if (con == 52)
    {
        image_speed = 0;
        image_index = 7;
        con = 53;
        alarm[4] = 60;
    }
    
    if (con == 53)
    {
        anim = instance_create(x + 12, y + 48, obj_animation);
        anim.sprite_index = spr_kris_shine;
        anim.image_speed = 0.125;
        con = 54;
        alarm[4] = 60;
    }
    
    if (con == 55)
    {
        blazetimer = 0;
        image_index = 8;
        image_speed = 0.5;
        alarm[4] = 10;
        con = 56;
    }
    
    if (con == 57)
    {
        image_index = 13;
        image_speed = 0;
        con = 58;
        alarm[4] = 1;
    }
    
    if (con == 59)
    {
        con = 60;
        alarm[4] = 10;
    }
    
    if (con == 60 || con == 56)
    {
        snd_play(snd_fountain_target);
        blazetimer++;
        anim = instance_create((x - 40) + (blazetimer * 6), y + 10 + random(20), obj_animation);
        anim.sprite_index = spr_kris_make_fountain_flash;
        anim.image_speed = 0.5;
    }
    
    if (con == 61)
    {
        snd_play(snd_fountain_make);
        ballcon = 1;
        image_index = 14;
        image_speed = 0.5;
        con = 62;
        alarm[4] = 6;
    }
    
    if (con == 63)
    {
        image_speed = 0;
        image_index += 0.5;
        
        if (image_index >= 19)
            image_index -= 2;
    }
    
    if (con == 64)
    {
        sprite_index = spr_kris_make_fountain_jump;
        image_speed = 0;
        image_index = 0;
        con = 65;
        alarm[4] = 90;
    }
    
    if (con == 66)
    {
        depth = 8;
        image_index = 1;
        vspeed = -8;
        hspeed = -1;
        gravity = 1;
        con = 67;
    }
    
    if (con == 67)
    {
        ballcheck = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_fountainball, false, true);
        
        if (ballcheck != -4)
        {
            with (ballcheck)
            {
                if (back == 0)
                {
                    hspeed += (-4 + random(8));
                    vspeed -= random(3);
                    backball.hspeed = hspeed;
                    backball.vspeed = vspeed;
                }
            }
        }
        
        if (y >= 120)
        {
            image_index = 2;
            vspeed = 0;
            hspeed = 0;
            gravity = 0;
            con = 68;
            alarm[4] = 60;
        }
    }
    
    if (con == 69)
    {
        if (image_index <= 4)
            image_index += 0.25;
    }
}
