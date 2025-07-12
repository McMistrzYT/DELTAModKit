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
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, snd_text, 8, 18, 0);
            break;
        
        case 2:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 2, snd_nosound, 8, 18, 0);
            break;
        
        case 3:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 2, snd_text, 8, 18, 1);
            break;
        
        case 4:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_text, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        
        case 5:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, snd_text, 8, 18, 0);
            break;
        
        case 6:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_text, 16, 36, 1);
            break;
        
        case 7:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, snd_txttor, 8, 18, 0);
            break;
        
        case 8:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 2, snd_txttor, 8, 18, 0);
            break;
        
        case 10:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, snd_txtsus, 8, 18, 0);
            break;
        
        case 11:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, snd_txtsus, 8, 18, 0);
            break;
        
        case 12:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, snd_txtnoe, 8, 18, 0);
            break;
        
        case 13:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, snd_txtber, 8, 18, 0);
            break;
        
        case 14:
            scr_textsetup(fnt_comicsans, 16777215, x, y, 33, 0, 1, snd_txtsans, 8, 18, 0);
            break;
        
        case 15:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, snd_text, 8, 18, 0);
            break;
        
        case 16:
            font_set = false;
            break;
        
        case 17:
            if (global.darkzone == 1)
                scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtund, 16, 36, 1);
            else
                scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, snd_txtund, 8, 18, 0);
            
            break;
        
        case 18:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, snd_txtasg, 8, 18, 0);
            break;
        
        case 19:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, snd_text, 8, 18, 0);
            break;
        
        case 20:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, snd_txtal, 8, 18, 0);
            break;
        
        case 21:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, snd_txtal, 8, 18, 0);
            break;
        
        case 22:
            scr_textsetup(fnt_tinynoelle, 16777215, x, y + 7, 33, 0, 1, snd_txtal, 6, 18, 0);
            break;
        
        case 23:
            scr_textsetup(fnt_tinynoelle, 16777215, x, y + 7, 33, 0, 1, snd_txtnoe, 6, 18, 0);
            break;
        
        case 30:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtsus, 16, 36, 1);
            break;
        
        case 31:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtral, 16, 36, 1);
            break;
        
        case 32:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtlan, 16, 36, 1);
            break;
        
        case 33:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_dadtxt, 16, 36, 1);
            break;
        
        case 35:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtjok, 16, 36, 1);
            break;
        
        case 36:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_nosound, 16, 36, 1);
            break;
        
        case 37:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 3, snd_txtsus, 18, 36, 1);
            break;
        
        case 40:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 2, snd_nosound, 8, 18, 0);
            break;
        
        case 41:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 3, snd_nosound, 8, 18, 0);
            break;
        
        case 42:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 2, snd_nosound, 16, 36, 1);
            break;
        
        case 45:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtral, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        
        case 46:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtlan, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        
        case 47:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtsus, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        
        case 48:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_dadtxt, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        
        case 50:
            scr_textsetup(fnt_dotumche, 0, x, y, 33, 0, 1, snd_text, 9, 20, 0);
            break;
        
        case 51:
            var rate = langopt(10, 14);
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, rate, snd_text, 16, 36, 1);
            break;
        
        case 52:
            var rate = langopt(6, 4);
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, rate, snd_text, 16, 36, 1);
            break;
        
        case 53:
            scr_textsetup(fnt_dotumche, 0, x, y, 33, 0, 1, snd_txtsus, 9, 20, 0);
            break;
        
        case 54:
            scr_textsetup(fnt_dotumche, 0, x, y, 33, 0, 2, snd_txtsus, 9, 20, 0);
            break;
        
        case 55:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 1, snd_txtrud, 8, 18, 0);
            break;
        
        case 56:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtnoe, 16, 36, 1);
            break;
        
        case 57:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtber, 16, 36, 1);
            break;
        
        case 58:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtq, 16, 36, 1);
            break;
        
        case 59:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtnoe, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        
        case 60:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 2, snd_txtral, 12, 20, 0);
            break;
        
        case 61:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 2, snd_txtsus, 12, 20, 0);
            break;
        
        case 62:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtq_2, 16, 36, 1);
            break;
        
        case 63:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 2, snd_txtnoe, 8, 18, 0);
            break;
        
        case 64:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 1, 2, snd_txtnoe, 8, 18, 0);
            break;
        
        case 65:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtrx1, 16, 36, 1);
            break;
        
        case 66:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtspam, 16, 36, 1);
            break;
        
        case 67:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtspam2, 16, 36, 1);
            break;
        
        case 68:
            scr_textsetup(fnt_dotumche, 0, x, y, 33, 0, 1, snd_txtspam, 9, 20, 0);
            break;
        
        case 69:
            scr_textsetup(fnt_dotumche, 0, x, y, 33, 0, 1, snd_txtber, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        
        case 70:
            scr_textsetup(fnt_dotumche, 0, x, y, 33, 0, 1, snd_txtq, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        
        case 71:
            scr_textsetup(fnt_dotumche, 0, x, y, 33, 0, 1, snd_txtq, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        
        case 72:
            scr_textsetup(fnt_dotumche, 0, x, y, 33, 0, 1, snd_txtspam2, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        
        case 74:
            scr_textsetup(fnt_dotumche, 0, x, y, 33, 0, 1, snd_txtral, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        
        case 75:
            scr_textsetup(fnt_dotumche, 0, x, y, 33, 0, 1, snd_txtsus, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        
        case 76:
            scr_textsetup(fnt_dotumche, 0, x, y, 33, 0, 1, snd_txtnoe, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        
        case 77:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtber, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        
        case 78:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 36, 0, 1, snd_text, 16, 36, 1);
            break;
        
        case 79:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_txtsusral, 16, 36, 1);
            break;
        
        case 80:
            scr_textsetup(global.mainbig_font, 16777215, x, y, 33, 0, 1, snd_tv_voice_short, 16, 36, 1);
            break;
        
        case 81:
            scr_textsetup(fnt_dotumche, 0, x, y, 33, 0, 1, snd_tv_voice_short, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        
        case 666:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 4, snd_nosound, 12, 20, 2);
            break;
        
        case 667:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 2, snd_nosound, 12, 20, 2);
            break;
        
        case 999:
            scr_textsetup(global.main_font, 16777215, x, y, 33, 0, 4, snd_txtecho, 8, 18, 3);
            break;
        
        case 100:
            scr_textsetup(fnt_8bit, 16777215, x, y, 22, 0, 1, snd_text, 16, 20, 0);
            
            if (room == room_board_preshadowmantle || room == room_shadowmantle || room == room_board_dungeon_2)
                scr_textsetup(fnt_8bit_mixed, 16777215, x, y, 22, 0, 1, snd_text, 16, 20, 0);
            
            break;
        
        case 101:
            scr_textsetup(fnt_8bit_mixed, 16777215, x, y, 22, 0, 1, snd_text, 16, 20, 0);
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

function scr_textsound()
{
    playtextsound = 1;
    
    if (button2_h() == 1)
    {
        var dontplaysound = true;
        
        if (variable_instance_exists(id, "runcheck"))
        {
            if (runcheck)
                dontplaysound = false;
        }
        
        if (dontplaysound)
            playtextsound = 0;
    }
    
    if (skippable == 0)
        playtextsound = 1;
    
    if (playtextsound == 1)
    {
        if (rate <= 2)
            getchar = string_char_at(mystring, pos);
        else
            getchar = string_char_at(mystring, pos - 1);
        
        play = 1;
        playcheck = 0;
        
        if (getchar == "&" || getchar == "\n")
        {
            if (rate < 3)
            {
                playcheck = 1;
                getchar = string_char_at(mystring, pos + 1);
            }
            else
            {
                play = 0;
            }
        }
        
        if (getchar == " ")
            play = 0;
        
        if (getchar == "^")
            play = 0;
        
        if (getchar == "!")
            play = 0;
        
        if (getchar == ".")
            play = 0;
        
        if (getchar == "?")
            play = 0;
        
        if (getchar == ",")
            play = 0;
        
        if (getchar == ":")
            play = 0;
        
        if (getchar == "/")
            play = 0;
        
        if (getchar == "\\")
            play = 0;
        
        if (getchar == "|")
            play = 0;
        
        if (getchar == "*")
            play = 0;
        
        if (play == 1)
        {
            if (textsound == snd_txtq)
            {
                audio_stop_sound(snd_txtq_2);
                qv = snd_play(snd_txtq_2);
                qp = 0.9 + random(0.15);
                snd_pitch(qv, qp);
                sound_timer = 2;
            }
            else if (textsound == snd_txtspam)
            {
                audio_stop_sound(snd_txtspam2);
                snd_play_x(snd_txtspam2, 0.8, 1.2);
                sound_timer = 2;
            }
            else if (textsound == snd_txtsans)
            {
                audio_stop_sound(snd_txtsans);
                qv = snd_play(snd_txtsans);
                sound_timer = 2;
            }
            /*else if (textsound == snd_txtjack_high_cute || textsound == snd_txtjack_low2)
            {
                // not importing chapter 3 + 4 code
            }
            else if (textsound == snd_txger)
            {
                 // not importing chapter 3 + 4 code
            }
            else if (textsound == snd_tv_voice_short)
            {
                 // not importing chapter 3 + 4 code
            }*/
            {
                snd_play(textsound);
            }
            
            with (obj_face)
                mouthmove = 1;
            
            miniface_pos++;
        }
    }
}
