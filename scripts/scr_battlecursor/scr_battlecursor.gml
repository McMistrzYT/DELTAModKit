function scr_battlecursor_memory_reset()
{
    if (global.flag[14] == 0)
    {
        for (i = 0; i < 20; i += 1)
        {
            for (j = 0; j < 20; j += 1)
                global.bmenucoord[i][j] = 0;
        }
    }
}

function scr_battletext()
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    
    battlewriter = instance_create(xx + 30, yy + 376, obj_writer);
    myface = instance_create(xx + 26, yy + 380, obj_face);
    
    with (battlewriter)
    {
        dialoguer = 1;
        facer = 1;
        
        if (global.fc == 0 && originalcharline == 33)
            charline = 26;
    }
    
    return battlewriter;
}

function scr_battletext_default()
{
    global.fc = 0;
    global.typer = 4;
    scr_battletext();
    return battlewriter;
}