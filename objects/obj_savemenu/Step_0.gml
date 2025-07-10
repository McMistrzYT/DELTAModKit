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
            xcoord = !xcoord;
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
    
    if (global.darkzone == 0)
    {
        if (ycoord == 1)
            xcoord = 0;
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
    
    if (global.darkzone == 1)
    {
        if (button1_p() && xcoord == 0 && ycoord == 1 && buffer < 0)
        {
            global.interact = 1;
            menu = instance_create(0, 0, obj_fusionmenu);
            menu.type = 4;
            endme = 2;
        }
        
        if (button1_p() && xcoord == 1 && ycoord == 1 && buffer < 0 && haverecruited)
        {
            global.interact = 1;
            menu = instance_create(0, 0, obj_fusionmenu);
            menu.type = 3;
            menu.subtype = recruitsubtype;
            endme = 2;
        }
    }
    else if (button1_p() && ycoord == 1 && buffer < 0)
    {
        snd_play(snd_select);
        menuno = 10;
        buffer = 3;
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

if (menuno == 10)
{
    if (left_p() || right_p())
        quitxcoord = !quitxcoord;
    
    if (button1_p() && buffer < 0)
    {
        if (quitxcoord == 0)
        {
            snd_play(snd_select);
            menuno = 11;
            quittimer = 0;
        }
        else if (quitxcoord == 1)
        {
            menuno = 0;
            buffer = 3;
            quitxcoord = 0;
        }
    }
    
    if (button2_p() && buffer < 0)
    {
        menuno = 0;
        buffer = 3;
        quitxcoord = 0;
    }
}

if (menuno == 11)
{
    quittimer++;
    
    if (quittimer == 1)
    {
        snd_free_all();
        var lastfade = instance_create(camerax(), cameray(), obj_fadeout);
        lastfade.fadespeed = 0.05;
        lastfade.x = camerax() - 20;
        lastfade.y = cameray() - 20;
        lastfade.image_xscale *= 3;
        lastfade.image_yscale *= 2;
        lastfade.depth = -900000;
    }
    
    if (quittimer >= 50)
        game_restart_true();
}
