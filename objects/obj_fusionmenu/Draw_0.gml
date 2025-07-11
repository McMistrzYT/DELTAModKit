if (init)
    event_inherited();

if (type == 2 && init == 1)
{
    draw_set_color(c_white);
    var topbary = 206;
    ossafe_fill_rectangle(camerax() + 110, cameray() + topbary, (camerax() + 640) - 110, cameray() + topbary + 2, 0);
}

if (type == 1 && init == 1)
{
    draw_set_color(c_white);
    var topbary = 179;
    var botbary = 278;
    ossafe_fill_rectangle((camerax() + 110) - 20, cameray() + topbary, ((camerax() + 640) - 110) + 20, cameray() + topbary + 2, 0);
    ossafe_fill_rectangle((camerax() + 110) - 20, cameray() + botbary, ((camerax() + 640) - 110) + 20, cameray() + botbary + 2, 0);
    draw_set_halign(fa_right);
    
    if (global.lang == "ja")
        draw_text_transformed(((camerax() + 640) - 110) + 20 + 40, 346, string((floor(menuScrollCurrent[0]) / 2) + 1) + " / " + string(ceil(menuMaximumID[0] / 2)), 0.5, 1, 0);
    else
        draw_text_transformed(((camerax() + 640) - 110) + 20 + 40, 346, "Page " + string((floor(menuScrollCurrent[0]) / 2) + 1) + " / " + string(ceil(menuMaximumID[0] / 2)), 0.5, 1, 0);
    
    draw_set_halign(fa_left);
}

