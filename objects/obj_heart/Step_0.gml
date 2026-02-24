wallcheck = 0;
press_l = 0;
press_r = 0;
press_d = 0;
press_u = 0;
bkx = 0;
bky = 0;
bkxy = 0;
jelly = 2;

if (left_h())
    press_l = 1;

if (right_h())
    press_r = 1;

if (up_h())
    press_u = 1;

if (down_h())
    press_d = 1;

px = 0;
py = 0;

if (canmove) {
    if (press_r == 1)
        px = wspeed;
    
    if (press_l == 1)
        px = -wspeed;
    
    if (press_d == 1)
        py = wspeed;
    
    if (press_u == 1)
        py = -wspeed;
    
    if (button2_h() && global.flag[22] == 0)
    {
        if (disableslow == 0)
        {
            px = ceil(px * 0.5);
            py = ceil(py * 0.5);
        }
    }
    else
    {
        disableslow = 0;
    }
}

remove_slow_z_buffer += 0.5;
scr_defaultprimarycollisioncode(obj_battlesolid)

if ((x + px) >= ((camerax() + camerawidth()) - sprite_width))					px = (camerax() + camerawidth()) - sprite_width - x;
if ((x + px) <= 0)																px = -x;
if ((y + py) <= 0)																py = -y;
if ((y + py) >= (((cameray() + cameraheight()) - sprite_height) + boundaryup))	py = ((cameray() + cameraheight()) - sprite_height - y) + boundaryup;

x += px;
y += py;

if (dmgnoise == true) {
    dmgnoise = false;
    snd_stop(snd_hurt1);
    snd_play(snd_hurt1);
}

global.inv -= 1;

if (global.inv > 0) {
    image_speed = 0.25;
}
else
{
    image_speed = 0;
    image_index = 0;
}

global.heartx = (x + 2) - camerax();
global.hearty = (y + 2) - cameray();

/*if (color == 1)
{
    wspeed = 5;
    
    if (chargeshot_delay > 0)
        chargeshot_delay--;
    
    if (button1_p() || (z_hold >= 10 && z_hold <= 39 && button1_r()))
    {
        if (instance_number(obj_yheart_shot) < 3 && chargeshot_delay == 0)
        {
            instance_create(x + 10, y + 10, obj_yheart_shot);
            snd_play(snd_heartshot_dr_b);
        }
    }
    
    if (z_hold == 20)
    {
        chargeshot_sound = snd_loop(snd_chargeshot_charge);
        snd_pitch(chargeshot_sound, 0.1);
        snd_volume(chargeshot_sound, 0, 0);
        snd_volume(chargeshot_sound, 0.3, 20);
    }
    
    if (z_hold >= 20 && z_hold < 40)
        snd_pitch(chargeshot_sound, 0.1 + ((z_hold - 20) / 20));
    
    if (z_hold >= 40)
        image_index = 2;
    
    if (z_charge < 15)
        chargeshotcount = 0;
    
    if (z_hold >= 40 && button1_r())
    {
        snd_stop(chargeshot_sound);
        snd_play(snd_chargeshot_fire);
        bigshot = instance_create(x + 10, y + 10, obj_yheart_shot);
        bigshot.big = 1;
        bigshot.sprite_index = spr_yheart_bigshot;
        bigshot.hspeed = 4 * f;
        bigshot.friction = -0.2 * f;
        bigshot.image_alpha = 0.5;
        bigshot.image_xscale = 0.1;
        bigshot.image_yscale = 2;
        z_hold = 0;
        chargeshot_delay = 5;
        image_index = 0;
        chargeshotcount++;
    }
    
    if (button1_h())
    {
        z_hold_f += 1;
    }
    else
    {
        z_hold_f = 0;
        snd_stop(chargeshot_sound);
    }
    
    z_hold = z_hold_f * 2;
}*/
