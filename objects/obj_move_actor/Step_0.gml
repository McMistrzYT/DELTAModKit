if (i_ex(target))
{
    if (init == 0)
    {
        init = 1;
        
        if (direction_word != "nothing")
        {
            if (direction_word == "l")
                direction = 180;
            
            if (direction_word == "d")
                direction = 270;
            
            if (direction_word == "r")
                direction = 0;
            
            if (direction_word == "u")
                direction = 90;
        }
        
        target.speed = speed;
        target.direction = direction;
    }
    
    timer += 1;
    
    if (timer >= time)
    {
        target.speed = 0;
        target.image_index = 0;
        target.image_speed = 0;
        instance_destroy();
        exit;
    }
}
else
{
    instance_destroy();
    exit;
}
