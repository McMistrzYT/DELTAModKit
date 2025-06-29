xx = __view_get(e__VW.XView, 0);
yy = __view_get(e__VW.YView, 0);

tpoff = (tp - tpy) + yy;
bpoff = -bp + bpy + yy;
var spell_offset = langopt(500, 496);

if (intro == 1)
{
    if (bp < (bpy - 1))
    {
        if ((bpy - bp) < 40)
            bp += round((bpy - bp) / 2.5);
        else
            bp += 30;
    }
    else
    {
        bp = bpy;
    }
    
    if (bp == bpy)
        intro = 0;
}

if (intro == 2)
{
    if (bp > 0)
    {
        if (round((bpy - bp) / 5) > 15)
            bp -= round((bpy - bp) / 2.5);
        else
            bp -= 30;
    }
    else
    {
        bp = 0;
    }
}

// chapter 3 stuff i removed
{
    rouxlserrortimer = 0;
    rouxlstelegraphcon = 0;
}

draw_set_color(c_black);
draw_rectangle(xx - 10, 481 + yy, xx + 700, ((480 - bp) + yy) - 4, false);
draw_set_color(bcolor);
draw_rectangle(xx - 10, (480 - bp - 3) + yy, xx + 700, (480 - bp - 2) + yy, false);
draw_set_color(bcolor);
draw_rectangle(xx - 10, (480 - bp) + 34 + yy, xx + 700, (480 - bp) + 36 + yy, false);
scr_charbox();

