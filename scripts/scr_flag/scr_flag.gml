enum DRFLAG { // NOT EVEN CLOSE TO ALL FLAGS!
		/* 6 */		BlockTextSkip = 6,
		/* 7 */		BlockMenu,
		/* 8 */		Setting_SimplifyVFX,
		/* 9 */		BattleMusicPlaying,
		/* 10 */	CanAutomash,
		/* 11 */	Setting_AutoRun,
		/* 12 */	DisableScreenShake, // Simplify VFX also does this
		/* 13 */	MultiKeyAttack,
		/* 14 */	RememberLastOption_Battle,
		/* 15  */	Setting_SFXVolume, // Was Removed from Option Menu before Survey Program Release, Likely since Toby didn't want to Mark Every Sound Effect as the Sound Effect Audio Group
		/* 16  */	Setting_MUSVolume, // Probably was Removed due to SFX being removed
		/* 17  */	Setting_MASTERVolume,
		
		/* 20 */	DialogueFlag = 20, // Controlled by Writer via using the \M0 to \m9 Text Commands
		/* 21 */	RoomEnterFreezeTimer,
		/* 22 */	BlockSoulSlow,
		/* 23 */	Climb_EverSeenStarterTrig,
		/* 24 */	Plat_Unlocked,
		/* 25 */	Plat_SwitchAttackandJump,

		/* 29 */	Chapter1SusieRevealedEyes = 29,
		/* 30 */	Chapter1RalseiFaceOutfit, // 0 is Hat, 1 is Hooded, 2 is Hatless
		/* 31 */	KrisMakeAudibleFootsteps,
		/* 32 */	PartyCommentonItems,
		/* 33 */	ChoiceTimer,
		/* 34 */	HideCharacterActs,
		/* 35 */	GameOverType,  // 0 is True GameOver, 1 is End Battle Without Gameover Screen Sets Failed Battle Flag to 1, 2 is Reload Room with entire party at 1 HP
		/* 36 */	FailedBattle,
		
		// Array Type Flag, Length == 10, may have unused Values
		/* 40 */	__DefeatCountersStart__ = 40,
		
		// Array Type Flag, Length == 13, may have unused Values
		/* 50 */	__EncountersCoreStart__ = 50,
		
		/* 261 */	NPC_QC_DinerCh2_CollectedHotChocolate = 261,
		
		/* 1332 */	HeldOverworldItemId_ForceStart = 1332,
}
// array macros
#region __DefeatCountersStart__
	#macro DefeatCounter_Violence		DRFLAG.__DefeatCountersStart__ + 0
	#macro DefeatCounter_Spare			DRFLAG.__DefeatCountersStart__ + 1
	#macro DefeatCounter_Pacify			DRFLAG.__DefeatCountersStart__ + 2
	#macro DefeatCounter_Violence_Auto	DRFLAG.__DefeatCountersStart__ + 3
	#macro DefeatCounter_Fatal			DRFLAG.__DefeatCountersStart__ + 4
	#macro DefeatCounter_Freeze			DRFLAG.__DefeatCountersStart__ + 5
#endregion
#region __EncountersCoreStart__
	#macro EncountersCore_EncounterResult_Total			DRFLAG.__EncountersCoreStart__ + 0
	#macro EncountersCore_EncounterResult_Enemy1	DRFLAG.__EncountersCoreStart__ + 1
	#macro EncountersCore_EncounterResult_Enemy2	DRFLAG.__EncountersCoreStart__ + 2
	#macro EncountersCore_EncounterResult_Enemy3	DRFLAG.__EncountersCoreStart__ + 3
	#macro EncountersCore_EncounterResultForward	DRFLAG.__EncountersCoreStart__ + 4 // This flag is what flag it'd Copy the value from Combat Results into
	#macro EncountersCore_EncounterX				DRFLAG.__EncountersCoreStart__ + 5
	#macro EncountersCore_EncounterY				DRFLAG.__EncountersCoreStart__ + 6
	
#endregion

