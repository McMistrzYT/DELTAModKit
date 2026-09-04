if (!init) {
    ignoredepth = false;
    init = true;
    
    scr_character_set_caterpillar_offsets(characterslot)
	
	var uselegacyinit = false // Reverses it to Deltarune's Init.
	
	if uselegacyinit {
	    if (name == "susie") {
	        if (scr_havechar("no") && global.darkzone == 0)
	            target = 8;
        
	        halign = (global.darkzone == 0) ? 3 : 6;
	        valign = (global.darkzone == 0) ? 6 : 16;
	    }
    
	    if (name == "noelle") {
	        //usprite = (global.darkzone == 1) ? spr_noelle_walk_up_dw : spr_noelle_walk_up_lw;
	        //rsprite = (global.darkzone == 1) ? spr_noelle_walk_right_dw : spr_noelle_walk_right_lw;
	        //lsprite = (global.darkzone == 1) ? spr_noelle_walk_left_dw : spr_noelle_walk_left_lw;
	        //dsprite = (global.darkzone == 1) ? spr_noelle_walk_down_dw : spr_noelle_walk_down_lw;
        
	        if (global.darkzone == 0)
	            target = scr_havechar("su") ? 17 : 12;
        
	        halign = (global.darkzone == 0) ? 2 : 4;
	        valign = (global.darkzone == 0) ? 9 : 18;
	    }
    
	    if (name == "ralsei") {
	        climbsprite = 4220;
	        halign = 2;
	        valign = 12;
	    }
	}
		
	if target > maxtarget {
		var previousmax = maxtarget
		maxtarget = floor(target * 1.5)
		for (i = previousmax; i < maxtarget; i += 1) {
		    remx[i] = remx[previousmax];
		    remy[i] = remy[previousmax];
		    facing[i] =  facing[previousmax] 
		    sliding[i] = sliding[previousmax]
		    special[i] = special[previousmax]
		}
	}
}