function scr_charcan(arg0)
{
    charcan = 1;
    
    if (global.hp[global.char[arg0]] <= 0)
        charcan = 0;
    
    if (global.acting[arg0] == 1)
        charcan = 0;
    
    if (global.char[arg0] == 0)
        charcan = 0;
    
    if (global.charmove[arg0] == 0)
        charcan = 0;
    
    if (global.charauto[global.char[arg0]] == 1)
        charcan = 0;
    
    return charcan;
}
