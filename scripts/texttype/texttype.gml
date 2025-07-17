function scr_textsetup(font, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
{
    myfont = font;
    mycolor = arg1;
    writingx = arg2;
    writingy = arg3;
    charline = arg4;
    shake = arg5;
    rate = arg6;
    
    if is_real(arg7)
        textsound = arg7;
    else if is_string(arg7)
        textsound = asset_get_index(arg7);
    else
        textsound = snd_error; 
     if !audio_exists(textsound)
	textsound = snd_error;
    hspace = arg8;
    vspace = arg9;
    special = arg10;
    colorchange = true;
    xcolor = mycolor;
}

function scr_84_get_font(fontname, startwithfnt = true, localizedfont = true)
{
	var start = (startwithfnt ? "fnt_" : ""); // incase if there's an Custom Font that DOESNT Start with `fnt_`
	var fnten = asset_get_index(start + fontname);
	var fnt = asset_get_index(start + (global.lang == "en" ? "" : string(global.lang) + "_") + fontname);
	if font_exists(fnt) && localizedfont == true // Localization font toggle, even though if you're using this function you're likely using Localization.
		return fnt;
	else if font_exists(fnten)
	    return fnten;
	else
	    return -1; // -1 is the default font for Gamemaker Studio 2.
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
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, "snd_text", 8, 18, false);
            break;
        
        case 2:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 2, "snd_nosound", 8, 18, false);
            break;
        
        case 3:
        
            scr_textsetup(scr_84_get_font("main"), 0xFFFFFF, x, y, 33, 0, 2, "snd_text", 8, 18, true);
            break;
        
        case 4:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_text", 16, 28, true);
            extra_ja_vspace = 2;
            break;
        
        case 5:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, "snd_text", 8, 18, false);
            break;
        
        case 6:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_text", 16, 36, true);
            break;
        
        case 7:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, "snd_txttor", 8, 18, false);
            break;
        
        case 8:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 2, "snd_txttor", 8, 18, false);
            break;
        
        case 10:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, "snd_txtsus", 8, 18, false);
            break;
        
        case 11:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, "snd_txtsus", 8, 18, false);
            break;
        
        case 12:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, "snd_txtnoe", 8, 18, false);
            break;
        
        case 13:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, "snd_txtber", 8, 18, false);
            break;
        
        case 14:
        
            scr_textsetup(scr_84_get_font("comicsans"), c_white, x, y, 33, 0, 1, "snd_txtsans", 8, 18, false);
            break;
        
        case 15:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, "snd_text", 8, 18, false);
            break;
        
        case 16:
        
            font_set = false;
            break;
        
        case 17:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, "snd_txtund", 8, 18, false);
            break;
        
        case 18:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, "snd_txtasg", 8, 18, false);
            break;
        
        case 19:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, "snd_text", 8, 18, false);
            break;
        
        case 20:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, "snd_txtal", 8, 18, false);
            break;
        
        case 21:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, "snd_txtal", 8, 18, false);
            break;
        
        case 22:
        
            scr_textsetup(scr_84_get_font("tinynoelle"), c_white, x, y + 7, 33, 0, 1, "snd_txtal", 6, 18, false);
            break;
        
        case 23:
        
            scr_textsetup(scr_84_get_font("tinynoelle"), c_white, x, y + 7, 33, 0, 1, "snd_txtnoe", 6, 18, false);
            break;
        
        case 30:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_txtsus", 16, 36, true);
            break;
        
        case 31:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_txtral", 16, 36, true);
            break;
        
        case 32:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_txtlan", 16, 36, true);
            break;
        
        case 33:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_dadtxt", 16, 36, true);
            break;
        
        case 35:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_txtjok", 16, 36, true);
            break;
        
        case 36:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_nosound", 16, 36, true);
            break;
        
        case 37:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 3, "snd_txtsus", 18, 36, true);
            break;
        
        case 40:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 2, "snd_nosound", 8, 18, false);
            break;
        
        case 41:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 3, "snd_nosound", 8, 18, false);
            break;
        
        case 42:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 2, "snd_nosound", 16, 36, true);
            break;
        
        case 45:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_txtral", 16, 28, true);
            extra_ja_vspace = 2;
            break;
        
        case 46:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_txtlan", 16, 28, true);
            extra_ja_vspace = 2;
            break;
        
        case 47:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_txtsus", 16, 28, true);
            extra_ja_vspace = 2;
            break;
        
        case 48:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_dadtxt", 16, 28, true);
            extra_ja_vspace = 2;
            break;
        
        case 50:
        
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, "snd_text", 9, 20, false);
            break;
        
        case 51:
        
            var rate = langopt(10, 14);
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, rate, "snd_text", 16, 36, true);
            break;
        
        case 52:
        
            var rate = langopt(6, 4);
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, rate, "snd_text", 16, 36, true);
            break;
        
        case 53:
        
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, "snd_txtsus", 9, 20, false);
            break;
        
        case 54:
        
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 2, "snd_txtsus", 9, 20, false);
            break;
        
        case 55:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, "snd_txtrud", 8, 18, false);
            break;
        
        case 56:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_txtnoe", 16, 36, true);
            break;
        
        case 57:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_txtber", 16, 36, true);
            break;
        
        case 58:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_txtq", 16, 36, true);
            break;
        
        case 59:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_txtnoe", 16, 28, true);
            extra_ja_vspace = 2;
            break;
        
        case 60:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 2, "snd_txtral", 12, 20, false);
            break;
        
        case 61:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 2, "snd_txtsus", 12, 20, false);
            break;
        
        case 62:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_txtq_2", 16, 36, true);
            break;
        
        case 63:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 2, "snd_txtnoe", 8, 18, false);
            break;
        
        case 64:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 1, 2, "snd_txtnoe", 8, 18, false);
            break;
        
        case 65:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_txtrx1", 16, 36, true);
            break;
        
        case 66:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_txtspam", 16, 36, true);
            break;
        
        case 67:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_txtspam2", 16, 36, true);
            break;
        
        case 68:
        
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, "snd_txtspam", 9, 20, false);
            break;
        
        case 69:
        
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, "snd_txtber", 9, 20, false);
            extra_ja_vspace = 2;
            break;
        
        case 70:
        
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, "snd_txtq", 9, 20, false);
            extra_ja_vspace = 2;
            break;
        
        case 71:
        
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, "snd_txtq", 9, 20, false);
            extra_ja_vspace = 2;
            break;
        
        case 72:
        
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, "snd_txtspam2", 9, 20, false);
            extra_ja_vspace = 2;
            break;
        
        case 74:
        
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, "snd_txtral", 9, 20, false);
            extra_ja_vspace = 2;
            break;
        
        case 75:
        
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, "snd_txtsus", 9, 20, false);
            extra_ja_vspace = 2;
            break;
        
        case 76:
        
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, "snd_txtnoe", 9, 20, false);
            extra_ja_vspace = 2;
            break;
        
        case 77:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, "snd_txtber", 16, 28, true);
            extra_ja_vspace = 2;
            break;
        
        case 78:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 36, 0, 1, "snd_text", 16, 36, true);
            break;
        
        case 79:
        
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 2, "snd_txtsus", 18, 36, true);
            break;
        
        case 80:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, "snd_nosound", 8, 18, false);
            break;
        
        case 81:
        
            scr_textsetup(scr_84_get_font("dotumche"), c_white, x, y, 33, 0, 1, "snd_nosound", 9, 20, false);
            extra_ja_vspace = 2;
            break;
        
        case 87:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, "snd_txtcar", 8, 18, false);
            break;
        
        case 666:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 4, "snd_nosound", 12, 20, 2);
            break;
        
        case 667:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 2, "snd_nosound", 12, 20, 2);
            break;
        
        case 999:
        
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 4, "snd_txtecho", 8, 18, 3);
            break;
        
        case 100:
        
            scr_textsetup(scr_84_get_font("8bit"), c_white, x, y, 22, 0, 1, "snd_text", 16, 20, false);
            break;
        
        default:
        
            font_set = false;
            break;
    }
    
    if (font_set && global.lang == "ja")
    {
		var fntname = font_get_name(myfont)
		
        if (fntname == "fnt_ja_main")
        {
            hspace = ((hspace * 26) / 16) + 1;
            
            if (vspace == 32)
            {
                vspace = 36;
            }
        }
        else if (fntname == "fnt_ja_mainbig")
        {
            hspace = ((hspace * 13) / 8) + 1;
        }
        else if (fntname == "fnt_ja_comicsans")
        {
            textscale = 0.5;
            hspace = ((hspace * 13) / 8) + 3;
        }
        else if (fntname == "fnt_ja_tinynoelle")
        {
            textscale = 0.5;
            hspace = ((hspace * 13) / 8) + 1;
        }
        else if (fntname == "fnt_ja_dotumche")
        {
            hspace = ((hspace * 26) / 16) + 1;
        }
        else if (fntname == "fnt_ja_small")
        {
            hspace = ((hspace * 13) / 8) + 1;
        }
        
        vspace += extra_ja_vspace;
    }
}

