function scr_textsetup(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
{
    myfont = arg0;
    mycolor = arg1;
    writingx = arg2;
    writingy = arg3;
    charline = arg4;
    shake = arg5;
    rate = arg6;
    textsound = arg7;
    hspace = arg8;
    vspace = arg9;
    special = arg10;
    colorchange = 1;
    xcolor = mycolor;
}


function scr_texttype()
{
    var font_set = true;
    var extra_ja_vspace = 0;
    textscale = 1;
    
    switch (global.typer)
    {
        case 0:
            font_set = false;
            break;
        
        case 1:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, 109, 8, 18, 0);
            break;
        
        case 2:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 2, 373, 8, 18, 0);
            break;
        
        case 3:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 2, 109, 8, 18, 1);
            break;
        
        case 4:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 109, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        
        case 5:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, 109, 8, 18, 0);
            break;
        
        case 6:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 109, 16, 36, 1);
            break;
        
        case 7:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, 136, 8, 18, 0);
            break;
        
        case 8:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 2, 136, 8, 18, 0);
            break;
        
        case 10:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, 128, 8, 18, 0);
            break;
        
        case 11:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, 128, 8, 18, 0);
            break;
        
        case 12:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, 129, 8, 18, 0);
            break;
        
        case 13:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, 130, 8, 18, 0);
            break;
        
        case 14:
            scr_textsetup(global.main_font/*scr_84_get_font("comicsans")*/, 16777215, x, y, 33, 0, 1, 126, 8, 18, 0);
            break;
        
        case 15:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, 109, 8, 18, 0);
            break;
        
        case 16:
            font_set = false;
            break;
        
        case 17:
            if (global.darkzone == 1)
                scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 127, 16, 36, 1);
            else
                scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, 127, 8, 18, 0);
            
            break;
        
        case 18:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, 124, 8, 18, 0);
            break;
        
        case 19:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, 109, 8, 18, 0);
            break;
        
        case 20:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, 135, 8, 18, 0);
            break;
        
        case 21:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, 135, 8, 18, 0);
            break;
        
        case 22:
            scr_textsetup(global.main_font/*scr_84_get_font("tinynoelle")*/, 16777215, x, y + 7, 33, 0, 1, 135, 6, 18, 0);
            break;
        
        case 23:
            scr_textsetup(global.main_font/*scr_84_get_font("tinynoelle")*/, 16777215, x, y + 7, 33, 0, 1, 129, 6, 18, 0);
            break;
        
        case 30:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 128, 16, 36, 1);
            break;
        
        case 31:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 131, 16, 36, 1);
            break;
        
        case 32:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 134, 16, 36, 1);
            break;
        
        case 33:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 219, 16, 36, 1);
            break;
        
        case 35:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 133, 16, 36, 1);
            break;
        
        case 36:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 373, 16, 36, 1);
            break;
        
        case 37:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 3, 128, 18, 36, 1);
            break;
        
        case 40:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 2, 373, 8, 18, 0);
            break;
        
        case 41:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 3, 373, 8, 18, 0);
            break;
        
        case 42:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 2, 373, 16, 36, 1);
            break;
        
        case 45:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 131, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        
        case 46:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 134, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        
        case 47:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 128, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        
        case 48:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 219, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        
        case 50:
            scr_textsetup(global.mainbig_font/*scr_84_get_font("dotumche")*/, 0, x, y, 33, 0, 1, 109, 9, 20, 0);
            break;
        
        case 51:
            var rate = langopt(10, 14);
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, rate, 109, 16, 36, 1);
            break;
        
        case 52:
            var rate = langopt(6, 4);
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, rate, 109, 16, 36, 1);
            break;
        
        case 53:
            scr_textsetup(global.mainbig_font/*scr_84_get_font("dotumche")*/, 0, x, y, 33, 0, 1, 128, 9, 20, 0);
            break;
        
        case 54:
            scr_textsetup(global.mainbig_font/*scr_84_get_font("dotumche")*/, 0, x, y, 33, 0, 2, 128, 9, 20, 0);
            break;
        
        case 55:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, 132, 8, 18, 0);
            break;
        
        case 56:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 129, 16, 36, 1);
            break;
        
        case 57:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 130, 16, 36, 1);
            break;
        
        case 58:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 68, 16, 36, 1);
            break;
        
        case 59:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 129, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        
        case 60:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 2, 131, 12, 20, 0);
            break;
        
        case 61:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 2, 128, 12, 20, 0);
            break;
        
        case 62:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 137, 16, 36, 1);
            break;
        
        case 63:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 2, 129, 8, 18, 0);
            break;
        
        case 64:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 1, 2, 129, 8, 18, 0);
            break;
        
        case 65:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 140, 16, 36, 1);
            break;
        
        case 66:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 138, 16, 36, 1);
            break;
        
        case 67:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 139, 16, 36, 1);
            break;
        
        case 68:
            scr_textsetup(global.mainbig_font/*scr_84_get_font("dotumche")*/, 0, x, y, 33, 0, 1, 138, 9, 20, 0);
            break;
        
        case 69:
            scr_textsetup(global.mainbig_font/*scr_84_get_font("dotumche")*/, 0, x, y, 33, 0, 1, 130, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        
        case 70:
            scr_textsetup(global.mainbig_font/*scr_84_get_font("dotumche")*/, 0, x, y, 33, 0, 1, 68, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        
        case 71:
            scr_textsetup(global.mainbig_font/*scr_84_get_font("dotumche")*/, 0, x, y, 33, 0, 1, 68, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        
        case 72:
            scr_textsetup(global.mainbig_font/*scr_84_get_font("dotumche")*/, 0, x, y, 33, 0, 1, 139, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        
        case 74:
            scr_textsetup(global.mainbig_font/*scr_84_get_font("dotumche")*/, 0, x, y, 33, 0, 1, 131, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        
        case 75:
            scr_textsetup(global.mainbig_font/*scr_84_get_font("dotumche")*/, 0, x, y, 33, 0, 1, 128, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        
        case 76:
            scr_textsetup(global.mainbig_font/*scr_84_get_font("dotumche")*/, 0, x, y, 33, 0, 1, 129, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        
        case 77:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 130, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        
        case 78:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 36, 0, 1, 109, 16, 36, 1);
            break;
        
        case 79:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 45, 16, 36, 1);
            break;
        
        case 80:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, 476, 16, 36, 1);
            break;
        
        case 81:
            scr_textsetup(global.mainbig_font/*scr_84_get_font("dotumche")*/, 0, x, y, 33, 0, 1, 476, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        
        case 666:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 4, 373, 12, 20, 2);
            break;
        
        case 667:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 2, 373, 12, 20, 2);
            break;
        
        case 999:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 4, 370, 8, 18, 3);
            break;
        
        case 100:
            scr_textsetup(global.mainbig_font/*scr_84_get_font("8bit")*/, 16777215, x, y, 22, 0, 1, 109, 16, 20, 0);
            
            if (room == room_board_preshadowmantle || room == room_shadowmantle || room == room_board_dungeon_2)
                scr_textsetup(global.mainbig_font/*scr_84_get_font("8bit_mixed")*/, 16777215, x, y, 22, 0, 1, 109, 16, 20, 0);
            
            break;
        
        case 101:
            scr_textsetup(global.mainbig_font/*scr_84_get_font("8bit_mixed")*/, 16777215, x, y, 22, 0, 1, 109, 16, 20, 0);
            break;
        
        default:
            font_set = false;
            break;
    }
    
    if (font_set && global.lang == "ja")
    {
        if (myfont == 15)
        {
            hspace = ((hspace * 26) / 16) + 1;
            
            if (vspace == 32)
                vspace = 36;
        }
        else if (myfont == 12)
        {
            hspace = ((hspace * 13) / 8) + 1;
        }
        else if (myfont == 10)
        {
            textscale = 0.5;
            hspace = ((hspace * 13) / 8) + 3;
        }
        else if (myfont == 14)
        {
            textscale = 0.5;
            hspace = ((hspace * 13) / 8) + 1;
        }
        else if (myfont == 11)
        {
            hspace = ((hspace * 26) / 16) + 1;
        }
        else if (myfont == 13)
        {
            hspace = ((hspace * 13) / 8) + 1;
        }
        else if (myfont == 3)
        {
            hspace = (hspace * 13) / 13;
            vspace = 20;
        }
        else if (myfont == 2)
        {
            hspace = (hspace * 13) / 10;
            vspace = 32;
        }
        
        vspace += extra_ja_vspace;
    }
}
