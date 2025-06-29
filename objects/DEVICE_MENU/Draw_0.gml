draw_set_font(global.main_font);

if (TYPE == 1 && SUBTYPE == 0)
{
    draw_sprite_ext(spr_giantdarkdoor, 1, 43, 48, 2, 2, 0, c_white, 0.03 + (sin(BG_SINER / 20) * 0.04));
    draw_sprite_ext(spr_giantdarkdoor, 1, 47, 48, 2, 2, 0, c_white, 0.03 + (sin(BG_SINER / 20) * 0.04));
    draw_sprite_ext(spr_giantdarkdoor, 1, 43, 52, 2, 2, 0, c_white, 0.03 + (sin(BG_SINER / 20) * 0.04));
    draw_sprite_ext(spr_giantdarkdoor, 1, 47, 52, 2, 2, 0, c_white, 0.03 + (sin(BG_SINER / 20) * 0.04));
    draw_sprite_ext(spr_giantdarkdoor, 1, 45, 50, 2, 2, 0, c_white, 0.25);
    BG_SINER++;
}

if (BGMADE == 1 && SUBTYPE == 1)
{
    ANIM_SINER += 1;
    ANIM_SINER_B += 1;
    BG_SINER += 1;
    
    if (BG_ALPHA < 0.5)
        BG_ALPHA += (0.04 - (BG_ALPHA / 14));
    
    if (BG_ALPHA > 0.5)
        BG_ALPHA = 0.5;
    
    __WAVEHEIGHT = 240;
    __WAVEWIDTH = 320;
    
    for (i = 0; i < (__WAVEHEIGHT - 50); i += 1)
    {
        __WAVEMINUS = BGMAGNITUDE * (i / __WAVEHEIGHT) * 1.3;
        
        if (__WAVEMINUS > BGMAGNITUDE)
            __WAVEMAG = 0;
        else
            __WAVEMAG = BGMAGNITUDE - __WAVEMINUS;
        
        draw_background_part_ext(IMAGE_MENU, 0, i, __WAVEWIDTH, 1, sin((i / 8) + (BG_SINER / 30)) * __WAVEMAG, (-10 + i) - (BG_ALPHA * 20), 1, 1, image_blend, BG_ALPHA * 0.8);
        draw_background_part_ext(IMAGE_MENU, 0, i, __WAVEWIDTH, 1, -sin((i / 8) + (BG_SINER / 30)) * __WAVEMAG, (-10 + i) - (BG_ALPHA * 20), 1, 1, image_blend, BG_ALPHA * 0.8);
    }
    
    T_SINER_ADD = (sin(ANIM_SINER_B / 10) * 0.6) - 0.25;
    
    if (T_SINER_ADD >= 0)
        TRUE_ANIM_SINER += T_SINER_ADD;
    
    draw_sprite_ext(IMAGE_MENU_ANIMATION, ANIM_SINER / 12, 0, ((10 - (BG_ALPHA * 20)) + __WAVEHEIGHT) - 70, 1, 1, 0, image_blend, BG_ALPHA * 0.46);
    draw_sprite_ext(IMAGE_MENU_ANIMATION, (ANIM_SINER / 12) + 0.4, 0, ((10 - (BG_ALPHA * 20)) + __WAVEHEIGHT) - 70, 1, 1, 0, image_blend, BG_ALPHA * 0.56);
    draw_sprite_ext(IMAGE_MENU_ANIMATION, (ANIM_SINER / 12) + 0.8, 0, ((10 - (BG_ALPHA * 20)) + __WAVEHEIGHT) - 70, 1, 1, 0, image_blend, BG_ALPHA * 0.7);
}

