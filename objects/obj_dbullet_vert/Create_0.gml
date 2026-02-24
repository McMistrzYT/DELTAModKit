scr_bullet_init();
grazepoints = 5;
timepoints = 5;
active = 0;

if (y < (cameray() + 20))
    y = cameray() + 20;

if (y > (cameray() + 460))
    y = cameray() + 460;

dont = 1;
difficulty = 1;
times = 0;
activetimer = 0;
image_alpha = 0;

if (!instance_exists(obj_heart))
    instance_destroy();

type = 0;