function scr_speaker(speak)
{
    _speaker = speak;
    global.typer = 5;
    
    if (global.darkzone == 1)
        global.typer = 6;
    
    if (global.fighting == 1)
        global.typer = 4;
    
    global.fc = 0;
    global.fe = 0;
    
    if (_speaker == "silent" && global.darkzone == 0)
        global.typer = 2;
    
    if (_speaker == "silent" && global.darkzone == 1)
        global.typer = 36;
    
    if (_speaker == "balloon" || _speaker == "enemy")
        global.typer = 50;
    
    if (_speaker == "sans")
    {
        global.typer = 14;
        global.fc = 6;
    }
    
    if (_speaker == "undyne" || _speaker == "und")
    {
        global.typer = 17;
        global.fc = 9;
    }
    
    if (_speaker == "temmie" || _speaker == "tem")
        global.typer = 21;
    
    if (_speaker == "jevil")
		global.typer = 35;
    
    if (_speaker == "catti")
        global.fc = 13;
    
    if (_speaker == "jockington" || _speaker == "joc")
        global.fc = 14;
    
    if (_speaker == "catty" || _speaker == "caddy")
        global.fc = 16;
    
    if (_speaker == "bratty" || _speaker == "bra")
        global.fc = 17;
    
    if (_speaker == "rouxls" || _speaker == "rou")
        global.fc = 18;
    
    if (_speaker == "burgerpants" || _speaker == "bur")
        global.fc = 19;
    
    if (_speaker == "spamton")
    {
        if (global.fighting == 0)
            global.typer = 66;
        else
            global.typer = 68;
    }
    
    if (_speaker == "sneo")
        global.typer = 67;
    
    if (_speaker == "tenna")
    {
        global.typer = 80;
        
        if (global.fighting == 1)
            global.typer = 81;
    }
    
    if (_speaker == "susie" || _speaker == "sus")
    {
        global.fc = 1;
        global.typer = 10;
        
        if (global.darkzone == 1)
        {
            global.typer = 30;
            
            if (global.fighting == 1)
                global.typer = 47;
        }
    }
    
    if (_speaker == "ralsei" || _speaker == "ral")
    {
        global.fc = 2;
        global.typer = 31;
        
        if (global.fighting == 1)
            global.typer = 45;
        
        if (global.flag[30] == 1)
            global.typer = 6;
    }
    
    if (_speaker == "noelle" || _speaker == "noe")
    {
        global.fc = 3;
        
        if (global.darkzone == 0)
            global.typer = 12;
        else
            global.typer = 56;
        
        if (global.fighting == 1)
            global.typer = 59;
    }
    
    if (_speaker == "toriel" || _speaker == "tor")
    {
        global.fc = 4;
        global.typer = 7;
    }
    
    if (_speaker == "asgore" || _speaker == "asg")
    {
        global.fc = 10;
        global.typer = 18;
    }
    
    if (_speaker == "king" || _speaker == "kin")
    {
        global.fc = 20;
        global.typer = 33;
        
        if (global.chapter == 1)
        {
            if (global.plot < 235)
                global.typer = 36;
        }
        
        if (global.fighting == 1)
            global.typer = 48;
    }
    
    if (_speaker == "rudy" || _speaker == "rud")
    {
        global.fc = 15;
        global.typer = 55;
    }
    
    if (_speaker == "lancer" || _speaker == "lan")
    {
        global.fc = 5;
        global.typer = 32;
        
        if (global.fighting == 1)
            global.typer = 46;
    }
    
    if (_speaker == "berdly" || _speaker == "ber")
    {
        global.fc = 12;
        
        if (global.darkzone == 0)
            global.typer = 13;
        else
            global.typer = 57;
        
        if (global.fighting == 1)
            global.typer = 77;
    }
    
    if (_speaker == "alphys" || _speaker == "alp")
    {
        global.fc = 11;
        global.typer = 20;
    }
    
    if (_speaker == "queen" || _speaker == "que")
    {
        global.fc = 21;
        global.typer = 58;
    }
    
    if (_speaker == "queen_2" || _speaker == "que_2")
    {
        global.fc = 21;
        global.typer = 62;
    }
}

function scr_anyface_next(arg0, arg1)
{
    global.msgno++;
    scr_anyface(arg0, global.msgno, arg1);
}

