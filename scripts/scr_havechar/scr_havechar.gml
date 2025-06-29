function scr_havechar(charname){
    var checker = charname;
    
	// for legacy purposes
    if (checker == "susie" || checker == "su" || checker == "s")
        checker = DRCharacter.Susie;
    
    if (checker == "ralsei" || checker == "ra" || checker == "r")
        checker = DRCharacter.Ralsei;
    
    if (checker == "noelle" || checker == "no" || checker == "n")
        checker = DRCharacter.Noelle;
    
    return global.char[0] == checker || global.char[1] == checker || global.char[2] == checker;
}

function scr_losechar()
{
    global.char[2] = 0;
    global.char[1] = 0;
    
    scr_refresh_party();
    
    global.submenu = 0;
    global.charselect = -1;
    
    for (i = 0; i < 36; i += 1)
        global.submenucoord[i] = 0;
}

function scr_getchar(charid)
{
	// for legacy purposes
    switch (charid)
    {
        case "kr":
        case "kris":
            charid = DRCharacter.Kris;
            break;
        
        case "su":
        case "susie":
            charid = DRCharacter.Susie;
            break;
        
        case "ra":
        case "ralsei":
            charid = DRCharacter.Ralsei;
            break;
        
        case "no":
        case "noelle":
            charid = DRCharacter.Noelle;
            break;
    }
    
    var characterToGet = charid;
    getchar = 0;
    
    if (global.char[0] == 0)
    {
        global.char[0] = characterToGet;
        getchar = 1;
    }
    
    if (global.char[1] == 0 && getchar == 0)
    {
        global.char[1] = characterToGet;
        getchar = 1;
    }
    
    if (global.char[2] == 0 && getchar == 0)
    {
        global.char[2] = characterToGet;
        getchar = 1;
    }
    
    scr_refresh_party();
}

function scr_refresh_party() {
	with (obj_darkcontroller)
    {
        chartotal = 0;
		for (i = 0; i < DRCharacter.__MAX__; i++) {
			havechar[i] = 0;
		}
		
		for (i = 0; i < 3; i++) {
			c = global.char[i];
			if c == DRCharacter.None continue;
			
			global.faceaction[i] = 0;
			havechar[c - 1] = scr_havechar(c);
			charpos[c - 1] = i;
			chartotal++;
		}
    }	
}

function scr_makecaterpillar(xx, yy, characterId, idx)
{
    global.cinstance[idx] = instance_create(xx, yy, obj_caterpillarchara);
    global.cinstance[idx].target = 12 + idx * 12;
    
    with (global.cinstance[idx])
		scr_character_set_caterpillar_sprites(characterId);
    
    return global.cinstance[idx];
}