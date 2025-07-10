global.interact = reminteract;
move_d = 0;
move_r = 0;
move_u = 0;
move_l = 0;
press_1 = 0;
press_2 = 0;

if (left_p())
    move_l = 1;

if (right_p())
    move_r = 1;

if (down_p())
    move_d = 1;

if (up_p())
    move_u = 1;

if (left_h())
    lheld++;
else
    lheld = 0;

if (down_h())
    dheld++;
else
    dheld = 0;

if (right_h())
    rheld++;
else
    rheld = 0;

if (up_h())
    uheld++;
else
    uheld = 0;

if (menuVHeld[menu] >= 0)
{
    if (dheld >= menuVHeld[menu] || uheld >= menuVHeld[menu])
        scrolltimer++;
    
    if (scrolltimer >= scrollrepeat)
    {
        if (dheld >= 1)
            move_d = 1;
        else
            move_u = 1;
        
        scrolltimer = 0;
    }
}

if (menuHHeld[menu] >= 0)
{
    if (rheld >= menuHHeld[menu] || lheld >= menuHHeld[menu])
        scrolltimer++;
    
    if (scrolltimer >= scrollrepeat)
    {
        if (rheld >= 1)
            move_r = 1;
        else
            move_l = 1;
        
        scrolltimer = 0;
    }
}

moved = 0;
hpageturn = 0;
vpageturn = 0;
remcoord = menuCoord[menu];

if (move_l == 1 && move_r == 0)
{
    if ((menuCoord[menu] % menuWidth[menu]) == 0 || menuWidth[menu] == 1)
    {
        if (menuHEdgeBehavior[menu] == 1)
            menuCoord[menu] += menuWidth[menu] - 1;
        
        if (menuHEdgeBehavior[menu] == 2)
            hpageturn = -1;
    }
    else
    {
        menuCoord[menu]--;
    }
}
else if (move_r == 1 && move_l == 0)
{
    if ((menuCoord[menu] % menuWidth[menu]) == (menuWidth[menu] - 1) || menuWidth[menu] == 1)
    {
        if (menuHEdgeBehavior[menu] == 1)
            menuCoord[menu] -= menuWidth[menu] - 1;
        
        if (menuHEdgeBehavior[menu] == 2)
            hpageturn = 1;
    }
    else
    {
        menuCoord[menu]++;
    }
}

if (move_d == 1 && move_u == 0)
{
    if (menuCoord[menu] >= ((menuWidth[menu] * (menuHeight[menu] - 1)) + menuScrollCurrent[menu]))
    {
        if (menuVEdgeBehavior[menu] == 1 && menuHeight[menu] >= 2)
            menuCoord[menu] -= menuWidth[menu] * (menuHeight[menu] - 1);
        
        if (menuVEdgeBehavior[menu] == 2)
            vpageturn = 1;
    }
    else
    {
        menuCoord[menu] += menuWidth[menu];
    }
}
else if (move_u == 1 && move_d == 0)
{
    if (menuCoord[menu] < (menuWidth[menu] + menuScrollCurrent[menu]))
    {
        if (menuVEdgeBehavior[menu] == 1 && menuHeight[menu] >= 2)
            menuCoord[menu] += menuWidth[menu] * (menuHeight[menu] - 1);
        
        if (menuVEdgeBehavior[menu] == 2)
            vpageturn = -1;
    }
    else
    {
        menuCoord[menu] -= menuWidth[menu];
    }
}

