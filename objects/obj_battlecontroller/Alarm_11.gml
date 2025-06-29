obj_battlecontroller.noreturn = 1;
obj_battlecontroller.intro = 2;

with (obj_tensionbar)
{
    alarm[5] = 15;
    hspeed = -10;
    friction = -0.4;
}

snd_stop(global.batmusic[1]);

if (global.turntimer > 0)
    global.turntimer = 0;

global.fighting = 0;
global.boardbattleresult = "lost";

with (obj_dbulletcontroller)
    instance_destroy();

with (obj_heart)
    instance_destroy();

with (obj_growtangle)
    instance_destroy();

with (obj_writer)
    instance_destroy();

with (obj_face)
    instance_destroy();

with (obj_lerpvar)
    instance_destroy();

with (obj_script_delayed)
    instance_destroy();

with (obj_afterimage_grow)
    instance_destroy();

with (obj_darkener)
    instance_destroy();

global.flag[9] = 0;
scr_endcombat();
