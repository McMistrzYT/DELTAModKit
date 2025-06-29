if (con == 0)
{
    con = 1;
    alarm[4] = 40;
}

if (con == 1)
    global.interact = 1;

if (con == 2)
{
    sndplay = 0;
    
    if (snd_is_playing(global.currentsong[1]))
    {
        sndplay = 1;
        snd_pause(global.currentsong[1]);
    }
    
    snd_play(snd_smile);
    con = 3;
    alarm[4] = 200;
}

if (con == 4)
{
    with (obj_dialoguer)
        instance_destroy();
    
    with (obj_writer)
        instance_destroy();
    
    con = 7;
}

if (con == 7)
{
    snd_stop(snd_smile);
    
    if (sndplay == 1)
        snd_resume(global.currentsong[1]);
    
    msgset(0, "* It's nothing but garbage noise./%");
    instance_create(0, 0, obj_dialoguer);
    con = 5;
    global.interact = 6;
    instance_destroy();
}
