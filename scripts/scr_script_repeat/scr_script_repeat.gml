function scr_script_repeat()
{
    var __scriptdelay = instance_create(0, 0, obj_script_delayed);
    __scriptdelay.script = argument[0];
    __scriptdelay.alarm[0] = -2;
    __scriptdelay.max_time = argument[1];
    __scriptdelay.rate = argument[2];
    __scriptdelay.constant = 1;
    __scriptdelay.target = id;
    
    for (var __i = 0; __i < (argument_count - 3); __i++)
        __scriptdelay.script_arg[__i] = argument[__i + 3];
    
    __scriptdelay.arg_count = argument_count - 3;
    return __scriptdelay;
}
