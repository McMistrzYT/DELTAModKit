if (i_ex(target))
{
    target.__scipt = script;
    
    for (i = 0; i < 10; i++)
        target.__scipt_arg[i] = script_arg[i];
    
    if (arg_count == 0)
    {
        with (target)
            script_execute(__scipt);
    }
    
    if (arg_count == 1)
    {
        with (target)
            script_execute(__scipt, __scipt_arg[0]);
    }
    
    if (arg_count == 2)
    {
        with (target)
            script_execute(__scipt, __scipt_arg[0], __scipt_arg[1]);
    }
    
    if (arg_count == 3)
    {
        with (target)
            script_execute(__scipt, __scipt_arg[0], __scipt_arg[1], __scipt_arg[2]);
    }
    
    if (arg_count == 4)
    {
        with (target)
            script_execute(__scipt, __scipt_arg[0], __scipt_arg[1], __scipt_arg[2], __scipt_arg[3]);
    }
    
    if (arg_count == 5)
    {
        with (target)
            script_execute(__scipt, __scipt_arg[0], __scipt_arg[1], __scipt_arg[2], __scipt_arg[3], __scipt_arg[4]);
    }
    
    if (arg_count == 6)
    {
        with (target)
            script_execute(__scipt, __scipt_arg[0], __scipt_arg[1], __scipt_arg[2], __scipt_arg[3], __scipt_arg[4], __scipt_arg[5]);
    }
    
    if (arg_count == 7)
    {
        with (target)
            script_execute(__scipt, __scipt_arg[0], __scipt_arg[1], __scipt_arg[2], __scipt_arg[3], __scipt_arg[4], __scipt_arg[5], __scipt_arg[6]);
    }
    
    if (arg_count == 8)
    {
        with (target)
            script_execute(__scipt, __scipt_arg[0], __scipt_arg[1], __scipt_arg[2], __scipt_arg[3], __scipt_arg[4], __scipt_arg[5], __scipt_arg[6], __scipt_arg[7]);
    }
    
    if (arg_count == 9)
    {
        with (target)
            script_execute(__scipt, __scipt_arg[0], __scipt_arg[1], __scipt_arg[2], __scipt_arg[3], __scipt_arg[4], __scipt_arg[5], __scipt_arg[6], __scipt_arg[7], __scipt_arg[8]);
    }
    
    if (arg_count == 10)
    {
        with (target)
            script_execute(__scipt, __scipt_arg[0], __scipt_arg[1], __scipt_arg[2], __scipt_arg[3], __scipt_arg[4], __scipt_arg[5], __scipt_arg[6], __scipt_arg[7], __scipt_arg[8], __scipt_arg[9]);
    }
}