function scr_anyface(arg0, arg1, arg2)
{
    _speakerC = arg0;
    _msgno = arg1;
    _emotion = arg2;
    
    if (is_real(arg2))
    {
        if (arg2 >= 10)
        {
            if (arg2 < 36)
                _emotion = chr(55 + arg2);
            else
                emotion = chr(61 + arg2);
        }
    }
    
    _speaker = string_lower(_speakerC);
    msgsetsub(arg1, "* Face ~1 not found/", _speaker);
    
    if (_speaker == "susie" || _speaker == "sus")
        scr_susface(_msgno, _emotion);
    
    if (_speaker == "ralsei" || _speaker == "ral")
        scr_ralface(_msgno, _emotion);
    
    if (_speaker == "noelle" || _speaker == "noe")
        scr_noeface(_msgno, _emotion);
    
    if (_speaker == "toriel" || _speaker == "tor")
        scr_torface(_msgno, _emotion);
    
    if (_speaker == "asgore" || _speaker == "asg")
        scr_asgface(_msgno, _emotion);
    
    if (_speaker == "king" || _speaker == "kin")
        scr_kingface(_msgno, _emotion);
    
    if (_speaker == "rudy" || _speaker == "rud")
        scr_rudface(_msgno, _emotion);
    
    if (_speaker == "lancer" || _speaker == "lan")
        scr_lanface(_msgno, _emotion);
    
    if (_speaker == "berdly" || _speaker == "ber")
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\FB \\TB %", string(_emotion));
    
    if (_speaker == "alphys" || _speaker == "alp")
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\Fa \\Ta %", string(_emotion));
    
    if (_speaker == "none" || _speaker == "x" || _speaker == "no name" || _speaker == "no_name")
        scr_noface(_msgno);
    
    if (_speaker == "rouxls" || _speaker == "rou")
        scr_rurusface(_msgno, _emotion);
    
    if (_speaker == "queen" || _speaker == "que")
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\FQ \\TQ %", string(_emotion));
    
    if (_speaker == "queen2" || _speaker == "que2")
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\F0 \\Tq %", string(_emotion));
    
    if (_speaker == "sans" || _speaker == "san")
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\Fs \\Ts %", string(_emotion));
    
    if (_speaker == "undyne" || _speaker == "und")
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\FU \\TU %", string(_emotion));
    
    if (_speaker == "burgerpants")
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\Fb \\T0 %", string(_emotion));
    
    if (_speaker == "sneo")
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\Tp %", string(_emotion));
    
    if (_speaker == "carol")
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\FC \\TC %", string(_emotion));
    
    if (_speaker == "bratty")
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\Fy \\T0 %", string(_emotion));
    
    if (_speaker == "catti")
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\Fi \\T0 %", string(_emotion));
    
    if (_speaker == "jackenstein")
        msgset(arg1, "\\TX \\F0 \\Tj %", string(_emotion));
    
    if (_speaker == "jackenstein_cute")
        msgset(arg1, "\\TX \\F0 \\Tk %", string(_emotion));
    
    if (_speaker == "tenna")
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\Tv %", string(_emotion));
    
    if (_speaker == "gerson")
        msgset(arg1, "\\TX \\F0 \\Tg %", string(_emotion));
}

function scr_susface(arg0, arg1)
{
    global.msg[arg0] = stringsetsub("\\TX \\F0 \\E~1 \\FS \\TS %", string(arg1));
}

function scr_ralface(arg0, arg1)
{
    global.msg[arg0] = stringsetsub("\\TX \\F0 \\E~1 \\FR \\TR %", string(arg1));
}

function scr_noeface(arg0, arg1)
{
    global.msg[arg0] = stringsetsub("\\TX \\F0 \\E~1 \\FN \\TN %", string(arg1));
}

function scr_torface(arg0, arg1)
{
    global.msg[arg0] = stringsetsub("\\TX \\F0 \\E~1 \\FT \\TT %", string(arg1));
}

function scr_asgface(arg0, arg1)
{
    global.msg[arg0] = stringsetsub("\\TX \\F0 \\E~1 \\FA \\TA %", string(arg1));
}

function scr_kingface(arg0, arg1)
{
    if ((global.chapter == 1 && global.plot >= 235) || global.chapter >= 2)
        global.msg[arg0] = stringsetsub("\\TX \\F0 \\E~1 \\FK \\TK %", string(arg1));
    else
        global.msg[arg0] = stringsetsub("\\TX \\F0 \\E~1 \\TK %", string(arg1));
}

function scr_rudface(arg0, arg1)
{
    global.msg[arg0] = stringsetsub("\\TX \\F0 \\E~1 \\Fr \\Tr %", string(arg1));
}

function scr_lanface(arg0, arg1)
{
    global.msg[arg0] = stringsetsub("\\TX \\F0 \\E~1 \\FL \\TL %", string(arg1));
}

function scr_noface(arg0)
{
    global.msg[arg0] = "\\TX \\F0 \\T0 %";
}

function scr_rurusface(arg0, arg1)
{
    global.msg[arg0] = stringsetsub("\\TX \\F0 \\E~1 \\Fu \\T0 %", string(arg1));
}