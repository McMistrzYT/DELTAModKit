global.msc = 0;
global.typer = 5;

if (global.darkzone == 1)
    global.typer = 6;

global.fc = 0;
global.fe = 0;
global.interact = 1;
nodialogue = 1;

if CUSTOM
{
	nodialogue = false
	if CUSTOM_TEXT = noone
		nodialogue = true
	else if is_array(CUSTOM_TEXT)
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
	else if is_string(CUSTOM_TEXT)
	{
		global.msg[0] = CUSTOM_TEXT
		global.msg[1] = "%%"
	}
}
else
	scr_save_point_text();

myinteract = 3;

if (nodialogue == 0)
    mydialoguer = instance_create(0, 0, obj_dialoguer);

talked += 1;
snd_play(snd_power);

for (i = 0; i < DRCharacter.__MAX__; i += 1)
{
    if (global.hp[i] < global.maxhp[i])
        global.hp[i] = global.maxhp[i];
}