function global_flagname_init() {
	if DEBUGMODE {
		var __generateflagnamesarray = function(_start, _array = [], _end, categoryname = "UNKNOWN") {
			if is_nan(_start) exit;
			if !is_array(_array) exit;
			if is_nan(_end) _end = _start + 10;
		
			for (var i = 0; i < _end - _start; i++) {
				var name = "??? (" + string(i) + ")"
				if i >= 0 && i < array_length(_array) name = string(_array[i])
			
				global.flagname[_start + i] = string("[{0}] {1}", categoryname, name)
			}
		}
	
		global.flagname = array_create(9999, undefined);
		global.flagname[DRFLAG.BlockTextSkip] = "disable text skip [Broken?]"
		global.flagname[DRFLAG.BlockMenu] = "disable Menu"
		global.flagname[DRFLAG.Setting_SimplifyVFX] = "Simplify VFX"
		global.flagname[DRFLAG.BattleMusicPlaying] = "Battle Music Playing"
		global.flagname[DRFLAG.CanAutomash] = "Has Wrist Protector"
		global.flagname[DRFLAG.Setting_AutoRun] = "AutoRun"
		global.flagname[DRFLAG.DisableScreenShake] = "Disable Screenshake"
	
		global.flagname[DRFLAG.RoomEnterFreezeTimer] = "Room Enter Freeze Timer"
	
		global.flagname[DRFLAG.Chapter1SusieRevealedEyes] = "Susie Ch1 Eyes"
		global.flagname[DRFLAG.Chapter1RalseiFaceOutfit] = "Ralsei Ch1 Hat"
		global.flagname[DRFLAG.KrisMakeAudibleFootsteps] = "Footsteps"
		global.flagname[DRFLAG.PartyCommentonItems] = "Party Item Comments"
		global.flagname[DRFLAG.ChoiceTimer] = "Choice Timer"
		global.flagname[DRFLAG.HideCharacterActs] = "Hide CharActs from Spell Menu"
		global.flagname[DRFLAG.GameOverType] = "Game Over Type"
		global.flagname[DRFLAG.FailedBattle] = "Lost Battle (No Reload)"
	
		global.flagname[55] = "Overworld Enemy Encounter X Pos"
		global.flagname[56] = "Overworld Enemy Encounter Y Pos"
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
		global.flagname[DRFLAG.NPC_QC_DinerCh2_CollectedHotChocolate] = "Ch2 Diner Hot Chocolate"
		global.flagname[DRFLAG.HeldOverworldItemId_ForceStart] = "Held Overworld Item"
		// Battles
		global.flagname[DRFLAG.MultiKeyAttack] = "Multikey Attack"
		global.flagname[DRFLAG.RememberLastOption_Battle] = "Remember Last Option [Battle]"
		global.flagname[22] = "Block Soul Slow"
		global.flagname[34] = "CharAction"
		global.flagname[36] = "Failed Dojo"
		global.flagname[37] = "Dojo Battle"
		global.flagname[39] = "Technically Won/Force Win"
	
		//global.flagname[40] = "Fled Or Fatal Kill Enemies"
		//global.flagname[41] = "Spared Enemies"
		//global.flagname[42] = "Pacified Enemies"
		//global.flagname[43] = "Susie Attacks"
		//global.flagname[44] = "Total Kills"
		/*
		global.flagname[54] = "EncounterEnd Flag Result Flag" // Weird Name, since it is a Flag that Points to what Flag the Encounter End Results with be put into.
		global.flagname[50] = "Battle End Result"
		global.flagname[51] = "End of Battle Enemy Stats [0]"
		global.flagname[52] = "End of Battle Enemy Stats [1]"
		global.flagname[53] = "End of Battle Enemy Stats [2]"
		*/
		global.flagname[45] = "Frozen Solid."
		global.flagname[925] = "Ice Shocks"
		global.flagname[1045] = "Sus Heal Strength"
	
		// Array Types
		__generateflagnamesarray(DRFLAG.__DefeatCountersStart__, [
			"Violenced",
			"Spare",
			"Pacify",
			"Auto-Violence",
			"Fatal",
			"Freeze",
		], undefined, "DEFEAT COUNTERS")
		__generateflagnamesarray(DRFLAG.__EncountersCoreStart__, [
			"Result Total",
			"Result Enemy 1",
			"Result Enemy 2",
			"Result Enemy 3",
			"Result Store Flag",
			"OverworldX",
			"OverworldY",
		], undefined, "ENCOUNTERS")
	
	
	}
}

function global_flagname_menu_init(arg0, arg1, arg2, arg3) {
    return show_message("FlagName Menu No longer exists as most Debugging features are now being commented out before release [or getting replaced with return].")
}

function debug_message(val)
{
	if scr_debug()
		debug_log(val)
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
        var v = global.flagname[flag]
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
        debug_log("*** flag [" + string(flag) + "] updated: " + string(value) + " | " + scr_flag_name_get(flag));
    }
}

function scr_setflag(flag, value) { scr_flag_set(flag, value); }

function scr_flag_set_ext(flag, bitmaskindex, newvalue, bytesperindex = 1){
    if (bitmaskindex < 0)
        scr_flag_set(flag, newvalue)
    else
        global.flag[flag] = scr_set_bitmask_value(global.flag[flag], bitmaskindex, newvalue, bytesperindex)
}


function scr_flag_get_ext(flag, bitmaskindex, bytesperindex = 1){
    if (bitmaskindex < 0)
        scr_flag_get(flag)
    else
        return scr_get_bitmask_value(global.flag[flag], bitmaskindex, bytesperindex);
}
