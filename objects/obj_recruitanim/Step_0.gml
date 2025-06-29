timer++;

if (timer <= 5)
{
    lerptimer++;
    image_xscale = lerp(image_xscale, 1, lerptimer / 5);
    image_yscale = lerp(image_yscale, 1, lerptimer / 5);
}

if (timer == 5)
    lerptimer = 0;

if (timer >= 5 && timer <= 8)
{
    lerptimer++;
    image_xscale = lerp(image_xscale, 0.5, lerptimer / 3);
    image_yscale = lerp(image_yscale, 2, lerptimer / 3);
}

if (timer == 8)
    lerptimer = 0;

if (timer >= 8 && timer <= 10)
{
    lerptimer++;
    
    if (lerptimer >= 2)
        lerptimer = 2;
    
    image_xscale = lerp(image_xscale, 1, lerptimer / 2);
    image_yscale = lerp(image_yscale, 1, lerptimer / 2);
}

x = xstart + (sprite_width / 2);

if (timer >= 35)
{
    vspeed -= 1;
    image_yscale += 0.1;
    image_alpha -= 0.1;
    
    if (image_alpha <= 0)
        instance_destroy();
}
