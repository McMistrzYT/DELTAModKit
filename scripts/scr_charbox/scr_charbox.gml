function scr_charbox()
{
    for (c = 0; c < DRHero.__MAX__; c += 1)
    {
        if (havechar[c] == 1)
        {
			charcolor = scr_hero_get_color(c);
            
            gc = global.charturn;
            xchunk = 0;
            
            if (charpos[c] == 0 && chartotal == 3)
                xchunk = 0;
            
            if (charpos[c] == 1 && chartotal == 3)
                xchunk = 213;
            
            if (charpos[c] == 2 && chartotal == 3)
                xchunk = 426;
            
            if (charpos[c] == 0 && chartotal == 2)
                xchunk = 108;
            
            if (charpos[c] == 1 && chartotal == 2)
                xchunk = 322;
            
            if (charpos[c] == 0 && chartotal == 1)
                xchunk = 213;
            
            if (gc == charpos[c])
            {
                if (mmy[c] > -32)
                    mmy[c] -= 2;
                    
                if (mmy[c] > -24)
                    mmy[c] -= 4;
                    
                if (mmy[c] > -16)
                    mmy[c] -= 6;
                    
                if (mmy[c] > -8)
                    mmy[c] -= 8;
                    
                if (mmy[c] < -32)
                    mmy[c] = -64;
            }
            else
            {
                if (mmy[c] < -14)
                    mmy[c] += 15;
                else
                    mmy[c] = 0;
            }
            
            if (gc == charpos[c] && global.myfight == 0)
                scr_selectionmatrix(xx + xchunk, (480 - bp) + yy);
            
            btc[0] = 0;
            btc[1] = 0;
            btc[2] = 0;
            btc[3] = 0;
            btc[4] = 0;
            
            if (gc == charpos[c])
                btc[global.bmenucoord[0][global.charturn]] = 1;
            
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
                
                var icon_offset = 5;
                {
                    draw_sprite(spr_btfight, btc[0], xx + xchunk + 15 + icon_offset, (485 - bp) + yy);
                    
                    if (scr_hero_uses_acts_instead_of_spells(c))
                        draw_sprite(spr_btact, btc[1], xx + xchunk + 50 + icon_offset, (485 - bp) + yy);
                    else
                        draw_sprite(spr_bttech, btc[1], xx + xchunk + 50 + icon_offset, (485 - bp) + yy);
                    
                    draw_sprite(spr_btitem, btc[2], xx + xchunk + 85 + icon_offset, (485 - bp) + yy);
                    draw_sprite(spr_btspare, btc[3], xx + xchunk + 120 + icon_offset, (485 - bp) + yy);
                    draw_sprite(spr_btdefend, btc[4], xx + xchunk + 155 + icon_offset, (485 - bp) + yy);
                    
                    if (spare_glow == 1 && gc == charpos[c]) draw_sprite_ext(spr_btspare, 2, xx + xchunk + 120 + icon_offset, (485 - bp) + yy, 1, 1, 0, c_white, 0.4 + (sin(global.time / 6) * 0.4));
                    if (pacify_glow == 1 && gc == charpos[c]) draw_sprite_ext(spr_bttech, 2, xx + xchunk + 50 + icon_offset, (485 - bp) + yy, 1, 1, 0, c_white, 0.4 + (sin(global.time / 6) * 0.4));
                }
            }
            
            draw_set_color(gc == charpos[c] ? charcolor : bcolor);
            
            if (global.charselect == charpos[c] || global.charselect == 3)
                draw_set_color(charcolor);
            
            if (rouxlsgridenabled == false)
            {
                draw_rectangle(xx + xchunk, (480 - bp - 3) + yy + mmy[c], xx + xchunk + 212, ((480 - bp) + yy) - 2, false);
                draw_set_color(c_black);
                draw_rectangle(xx + xchunk + 2, (480 - bp - 1) + yy + mmy[c], xx + xchunk + 210, (480 - bp) + yy + mmy[c] + 33, false);
            }
            else
            {
                draw_rectangle(xx + xchunk, (480 - bp - 3) + yy + mmy[c], xx + xchunk + 212, (480 - bp - 2) + yy + mmy[c], false);
                
                if (mmy[c] < -32)
                {
                    draw_rectangle(xx + xchunk, (480 - bp - 3) + yy + mmy[c], xx + xchunk + 1, bpoff + b_offset + 39 + mmy[c], false);
                    draw_rectangle(xx + xchunk + 211, (480 - bp - 3) + yy + mmy[c], xx + xchunk + 212, bpoff + b_offset + 39 + mmy[c], false);
                }
                
                draw_set_color(c_black);
                
                if (gc != charpos[c] && mmy[c] != 0)
                    draw_rectangle(xx + xchunk + 2, (480 - bp - 1) + yy + mmy[c], xx + xchunk + 210, (480 - bp) + yy + 0 + 33, false);
                else
                    draw_rectangle(xx + xchunk + 2, (480 - bp - 1) + yy + mmy[c], xx + xchunk + 210, (480 - bp) + yy + mmy[c] + 33, false);
            }
            
            b_offset = 480;
            
            if (global.fighting == 0)
                b_offset = 430;
            
            if (global.fighting == 1)
                b_offset = 336;
			
			headspr = spr_headkris;
			namespr = spr_bnamekris;
			
			scr_hero_get_nameplate(c);
            
            draw_sprite(headspr, global.faceaction[charpos[c]], xx + 13 + xchunk, bpoff + b_offset + mmy[c]);
            draw_sprite(namespr, 0, xx + 51 + xchunk, bpoff + b_offset + 3 + mmy[c]);
            
            draw_sprite(spr_hpname, 0, xx + 109 + xchunk, bpoff + b_offset + 11 + mmy[c]);
            draw_set_color(c_white);
            draw_set_font(global.hpfont);
            
            if ((global.hp[c + 1] / global.maxhp[c + 1]) <= 0.25)
                draw_set_color(c_yellow);
            
            if (global.hp[c + 1] <= 0)
                draw_set_color(c_red);
            
            draw_set_halign(fa_right);
            draw_text(xx + 160 + xchunk, ((bpoff + b_offset) - 2) + mmy[c], string_hash_to_newline(global.hp[c + 1]));
            draw_sprite(spr_hpslash, 0, xx + 159 + xchunk, ((bpoff + b_offset) - 4) + mmy[c]);
            draw_text(xx + 205 + xchunk, ((bpoff + b_offset) - 2) + mmy[c], string_hash_to_newline(global.maxhp[c + 1]));
            draw_set_halign(fa_left);
            draw_set_color(c_maroon);
            draw_rectangle(xx + 128 + xchunk, bpoff + b_offset + 11 + mmy[c], xx + 203 + xchunk, bpoff + b_offset + 19 + mmy[c], false);
            
            if (global.hp[c + 1] > 0 && global.maxhp[c + 1] > 0)
            {
                draw_set_color(charcolor);
                draw_rectangle(xx + 128 + xchunk, bpoff + b_offset + 11 + mmy[c], xx + xchunk + 128 + ceil((global.hp[c + 1] / global.maxhp[c + 1]) * 75), bpoff + b_offset + 19 + mmy[c], false);
            }
        }
    }
}
