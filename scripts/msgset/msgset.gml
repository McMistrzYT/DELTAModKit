/// @desc MessageSet, Sets the Current Message (for msgnext to access and increase by 1) and Sets the Message
/// @arg MessageIndex The Index in the Array the Message goes into, Arrays start at 0
/// @arg Message The Message to insert into the Array, Used for Dialogue
/// @arg pointer_null Unused Argument, exists so feather stops complaining due to leftover localization keys when msgsetloc (the Localization Variation of this) instances were replaced with msgset
function msgset(messageid, text, nullargument_tostopfeathercomplaints = pointer_null){
    global.msgno = messageid;
    global.msg[messageid] = text;
}

/// @desc MessageNext, sets the Next Message, use MessageSet to start it back off at 0 (or what ever MessageId you force it into)
/// @arg Message The Message to insert into the Array, Used for Dialogue
function msgnext(text){
    global.msgno++;
    msgset(global.msgno, text);
}

function msgsetsub(){
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