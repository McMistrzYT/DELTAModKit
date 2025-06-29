function scr_speaker(speak)
{
    _speaker = speak;
    global.typer = 5;
    
    if (global.darkzone == 1)
        global.typer = 6;
    
    //if (global.fighting == 1)
    //    global.typer = 4;
    
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
