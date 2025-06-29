if (fadebuffer > 0)
    ONEBUFFER = 1;

if (TYPE > 0)
{
    var OSUR = 0;
    var OSUL = 0;
    var OSUD = 0;
    var OSUU = 0;
    
    if (fadebuffer < 0 && FINISH == 0)
    {
        var dx = 0;
        var dy = 0;
        
        if (right_p())
            OSUR = 1;
        
        if (left_p())
            OSUL = 1;
        
        if (down_p())
            OSUD = 1;
        
        if (up_p())
            OSUU = 1;
        
        if (right_h())
            PANASHIR++;
        else
            PANASHIR = 0;
        
        if (left_h())
            PANASHIL++;
        else
            PANASHIL = 0;
        
        if (up_h())
            PANASHIU++;
        else
            PANASHIU = 0;
        
        if (down_h())
            PANASHID++;
        else
            PANASHID = 0;
        
        if (PANASHIR >= 6)
        {
            PANASHIR = 3;
            OSUR = 1;
        }
        
        if (PANASHIL >= 6)
        {
            PANASHIL = 3;
            OSUL = 1;
        }
        
        if (PANASHIU >= 6)
        {
            PANASHIU = 3;
            OSUU = 1;
        }
        
        if (PANASHID >= 6)
        {
            PANASHID = 3;
            OSUD = 1;
        }
        
        if (OSUR)
            dx = 1;
        
        if (OSUL)
            dx = -1;
        
        if (OSUD)
            dy = 1;
        
        if (OSUU)
            dy = -1;
        
        if (dx != 0 && XMAX > 0)
        {
            var found = false;
            
            do
            {
                CURX = (CURX + (XMAX + 1) + dx) % (XMAX + 1);
                var ccc = NAME[CURX][CURY];
                
                if (ccc != " " && ccc != "　" && ccc != ">" && ccc != "<")
                    found = true;
            }
            until (found);
        }
        else if (dy != 0 && YMAX > 0)
        {
            var found = false;
            
            do
            {
                CURY = (CURY + (YMAX + 1) + dy) % (YMAX + 1);
                var move = true;
                var ccc = "";
                
                while (move)
                {
                    ccc = NAME[CURX][CURY];
                    
                    if (ccc == ">")
                        CURX += 1;
                    else if (ccc == "<")
                        CURX -= 1;
                    else
                        move = false;
                }
                
                if (ccc != " " && ccc != "　")
                    found = true;
            }
            until (found);
        }
    }
}
else if (fadebuffer < 0 && FINISH == 0)
{
    if (right_p())
        CURX = 1;
    
    if (left_p())
        CURX = 0;
}

if (TYPE >= 0 && TYPE <= 2)
{
    DRAWHEART = 1;
    
    if (CURX >= 0)
    {
        IDEALX = NAMEX[CURX][CURY];
        IDEALY = NAMEY[CURX][CURY];
        
        if (TYPE == 0)
        {
            draw_set_font(global.main_font);
            IDEALX += ((string_width(NAME[CURX][CURY]) / 2) - 10);
        }
    }
    else
    {
        IDEALX = 150;
        IDEALY = 180;
    }
    
    if (abs(HEARTX - IDEALX) <= 2)
        HEARTX = IDEALX;
    
    if (abs(HEARTY - IDEALY) <= 2)
        HEARTY = IDEALY;
    
    HEARTDIFF = (IDEALX - HEARTX) * 0.3;
    HEARTX += HEARTDIFF;
    
    if (DRAWHEART == 0)
    {
        HEARTX = IDEALX;
        DRAWHEART = 1;
    }
    
    HEARTDIFF = (IDEALY - HEARTY) * 0.3;
    HEARTY += HEARTDIFF;
    
    if (DRAWHEART == 0)
    {
        HEARTY = IDEALY;
        DRAWHEART = 1;
    }
    
    if (FINISH == 0)
    {
        if (button1_p() && CURX >= 0 && ONEBUFFER < 0)
        {
            global.choice = CURX;
            
            if (TYPE == 2)
                global.choice = CURY;
            
            FINISH = 1;
            ONEBUFFER = 99;
        }
    }
}

if (TYPE == 3)
{
    DRAWHEART = 1;
    var str = NAME[CURX][CURY];
    var cmd = "";
    
    if (string_length(str) > 1)
    {
        cmd = string_char_at(str, 2);
        str = string_copy(str, 4, string_length(str) - 3);
    }
    
    draw_set_font(global.main_font);
    IDEALX = (NAMEX[CURX][CURY] + (string_width(str) / 2)) - 10;
    IDEALY = NAMEY[CURX][CURY] - 2;
    
    if (abs(HEARTX - IDEALX) <= 2)
        HEARTX = IDEALX;
    
    if (abs(HEARTY - IDEALY) <= 2)
        HEARTY = IDEALY;
    
    HEARTDIFF = (IDEALX - HEARTX) * 0.5;
    
    if (abs(HEARTDIFF) > 60)
        DRAWHEART = 0;
    
    HEARTX += HEARTDIFF;
    
    if (DRAWHEART == 0)
    {
        HEARTX = IDEALX;
        DRAWHEART = 1;
    }
    
    HEARTDIFF = (IDEALY - HEARTY) * 0.5;
    
    if (abs(HEARTDIFF) > 60)
        DRAWHEART = 0;
    
    HEARTY += HEARTDIFF;
    
    if (DRAWHEART == 0)
    {
        HEARTY = IDEALY;
        DRAWHEART = 1;
    }
    
    ERASE = 0;
    
    if (FINISH == 0)
    {
        if (button2_p())
            ERASE = 1;
        
        if (button1_p() && ONEBUFFER < 0)
        {
            if (cmd == "")
            {
                if (string_length(NAMESTRING) < STRINGMAX)
                    NAMESTRING += NAME[CURX][CURY];
            }
            
            if (cmd == "B")
                ERASE = 1;
            
            if (cmd == "1" || cmd == "2" || cmd == "3")
            {
                var new_type = real(cmd);
                
                if (LANGSUBTYPE != new_type)
                {
                    LANGSUBTYPE = new_type;
                }
            }
            
            if (cmd == "E" && ONEBUFFER < 0 && string_length(NAMESTRING) >= 1)
            {
                ONEBUFFER = 99;
                FINISH = 1;
                global.choice = 1;
            }
        }
    }
    
    if (ERASE == 1 && string_length(NAMESTRING) == 0)
        backout = 1;
    
    if (ERASE == 1 && FINISH == 0)
    {
        if (string_length(NAMESTRING) > 0)
            NAMESTRING = string_delete(NAMESTRING, string_length(NAMESTRING), 1);
    }
}

ONEBUFFER -= 1;

if (FINISH == 0)
    fadebuffer -= 1;

if (FINISH == 1)
{
    global.flag[20] = 1;
    
    if (fadebuffer < 0)
        fadebuffer = 0;
    
    fadebuffer += 1;
    
    if (fadebuffer >= 10)
        instance_destroy();
}
