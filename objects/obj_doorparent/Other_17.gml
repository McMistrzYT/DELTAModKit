if (is_real(doorEntrance)){
    if (doorEntrance != -1) global.entrance = doorEntrance;
}
else if (is_string(doorEntrance)){
    global.entrance = (ord(string_upper(doorEntrance)) - ord("A")) + 1;
}

if (doorSound2 != -1) snd_play(doorSound2);
if (doorFacing != -1) global.facing = doorFacing;
if (doorPostDelay > 1) global.flag[DRFLAG.RoomEnterFreezeTimer] = doorPostDelay; else global.flag[DRFLAG.RoomEnterFreezeTimer] = -10;