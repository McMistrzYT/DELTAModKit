buffer -= 1;

if (menuno == 0)
{
    if (xcoord == 2 && buffer < 0)
    {
        if (button1_p())
        {
            xcoord = 99;
            endme = 1;
        }
    }
    
    if (xcoord < 2)
    {
        if (left_p() || right_p())
        {
            if (xcoord == 1)
                xcoord = 0;
            else
                xcoord = 1;
        }
    }
    
    if (type == 1)
    {
        if (up_p() || down_p())
        {
            if (ycoord == 1)
                ycoord = 0;
            else
                ycoord = 1;
        }
    }
    
    if (xcoord == 0 && ycoord == 0 && buffer < 0)
    {
        if (button1_p())
        {
            menuno = 1;
            buffer = 3;
            snd_play(snd_select);
        }
    }
    
    if (button1_p() && xcoord == 1 && ycoord == 0 && buffer < 0)
        endme = 1;
    
    if (button1_p() && xcoord == 0 && ycoord == 1 && buffer < 0)
    {
        global.interact = 1;
        //menu = instance_create(0, 0, obj_fusionmenu);
        //menu.type = 4;
        endme = 2;
    }
    
    if (button1_p() && xcoord == 1 && ycoord == 1 && buffer < 0 && haverecruited)
    {
        global.interact = 1;
        //menu = instance_create(0, 0, obj_fusionmenu);
        //menu.type = 3;
        //menu.subtype = recruitsubtype;
        endme = 2;
    }
    
    if (button2_p() && buffer < 0 && endme == 0)
        endme = 1;
    
    if (endme == 1)
    {
        global.interact = 0;
        
        with (obj_mainchara)
            onebuffer = 3;
        
        instance_destroy();
    }
    
    if (endme == 2)
    {
        with (obj_mainchara)
            onebuffer = 3;
        
        instance_destroy();
    }
}

if (menuno == 1)
{
    var menuwidth = 60;
    var menuheight = 80;
    scr_darkbox_black(camerax() + 120, cameray() + 110, camerax() + 120 + menuwidth, cameray() + 110 + menuheight);
}