if (global.bmenuno == 1 || global.bmenuno == 3 || global.bmenuno == 11 || global.bmenuno == 12 || global.bmenuno == 13)
{
    if (global.myfight == 0)
    {
        draw_sprite(spr_heart, 0, xx + 55, yy + 385 + (global.bmenucoord[global.bmenuno][global.charturn] * 30));
        draw_set_font(global.mainbig_font);
        namewidthb[0] = string_width(string_hash_to_newline(global.monstername[0]));
        namewidthb[1] = string_width(string_hash_to_newline(global.monstername[1]));
        namewidthb[2] = string_width(string_hash_to_newline(global.monstername[2]));
        var namewidthmax = 0;
        
        for (i = 0; i < 3; i++)
        {
            if (namewidthb[i] > namewidthmax)
                namewidthmax = namewidthb[i];
        }
        
        for (i = 0; i < 3; i += 1)
        {
            with (global.monsterinstance[global.bmenucoord[global.bmenuno][global.charturn]])
            {
                if (flash == 0)
                    fsiner = 0;
                
                flash = 1;
                becomeflash = 1;
            }
            
            if (global.monster[i] == 1)
            {
                draw_set_color(c_white);
                mercydraw = 0;
                tireddraw = 0;
                mnamecolor1 = 16777215;
                mnamecolor2 = 16777215;
                aqcolor = merge_color(c_aqua, c_blue, 0.3);
                
                if (global.charturn == 2)
                {
                    var _aqcolor = merge_color(c_aqua, c_blue, 0.3);
                    aqcolor = merge_color(_aqcolor, c_white, 0.5 + (sin(t_siner / 4) * 0.5));
                }
                
                if (global.monsterstatus[i] == 1)
                    tireddraw = 1;
                
                if (global.mercymod[i] >= global.mercymax[i])
                    mercydraw = 1;
                
                namewidth = string_width(string_hash_to_newline(global.monstername[i]));
                
                if (tireddraw == 1)
                {
                    if (global.encounterno != 31)
                    {
                        draw_set_color(aqcolor);
                        mnamecolor1 = aqcolor;
                        mnamecolor2 = aqcolor;
                    }
                    
                    draw_sprite(spr_tiredmark, 0, xx + 80 + namewidth + 40, yy + 385 + (i * 30));
                }
                
                if (mercydraw == 1)
                {
                    draw_set_color(c_yellow);
                    mnamecolor1 = 65535;
                    
                    if (tireddraw == 0)
                        mnamecolor2 = 65535;
                    
                    if (hidemercy == 0)
                        draw_sprite(spr_sparestar, 0, xx + 80 + namewidth + 20, yy + 385 + (i * 30));
                }
                
                draw_text_colour(xx + 80, yy + 375 + (i * 30), string_hash_to_newline(global.monstername[i]), mnamecolor1, mnamecolor2, mnamecolor2, mnamecolor1, 1);
                var __drawstatus = 0;
                
                if (global.bmenuno == 13)
                    __drawstatus = 1;
                
                if (__drawstatus == 0)
                {
                    draw_set_color(c_gray);
                    draw_text(xx + 80 + namewidth + 60, yy + 375 + (i * 30), string_hash_to_newline(global.monstercomment[i]));
                    
                    draw_set_color(c_maroon);
                    draw_rectangle(xx + 420, yy + 380 + (i * 30), xx + 500, yy + 380 + (i * 30) + 15, false);
                    draw_set_color(c_lime);
                    draw_rectangle(xx + 420, yy + 380 + (i * 30), xx + 420 + ((global.monsterhp[i] / global.monstermaxhp[i]) * 80), yy + 380 + (i * 30) + 15, false);
                    draw_set_color(c_white);
                    draw_text_transformed(xx + 424, yy + 364, "HP", 1, 0.5, 0);
                    
                    //if (global.chapter == 3 && i_ex(obj_knight_enemy))
                    //   draw_text_transformed(xx + 424, yy + 380 + (i * 30), "???", 1, 0.5, 0);
                    //else
                        draw_text_transformed(xx + 424, yy + 380 + (i * 30), string(ceil((global.monsterhp[i] / global.monstermaxhp[i]) * 100)) + "%", 1, 0.5, 0);
                }
                else
                {
                    var __actname = "Standard";
                    var __plainactname = __actname;
					
					__actname = global.actname[global.char[global.charturn]][i][global.bmenucoord[2][global.charturn]];
                    
					if (__actname == scr_character_get_act_name_override(global.char[global.charturn]))
						__actname = __plainactname;
                    
                    draw_set_color(hpcolorsoft[global.char[global.charturn] - 1]);
                    draw_text_width(xx + 80 + namewidthmax + 60, yy + 375 + (i * 30), string_hash_to_newline(__actname), 514 - (80 + namewidthmax + 60));
                }
                
                mercyamt = global.mercymod[i];
                
                if (mercyamt >= 100)
                    mercyamt = 100;
                
                if (hidemercy == 0)
                {
                    var mercypercent = ceil((global.mercymod[i] / global.mercymax[i]) * 100);
                    
                    if (mercypercent > 100)
                        mercypercent = 100;
                    
                    draw_set_color(merge_color(c_orange, c_red, 0.5));
                    draw_rectangle(xx + 520, yy + 380 + (i * 30), xx + 600, yy + 380 + (i * 30) + 15, false);
                    draw_set_color(c_yellow);
                    
                    if (mercyamt > 0 && cantspare[i] == 0)
                        draw_rectangle(xx + 520, yy + 380 + (i * 30), xx + 520 + (mercypercent * 0.8), yy + 380 + (i * 30) + 15, false);
                    
                    draw_set_color(c_white);
                    var mercywidth = 1;
                    
                    draw_text_transformed(xx + 524, yy + 364, "MERCY", mercywidth, 0.5, 0);
                    draw_set_color(c_maroon);
                    
                    if (cantspare[i] == 0)
                        draw_text_transformed(xx + 524, yy + 380 + (i * 30), string(mercypercent) + "%", 1, 0.5, 0);
                    
                    if (cantspare[i] == 1)
                    {
                        draw_line_width_color((xx + 520) - 1, yy + 380 + (i * 30), xx + 600, yy + 380 + (i * 30) + 15, 2, c_maroon, c_maroon);
                        draw_line_width_color((xx + 520) - 1, yy + 380 + (i * 30) + 15, xx + 600, yy + 380 + (i * 30), 2, c_maroon, c_maroon);
                    }
                }
            }
        }
    }
}

