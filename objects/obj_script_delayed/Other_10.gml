if (i_ex(target)) {
    target.__scipt = script;
    
    for (i = 0; i < 10; i++)
        target.__scipt_arg[i] = script_arg[i];
    
    with target scr_script_execute_name(__scipt, __scipt_arg)
}