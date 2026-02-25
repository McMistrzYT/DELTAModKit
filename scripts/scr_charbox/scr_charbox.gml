function scr_charbox(){
    for (curhero = 0; curhero < array_length(global.char); curhero += 1) {
		charicon_width = 213; // A value that seems to be Exactly the correct pos
		var charicon_dis = 0; // Not really useful with the normal charboxes since those don't use spacing normally
		var changeamt = (charicon_width + charicon_dis)
		
		xchunk = floor(((camerawidth()/2) + (changeamt * (curhero - (chartotal / 2))))); // 320 is the middle of the screen.
		c = global.char[curhero] - 1;
		charpos[c] = curhero;
		charcolor = scr_hero_get_color(c);
        gc = global.charturn;
        
		if !curhero > array_length(mmy) mmy[curhero] = 0
		
        if (gc == charpos[c]) {
            if (mmy[curhero] > -32) mmy[curhero] -= 2;
            if (mmy[curhero] > -24) mmy[curhero] -= 4;
            if (mmy[curhero] > -16) mmy[curhero] -= 6;
			if (mmy[curhero] > -8)  mmy[curhero] -= 8;
			if (mmy[curhero] < -32) mmy[curhero] = -64;
        } else {
            if (mmy[curhero] < -14)
                mmy[curhero] += 15;
            else
                mmy[curhero] = 0;
        }
		boxcasingy = mmy[curhero]
            
        if (gc == charpos[c] && global.myfight == 0)
            scr_selectionmatrix(xx + xchunk, (480 - bp) + yy);
            
        btc[0] = 0;
        btc[1] = 0;
        btc[2] = 0;
        btc[3] = 0;
        btc[4] = 0;
            
        if (gc == charpos[c]) btc[global.bmenucoord[0][global.charturn]] = 1;
            
        if (global.fighting == 1)
        {
            spare_glow = 0;
                
            for (sglowi = 0; sglowi < 3; sglowi += 1)
            {
                if (global.monster[sglowi] == 1 && global.mercymod[sglowi] >= 100)
                    spare_glow = 1;
            }
              
            pacify_glow = 0;
                
            if (scr_hero_has_pacify(c))
                for (sglowi = 0; sglowi < 3; sglowi += 1)
                    if (global.monster[sglowi] == 1 && global.monsterstatus[sglowi] == 1 && global.tension >= scr_hero_get_pacify_spell_cost(c))
                        pacify_glow = 1;
							
			scr_hero_rendercharboxicons(c)
        }
            
        draw_set_color(gc == charpos[c] ? charcolor : bcolor);
            
        if (global.charselect == charpos[c] || global.charselect == 3)
            draw_set_color(charcolor);
		
        if (rouxlsgridenabled == false)
        {
            draw_rectangle(xx + xchunk, (480 - bp - 3) + yy + boxcasingy, xx + xchunk + 212, ((480 - bp) + yy) - 2, false);
            draw_set_color(c_black);
            draw_rectangle(xx + xchunk + 2, (480 - bp - 1) + yy + boxcasingy, xx + xchunk + 210, (480 - bp) + yy + boxcasingy + 33, false);
        }
        else
        {
            draw_rectangle(xx + xchunk, (480 - bp - 3) + yy + boxcasingy, xx + xchunk + 212, (480 - bp - 2) + yy + boxcasingy, false);
                
            if (boxcasingy < -32)
            {
                draw_rectangle(xx + xchunk, (480 - bp - 3) + yy + boxcasingy, xx + xchunk + 1, bpoff + b_offset + 39 + boxcasingy, false);
                draw_rectangle(xx + xchunk + 211, (480 - bp - 3) + yy + boxcasingy, xx + xchunk + 212, bpoff + b_offset + 39 + boxcasingy, false);
            }
                
            draw_set_color(c_black);
                
            if (gc != charpos[c] && boxcasingy != 0)
                draw_rectangle(xx + xchunk + 2, (480 - bp - 1) + yy + boxcasingy, xx + xchunk + 210, (480 - bp) + yy + 0 + 33, false);
            else
                draw_rectangle(xx + xchunk + 2, (480 - bp - 1) + yy + boxcasingy, xx + xchunk + 210, (480 - bp) + yy + boxcasingy + 33, false);
        }
            
        b_offset = 480;
            
        if (global.fighting == 0)
            b_offset = 430;
            
        if (global.fighting == 1)
            b_offset = 336;
			
		headspr = spr_headkris;
		namespr = spr_bnamekris;
			
		scr_hero_get_nameplate(c);
            
        draw_sprite(headspr, global.faceaction[charpos[c]], xx + 13 + xchunk, bpoff + b_offset + boxcasingy);
        draw_sprite(namespr, 0, xx + 51 + xchunk, bpoff + b_offset + 3 + boxcasingy);
            
        draw_sprite(spr_hpname, 0, xx + 109 + xchunk, bpoff + b_offset + 11 + boxcasingy);
        draw_set_color(c_white);
        draw_set_font(global.hpfont);
            
        if ((global.hp[c + 1] / global.maxhp[c + 1]) <= 0.25)
            draw_set_color(c_yellow);
            
        if (global.hp[c + 1] <= 0)
            draw_set_color(c_red);
            
        draw_set_halign(fa_right);
        draw_text(xx + 160 + xchunk, ((bpoff + b_offset) - 2) + boxcasingy, string_hash_to_newline(global.hp[c + 1]));
        draw_sprite(spr_hpslash, 0, xx + 159 + xchunk, ((bpoff + b_offset) - 4) + boxcasingy);
        draw_text(xx + 205 + xchunk, ((bpoff + b_offset) - 2) + boxcasingy, string_hash_to_newline(global.maxhp[c + 1]));
        draw_set_halign(fa_left);
        draw_set_color(c_maroon);
        draw_rectangle(xx + 128 + xchunk, bpoff + b_offset + 11 + boxcasingy, xx + 203 + xchunk, bpoff + b_offset + 19 + boxcasingy, false);
            
        if (global.hp[c + 1] > 0 && global.maxhp[c + 1] > 0)
        {
            draw_set_color(charcolor);
            draw_rectangle(xx + 128 + xchunk, bpoff + b_offset + 11 + boxcasingy, xx + xchunk + 128 + ceil((global.hp[c + 1] / global.maxhp[c + 1]) * 75), bpoff + b_offset + 19 + boxcasingy, false);
        }
    }
}
