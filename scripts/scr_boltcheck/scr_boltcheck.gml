function scr_boltcheck(partyslot){
    pressbuffer[global.char[partyslot]] = 5;
    qualifybolt = -1;
    close = 99;
    topclose = 99;
    
    for (i = 0; i < bolttotal; i += 1) 
		if (boltchar[i] == partyslot && boltalive[i] == true) {
            close = boltframe[i] - boltx;
            
            if (close < 15 && close > -5) && (close < topclose) {
                topclose = close;
                qualifybolt = i;
            }
        }
    
    if (qualifybolt != -1) {
        scr_boltburstsharedcode(qualifybolt, partyslot)
    }
}

function scr_boltcheck_onebutton(){
    dualbolt = -1;
    dualboltid = -1;
	for (i = 0; i < DRCharacter.__MAX__; ++i) pressbuffer[i] = 5;
    qualifybolt = -1;
    close = 99;
    topclose = 999;
    
    for (i = 0; i < bolttotal; i += 1) {
        if (boltalive[i] == true){
            close = boltframe[i] - boltx;
            
            if (close < 15 && close > -5) {
                if (close == topclose) {
                    dualbolt = true;
                    dualboltid = i;
                }
                
                if (close < topclose) {
                    topclose = close;
                    qualifybolt = i;
                }
            }
        }
    }
    
    if (qualifybolt != -1) {
        bc = boltchar[qualifybolt];
		scr_boltburstsharedcode(qualifybolt, bc)
        if (dualbolt == true) scr_boltburstsharedcode(dualboltid, boltchar[dualboltid])
    }
}

function scr_boltburstsharedcode(boltid, boltchar) {
		p = abs(topclose);
        burstbolt = instance_create((x + 80 + (boltframe[boltid] * boltspeed)) - (boltx * boltspeed), y + (38 * boltchar), obj_burstbolt);
        
        if (p == 0) {
            points[boltchar] += 150;
            with (burstbolt) {image_blend = c_yellow; mag = 0.2;}
        }
        
        if (p == 1) points[boltchar] += 120;
        if (p == 2) points[boltchar] += 110;
        if (p >= 3){points[boltchar] += 100 - (abs(boltchar) * 2); burstbolt.image_blend = boltcolor[boltchar];}
        if (p >= 15) burstbolt.image_blend = charcolor[boltchar];
        
        boltalive[boltid] = false;	
}