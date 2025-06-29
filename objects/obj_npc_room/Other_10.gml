skip = false;
global.msc = 0;
global.typer = 5;

if (global.darkzone == 1)
    global.typer = 6;

global.fc = 0;
global.fe = 0;
global.interact = 1;
image_speed = 0.2;

if (global.darkzone == 1)
    image_speed = 0.2;

global.msg[0] = "* The gash weaves down as if you cry./%";

if (scr_debug())
    global.msg[0] = "* [NO TEXT] (obj_npc_room)/%";

scr_npc_interact();

if (skip == 0)
{
    remanimspeed = image_speed;
    myinteract = 3;
    mydialoguer = instance_create(0, 0, obj_dialoguer);
    mydialoguer.jpspecial = jpspecial;
    talked += 1;
}