if (type == 3 && init == 1)
{
    if (menu == 0)
    {
        draw_set_font(fnt_mainbig);
        draw_set_color(c_white);
        draw_text(xx + 80, yy + 30, "Recruits");
        
        if (alternateMenu == 0)
        {
            ossafe_fill_rectangle(xx + 330, yy + 10, xx + 620, yy + 440, false);
            draw_set_color(c_black);
            ossafe_fill_rectangle(xx + 334, yy + 14, (xx + 620) - 4, (yy + 440) - 4, false);
        }
        
        reccolor = scr_chapter_get_recruit_color();
        
        ossafe_fill_rectangle_color(xx + 370, yy + 75, xx + 370 + 205, yy + 75 + 150, 0, 0, reccolor, reccolor, false);
        draw_set_color(c_white);
        ossafe_fill_rectangle(xx + 370, yy + 75, xx + 370 + 205, yy + 75 + 150, true);
        recruitspriteheight = sprite_get_height(recruitSprite[menuCoord[0]]);
        recruitspritewidth = sprite_get_width(recruitSprite[menuCoord[0]]);
        rx = ((sprite_get_xoffset(recruitSprite[menuCoord[0]]) * 2) - recruitspritewidth) + (recruitSpriteX[menuCoord[0]] * 2);
        ry = ((sprite_get_yoffset(recruitSprite[menuCoord[0]]) * 2) - (recruitspriteheight * 2)) + (recruitSpriteY[menuCoord[0]] * 2);
        animer += 0.25;
        draw_sprite_ext(recruitSprite[menuCoord[0]], animer, xx + 470 + rx, yy + 220 + ry, 2, 2, 0, c_white, 1);
        
        /*if (recruitSprite[menuCoord[0]] == spr_werewire_idle)
        {
            draw_sprite_ext(spr_werewire_wire_curve, 0, (xx + 470 + rx) - 20, (yy + 220 + ry) - 12, 2, 2, 0, c_white, 1);
            draw_sprite_ext(spr_werewire_wire_vertical, 0, (xx + 470 + rx) - 20, (yy + 220 + ry) - 12 - 31, 2, 8, 0, c_white, 1);
        }*/
        
        draw_set_halign(fa_center);
        draw_text(xx + 473, yy + 240, recruitName[menuCoord[0]]);
        draw_set_halign(fa_left);
        draw_text_transformed(xx + 368, yy + 280, "CHAPTER " + string(recruitChapter[menuCoord[0]]), 1, 1, 0);
        draw_set_halign(fa_right);
        draw_text_transformed(xx + 576, yy + 280, "LV " + string(recruitLevel[menuCoord[0]]), 1, 1, 0);
        draw_set_halign(fa_left);
        
        if (alternateMenu == 0)
        {
            /*if (global.is_console || obj_gamecontroller.gamepad_active)
            {
                draw_sprite_ext(scr_getbuttonsprite(global.input_g[4], false), 0, xx + 380, yy + 323, 2, 2, 0, c_white, 1);
                draw_sprite_ext(scr_getbuttonsprite(global.input_g[5], false), 0, xx + 380, yy + 353, 2, 2, 0, c_white, 1);
                draw_text(xx + 414, yy + 320, string_hash_to_newline("More Info"));
                draw_text(xx + 414, yy + 350, string_hash_to_newline("Quit"));
            }
            else*/
            {
                draw_text(xx + 380, yy + 320, string_hash_to_newline(stringsetsub("~1: More Info#~2: Quit", scr_get_input_name(4), scr_get_input_name(5))));
            }
        }
        /*else if (global.is_console || obj_gamecontroller.gamepad_active)
        {
            draw_sprite_ext(scr_getbuttonsprite(global.input_g[4], false), 0, xx + 380, yy + 323, 2, 2, 0, c_white, 1);
            draw_sprite_ext(scr_getbuttonsprite(global.input_g[5], false), 0, xx + 380, yy + 353, 2, 2, 0, c_white, 1);
            draw_text(xx + 414, yy + 320, string_hash_to_newline("More Info"));
            draw_text(xx + 414, yy + 350, string_hash_to_newline("Quit"));
        }*/
        else
        {
            draw_text(xx + 380, yy + 320, string_hash_to_newline(stringsetsub("~1: More Info#~2: Quit", scr_get_input_name(4), scr_get_input_name(5))));
        }
        
        if (alternateMenu)
        {
            draw_set_halign(fa_center);
            draw_set_color(c_lime);
            draw_text_transformed(xx + 298, yy + 30, "PROGRESS", squished, 1, 0);
            draw_set_halign(fa_left);
        }
    }
    
    if (menu == 1)
    {
        reccolor = scr_chapter_get_recruit_color();
        
        ossafe_fill_rectangle_color(xx + 80, yy + 70, xx + 80 + 205, yy + 70 + 150, 0, 0, reccolor, reccolor, false);
        draw_set_color(c_white);
        ossafe_fill_rectangle(xx + 80, yy + 70, xx + 80 + 205, yy + 70 + 150, true);
        recruitspriteheight = sprite_get_height(recruitSprite[menuCoord[1]]);
        recruitspritewidth = sprite_get_width(recruitSprite[menuCoord[1]]);
        rx = ((sprite_get_xoffset(recruitSprite[menuCoord[1]]) * 2) - recruitspritewidth) + (recruitSpriteX[menuCoord[1]] * 2);
        ry = ((sprite_get_yoffset(recruitSprite[menuCoord[1]]) * 2) - (recruitspriteheight * 2)) + (recruitSpriteY[menuCoord[1]] * 2);
        animer += 0.25;
        draw_sprite_ext(recruitSprite[menuCoord[1]], animer, xx + 180 + rx, yy + 215 + ry, 2, 2, 0, c_white, 1);
        
        /*if (recruitSprite[menuCoord[1]] == spr_werewire_idle)
        {
            draw_sprite_ext(spr_werewire_wire_curve, 0, (xx + 180 + rx) - 20, (yy + 215 + ry) - 12, 2, 2, 0, c_white, 1);
            draw_sprite_ext(spr_werewire_wire_vertical, 0, (xx + 180 + rx) - 20, (yy + 215 + ry) - 12 - 31, 2, 8, 0, c_white, 1);
        }*/
        
        draw_set_color(c_white);
        draw_text(xx + 300, yy + 70, recruitName[menuCoord[1]]);
        draw_set_halign(fa_right);
        draw_text_transformed(xx + 590, yy + 30, string(menuCoord[menu] + 1) + "/" + string(menuMaximumID[menu] + 1), squished, 1, 0);
        draw_set_halign(fa_left);
        draw_text_transformed(xx + 300, yy + 30, "CHAPTER " + string(recruitChapter[menuCoord[1]]), squished, 1, 0);
        var ymod = 120;
        
        if (jp)
            ymod = 104;
        
        var memfont = draw_get_font();
        
        if (!jp)
        {
            draw_set_font(fnt_dotumche);
            draw_text_ext_transformed(xx + 300, yy + ymod, string_hash_to_newline(recruitDesc[menuCoord[1]]), 20, 280, 1, 1, 0);
        }
        
        draw_set_font(memfont);
        stringl[0] = "LIKE";
        stringl[1] = "DISLIKE";
        stringl[2] = "?????";
        stringl[3] = "?????";
        stringm[0] = recruitLike[menuCoord[1]];
        stringm[1] = recruitDislike[menuCoord[1]];
        stringm[2] = "?????????";
        stringm[3] = "?????????";
        stringn[0] = "LEVEL";
        stringn[1] = "ATTACK";
        stringn[2] = "DEFENSE";
        stringn[3] = "ELEMENT  ";
        stringo[0] = string(recruitLevel[menuCoord[1]]);
        stringo[1] = string(recruitAttack[menuCoord[1]]);
        stringo[2] = string(recruitDefense[menuCoord[1]]);
        stringo[3] = recruitElement[menuCoord[1]];
        stringel = stringn[3] + stringo[3];
        
        for (i = 0; i < 4; i++)
        {
            stringlscale = 1;
            stringmscale = 1;
            
            if (!jp)
            {
                if (string_width(string_hash_to_newline(stringl[i])) >= 60)
                    stringlscale = 80 / string_width(string_hash_to_newline(stringl[i]));
            }
            
            if (string_width(string_hash_to_newline(stringm[i])) >= 290)
                stringmscale = 290 / string_width(string_hash_to_newline(stringm[i]));
            
            draw_set_halign(fa_left);
            draw_text_transformed(xx + 80, yy + 240 + (i * 40), string_hash_to_newline(stringl[i]), stringlscale, 1, 0);
            draw_text_transformed(xx + 80 + 100, yy + 240 + (i * 40), string_hash_to_newline(stringm[i]), stringmscale, 1, 0);
            draw_set_halign(fa_right);
            
            if (i != 3)
            {
                draw_text_transformed(xx + 560, yy + 240 + (i * 40), string_hash_to_newline(stringn[i]), squished, 1, 0);
                draw_text_transformed(xx + 590, yy + 240 + (i * 40), string_hash_to_newline(stringo[i]), squished, 1, 0);
            }
            else
            {
                draw_text_transformed(xx + 590, yy + 240 + (i * 40), string_hash_to_newline(stringel), squished, 1, 0);
            }
            
            draw_set_halign(fa_left);
        }
        
        if (alternateMenu == 0)
        {
            if (recruitPlaceable[menuCoord[1]])
            {
                /*if (global.is_console || obj_gamecontroller.gamepad_active)
                {
                    draw_sprite_ext(scr_getbuttonsprite(global.input_g[4], false), 0, xx + 80, yy + 402, 2, 2, 0, c_white, 1);
                    draw_text(xx + 114, yy + 400, "Place");
                }
                else*/
                {
                    draw_text(xx + 80, yy + 400, stringsetsub("~1: Place", scr_get_input_name(4)));
                }
            }
            else
            {
                draw_set_color(c_gray);
                draw_text(xx + 80, yy + 400, "Cannot Place");
            }
            
            draw_set_color(c_white);
            
            /*if (global.is_console || obj_gamecontroller.gamepad_active)
            {
                draw_sprite_ext(scr_getbuttonsprite(global.input_g[5], false), 0, xx + 320, yy + 402, 2, 2, 0, c_white, 1);
                draw_text(xx + 354, yy + 400, "Return");
            }
            else*/
            {
                draw_text(xx + 320, yy + 400, stringsetsub("~1: Return", scr_get_input_name(5)));
            }
        }
        /*else if (global.is_console || obj_gamecontroller.gamepad_active)
        {
            var button_x = (global.lang == "en") ? (xx + 165) : (xx + 84);
            draw_sprite_ext(scr_getbuttonsprite(global.input_g[5], false), 0, button_x, yy + 402, 2, 2, 0, c_white, 1);
            var x_offset = (global.lang == "en") ? 0 : 38;
            draw_text(xx + 80 + x_offset, yy + 400, string_hash_to_newline("Press         to Return"));
        }*/
        else
        {
            draw_text(xx + 80, yy + 400, stringsetsub("Press ~1 to Return", scr_get_input_name(5)));
        }
    }
}

