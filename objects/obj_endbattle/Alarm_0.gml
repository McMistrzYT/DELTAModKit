var skipplmove = false;

with (obj_mainchara)
{
    if (global.specialbattle != 3)
        cutscene = 0;
    
    visible = 1;
}

with (obj_caterpillarchara)
    visible = 1;

if (!skipplmove)
{
    if (global.specialbattle == 0 || global.specialbattle == 3)
    {
        for (i = 0; i < (count + 1); i += 1)
        {
            with (c[i])
                instance_destroy();
        }
    }
}

if (global.specialbattle == 0 || global.specialbattle == 2)
    global.interact = 0;

if (global.flag[9] == 1)
{
    snd_free(global.batmusic[0]);
    snd_volume(global.currentsong[1], 0, 0);
    snd_resume(global.currentsong[1]);
    snd_volume(global.currentsong[1], 1, 20);
}

instance_destroy();
