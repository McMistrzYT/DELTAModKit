function scr_levelup()
{
    var encountercountflag = 1248;
    var attackpluscountflag = 1249;
    var gainedstats = 0;
	
    global.flag[encountercountflag]++;
	
	for (i = 1; i < DRCharacter.__MAX__; i++) {
		if (global.maxhp[i] < scr_character_get_max_hp(i)) {
			global.maxhp[i] += 2;
			global.hp[i] += 2;
		}
		
		if ((global.flag[encountercountflag] % 10) == 0 && global.flag[attackpluscountflag] < 2)
	    {
	        gainedstats = 1;
	        global.at[i] += 1;
			if (scr_character_has_magic(i))
				global.mag[i] += 1;
	        global.flag[attackpluscountflag]++;
	    }
		
		global.maxhp[i] = clamp(global.maxhp[i], 10, scr_character_get_max_hp(i));
		global.hp[i] = min(global.hp[i], global.maxhp[i]);
	}
    
	// default behaviour
    if ((global.flag[encountercountflag] % 2) == 0)
        global.maxhp[DRCharacter.Susie] += 1;
    
    return gainedstats;
}
