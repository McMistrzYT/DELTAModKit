if (is_real(doorEntrance))
{
    if (doorEntrance != -1)
        global.entrance = doorEntrance;
}
else if (is_string(doorEntrance))
{
    global.entrance = (ord(string_upper(doorEntrance)) - 65) + 1;
}

if (doorSound2 != -1)
    snd_play(doorSound2);

if (doorFacing != -1)
    global.facing = doorFacing;

if (doorPostDelay > 1)
    global.flag[21] = doorPostDelay;
else
    global.flag[21] = -10;