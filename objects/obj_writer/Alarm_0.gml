var playsound = 0;

if (rate > 2)
{
    alarm[1] = 1;
}
else
{
    sound_timer--;
    
    if (first_alarm == 1 && pos >= 2 && sound_timer <= 0)
        playsound = 1;
}

if (pos <= length)
    alarm[0] = rate;
else
    reachedend = 1;

if (first_alarm == 0)
{
    getchar = string_char_at(mystring, 1);
    
    if (getchar == "\\")
        pos += 3;
    else
        pos += 1;
    
    first_alarm = 1;
}
else
{
    getchar = string_char_at(mystring, pos);
    nextchar = string_char_at(mystring, pos + 1);
    
    if (getchar == "`")
    {
        pos += 2;
        exit;
    }
    
    if (getchar == "&" || getchar == "\n")
        pos += 1;
    
    if (getchar == "\\")
        pos += 3;
    
    if (getchar == "/")
    {
        halt = 1;
        
        if (nextchar == "%")
            halt = 2;
        
        alarm[0] = -1;
    }
    
    getchar = string_char_at(mystring, pos);
    nextchar = string_char_at(mystring, pos + 1);
    
    if (getchar == "|")
        pos += 2;
    
    if (getchar == "^")
    {
        pos += 2;
        
        if (alarm[0] > 0)
        {
            if (nextchar == "1")
                alarm[0] += 5;
            
            if (nextchar == "2")
                alarm[0] += 10;
            
            if (nextchar == "3")
                alarm[0] += 15;
            
            if (nextchar == "4")
                alarm[0] += 20;
            
            if (nextchar == "5")
                alarm[0] += 30;
            
            if (nextchar == "6")
                alarm[0] += 40;
            
            if (nextchar == "7")
                alarm[0] += 60;
            
            if (nextchar == "8")
                alarm[0] += 90;
            
            if (nextchar == "9")
                alarm[0] += 150;
        }
    }
    
    pos += 1;
}

if (reachedend_sound_play)
{
    if (reachedend && !reachedend_sound_played)
        playsound = 0;
}

if playsound scr_textsound()