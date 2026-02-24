function scr_havechar(charname, giveslot = false){
    var checker = charname;
    
	// for legacy purposes
    if (checker == "susie" || checker == "su" || checker == "s")
        checker = DRCharacter.Susie;
    
    if (checker == "ralsei" || checker == "ra" || checker == "r")
        checker = DRCharacter.Ralsei;
    
    if (checker == "noelle" || checker == "no" || checker == "n")
        checker = DRCharacter.Noelle;
    
	var found = giveslot ? [0, false] : false
	
	for (var i = 0; i < array_length(global.char); ++i) {
	    if global.char[i] == checker {
			found = giveslot ? [true, i] : true
			break
		}
	}
	
    return found;
}

function scr_losechar() {
	for (var i = 1; i < array_length(global.char); ++i) {
	    global.char[i] = DRCharacter.None
	}
    
    scr_refresh_party();
    
    global.submenu = 0;
    global.charselect = -1;
    
    for (i = 0; i < 36; i += 1)
        global.submenucoord[i] = 0;
}

function scr_getchar(charid, force = false) {
	// for legacy purposes
    switch (charid) {
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
    getchar = false;
    
	for (var i = 0; i < array_length(global.char) && getchar == false; ++i) {
	    if global.char[i] == DRCharacter.None {
			global.char[i] = characterToGet;
			getchar = true
		}
	}
	
	if getchar == false {
		var charname = "UnknownCharacter | " + string(characterToGet)
		try { charname = global.charname[characterToGet] } catch (ex) {} // Incase if that charname does not Exist.
		show_debug_message("Tried to add '{0}' to the party, {1}", charname, force ? "Forcing in anyways." : "But the party was full.")
		
		if force {
			array_push(global.char, characterToGet)
		}
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
		
		for (i = 0; i < array_length(global.char); i++) {
			c = global.char[i];
			if c == DRCharacter.None continue;
			
			global.faceaction[i] = 0;
			havechar[c - 1] = scr_havechar(c);
			charpos[c - 1] = i;
			chartotal++;
		}
    }	
}

function scr_makecaterpillar(xx, yy, characterId, idx) {
	scr_character_set_caterpillar_offsets(characterId)
    global.cinstance[idx] = instance_create(xx - halign, yy - valign, obj_caterpillarchara);
    global.cinstance[idx].target = 12 + idx * 12;
    global.cinstance[idx].characterslot = characterId
	
    with (global.cinstance[idx]) {
		scr_character_set_caterpillar_sprites(characterId);
	}
    
    return global.cinstance[idx];
}