if (type == 4 && init == 1)
{
    draw_set_font(fnt_mainbig);
    
    if (menu == 0)
        draw_set_color(c_ltgray);
    else
        draw_set_color(c_dkgray);
    
    {
        draw_set_font(fnt_dotumche);
        draw_text_transformed(xx + 60, yy + 140, "POCKET", 1, 1, 0);
    }
    
    if (menu == 1)
        draw_set_color(c_ltgray);
    
    if (menu < 1)
        draw_set_color(c_dkgray);
    
    {
        draw_text_transformed(xx + 60, yy + 290, "STORAGE", 1, 1, 0);
    }
    
    {
        draw_text_transformed(xx + 60, yy + 360, "Page ", 1, 1, 0);
        draw_text_transformed(xx + 60, yy + 380, string((floor(menuScrollCurrent[1]) / 12) + 1) + "/" + string(floor(global.flag[64] / 12)), 1, 1, 0);
    }
}

if (type == 5 && init == 1)
{
    draw_set_font(fnt_mainbig);
    draw_set_color(c_ltgray);
    draw_text_transformed(480, 280, "Page " + string((floor(menuScrollCurrent[0]) / 6) + 1) + " / " + string(ceil(menuMaximumID[0] / 6)), 1, 1, 0);
    tickerTimer++;
    draw_set_font(fnt_dotumche);
    draw_text_transformed(440, 375, "Left / Right: \nChange Pages.", 1, 1, 0);
    
    if (subtype == 1)
        draw_text_transformed(440, 410, "The song you play\nwill be the town\nBGM.", 1, 1, 0);
    else
        draw_text_transformed(440, 410, "Play songs\nfreely.", 1, 1, 0);
    
    var tempSongName = chosenSongName + "    ";
    var songNameLength = string_length(tempSongName);
    var tickerSongName;
    
    if (songNameLength >= 24)
    {
        var tickerCount = max(0, floor((tickerTimer - 60) / 3)) % songNameLength;
        var tickerSongNamePrep = tempSongName + chosenSongName;
        tickerSongName = string_copy(tickerSongNamePrep, 1 + tickerCount, 20);
    }
    else
    {
        tickerSongName = tempSongName;
    }
    
    draw_set_color(c_lime);
    draw_text_transformed(440, 320, "Now Playing", 1, 1, 0);
    draw_text_transformed(440, 345, tickerSongName, 1, 1, 0);
}
