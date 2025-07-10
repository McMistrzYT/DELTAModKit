if (EVENT == 1)
{
    snd_free_all();
    
    if (global.chapter == 1)
    {
        global.currentsong[0] = snd_init("AUDIO_DRONE.ogg");
        global.currentsong[1] = mus_loop(global.currentsong[0]);
        global.typer = 667;
        global.fc = 0;
        global.msg[0] = "\\M0 IT APPEARS YOU& HAVE REACHED^6& &    AN END./%";
        EVENT = 2;
        W = instance_create(70, 80, obj_writer);
        
        if (global.tempflag[3] >= 1)
        {
            with (obj_writer)
                instance_destroy();
        }
    }
    else if (text_timer > 0)
    {
        text_timer--;
    }
    else
    {
        EVENT = 3;
        alarm[4] = 30;
        global.currentsong[0] = snd_init("AUDIO_DEFEAT.ogg");
        global.currentsong[1] = mus_loop(global.currentsong[0]);
        var voice = choose(0, 1);
        
        if (!scr_havechar(DRCharacter.Susie))
            voice = 1;
        else if (!scr_havechar(DRCharacter.Ralsei))
            voice = 0;
        
        if (scr_havechar(DRCharacter.Susie) || scr_havechar(DRCharacter.Ralsei))
        {
            if (voice == 0)
            {
                scr_speaker("no_name");
                msgset(0, "  Come on^1,&  that all you got!?/");
                msgnext("  Kris^1,&  get up...!/%");
                global.typer = 61;
                global.fc = 0;
            }
            else
            {
                scr_speaker("no_name");
                msgset(0, "  This is not&  your fate...!/");
                msgnext("  Please^1,&  don't give up!/%");
                global.typer = 60;
                global.fc = 0;
            }
            
            var xx = 50;
            
            if (global.lang == "ja")
                xx = 44;
            
            W = instance_create(50, 150, obj_writer);
        }
    }
}

if (EVENT == 0)
    EVENT = 1;

if (EVENT == 2 && !instance_exists(obj_writer))
{
    EVENT = 3;
    alarm[4] = 30;
    global.msg[0] = "\\M0 WILL YOU TRY AGAIN?";
    
    if (global.tempflag[3] >= 1)
        global.msg[0] = "\\M0 WILL YOU PERSIST?";
    
    if (global.tempflag[3] >= 1)
        alarm[4] = 15;
    
    W = instance_create(langopt(40, 84), 80, obj_writer);
}

if (EVENT == 4 && !instance_exists(obj_writer))
{
    if (global.chapter == 1)
    {
        choice = instance_create(100, 120, DEVICE_CHOICE);
        EVENT = 5;
    }
    else if (!instance_exists(obj_writer))
    {
        choice = instance_create(100, 120, DEVICE_CHOICE);
        
        if (global.chapter > 1)
        {
            with (choice)
            {
                NAME[0][0] = "CONTINUE";
                NAME[1][0] = "GIVE UP";
                NAMEX[0][0] = 80;
                NAMEX[1][0] = 190;
                NAMEY[0][0] = 180;
                NAMEY[1][0] = 180;
                XMAX = 1;
                CURX = -1;
                IDEALX = 190;
                IDEALY = 180;
            }
        }
        
        EVENT = 5;
    }
}

if (EVENT == 5)
{
    if (global.choice == 0)
    {
        with (obj_writer)
            instance_destroy();
        
        EVENT = 6;
    }
    
    if (global.choice == 1)
    {
        with (obj_writer)
            instance_destroy();
        
        EVENT = 26;
    }
}

if (EVENT == 6)
{
    snd_free_all();
    EVENT = 7;
    alarm[4] = 30;
    
    if (global.chapter == 1)
    {
        global.flag[6] = 1;
        global.msg[0] = " THEN, THE FUTURE& IS IN YOUR HANDS.";
        W = instance_create(50, 80, obj_writer);
        
        if (global.tempflag[3] >= 1)
        {
            with (obj_writer)
                instance_destroy();
            
            alarm[4] = 1;
        }
    }
}

if (EVENT == 8)
{
    WHITEFADE = 1;
    FADEUP = 0.01;
    EVENT = 9;
    alarm[4] = 120;
    
    if (global.tempflag[3] >= 1)
    {
        FADEUP = 0.03;
        alarm[4] = 45;
    }
    else
    {
        snd_play(snd_dtrans_lw);
    }
    
    global.tempflag[3] += 1;
}

if (EVENT == 10)
{
    scr_windowcaption("THE DARK");
    scr_tempload();
    EVENT = 11;
}

if (EVENT == 26)
{
    snd_free_all();
    
    if (global.chapter > 1)
    {
        if (i_ex(obj_gameoverbg))
            instance_destroy(obj_gameoverbg);
    }
    
    global.typer = 667;
    global.msg[0] = "\\M0 THEN THE WORLD^5 & WAS COVERED^5 & IN DARKNESS./%";
    EVENT = 27;
    W = instance_create(60, 80, obj_writer);
}

if (EVENT == 27 && !instance_exists(obj_writer))
{
    global.currentsong[0] = snd_init("AUDIO_DARKNESS.ogg");
    global.currentsong[1] = mus_play(global.currentsong[0]);
    EVENT = 28;
    DARK_WAIT = 0;
}

if (EVENT == 28)
{
    DARK_WAIT += 1;
    
    if (DARK_WAIT >= 2040)
        ossafe_game_end();
    
    if (!snd_is_playing(global.currentsong[1]))
        ossafe_game_end();
}

if (EVENT >= 0 && EVENT <= 4)
{
    if (button2_h())
    {
        with (obj_writer)
        {
            if (pos < (length - 3))
                pos += 2;
            
            if (specfade <= 0.9)
                specfade -= 0.1;
            
            if (rate <= 1)
                rate = 1;
        }
    }
}