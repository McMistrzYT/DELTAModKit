grazed = 0;
target = 0;
inv = 120;
damage = 124;
element = "none";
grazepoints = 5;
timepoints = 5;
active = 0;
dont = 1;
activetimer = 0;
difficulty = 1;
times = 0;
image_alpha = 0;

if (instance_exists(obj_heart))
    futuredir = point_direction(x, y, obj_heart.x + 8, obj_heart.y + 8);
else
    instance_destroy();
