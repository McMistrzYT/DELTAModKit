global.sp = 4;
wspeed = global.sp;
image_speed = 0;
fly = 0;
darken = 1;
darkamt = 0;
dmgnoise = 0;
chargeshot_sound = -1;
canmove = 1;
instance_create(x + 10, y + 10, obj_grazebox);
boundaryup = 0;

color = global.defaultsoulmode
_soulmodedata = global.soulmodesdata[color]

scr_heartcolor(color, id)
disableslow = 0;

if (button2_h()) disableslow = 1;

remove_slow_z_buffer = 40;
