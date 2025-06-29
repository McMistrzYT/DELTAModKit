if (button3_h() && button2_h())
{
}
else
{
    with (obj_mainchara)
        roomenterfreezeend = 1;
}

if (doorPreset > 0)
{
    if (doorPreset == 1)
    {
        doorDelay = 14;
        doorPostDelay = 6;
        doorSound = snd_dooropen;
        doorSound2 = snd_doorclose;
    }
    else if (doorPreset == 2)
    {
        doorDelay = 16;
        doorPostDelay = 6;
        doorSound = snd_escaped;
    }
}

if (doorFadeMusic)
{
    alarm[3] = doorFadeMusicTime;
    mus_volume(global.currentsong[1], 0, alarm[3]);
    
    if (doorDelay <= doorFadeMusicTime)
        doorDelay = doorFadeMusicTime + 1;
}

if (doorDelay > 0)
    alarm[2] = doorDelay;

if (doorSound != -1)
    snd_play(doorSound);

if (i_ex(obj_fadeout))
{
    var off = 0;
    
    if (os_type == os_macosx)
        off = 1;
    
    if (alarm[2] > 0)
        obj_fadeout.fadespeed = 1 / (alarm[2] - off);
}

//with (obj_overworldbulletparent)
//    active = 0;
