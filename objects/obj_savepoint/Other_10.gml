global.msc = 0;
global.typer = 5;

if (global.darkzone == 1)
    global.typer = 6;

global.fc = 0;
global.fe = 0;
global.interact = 1;
nodialogue = 1;

scr_save_point_text()

myinteract = 3;

if (nodialogue == 0)
    mydialoguer = instance_create(0, 0, obj_dialoguer);

talked += 1;
snd_play(snd_power);

for (i = 0; i < 5; i += 1)
{
    if (global.hp[i] < global.maxhp[i])
        global.hp[i] = global.maxhp[i];
}
