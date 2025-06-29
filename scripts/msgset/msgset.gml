function msgset(arg0, arg1)
{
    global.msgno = arg0;
    global.msg[arg0] = arg1;
}

function msgnext(arg0)
{
    global.msgno++;
    msgset(global.msgno, arg0);
}

function msgsetsub()
{
    var len = argument_count;
    var args;
    
    for (var i = 0; i < len; i++)
        args[i] = argument[i];
    
    var str = substringargs(argument[1], 2, args);
    msgset(argument[0], str);
}

function msgnextsub()
{
    var len = argument_count;
    var args;
    
    for (var i = 0; i < len; i++)
        args[i] = argument[i];
    
    var str = substringargs(argument[0], 1, args);
    msgnext(str);
}