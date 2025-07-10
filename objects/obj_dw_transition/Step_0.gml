if (linecon == 1)
{
    linetimer += 1;
    
    if (linetimer >= 1)
    {
        xrand = random(1.5707963267948966);
        xrand2 = random(1.5707963267948966);
        instance_create((70 - (sin(xrand) * 70)) + camerax(), -10 + cameray(), obj_dw_transition_line);
        instance_create(250 + (sin(xrand2) * 70) + camerax(), -16 + cameray(), obj_dw_transition_line);
        linetimer = 0;
    }
    
    linesfxtimer++;
    
    if (linesfxtimer >= 4)
    {
        linesfxtimer = 0;
        sidenoise = snd_play(snd_dtrans_twinkle);
        snd_volume(sidenoise, 0.3, 0);
        snd_pitch(sidenoise, 0.6 + random(0.6));
    }
}

if (sus_f != 0)
{
    if (sus_v > 0)
    {
        sus_v -= sus_f;
        
        if (sus_v < 0)
            sus_v = 0;
    }
    
    if (sus_v < 0)
    {
        sus_v += sus_f;
        
        if (sus_v > 0)
            sus_v = 0;
    }
}

if (sus_v != 0)
{
    sus_y += sus_v;
    kris_y += sus_v;
}

if (fake_screenshake == 1)
{
    if (fake_shakeamount != 0)
    {
        if (fake_shakeamount > 0)
            fake_shakeamount -= 1;
        
        if (fake_shakeamount < 0)
            fake_shakeamount += 1;
        
        fake_shakeamount *= -1;
    }
    else
    {
        fake_screenshake = 0;
    }
}