function scr_textsound()
{
    playtextsound = true;
    
    if (button2_h() == true) // true is already true, isn't it toby????
    {
        var dontplaysound = true;
        
        if (variable_instance_exists(id, "runcheck"))
        {
            if (runcheck)
            {
                dontplaysound = false;
            }
        }
        
        if (dontplaysound)
        {
            playtextsound = false;
        }
    }
    
    if (skippable == false)
    {
        playtextsound = true;
    }
    
    if (playtextsound == true)
    {
        if (rate <= 2)
        {
            getchar = string_char_at(mystring, pos);
        }
        else
        {
            getchar = string_char_at(mystring, pos - 1);
        }
        
        play = true;
        playcheck = false;
        
        if (getchar == "&" || getchar == "\n")
        {
            if (rate < 3)
            {
                playcheck = true;
                getchar = string_char_at(mystring, pos + 1);
            }
            else
            {
                play = false;
            }
        }

        // Lower the Amount of If Statements (Also allows for Easily adding more letters to the blacklist, rather than having to do a lot of CtrlC+CtrlV)
	var soundblacklist = [" ", "^", "!", ".", "?", ",", ":", "/", "\\", "|", "*"];
		
        var i = 0
	while i < array_length(soundblacklist)
	{
		if getchar == soundblacklist[i]
		{
			play = false;
			break;
		}
		i++
	}
        
        if (play == true)
        {
	    var textname = audio_get_name(textsound)
            if (textname == "snd_txtq")
            {
                audio_stop_sound(snd_txtq_2);
                qv = snd_play(snd_txtq_2);
                qp = 0.9 + random(0.15);
                snd_pitch(qv, qp);
                sound_timer = 2;
            }
            else if (textname == "snd_txtspam")
            {
                audio_stop_sound(snd_txtspam2);
                snd_play_x(snd_txtspam2, 0.8, 1.2);
                sound_timer = 2;
            }
            else if (textname == "snd_txtsans")
            {
                audio_stop_sound(snd_txtsans);
                qv = snd_play(snd_txtsans);
                sound_timer = 2;
            }
            else
            {
                snd_play(textsound);
            }
            
            with (obj_face_parent)
            {
                mouthmove = true;
            }
            
            miniface_pos++;
        }
    }
}
