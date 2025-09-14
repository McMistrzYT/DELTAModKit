if (con == 1)
{
    image_angle += (rotspeed * 2);
    direction += (rotspeed * 3);
    timer++;
    
    if (timer >= 10)
        image_alpha -= 0.1;
    
    if (image_alpha <= 0)
        instance_destroy();
}
