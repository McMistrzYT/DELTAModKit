function scr_overworldcharwalking_shared(facing = 0) {
	
	walk = false;
	
	if ((y != nowy) || (x != nowx)) && (variable_instance_exists(id, "nopress") ? nopress == 0 : true)
		walk = true;
    
	if (walk == true) walkbuffer = 6
	
	if (walkbuffer > 3 && fun == false) {
		walktimer += 1.5
		if (runmove == true) walktimer += 1.5
		
		
		if (walktimer >= (image_number * timebetweenwalkframes)) 
			walktimer -= (image_number * timebetweenwalkframes)
		
		image_index = floor(walktimer / timebetweenwalkframes)
	}
	
	if (walkbuffer <= 0 && fun == false && (variable_instance_exists(id, "climbing") ? climbing == false : true)) {
		if (walktimer < timebetweenwalkframes) walktimer = timebetweenwalkframes - 0.5
		
		var current = floor(walktimer / timebetweenwalkframes) * timebetweenwalkframes
		var next = current + timebetweenwalkframes
		
		if (walktimer >= current && walktimer < next) walktimer = next - 0.5
		
		image_index = 0
	}
	
	walkbuffer -= 0.75
	
	if (facing == 0) sprite_index = dsprite;
	if (facing == 1) sprite_index = rsprite;
	if (facing == 2) sprite_index = usprite;
	if (facing == 3) sprite_index = lsprite;
}

function scr_overworldcontrollers_spawncharacters(spawndarkners = true) {
	chartotal = 0
	for (var i = 0; i < DRCharacter.__MAX__; ++i) {
	    havechar[i] = false
		charpos[i] = 0
	}
	
	for (var i = 1; i < array_length(global.char); i += 1) {
		var char = global.char[i]
	    global.faceaction[i] = 0;
	
		if (char == DRCharacter.None) continue;
		if !spawndarkners && !scr_character_is_lightner(char) continue;
		
		chartotal++;
		havechar[char - 1] = true;
	    charpos[char - 1] = i;
        
	    if (i > 0) {
			scr_character_set_caterpillar_offsets(char)
	        global.cinstance[i - 1] = instance_create(obj_mainchara.x - halign + obj_mainchara.halign, obj_mainchara.y - valign + obj_mainchara.valign, obj_caterpillarchara);
	        global.cinstance[i - 1].target = chartotal * 12;
			global.cinstance[i - 1].characterslot = char
		
			with (global.cinstance[i - 1]) {
				scr_character_set_caterpillar_sprites(char);
			}
	    }
	}
}