if (init == 1)
{
    if (i_ex(body_obj))
    {
        with (body_obj)
            instance_destroy();
    }
    
    if (i_ex(target))
    {
        with (target)
            visible = 1;
        
        target.x = endx;
        target.y = endy;
    }
}
