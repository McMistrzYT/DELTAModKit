function scr_custommenu_optionxy()
{
    wrap = 0;
    vwrap = 0;
    
    for (_n = 0; _n < menuMax; _n++)
    {
        for (j = 0; j <= menuMaximumID[_n]; j++)
        {
            optionX[_n][j] = menuX[_n] + (wrap * menuSpacingX[_n]);
            optionY[_n][j] = menuY[_n] + (vwrap * menuSpacingY[_n]);
            wrap++;
            
            if (wrap >= menuWidth[_n])
            {
                wrap = 0;
                vwrap++;
            }
        }
    }
}

function scr_custommenu_item_info_refresh()
{
    scr_iteminfo_all();
    scr_itemdesc();
    
    for (i = 0; i < 12; i++)
    {
        menuitemid[i] = global.item[i];
        menuitemdesc[i] = itemdesc[i];
        menuitemname[i] = global.itemnameb[i];
        
        if (menuitemname[i] == " ")
            menuitemname[i] = "---";
    }
    
    for (i = 0; i < global.flag[64]; i += 1)
    {
        pocketitemid[i] = global.pocketitem[i];
        scr_iteminfo(pocketitemid[i]);
        pocketitemname[i] = itemnameb;
        pocketitemdesc[i] = scr_itemdesc_single(global.pocketitem[i]);
        
        if (pocketitemname[i] == " ")
            pocketitemname[i] = "---";
    }
    
    menuMaximumID[0] = 11;
    
    for (var _j = 0; _j <= menuMaximumID[0]; _j++)
    {
        optionID[0][_j] = menuitemid[_j];
        optionText[0][_j] = menuitemname[_j];
        optionTopComment[0][_j] = menuitemdesc[_j];
        optionSelectable[0][_j] = 1;
    }
    
    menuMaximumID[1] = global.flag[64] - 1;
    
    for (var _j = 0; _j <= menuMaximumID[1]; _j++)
    {
        optionID[1][_j] = pocketitemid[_j];
        optionText[1][_j] = pocketitemname[_j];
        optionSelectable[1][_j] = 1;
        optionEffect[1][_j] = 1;
        optionTopComment[1][_j] = pocketitemdesc[_j];
    }
}

function scr_musicmenu_songadd(arg0, arg1)
{
    songOgg[songCount] = arg0;
    songName[songCount] = string(songCount + 1) + " - " + arg1;
    songCount++;
}
