if (init == 0) {
	init = 1;
}

var objInd = obj_writer;

if (normalanim == 1)
{
    if (myinteract > 0 && instance_exists(objInd))
    {
        if (objInd.halt > 0)
        {
            image_speed = 0;
            image_index = 0;
        }
        
        if (objInd.halt == 0)
            image_speed = remanimspeed;
    }
}

if (normalanim == 1 || normalanim == 2)
{
    if (myinteract == 0)
    {
        image_index = 0;
        image_speed = 0;
    }
}

if (normalanim == 3)
{
    if (myinteract > 0 && instance_exists(objInd))
    {
        if (objInd.halt > 0)
            image_speed = remanimspeed;
        
        if (objInd.halt == 0)
            image_speed = remanimspeed / 2;
    }
    else
    {
        image_speed = remanimspeed;
    }
}

if (normalanim == 4)
{
    image_index = 0;
    image_speed = 0;
}

if (normalanim == 5)
{
    if (myinteract > 0 && instance_exists(objInd))
    {
        image_speed = 0;
        image_index = 1;
    }
    else
    {
        image_speed = 0;
        image_index = 0;
    }
}

if (normalanim == 6)
{
    if (myinteract > 0 && instance_exists(objInd))
    {
        if (objInd.halt > 0)
        {
            image_speed = 0;
            image_index = 0;
        }
        
        if (objInd.halt == 0)
        {
            image_speed = 0;
            image_index = 1;
        }
    }
}