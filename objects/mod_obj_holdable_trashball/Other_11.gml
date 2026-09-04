// Inherit the parent event
if global.interact == 3 exit; // Room Transition
if scr_flag_get(DRFLAG.HeldOverworldItemId_ForceStart) == DROverworldItem.trashballCh2 scr_flag_set(DRFLAG.HeldOverworldItemId_ForceStart, DROverworldItem.None)
event_inherited();