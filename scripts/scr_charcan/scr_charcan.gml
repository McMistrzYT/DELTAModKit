function scr_charcan(partyslot) {
    charcan = true;
    
    if (global.hp[global.char[partyslot]] <= 0)			charcan = false;
    if (global.acting[partyslot] == true)				charcan = false;
    if (global.char[partyslot] == DRCharacter.None)		charcan = false;
    if (global.charmove[partyslot] == false)				charcan = false;
    if (global.charauto[global.char[partyslot]] == true) charcan = false;
    
    return charcan;
}
