dothis = 1;

if (dothis == 1)
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
}
