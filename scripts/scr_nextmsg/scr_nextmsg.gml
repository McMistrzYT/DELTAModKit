function scr_nextmsg()
{
    msgno += 1;
    lineno = 0;
    aster = 0;
    halt = 0;
    pos = 1;
    alarm[0] = 1;
    drawaster = 1;
    autoaster = 1;
    miniface_pos = 0;
    miniface_current_pos = -1;
    mystring = nstring[msgno];
    formatted = 0;
    wxskip = 0;
    sound_played = 0;
    reachedend = 0;
    reachedend_sound_played = 0;
    forcebutton1 = 0;
    
    if (rate < 3)
    {
        firstnoise = 0;
        alarm[2] = 1;
    }
    
    for (var _objecti = 0; _objecti < 9; _objecti++)
        object_made[_objecti] = 0;
    
    //with (obj_funnytext)
    //    instance_destroy();
}
