// @description Merged for Mainchara and Caterpillarchara
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

// @description Merged for darkcontroller and overworldcontroller
function scr_overworldcontrollers_spawncharacters(spawndarkners = true) {
	chartotal = 0
	for (var i = 0; i < DRCharacter.__MAX__; ++i) {
	    havechar[i] = false
		charpos[i] = 0
	}
	
	for (var i = 0; i < array_length(global.char); i += 1) {
		var char = global.char[i]
	    global.faceaction[i] = 0;
	
		if (char == DRCharacter.None) continue;
		if !spawndarkners && !scr_character_is_lightner(char) && i > 0 continue;
		
		chartotal++;
		havechar[char - 1] = true;
	    charpos[char - 1] = i;
        
	    if (i > 0) {
			scr_character_set_caterpillar_offsets(char)
	        global.cinstance[i - 1] = instance_create(obj_mainchara.x - halign + obj_mainchara.halign, obj_mainchara.y - valign + obj_mainchara.valign, obj_caterpillarchara);
	        global.cinstance[i - 1].target = (chartotal - 1) * 12;
			global.cinstance[i - 1].characterslot = char
		
			with (global.cinstance[i - 1]) {
				scr_character_set_caterpillar_sprites(char);
			}
	    }
	}
}

// @description Merged for Heart and Mainchara
function scr_defaultprimarycollisioncode(_solidobjecttype = obj_solidblock) {
	xmeet = false;
	ymeet = false;
	xymeet = false;

	if (place_meeting(x + px, y + py, _solidobjecttype)) {
	    xymeet = true;
                
	    if (scr_debug() && (variable_instance_exists(id, "noclip") && noclip))
	        xymeet = false;
	}
            
	if (place_meeting(x + px, y, _solidobjecttype)) {
	    if (place_meeting(x + px, y, _solidobjecttype)) {
	        for (g = wspeed; g > 0; g -= 1) {
	            mvd = false;
                        
	            if (press_d == false && !place_meeting(x + px, y - g, _solidobjecttype)) {
	                y -= g;
	                py = 0;
	                mvd = true;
	                break;
	            }
                        
	            if (press_u == false && mvd == false && !place_meeting(x + px, y + g, _solidobjecttype)) {
	                y += g;
	                py = 0;
	                break;
	            }
	        }
	    }
                
	    xmeet = true;
	    bkx = false;
                
	    if (px > 0) {
	        for (var i = px; i >= 0; i -= 1) {
	            if (!place_meeting(x + i, y, _solidobjecttype)) {
	                px = i;
	                bkx = true;
	                break;
	            }
	        }
	    }
                
	    if (px < 0) {
	        for (var i = px; i <= 0; i += 1) {
	            if (!place_meeting(x + i, y, _solidobjecttype)) {
	                px = i;
	                bkx = true;
	                break;
	            }
	        }
	    }
                
	    if (bkx == 0) px = 0;
	}
            
	if (place_meeting(x, y + py, _solidobjecttype)) {
	    ymeet = true;
	    bky = false;
                
	    if (place_meeting(x, y + py, _solidobjecttype)) {
	        for (g = wspeed; g > 0; g -= 1) {
	            mvd = false;
                        
	            if (press_r == false && !place_meeting(x - g, y + py, _solidobjecttype)) {
	                x -= g;
	                px = 0;
	                mvd = true;
	                break;
	            }
                        
	            if (mvd == false && press_l == false && !place_meeting(x + g, y + py, _solidobjecttype)) {
	                x += g;
	                px = 0;
	                break;
	            }
	        }
	    }
                
	    if (py > 0) {
	        for (var i = py; i >= 0; i -= 1) {
	            if (!place_meeting(x, y + i, _solidobjecttype)) {
	                py = i;
	                bky = true;
	                break;
	            }
	        }
	    }
                
	    if (py < 0) {
	        for (var i = py; i <= 0; i += 1) {
	            if (!place_meeting(x, y + i, _solidobjecttype)) {
	                py = i;
	                bky = true;
	                break;
	            }
	        }
	    }
                
	    if (bky == false) py = 0;
	}
            
	if (place_meeting(x + px, y + py, _solidobjecttype)) {
	    xymeet = true;
	    bkxy = false;
	    var i = px;
	    j = py;
                
	    while (j != 0 || i != 0) {
	        if (!place_meeting(x + i, y + j, _solidobjecttype)) {
	            px = i;
	            py = j;
	            bkxy = true;
	            break;
	        }
                    
	        if (abs(j) >= 1) {
	            if (j > 0) j -= 1;
	            if (j < 0) j += 1;
	        }       else   j = 0;
                    
	        if (abs(i) >= 1) {
	            if (i > 0) i -= 1;
	            if (i < 0) i += 1;
	        }       else   i = 0;
	    }
                
	    if (bkxy == false) {
	        px = 0;
	        py = 0;
	    }
	}
}