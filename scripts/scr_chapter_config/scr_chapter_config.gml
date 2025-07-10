function scr_chapter_config() {
	global.chapter = 4;
	global.versionno = "v0.90-modkit-2";
	
	global.newFileStartingRoom = room_lw_test;
	global.isStartingRoomDarkWorld = false;
}

function scr_gamestart_chapter_override()
{
    global.plot = 0;
    global.char[0] = DRCharacter.Kris;
    global.char[1] = DRCharacter.Susie;
    global.char[2] = DRCharacter.Ralsei;
	
    scr_litemremove(DRLightItem.HotChocolate);
    scr_litemremove(DRLightItem.Bouquet);
    scr_litemremove(DRLightItem.Egg);
    scr_litemremove(DRLightItem.Cards);
    scr_litemremove(DRLightItem.BoxOfHeartCandy);
	
    global.phone[1] = DRPhoneNumbers.None;
    global.phone[2] = DRPhoneNumbers.None;
	
    scr_keyitemremove(DRKeyItem.Egg);
    scr_keyitemremove(DRKeyItem.BrokenCake);
    scr_keyitemremove(DRKeyItem.BrokenKeyA);
    scr_keyitemremove(DRKeyItem.BrokenKeyB);
    scr_keyitemremove(DRKeyItem.BrokenKeyC);
	scr_keyitemremove(DRKeyItem.DoorKey);
    scr_keyitemremove(DRKeyItem.Lancer);
    scr_keyitemremove(DRKeyItem.RouxlsKaard);
    scr_keyitemremove(DRKeyItem.EmptyDisk);
    scr_keyitemremove(DRKeyItem.LoadedDisk);
    scr_keyitemremove(DRKeyItem.KeyGen);
    scr_keyitemremove(DRKeyItem.Starwalker);
    scr_keyitemremove(DRKeyItem.PureCrystal);
	
    scr_itemremove(DRItem.Manual);
    
    if (global.flag[64] < 24)
        global.flag[64] = 24;
    
    if (global.chapter == 3)
    {
        global.flag[1173] = 0;
        global.flag[1174] = 0;
        global.flag[1194] = 0;
        global.flag[1196] = 0;
        global.flag[1198] = 0;
        
        for (var i = 0; i < 20; i++)
            global.battlegrade[i] = "Z";
        
        global.swordboardeath = 0;
        // scr_funnytext_init_sounds();
    }
    
    if (global.chapter > 2)
    {
        global.flag[7] = 0;
        global.flag[9] = 1;
        global.flag[10] = 1;
        global.flag[16] = 0.85;
        global.flag[17] = 0.6;
        global.flag[20] = 0;
        global.flag[21] = 0;
        global.flag[31] = 1;
        global.flag[32] = 0;
    }
}