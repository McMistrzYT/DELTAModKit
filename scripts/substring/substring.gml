function substringargs(str, offset, args)
{
    var sub_id = 1;
    var num_args = array_length(args);
    var len = (num_args - offset) + 1;
    
    while (sub_id < len)
    {
        var sub = "~" + string(sub_id);
        var ndx = (sub_id + offset) - 1;
        str = string_replace_all(str, sub, args[ndx]);
        sub_id = sub_id + 1;
    }
    
    return str;
}

function stringsetsub()
{
    var len = argument_count;
    var args;
    
    for (var i = 0; i < len; i++)
        args[i] = argument[i];
    
    var str = substringargs(argument[0], 1, args);
    return str;
}
