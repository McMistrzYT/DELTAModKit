timer += 1;

if (timer == 1)
    snd_free_all();

if (timer == 30)
{
    with (bg)
        instance_destroy();
    
    visible = 1;
    x = global.heartx;
    y = global.hearty;
}

if (timer == 31)
    sprite_delete(global.screenshot);

if (timer == 50)
{
    snd_play(snd_break1);
    sprite_index = spr_heartbreak;
    x -= 2;
}

if (timer == 90)
{
    snd_play(snd_break2);
    visible = false;
    sh[0] = instance_create(x - 2, y, obj_marker);
    sh[1] = instance_create(x, y + 3, obj_marker);
    sh[2] = instance_create(x + 2, y + 6, obj_marker);
    sh[3] = instance_create(x + 8, y, obj_marker);
    sh[4] = instance_create(x + 10, y + 3, obj_marker);
    sh[5] = instance_create(x + 12, y + 6, obj_marker);
    
    for (i = 0; i < array_length(sh); i += 1)
    {
        with (sh[i])
        {
            direction = random(360);
            speed = 7;
            gravity_direction = 270;
            gravity = 0.2;
            sprite_index = spr_heartshards;
            image_speed = 0.2;
        }
    }
    
    if (global.tempflag[3] >= 1)
        timer += 15;
}

if (timer == 140)
    instance_create(0, 0, obj_fadeout);

if (timer >= 80 && timer < 150)
{
    if (button1_p())
        Z_COUNT += 1;
    
    if (Z_COUNT >= 4)
    {
        timer = -999;
        timerb++;
        var fade_out = scr_fadeout(30);
        
        with (fade_out)
        {
            image_blend = c_white;
            depth = -99999999;
        }
        
        snd_play_x(snd_dtrans_lw, 0.7, 1);
    }
}

if (timer == 150)
    room_goto(PLACE_FAILURE);

if (timerb > 0)
{
    timerb++;
    
    if (timerb == 40)
        scr_tempload();
}