if (MENU_NO >= 0)
{
    for (i = 0; i < 3; i += 1)
    {
        CONT_THIS = 0;
        PREV_MENU = MENU_NO;
        
        if (MENU_NO == 1)
            PREV_MENU = 0;
        
        if (MENU_NO == 4)
            PREV_MENU = 3;
        
        if (MENU_NO == 6)
            PREV_MENU = 5;
        
        if (MENU_NO == 7)
            PREV_MENU = 5;
        
        if (MENU_NO == 11)
            PREV_MENU = 10;
        
        if (MENUCOORD[0] == i && MENU_NO == 1)
            CONT_THIS = 1;
        
        if (MENUCOORD[3] == i && MENU_NO == 4)
            CONT_THIS = 4;
        
        if (MENUCOORD[5] == i && MENU_NO == 6)
            CONT_THIS = 6;
        
        if (MENUCOORD[5] == i && MENU_NO == 7)
            CONT_THIS = 7;
        
        if (MENUCOORD[10] == i && MENU_NO == 11)
            CONT_THIS = 11;
        
        BOX_X1 = 55;
        BOX_Y1 = 55 + ((YL + YS) * i);
        BOX_X2 = 55 + XL;
        BOX_Y2 = (55 + ((YL + YS) * i) + YL) - 1;
        draw_sprite_ext(spr_pxwhite, 0, BOX_X1, BOX_Y1, XL, YL, 0, c_black, 0.5);
        draw_set_color(COL_A);
        
        if (MENU_NO >= 0)
        {
            if (MENUCOORD[PREV_MENU] == i)
                draw_set_color(COL_B);
        }
        
        if (MENU_NO == 3 || MENU_NO == 4)
        {
            if (MENUCOORD[2] == i)
                draw_set_color(COL_PLUS);
        }
        
        if (MENU_NO == 7 && MENUCOORD[5] == i)
            draw_set_color(c_red);
        
        if (TYPE == 1)
        {
            var col = draw_get_color();
            var alf = draw_get_alpha();
            draw_sprite_ext(spr_pxwhite, 0, BOX_X1 - 2, BOX_Y1 - 2, (BOX_X2 - BOX_X1) + 4, 2, 0, col, alf);
            draw_sprite_ext(spr_pxwhite, 0, BOX_X1 - 2, BOX_Y2, (BOX_X2 - BOX_X1) + 4, 2, 0, col, alf);
            draw_sprite_ext(spr_pxwhite, 0, BOX_X1 - 2, BOX_Y1 - 2, 2, (BOX_Y2 - BOX_Y1) + 4, 0, col, alf);
            draw_sprite_ext(spr_pxwhite, 0, BOX_X2, BOX_Y1 - 2, 2, (BOX_Y2 - BOX_Y1) + 4, 0, col, alf);
        }
        
        if (CONT_THIS < 4 || CONT_THIS == 11)
        {
            var NOWNAME = NAME[i];
            var NOWTIME = TIME_STRING[i];
            
            if (MENU_NO == 10 || MENU_NO == 11)
            {
                var filefound = 0;
                
                if (INCOMPLETE_LOAD == 0 && COMPLETEFILE_PREV[i] == 1)
                    filefound = 1;
                
                if (INCOMPLETE_LOAD == 1 && INCOMPLETEFILE_PREV[i] == 1)
                    filefound = 1;
                
                if (filefound)
                {
                    NOWNAME = COMPLETEFILE_PREV_NAME[i];
                    NOWTIME = COMPLETETIME_STRING[i];
                }
                else if (INCOMPLETE_LOAD)
                {
                    NOWNAME = "FILE not found.";
                }
                else
                {
                    NOWNAME = "Completion FILE not found.";
                    NOWTIME = " ";
                }
            }
            
			draw_set_font(global.main_font);
            
            draw_text_shadow(BOX_X1 + 25, BOX_Y1 + 5, NOWNAME);
            draw_set_font(global.main_font);
            draw_set_halign(fa_right);
            draw_text_shadow(BOX_X1 + 180, BOX_Y1 + 5, NOWTIME);
            draw_set_halign(fa_left);
        }
        
        if (CONT_THIS >= 1)
        {
            if (TYPE == 0)
            {
                if (MENU_NO == 1)
                {
                    SELTEXT_C = " ";
                    SELTEXT_A = "CONTINUE";
                    SELTEXT_B = "BACK";
                    
                    if (FILE[MENUCOORD[0]] == 0)
                    {
                        SELTEXT_A = "BEGIN";
                        SELTEXT_B = "BACK";
                    }
                }
                
                if (MENU_NO == 4)
                {
                    SELTEXT_A = "OVERWRITE";
                    SELTEXT_B = "DO NOT";
                    SELTEXT_C = "IT WILL BE SUBSUMED.";
                }
                
                if (MENU_NO == 6)
                {
                    SELTEXT_A = "YES";
                    SELTEXT_B = "NO";
                    SELTEXT_C = "TRULY ERASE IT?";
                }
                
                if (MENU_NO == 7)
                {
                    SELTEXT_A = "ERASE";
                    SELTEXT_B = "DO NOT";
                    SELTEXT_C = "THEN IT WILL BE DESTROYED.";
                }
            }
            else
            {
                if (MENU_NO == 1)
                {
                    SELTEXT_C = " ";
                    SELTEXT_A = "Continue";
                    SELTEXT_B = "Back";
                    
                    if (FILE[MENUCOORD[0]] == 0)
                    {
                        SELTEXT_A = "Start";
                        SELTEXT_B = "Back";
                    }
                }
                
                if (MENU_NO == 4)
                {
                    SELTEXT_A = "Yes";
                    SELTEXT_B = "No";
                    SELTEXT_C = "Copy over this file?";
                }
                
                if (MENU_NO == 6)
                {
                    SELTEXT_A = "Yes";
                    SELTEXT_B = "No";
                    SELTEXT_C = "Erase this file?";
                }
                
                if (MENU_NO == 7)
                {
                    SELTEXT_A = "Yes!";
                    SELTEXT_B = "No!";
                    SELTEXT_C = "Really erase it?";
                }
                
                if (MENU_NO == 11)
                {
                    SELTEXT_A = "Start";
                    SELTEXT_B = "Back";
                    SELTEXT_C = " ";
                }
            }
            
            draw_set_color(COL_B);
            
            if (MENU_NO == 7)
                draw_set_color(c_red);
            
            draw_text_shadow(BOX_X1 + 25, BOX_Y1 + 5, SELTEXT_C);
            draw_set_color(COL_A);
            
            if (MENUCOORD[MENU_NO] == 0)
            {
                draw_set_color(COL_B);
                HEARTX = 75;
                HEARTY = 81 + ((YL + YS) * MENUCOORD[PREV_MENU]);
            }
            
            draw_text_shadow(BOX_X1 + 35, BOX_Y1 + 22, SELTEXT_A);
            draw_set_color(COL_A);
            
            if (MENUCOORD[MENU_NO] == 1)
            {
                draw_set_color(COL_B);
                HEARTX = 165;
                HEARTY = 81 + ((YL + YS) * MENUCOORD[PREV_MENU]);
            }
            
            draw_text_shadow(BOX_X1 + 125, BOX_Y1 + 22, SELTEXT_B);
        }
        else
        {
            var NOWPLACE = PLACE[i];
            
            if (MENU_NO == 10 || MENU_NO == 11)
            {
                if (COMPLETEFILE_PREV[i] == 1)
                    NOWPLACE = scr_get_completed_file_name(global.chapter - 1);
                else
                    NOWPLACE = "[Made on seeing credits.]";
                
                if (INCOMPLETE_LOAD)
                    NOWPLACE = COMPLETEFILE_PREV_PLACE[i];
            }
            
            draw_text_shadow_width(BOX_X1 + 25, BOX_Y1 + 22, NOWPLACE, 180);
        }
    }
}

