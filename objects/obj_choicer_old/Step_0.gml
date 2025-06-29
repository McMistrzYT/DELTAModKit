if (button1_p())
    event_user(0);

if (left_p())
{
    if (mychoice == 0)
        mychoice = 1;
    else
        mychoice = 0;
    
    if (mychoice == 1)
        x = (185 * dar) + add;
    else
        x = (89 * dar) + add;
}

if (right_p())
{
    if (mychoice == 0)
        mychoice = 1;
    else
        mychoice = 0;
    
    if (mychoice == 1)
        x = (185 * dar) + add;
    else
        x = (89 * dar) + add;
}
