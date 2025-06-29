if (auto_walk == 1)
{
    if (walk == 1)
    {
        v_speed = 0;
        
        if (fake_speed != 0)
            v_speed = fake_speed;
        
        if (speed != 0)
            v_speed = speed;
        
        if (v_speed > 0)
        {
            new_image_speed = v_speed / (10 * dz);
            image_speed = new_image_speed;
            
            if (new_image_speed <= 0.25)
                image_speed = 0.25;
            
            if (new_image_speed >= 1)
                image_speed = 0.5;
            
            if (stopped == 1)
            {
                image_index = 1;
                stopped = 0;
            }
        }
        
        if (v_speed == 0)
        {
            stopped = 1;
            image_index = 0;
            image_speed = 0;
        }
    }
}

if (auto_facing == 1)
{
    v_vspeed = 0;
    v_hspeed = 0;
    
    if (fake_speed != 0)
    {
        v_vspeed = lengthdir_y(fake_speed, fake_direction);
        v_hspeed = lengthdir_x(fake_speed, fake_direction);
    }
    
    if (hspeed != 0)
        v_hspeed = hspeed;
    
    if (vspeed != 0)
        v_vspeed = vspeed;
    
    if (v_vspeed > 0.05)
        sprite_index = dsprite;
    
    if (v_vspeed < -0.05)
        sprite_index = usprite;
    
    if (abs(v_hspeed) > abs(v_vspeed) && v_hspeed > 0.05)
        sprite_index = rsprite;
    
    if (abs(v_hspeed) > abs(v_vspeed) && v_hspeed < -0.05)
        sprite_index = lsprite;
}

if (spinspeed != 0)
{
    spintimer += (1 / spinspeed);
    
    if (spintimer >= 1)
    {
        if (facing == "d")
            facing = "l";
        else if (facing == "l")
            facing = "u";
        else if (facing == "u")
            facing = "r";
        else if (facing == "r")
            facing = "d";
        
        spintimer = 0;
    }
    
    if (spintimer <= -1)
    {
        if (facing == "d")
            facing = "r";
        else if (facing == "l")
            facing = "d";
        else if (facing == "u")
            facing = "l";
        else if (facing == "r")
            facing = "u";
        
        spintimer = 0;
    }
    
    if (facing == "d")
        sprite_index = dsprite;
    
    if (facing == "r")
        sprite_index = rsprite;
    
    if (facing == "u")
        sprite_index = usprite;
    
    if (facing == "l")
        sprite_index = lsprite;
}
else
{
    spintimer = 0;
}

if (debug_killtimer > 0)
{
    debug_killtimer--;
    
    if (debug_killtimer <= 0)
        instance_destroy();
}

if (auto_depth == 1)
{
    scr_depth();
    depth += depthbonus;
}

sinerx = 0;
sinery = 0;

if (siner_add0 != 0)
{
    siner0 += siner_add0;
    
    if (siner_type0 == "sin")
        sinmove = sin(siner0) * siner_amplitude0;
    else
        sinmove = cos(siner0) * siner_amplitude0;
    
    if (siner_visual0 == 1)
    {
        sinerx += lengthdir_x(sinmove, siner_direction0);
        sinery += lengthdir_y(sinmove, siner_direction0);
    }
    else
    {
        x += lengthdir_x(sinmove, siner_direction0);
        y += lengthdir_y(sinmove, siner_direction0);
    }
}

if (siner_add1 != 0)
{
    siner1 += siner_add1;
    
    if (siner_type1 == "sin")
        sinmove = sin(siner1) * siner_amplitude1;
    else
        sinmove = cos(siner1) * siner_amplitude1;
    
    if (siner_visual1 == 1)
    {
        sinerx += lengthdir_x(sinmove, siner_direction1);
        sinery += lengthdir_y(sinmove, siner_direction1);
    }
    else
    {
        x += lengthdir_x(sinmove, siner_direction1);
        y += lengthdir_y(sinmove, siner_direction1);
    }
}

if (shakeamt > 0)
{
    shaketimer--;
    
    if (shaketimer <= 0)
    {
        if (shaketype == 0)
        {
            shakex = random_range(-shakeamt, shakeamt);
            shakey = random_range(-shakeamt, shakeamt);
        }
        
        if (shaketype == 1)
            shakex = random(shakeamt);
        
        if (shaketype == 2)
            shakex = random_range(-shakeamt, shakeamt);
        
        if (shaketype == 3)
            shakex = -random(shakeamt);
        
        if (shaketype == 4)
            shakey = random_range(-shakeamt, shakeamt);
        
        if (shaketype == 5)
            shakey = -random(shakeamt);
        
        if (shaketype == 6)
            shakey = random(shakeamt);
        
        shaketimer = shaketime;
    }
}
else
{
    shakex = 0;
    shakey = 0;
}

if (stepsound == 1)
{
    if (stepsound_count == 0)
    {
        //snd_play(snd_step1); // lazy
        stepsound_count = 1;
    }
    else if (stepsound_count == 1)
    {
        //snd_play(snd_step2);
        stepsound_count = 0;
    }
    
    stepsound = 0;
}
