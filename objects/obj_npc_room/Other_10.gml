skip = false;
global.msc = 0;
global.typer = 5;

if (global.darkzone == 1)
    global.typer = 6;

global.fc = 0;
global.fe = 0;
global.interact = 1;
if TALKSPRITE
{
	image_speed = 0.2;

	if (global.darkzone == 1)
	    image_speed = 0.2;
}
global.msg[0] = scr_debug() ? "* [NO TEXT] (obj_npc_room)/%" : "* The gash weaves down as if you cry./%";


if !CUSTOM
{
	scr_npc_interact();
}
else
{
	if USECUSTOMFUNC
		CUSTOM_FUNC()
	else
	{
		var i = 0
		while i < array_length(CUSTOM_TEXT)
		{
			global.msg[i] = CUSTOM_TEXT[i]
			i++
		
			if i == array_length(CUSTOM_TEXT)
			{
				global.msg[i] = "%%"
			}
		}
	}
}

if (skip == 0)
{
	if TALKSPRITE
	{
		remanimspeed = image_speed;
	}
    myinteract = 3;
    mydialoguer = instance_create(0, 0, obj_dialoguer);
    mydialoguer.jpspecial = jpspecial;
    talked += 1;
}
