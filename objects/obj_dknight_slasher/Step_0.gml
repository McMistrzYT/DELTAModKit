if (con == 0)
{
    throwernumber = instance_number(object_index);
    con = 12;
    movecon = 4;
    timer = 0;
    thrown = 0;
    image_index = 0;
}

if (movecon == 4)
{
    movesiner += 1;
    
    if (global.turntimer >= 30)
    {
        if (movefactor < 1)
            movefactor += 0.1;
    }
    
    y = ystart + (sin(movesiner / 16) * 40 * movefactor);
    
    if (global.turntimer <= 30)
    {
        if (movefactor > 0)
            movefactor -= 0.1;
        else
            movefactor = 0;
    }
}

if (con == 10)
{
    timer = 0;
    thrown = 0;
    image_index = 0;
    
    if (global.turntimer > 15)
        con = 11;
}

if (con == 11)
{
    image_index += 0.334;
    
    if (image_index >= 4 && thrown == 0)
    {
        swordbullet = instance_create(x + 6, y + 34, obj_regularbullet);
        swordbullet.siner = movesiner;
        scr_bullet_inherit(swordbullet);
        swordbullet.throwernumber = throwernumber;
        
        with (swordbullet)
        {
            active = 1;
            sprite_index = spr_diamondswordbullet;
            image_xscale = 2;
            image_yscale = 2;
            move_towards_point(obj_heart.x + 8, obj_heart.y + 8, 9 + (sin(siner / 10) * 4));
            
            if (throwernumber == 2)
                speed *= 0.85;
            
            if (throwernumber == 3)
                speed *= 0.7;
            
            direction += (5 - random(10));
            image_angle = direction;
        }
        
        swordbullet.depth = depth + 1;
        thrown = 1;
    }
    
    if (image_index >= 6)
    {
        con = 12;
        timer = 0;
    }
}

if (con == 12)
{
    timer += 1;
    
    if (timer >= (throwernumber * 3))
        con = 10;
}
