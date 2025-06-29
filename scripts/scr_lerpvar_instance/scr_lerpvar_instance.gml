function scr_lerpvar_instance()
{
    __lerpvar = instance_create(0, 0, obj_lerpvar);
    __lerpvar.target = argument[0];
    __lerpvar.varname = argument[1];
    __lerpvar.pointa = argument[2];
    __lerpvar.pointb = argument[3];
    __lerpvar.maxtime = argument[4];
    
    if (argument_count >= 6)
        __lerpvar.easetype = argument[5];
    
    if (argument_count >= 7)
        __lerpvar.easeinout = argument[6];
    
    return __lerpvar;
}

function scr_lerp_var_instance()
{
    if (argument_count >= 6)
        return scr_lerpvar_instance(argument0, argument1, argument2, argument3, argument4, argument5);
    else if (argument_count >= 7)
        return scr_lerpvar_instance(argument0, argument1, argument2, argument3, argument4, argument5, argument6);
    else
        return scr_lerpvar_instance(argument0, argument1, argument2, argument3, argument4);
}

function scr_lerp_instance_var()
{
    if (argument_count >= 6)
        return scr_lerpvar_instance(argument0, argument1, argument2, argument3, argument4, argument5);
    else if (argument_count >= 7)
        return scr_lerpvar_instance(argument0, argument1, argument2, argument3, argument4, argument5, argument6);
    else
        return scr_lerpvar_instance(argument0, argument1, argument2, argument3, argument4);
}

function scr_lerpvar()
{
    if (argument_count < 6)
        ___lerpvar = scr_lerpvar_instance(id, argument[0], argument[1], argument[2], argument[3]);
    else
        ___lerpvar = scr_lerpvar_instance(id, argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
    
    return ___lerpvar;
}

function scr_lerpvar_respect()
{
    if (argument_count < 6)
        ___lerpvar = scr_lerpvar_instance(id, argument[0], argument[1], argument[2], argument[3]);
    else
        ___lerpvar = scr_lerpvar_instance(id, argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
    
    ___lerpvar.respectglobalinteract = true;
    return ___lerpvar;
}