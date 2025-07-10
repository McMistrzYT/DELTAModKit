if (instance_number(obj_dw_transition) > 1)
    instance_destroy();

depth = 100;
con = 8;
timer = 0;
index = 0;
sus_v = 0;
sus_f = 0;
dz = 1 + global.darkzone;
kris_x = 134 + camerax();
kris_y = 94 + cameray();
sus_x = 162 + camerax();
sus_y = 86 + cameray();
sus_draw = 1;
sus_sprite = 0;
sus_index = 0;
kris_only = 0;
finaly = 140;
image_alpha = 0.9;
linecon = 0;
linetimer = 0;
rect_draw = 0;
fake_screenshake = 0;
fake_shakeamount = 0;
rx1 = 138;
ry1 = 64;
rx2 = 182;
ry2 = 118;

quick_mode = 0;
soundtimer = 0;
soundcon = 0;
linesfxtimer = 0;
nextroom = room_dw_castle_area_1;
skiprunback = 0;
char_alpha = 1;

border_fade = false;