if (global.bmenuno == 2 && global.myfight == 0 && global.flag[34] == 1)
{
    thischar = global.char[global.charturn];
    spellcoord = global.bmenucoord[2][global.charturn];
    page = 0;
    
    if (spellcoord > 5)
    {
        page = 1;
        spellcoord -= 6;
    }
    
    icx = 10;
    icy = 385;
    
    if (spellcoord == 1 || spellcoord == 3 || spellcoord == 5)
        icx = 230;
    
    if (spellcoord > 1 && spellcoord < 4)
        icy = 415;
    
    if (spellcoord > 3)
        icy = 445;
    
    draw_sprite(spr_heart, 0, xx + icx, yy + icy);
    draw_set_font(global.mainbig_font);
    
    for (i = 0; i < 3; i += 1)
    {
        var currentspell = global.spell[thischar][(page * 6) + (i * 2)];
        draw_set_color(c_white);
        
        if (global.tension < global.spellcost[thischar][(page * 6) + (i * 2)]) draw_set_color(c_gray);
        else if (currentspell == 3 || currentspell == 8) // TODO: pacify spells here
        {
            pacify_glow = 0;
            
            for (sglowi = 0; sglowi < 3; sglowi += 1)
            {
                if (global.monster[sglowi] == 1 && global.monsterstatus[sglowi] == 1)
                {
                    if (global.encounterno != 31)
                        pacify_glow = 1;
                }
            }
            
            if (pacify_glow == 1)
                draw_set_color(merge_color(c_aqua, c_blue, 0.3));
        }
        
        draw_text(xx + 30, yy + 375 + (i * 30), string_hash_to_newline(global.spellnameb[thischar][(page * 6) + (i * 2)]));
        draw_set_color(c_white);
        
        if (global.tension < global.spellcost[thischar][(page * 6) + (i * 2) + 1])
            draw_set_color(c_gray);
        
        draw_text(xx + 260, yy + 375 + (i * 30), string_hash_to_newline(global.spellnameb[thischar][(page * 6) + (i * 2) + 1]));
    }
    
    draw_set_color(c_gray);
    draw_text(xx + spell_offset, yy + 375, string_hash_to_newline(global.spelldescb[thischar][(page * 6) + spellcoord]));
    thiscost = floor((global.spellcost[thischar][(page * 6) + spellcoord] / global.maxtension) * 100);
    draw_set_color(c_orange);
    draw_text(xx + spell_offset, yy + 440, string_hash_to_newline(string(thiscost) + "% TP"));
}

if (global.bmenuno == 2 && global.myfight == 0 && global.flag[34] == 0)
{
    thischar = global.charturn;
    spellcoord = global.bmenucoord[2][global.charturn];
    page = 0;
    
    if (spellcoord > 5)
    {
        page = 1;
        spellcoord -= 6;
    }
    
    icx = 10;
    icy = 385;
    
    if (spellcoord == 1 || spellcoord == 3 || spellcoord == 5)
        icx = 230;
    
    if (spellcoord > 1 && spellcoord < 4)
        icy = 415;
    
    if (spellcoord > 3)
        icy = 445;
    
    var _cant = 0;
    draw_sprite(spr_heart, 0, xx + icx, yy + icy);
    draw_set_font(global.mainbig_font);
    
    for (i = 0; i < 3; i += 1)
    {
        var __n = 0;
        var __isact = 0;
        
        repeat (2)
        {
            draw_set_color(c_white);
            
            if (global.battlespellspecial[thischar][(page * 6) + (i * 2) + __n] >= 1)
                draw_set_color(hpcolorsoft[global.char[thischar] - 1]);
            
            _cant = 0;
            
            if (global.tension < global.battlespellcost[thischar][(page * 6) + (i * 2) + __n] || _cant == 1)
            {
                draw_set_color(c_gray);
            }
            else if (global.battlespell[thischar][(page * 6) + (i * 2) + __n] == DRSpell.Pacify ||
					 global.battlespell[thischar][(page * 6) + (i * 2) + __n] == DRSpell.SleepMist)
            {
                pacify_glow = 0;
                
                for (sglowi = 0; sglowi < 3; sglowi += 1)
                {
                    if (global.monster[sglowi] == 1 && global.monsterstatus[sglowi] == 1)
                    {
                        if (global.encounterno != 31)
                            pacify_glow = 1;
                    }
                }
                
                if (pacify_glow == 1)
                {
                    var _aqcolor = merge_color(c_aqua, c_blue, 0.3);
                    var _aqcolor2 = merge_color(_aqcolor, c_white, 0.5 + (sin(t_siner / 4) * 0.5));
                    draw_set_color(_aqcolor2);
                }
            }
            
            draw_text(xx + 30 + (__n * 230), yy + 375 + (i * 30), string_hash_to_newline(global.battlespellname[thischar][(page * 6) + (i * 2) + __n]));
            __n++;
        }
    }
    
    draw_set_color(c_gray);
    draw_text(xx + spell_offset, yy + 375, string_hash_to_newline(global.battlespelldesc[thischar][(page * 6) + spellcoord]));
    thiscost = floor((global.battlespellcost[thischar][(page * 6) + spellcoord] / global.maxtension) * 100);
    draw_set_color(c_orange);
    
    if (thiscost > 0)
        draw_text(xx + spell_offset, yy + 440, string_hash_to_newline(string(thiscost) + "% TP"));
}

