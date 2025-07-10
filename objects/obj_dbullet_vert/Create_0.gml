scr_bullet_init();
grazepoints = 5;
timepoints = 5;
active = 0;

if (y < (__view_get(e__VW.YView, 0) + 20))
    y = __view_get(e__VW.YView, 0) + 20;

if (y > (__view_get(e__VW.YView, 0) + 460))
    y = __view_get(e__VW.YView, 0) + 460;

dont = 1;
difficulty = 1;
times = 0;
activetimer = 0;
image_alpha = 0;

if (!instance_exists(obj_heart))
    instance_destroy();

type = 0;