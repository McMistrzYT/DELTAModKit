function global_flagname_init()
{
	global.flagname = [];

	repeat (9999)
	{
	    array_push(global.flagname, undefined)
	}

	global.flagname[6] = "disable text skip [Broken]"
	global.flagname[8] = "Simplify VFX"
	global.flagname[10] = "Has Wrist Protector"
	global.flagname[11] = "AutoRun"
	global.flagname[12] = "Disable Screenshake"
	global.flagname[29] = "Susie Ch1 Eyes"
	global.flagname[30] = "Ralsei Ch1 Hat"
	global.flagname[31] = "Footsteps"
	global.flagname[32] = "Party Item Comments"
	global.flagname[35] = "Game Over Type"
	global.flagname[21] = "Room Enter Freeze"
	// GONER CREATION SYSTEM
	global.flagname[900] = "GONER HEAD"
	global.flagname[901] = "GONER BODY"
	global.flagname[902] = "GONER LEGS"
	global.flagname[903] = "GONER FOOD"
	global.flagname[904] = "GONER BLOOD TYPE"
	global.flagname[905] = "GONER COLOR"
	global.flagname[909] = "GONER GIFT"
	global.flagname[906] = "GONER FEEL"
	global.flagname[907] = "GONER HONEST"
	global.flagname[908] = "GONER PAIN & SEIZURE"
	// Moss
	global.flagname[106] = "Moss Ch1"
	global.flagname[920] = "Moss Ch2"
	global.flagname[922] = "Sus Moss Ch2"
	global.flagname[921] = "Noe Moss Ch2"
	global.flagname[1078] = "Moss Ch3"
	global.flagname[1592] = "Moss Ch4"
	// Egg
	global.flagname[910] = "Met Man Ch1"
	global.flagname[917] = "Met Man Ch2"
	global.flagname[918] = "Got Egg Ch2"
	global.flagname[930] = "Got Egg Ch3"
	global.flagname[931] = "Got Egg Ch4"	
	// Back to others
	global.flagname[425] = "Onyon"
	global.flagname[302] = "Wearing Classroom Ball of Junk"
	global.flagname[915] = "Weird Route Progress"
	global.flagname[916] = "Weird Route Aborted"
	global.flagname[20] = "Multiuse" // It's used in a lot of completely unreleated scenarios...
	global.flagname[367] = "Blue Checkmark 1"
	global.flagname[407] = "Blue Checkmark 2"
	global.flagname[420] = "Blue Checkmark 3"
	// Battles
	global.flagname[22] = "Block Soul Slow"
	global.flagname[34] = "CharAction"
	global.flagname[37] = "Dojo Battle"
	global.flagname[13] = "Multikey Attack"
	global.flagname[14] = "Remember Last Option [Battle]"
	global.flagname[40] = "Fled Or Fatal Kill Enemies"
	global.flagname[41] = "Spared Enemies"
	global.flagname[42] = "Pacified Enemies"
	global.flagname[43] = "Susie Attacks"
	global.flagname[44] = "Total Kills"
	global.flagname[54] = "Encounter Flag"
	global.flagname[50] = "Battle End Result"
	global.flagname[51] = "End of Battle Enemy Stats [0]"
	global.flagname[52] = "End of Battle Enemy Stats [1]"
	global.flagname[53] = "End of Battle Enemy Stats [2]"
	global.flagname[45] = "Frozen Solid."
	global.flagname[925] = "Ice Shocks"
	global.flagname[1045] = "Sus Heal Strength"
}

function global_flagname_menu_init(arg0, arg1, arg2, arg3)
{
    return show_message("FlagName Menu No longer exists as most Debugging features are now being commented out before release [or getting replaced with return].")
}

function debug_message(val)
{
	if scr_debug()
		show_debug_message(val)
}

function scr_flag_get(flag)
{
    var flag_value = global.flag[flag];
    return flag_value;
}

function scr_flag_name_get(flag)
{
    if (!global.is_console)
    {
        var v = global.flagname[flag];
        return is_undefined(v) ? "*unknown flag*" : v;
    }
    else
    {
        return "";
    }
}

function scr_getflag(flag)
{
    return scr_flag_get(flag);
}

function scr_flag_set(flag, value)
{
    global.flag[flag] = value;
    
    if (scr_debug())
    {
        show_debug_message("*** flag [" + string(flag) + "] updated: " + string(value) + " | " + scr_flag_name_get(flag));
    }
}

function scr_setflag(flag, value)
{
    scr_flag_set(flag, value);
}