if (global.bmenuno == 4 && global.myfight == 0)
{
    itemcoord = global.bmenucoord[4][global.charturn];
    page = 0;
    
    if (itemcoord > 5)
    {
        page = 1;
        itemcoord -= 6;
    }
    
    icx = 10;
    icy = 385;
    
    if (itemcoord == 1 || itemcoord == 3 || itemcoord == 5)
        icx = langopt(230, 240);
    
    if (itemcoord > 1 && itemcoord < 4)
        icy = 415;
    
    if (itemcoord > 3)
        icy = 445;
    
    draw_sprite(spr_heart, 0, xx + icx, yy + icy);
    draw_set_font(global.mainbig_font);
    
    for (i = 0; i < 3; i += 1)
    {
        var s1 = string_hash_to_newline(tempitemnameb[(page * 6) + (i * 2)][global.charturn]);
        var s2 = string_hash_to_newline(tempitemnameb[(page * 6) + (i * 2) + 1][global.charturn]);
        var s1_width = string_width(s1);
        var s2_width = string_width(s2);
        var s1_xscale = min(1, 200 / s1_width);
        var s2_xscale = min(1, 200 / s2_width);
        draw_set_color(c_white);
        draw_text_transformed(xx + 30, yy + 375 + (i * 30), s1, s1_xscale, 1, 0);
        draw_text_transformed(xx + 260, yy + 375 + (i * 30), s2, s2_xscale, 1, 0);
    }
    
    if (page == 0 && global.item[6] != 0)
        draw_sprite(spr_morearrow, 0, xx + 470, yy + 445 + (sin(s_siner / 10) * 2));
    
    if (page == 1)
        draw_sprite_ext(spr_morearrow, 0, xx + 470, (yy + 395) - (sin(s_siner / 10) * 2), 1, -1, 0, c_white, 1);
    
    draw_set_color(c_gray);
    draw_text(xx + spell_offset, yy + 375, string_hash_to_newline(tempitemdescb[(page * 6) + itemcoord][global.charturn]));
}