if (hpageturn != 0 || vpageturn != 0)
{
    cellcount = ceil((menuMaximumID[menu] + 1) / menuPageSize[menu]);
    
    if (vpageturn == -1)
    {
        menuScrollCurrent[menu] -= menuScrollAdd[menu];
        menuCoord[menu] -= menuScrollAdd[menu];
    }
    
    if (vpageturn == 1)
    {
        menuScrollCurrent[menu] += menuScrollAdd[menu];
        menuCoord[menu] += menuScrollAdd[menu];
    }
    
    if (hpageturn == -1)
    {
        if (menuWidth[menu] > 1)
        {
            menuScrollCurrent[menu] -= menuScrollAdd[menu];
            menuCoord[menu] -= (menuScrollAdd[menu] - menuWidth[menu]) + 1;
        }
        else
        {
            prevcord = menuCoord[menu];
            prevscroll = menuScrollCurrent[menu];
            menuScrollCurrent[menu] -= menuScrollAdd[menu];
            menuCoord[menu] -= menuScrollAdd[menu];
            
            if (menuCoord[menu] < menuMinimumID[menu])
            {
                menuCoord[menu] = ((cellcount - 1) * menuPageSize[menu]) + prevcord;
                menuScrollCurrent[menu] = (cellcount - 1) * menuPageSize[menu];
            }
        }
    }
    
    if (hpageturn == 1)
    {
        if (menuWidth[menu] > 1)
        {
            menuScrollCurrent[menu] += menuScrollAdd[menu];
            menuCoord[menu] += (menuScrollAdd[menu] - menuWidth[menu]) + 1;
        }
        else
        {
            prevcord = menuCoord[menu];
            prevscroll = menuScrollCurrent[menu];
            menuScrollCurrent[menu] += menuScrollAdd[menu];
            menuCoord[menu] += menuScrollAdd[menu];
            
            if (menuCoord[menu] > menuMaximumID[menu])
            {
                if (menuScrollCurrent[menu] >= (cellcount * menuPageSize[menu]))
                {
                    menuCoord[menu] = prevcord - prevscroll;
                    menuScrollCurrent[menu] = menuMinimumID[menu];
                }
                else
                {
                    while (menuCoord[menu] > menuMaximumID[menu])
                        menuCoord[menu]--;
                }
            }
        }
    }
    
    if (hpageturn != 0)
    {
        if (menuScrollCurrent[menu] < 0)
        {
            menuScrollCurrent[menu] = menuMaximumID[menu] + menuScrollCurrent[menu];
            menuCoord[menu] = (menuMaximumID[menu] + menuCoord[menu] + menuWidth[menu]) - 1;
        }
        else if (menuScrollCurrent[menu] > menuMaximumID[menu])
        {
            menuScrollCurrent[menu] = menuMaximumID[menu] - menuScrollCurrent[menu];
            menuCoord[menu] = (menuCoord[menu] - menuMaximumID[menu] - menuWidth[menu]) + 1;
        }
    }
    
    if (menuScrollCurrent[menu] <= menuMinimumID[menu])
        menuScrollCurrent[menu] = menuMinimumID[menu];
    
    if (menuScrollCurrent[menu] > menuMaximumID[menu])
        menuScrollCurrent[menu] = menuMaximumID[menu];
    
    if (menuWidth[menu] > 1)
    {
        while ((menuScrollCurrent[menu] % menuWidth[menu]) != 0)
            menuScrollCurrent[menu]++;
    }
    
    if (menuWidth[menu] == 1)
    {
        while ((menuScrollCurrent[menu] % menuHeight[menu]) != 0)
            menuScrollCurrent[menu]++;
    }
}

if (menuCoord[menu] > menuMaximumID[menu])
    menuCoord[menu] = menuMaximumID[menu];

if (menuCoord[menu] < menuMinimumID[menu])
    menuCoord[menu] = menuMinimumID[menu];

confirm_press = 0;
confirm_moved = 0;
confirm_custom = 0;
cancel_press = 0;
third_press = 0;
confirmed = 0;
quit_now = 0;

if (button1_p() && buffer1 <= 0 && buffer2 <= 0)
{
    confirm_press = 1;
    
    if (optionSelectable[menu][menuCoord[menu]])
    {
        optionSelected[menu][menuCoord[menu]] = 1;
        buffer1 = 2;
        
        if (optionEffect[menu][menuCoord[menu]] == 0)
        {
            if (menuNext[menu] < menuMax && menuNext[menu] >= 0)
            {
                menu = menuNext[menu];
                confirm_moved = 1;
            }
        }
        else if (optionEffect[menu][menuCoord[menu]] == 1)
        {
            confirm_custom = 1;
        }
        else if (optionEffect[menu][menuCoord[menu]] == 2)
        {
            cancel_press = 1;
        }
    }
}

if (button2_p() && buffer1 <= 0 && buffer2 <= 0)
    cancel_press = 1;

if (cancel_press == 1)
{
    menu = menuPrevious[menu];
    buffer2 = 2;
    
    if (menu == -1)
    {
        menu = 0;
        quit_now = 1;
    }
    else
    {
        for (j = 0; j < menuMaximumID[menu]; j++)
            optionSelected[menu][menuCoord[menu]] = 0;
    }
}

if (button3_p() && buffer1 <= 0 && buffer2 <= 0 && buffer3 <= 0)
{
    buffer3 = 2;
    third_press = 1;
}

if (quit_now)
{
    if (reminteract == 1)
        global.interact = 0;
    
    instance_destroy();
}

rbuffer -= 1;
ubuffer -= 1;
dbuffer -= 1;
lbuffer -= 1;
buffer1 -= 1;
buffer2 -= 1;
buffer3 -= 1;