if (MENU_NO >= 0)
{
    if (MENU_NO == 0 || MENU_NO == 2 || MENU_NO == 3 || MENU_NO == 5 || MENU_NO == 10)
    {
        if (MENUCOORD[MENU_NO] >= 0 && MENUCOORD[MENU_NO] <= 2)
        {
            HEARTX = 65;
            HEARTY = 72 + ((YL + YS) * MENUCOORD[MENU_NO]);
        }
        
        if (MENUCOORD[MENU_NO] == 3)
        {
            HEARTX = 40 - jamod;
            HEARTY = 195;
        }
        
        if (MENUCOORD[MENU_NO] == 4)
        {
            HEARTX = 125;
            HEARTY = 195;
        }
        
        if (MENUCOORD[MENU_NO] == 5)
        {
            HEARTX = 40 - jamod;
            HEARTY = 215;
        }
        
        if (MENUCOORD[MENU_NO] == 6)
        {
            HEARTX = 125;
            HEARTY = 215;
        }
        
        if (MENUCOORD[MENU_NO] == 7)
        {
            HEARTX = 190;
            HEARTY = 195;
        }
        
        if (MENUCOORD[MENU_NO] == 8)
        {
            HEARTX = 190;
            HEARTY = 215;
        }
    }
    
    if (MENU_NO >= 2)
    {
        CANCELTEXT = "CANCEL";
        
        if (TYPE == 1)
            CANCELTEXT = "Cancel";
        
        if (MENU_NO == 10 || MENU_NO == 11)
            CANCELTEXT = stringsetsub("Don't Use Chapter ~1 FILE", string(global.chapter - 1));
        
        draw_set_color(COL_A);
        
        if (MENU_NO < 20)
        {
            if (MENUCOORD[PREV_MENU] == 3)
                draw_set_color(COL_B);
        }
        
        draw_text_shadow(55, 190, CANCELTEXT);
    }
    
    if (MENU_NO == 0 || MENU_NO == 1)
    {
        jamod = 0;
        
        if (global.lang == "ja")
            jamod = 10;
        
        COPYTEXT = "COPY";
        ERASETEXT = "ERASE";
        CHFILETEXT = stringsetsub("Ch ~1 Files", string(global.chapter - 1));
        CHSELECTTEXT = "Chapter Select";
        QUITTEXT = "End Program";
        LANGUAGETEXT = "English";
        
        if (TYPE == 1)
        {
            COPYTEXT = "Copy";
            ERASETEXT = "Erase";
        }
        
        draw_set_color(COL_A);
        
        if (MENUCOORD[0] == 3)
            draw_set_color(COL_B);
        
        draw_text_shadow(54 - jamod, 190, COPYTEXT);
        draw_set_color(COL_A);
        
        if (MENUCOORD[0] == 4)
            draw_set_color(COL_B);
        
        draw_text_shadow(140, 190, ERASETEXT);
        draw_set_color(COL_A);
        
        if (MENUCOORD[0] == 5)
            draw_set_color(COL_B);
        
        draw_text_shadow(54 - jamod, 210, CHFILETEXT);
        draw_set_color(COL_A);
        
        if (MENUCOORD[0] == 7)
            draw_set_color(COL_B);
        
        draw_text_shadow(204, 190, CHSELECTTEXT);
        draw_set_color(COL_A);
        
        if (MENUCOORD[0] == 8)
            draw_set_color(COL_B);
        
        if (CANQUIT)
            draw_text_shadow(204, 210, QUITTEXT);
        
        draw_set_font(global.main_font);
        
        draw_set_color(COL_A);
        
        if (MENUCOORD[0] == 6)
            draw_set_color(COL_B);
        
        var languagex = 140;
        
        if (global.lang == "en")
            languagex = 136;
        
        draw_text_shadow(languagex, 210, LANGUAGETEXT);
        draw_set_font(global.main_font);
    }
    
    draw_set_font(global.main_font);
    
    if (TYPE == 1)
    {
        draw_set_alpha(0.4);
        draw_set_color(c_white);
        draw_set_halign(fa_right);
        draw_set_valign(fa_bottom);
        draw_text_transformed(313, 236, "DELTARUNE " + global.versionno + " (C) Toby Fox 2018-2025 ", 0.5, 0.5, 0);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
    else
    {
        draw_set_color(COL_A);
        draw_text_transformed(248, 230, global.versionno, 0.5, 0.5, 0);
        draw_set_color(c_white);
    }
    
    draw_set_font(global.main_font);
    draw_set_alpha(1);
    
    if (MESSAGETIMER <= 0)
    {
        if (TYPE == 0)
        {
            if (MENU_NO == 0 || MENU_NO == 1)
                TEMPCOMMENT = " ";
            
            if (MENU_NO == 2)
                TEMPCOMMENT = "CHOOSE THE ONE TO COPY.";
            
            if (MENU_NO == 3)
                TEMPCOMMENT = "CHOOSE THE TARGET FOR THE REFLECTION.";
            
            if (MENU_NO == 4)
                TEMPCOMMENT = "IT WILL BE SUBSUMED.";
            
            if (MENU_NO == 5 || MENU_NO == 6 || MENU_NO == 7)
                TEMPCOMMENT = "SELECT THE ONE TO ERASE.";
        }
        
        if (TYPE == 1)
        {
            if (MENU_NO == 0 || MENU_NO == 1)
                TEMPCOMMENT = "Please select a file.";
            
            if (MENU_NO == 2)
                TEMPCOMMENT = "Choose a file to copy.";
            
            if (MENU_NO == 3)
                TEMPCOMMENT = "Choose a file to copy to.";
            
            if (MENU_NO == 4)
                TEMPCOMMENT = "The file will be overwritten.";
            
            if (MENU_NO == 5 || MENU_NO == 6 || MENU_NO == 7)
                TEMPCOMMENT = "Choose a file to erase.";
            
            if (MENU_NO == 10)
                TEMPCOMMENT = stringsetsub("Start Chapter ~1 from Chapter ~2's FILE.", string(global.chapter), string(global.chapter - 1));
            
            if (MENU_NO == 11)
                TEMPCOMMENT = stringsetsub("This will start Chapter ~1 in FILE Slot ~2.", string(global.chapter), MENUCOORD[10] + 1);
        }
    }
    
    draw_set_color(COL_B);
	
    draw_text_shadow(40, 30, TEMPCOMMENT);
    
    MESSAGETIMER -= 1;
}

if (abs(HEARTX - HEARTXCUR) <= 2)
    HEARTXCUR = HEARTX;

if (abs(HEARTY - HEARTYCUR) <= 2)
    HEARTYCUR = HEARTY;

HEARTXCUR += ((HEARTX - HEARTXCUR) / 2);
HEARTYCUR += ((HEARTY - HEARTYCUR) / 2);

if (MENU_NO >= 0)
    draw_sprite(spr_heartsmall, 0, HEARTXCUR, HEARTYCUR);

draw_set_font(global.main_font);
draw_set_color(c_white);
draw_text_shadow(camerax() + 8, cameray() + 4, "CHAPTER " + string(global.chapter));
draw_set_font(global.main_font);
