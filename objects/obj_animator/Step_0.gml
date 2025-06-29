if (i_ex(target))
{
    if (con == 0)
    {
        target.image_index = 0;
        target.image_speed = 0;
        
        if (sprite >= 0)
            target.sprite_index = sprite;
        
        if (initframe >= 0)
            target.image_index = initframe;
        
        fake_image_index_max = endframe;
        
        if (endframe == 0)
            fake_image_index_max = target.image_number - 1 - target.image_index;
        
        if (endframe == -1)
            fake_image_index_max = target.image_number - target.image_index;
        
        con = 1;
    }
    
    if (con == 1)
    {
        fake_image_index += fake_image_speed;
        target.image_index = fake_image_index;
        
        if (fake_image_index >= fake_image_index_max)
            instance_destroy();
    }
}
else
{
    instance_destroy();
}
