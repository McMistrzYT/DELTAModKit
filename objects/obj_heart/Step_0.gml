wallcheck = 0;
press_l = 0;
press_r = 0;
press_d = 0;
press_u = 0;
bkx = 0;
bky = 0;
bkxy = 0;
jelly = 2;

if (left_h())	press_l = 1;
if (right_h())	press_r = 1;
if (up_h())		press_u = 1;
if (down_h())	press_d = 1;

px = 0;
py = 0;

if (canmove && !_soulmodedata.overridemovementcode) {
    if (press_r == 1) px = wspeed;    
    if (press_l == 1) px = -wspeed;    
    if (press_d == 1) py = wspeed;    
    if (press_u == 1) py = -wspeed;
    
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

if IncludeRemovedDebugSoulSlowLock {
	if (color == 0)	{
		if (button3_h()) {
			if (button1_p()) {
				if (remove_slow_z_buffer > 40)
					remove_slow_z_buffer = 40
			
				remove_slow_z_buffer -= 10
			
				if (remove_slow_z_buffer <= 0) {
					if (global.flag[22] == 0)
						global.flag[22] = 1
					else
						global.flag[22] = 0
				
					snd_play(snd_swallow)
					remove_slow_z_buffer = 40
				}
			}
		}
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

method(id, _soulmodedata.step)()