if (global.bmenuno == 9 && global.myfight == 0)
{
    actcoord = global.bmenucoord[9][global.charturn];
    
    for (__acti = 0; __acti < 6; __acti++)
    {
        canact[__acti] = 0;
		var chara = global.char[global.charturn];
        
        canact[__acti] = global.canact[chara][thisenemy][__acti];
        acttpcost[__acti] = global.actcost[chara][thisenemy][__acti];
        actsimul[__acti] = global.actsimul[chara][thisenemy][__acti];
        actname[__acti] = global.actname[chara][thisenemy][__acti];
        actdesc[__acti] = global.actdesc[chara][thisenemy][__acti];
    }
    
    page = 0;
    icx = 10;
    icy = 385;
    
    if (actcoord == 1 || actcoord == 3 || actcoord == 5)
        icx = 230;
    
    if (actcoord > 1 && actcoord < 4)
        icy = 415;
    
    if (actcoord > 3)
        icy = 445;
    
    draw_sprite(spr_heart, 0, xx + icx, yy + icy);
    draw_set_font(global.mainbig_font);
    
    for (i = 0; i < 6; i += 1)
    {
        cant = 0;
        chartime = 0;
        
        if (global.char[global.charturn] == DRCharacter.Kris)
            chartime = global.actactor[1][global.bmenucoord[11][global.charturn]][i];
        
        charoffset = 0;
        xoffset = 0;
        
        if (i == 1 || i == 3 || i == 5)
            xoffset = 230;
        
        yoffset = 0;
        
        if (i == 2 || i == 3)
            yoffset = 30;
        
        if (i == 4 || i == 5)
            yoffset = 60;
        
        if (global.tension < acttpcost[i])
            cant = 1;
        
        if (i == 3 && global.monstertype[thisenemy] == 59 && global.flag[1044] < 150)
            cant = 1;
        
        draw_set_color(c_white);
        
        if (cant == 1)
            draw_set_color(c_gray);
        
        /*if (chartime == 2)
            draw_sprite_ext(spr_headsusie, 0, xx + 30 + xoffset, yy + 375 + yoffset, 1, 1, 0, susblend, 1);
        
        if (chartime == 3)
            draw_sprite_ext(spr_headralsei, 0, xx + 30 + xoffset, yy + 375 + yoffset, 1, 1, 0, susblend, 1);
        
        if (chartime == 4)
        {
            draw_sprite_ext(spr_headsusie, 0, xx + 30 + xoffset, yy + 375 + yoffset, 1, 1, 0, susblend, 1);
            draw_sprite_ext(spr_headralsei, 0, xx + 60 + xoffset, yy + 375 + yoffset, 1, 1, 0, susblend, 1);
        }
        
        if (chartime == 5)
            draw_sprite_ext(spr_headnoelle, 0, xx + 30 + xoffset, yy + 375 + yoffset, 1, 1, 0, noeblend, 1);*/
        
        var s1 = string_hash_to_newline(actname[i]);
        var s1_width = max(1, string_width(s1));
        var s1_xscale = (206 - charoffset) / s1_width;
        
        if (s1_xscale > 1)
            s1_xscale = 1;
        
        if (s1_xscale < 0.5)
            s1_xscale = 0.5;
        
        draw_text_transformed(xx + 30 + charoffset + xoffset, yy + 375 + yoffset, string_hash_to_newline(actname[i]), s1_xscale, 1, 0);
    }
    
    draw_set_color(c_gray);
    draw_text(xx + 500, yy + 375, string_hash_to_newline(actdesc[actcoord]));
    
    if (global.tensionselect > 0)
    {
        thiscost = round((acttpcost[actcoord] / global.maxtension) * 100);
        draw_set_color(c_orange);
        draw_text(xx + 500, yy + 440, string_hash_to_newline(string(thiscost) + "% TP"));
    }
    
    with (global.monsterinstance[global.bmenucoord[11][global.charturn]])
    {
        if (flash == 0)
            fsiner = 0;
        
        flash = 1;
        becomeflash = 1;
    }
}

if (global.bmenuno == 7 || global.bmenuno == 8)
{
    if (global.myfight == 0)
    {
        draw_sprite(spr_heart, 0, xx + 55, yy + 385 + (global.bmenucoord[global.bmenuno][global.charturn] * 30));
        draw_set_font(global.mainbig_font);
        
        for (i = 0; i < 3; i += 1)
        {
            if (global.char[i] != 0)
            {
                with (global.charinstance[global.bmenucoord[global.bmenuno][global.charturn]])
                {
                    if (flash == 0)
                        fsiner = 0;
                    
                    flash = 1;
                    becomeflash = 1;
                }
                
                draw_set_color(c_white);
                draw_text(xx + 80, yy + 375 + (i * 30), string_hash_to_newline(global.charname[global.char[i]]));
                draw_set_color(c_maroon);
                draw_rectangle(xx + 400, yy + 380 + (i * 30), xx + 500, yy + 380 + (i * 30) + 15, false);
                draw_set_color(c_lime);
                var _hp = (global.hp[global.char[i]] / global.maxhp[global.char[i]]) * 100;
                
                if (_hp <= -100)
                    _hp = -100;
                
                draw_rectangle(xx + 400, yy + 380 + (i * 30), xx + 400 + _hp, yy + 380 + (i * 30) + 15, false);
            }
        }
    }
}