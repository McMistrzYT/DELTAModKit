function scr_charbox_x(charid)
{
    if (charid == 0 && chartotal == 3)
        return 0;
    
    if (charid == 1 && chartotal == 3)
        return 212;
    
    if (charid == 2 && chartotal == 3)
        return 424;
    
    if (charid == 0 && chartotal == 2)
        return 106;
    
    if (charid == 1 && chartotal == 2)
        return 326;
    
    if (charid == 0 && chartotal == 1)
        return 212;
}

function scr_itemcomment(charid, msg)
{
    talkx = scr_charbox_x(charid);
    itemcomment = instance_create(talkx + xx, yy + 460, obj_menuwriter);
    itemcomment.msg = msg;
    itemcomment.who = charid;
    
    if (global.flag[32] == 1)
    {
        with (itemcomment)
            instance_destroy();
    }
}

function scr_keyitemcheck(itemid)
{
    haveit = 0;
    itemcount = 0;
    
    for (i = 0; i < 12; i += 1)
    {
        if (global.keyitem[i] == itemid)
            haveit = 1;
        
        if (global.keyitem[i] == itemid)
            itemcount += 1;
    }
    
    return haveit;
}

function scr_keyitemremove(arg0)
{
    removed = 0;
    scr_keyitemcheck(arg0);
    
    if (haveit == 1)
    {
        loc = 0;
        skip = 0;
        
        if (global.keyitem[0] == arg0 && skip == 0)
        {
            loc = 0;
            skip = 1;
        }
        
        if (global.keyitem[1] == arg0 && skip == 0)
        {
            loc = 1;
            skip = 1;
        }
        
        if (global.keyitem[2] == arg0 && skip == 0)
        {
            loc = 2;
            skip = 1;
        }
        
        if (global.keyitem[3] == arg0 && skip == 0)
        {
            loc = 3;
            skip = 1;
        }
        
        if (global.keyitem[4] == arg0 && skip == 0)
        {
            loc = 4;
            skip = 1;
        }
        
        if (global.keyitem[5] == arg0 && skip == 0)
        {
            loc = 5;
            skip = 1;
        }
        
        if (global.keyitem[6] == arg0 && skip == 0)
        {
            loc = 6;
            skip = 1;
        }
        
        if (global.keyitem[7] == arg0 && skip == 0)
        {
            loc = 7;
            skip = 1;
        }
        
        if (global.keyitem[8] == arg0 && skip == 0)
        {
            loc = 8;
            skip = 1;
        }
        
        if (global.keyitem[9] == arg0 && skip == 0)
        {
            loc = 9;
            skip = 1;
        }
        
        if (global.keyitem[10] == arg0 && skip == 0)
        {
            loc = 10;
            skip = 1;
        }
        
        if (global.keyitem[11] == arg0 && skip == 0)
        {
            loc = 11;
            skip = 1;
        }
        
        scr_keyitemshift(loc, 0);
        removed = 1;
    }
}

function scr_keyitemshift(arg0, arg1)
{
    global.keyitem[12] = arg1;
    
    for (i = arg0; i < 12; i += 1)
        global.keyitem[i] = global.keyitem[i + 1];
    
    scr_keyiteminfo_all();
}

function scr_itemdesc()
{
    for (i = 0; i < 12; i += 1)
    {
        itemid = global.item[i];
        itemdesc[i] = scr_itemdesc_single(itemid);
    }
}

function scr_itemdialoguer()
{
    global.interact = 6;
    
    with (obj_darkcontroller)
        charcon = 0;
    
    global.menuno = -1;
    charcon = 0;
    instance_create(0, 0, obj_dialoguer);
}

function scr_itemcheck(arg0)
{
    haveit = 0;
    itemcount = 0;
    
    for (var __i = 0; __i < 12; __i += 1)
    {
        if (global.item[__i] == arg0)
            haveit = 1;
        
        if (global.item[__i] == arg0)
            itemcount += 1;
    }
    
    return haveit;
}

function scr_itemget(itemid)
{
    var __i = 0;
    var loop = 1;
    noroom = 0;
    _pocketed = 0;
    _noroominventory = 0;
    global.item[12] = 999;
    
    while (loop == 1)
    {
        if (global.item[__i] == 0)
        {
            global.item[__i] = itemid;
            break;
        }
        
        if (__i == 12)
        {
            _noroominventory = 1;
            noroom = 1;
            
            for (var __j = 0; __j < global.flag[64]; __j++)
            {
                if (global.pocketitem[__j] == 0)
                {
                    show_debug_message("Placed in pocket :" + string(__j));
                    global.pocketitem[__j] = itemid;
                    _pocketed = 1;
                    noroom = 0;
                    break;
                }
            }
            
            break;
        }
        
        __i += 1;
    }
    
    script_execute(scr_iteminfo_all);
    show_debug_message("noroom=" + string(noroom));
    show_debug_message("_pocketed=" + string(_pocketed));
    show_debug_message("_noroominventory=" + string(_noroominventory));
}

function scr_keyitemget(kitemid)
{
    i = 0;
    loop = 1;
    noroom = 0;
    global.item[12] = 999;
    
    while (loop == 1)
    {
        if (global.keyitem[i] == 0)
        {
            global.keyitem[i] = kitemid;
            break;
        }
        
        if (i == 12)
        {
            noroom = 1;
            break;
        }
        
        i += 1;
    }
    
    script_execute(scr_keyiteminfo_all);
}

function scr_itemremove(arg0)
{
    removed = 0;
    scr_itemcheck(arg0);
    
    if (haveit == 1)
    {
        loc = 0;
        skip = 0;
        
        if (global.item[0] == arg0 && skip == 0)
        {
            loc = 0;
            skip = 1;
        }
        
        if (global.item[1] == arg0 && skip == 0)
        {
            loc = 1;
            skip = 1;
        }
        
        if (global.item[2] == arg0 && skip == 0)
        {
            loc = 2;
            skip = 1;
        }
        
        if (global.item[3] == arg0 && skip == 0)
        {
            loc = 3;
            skip = 1;
        }
        
        if (global.item[4] == arg0 && skip == 0)
        {
            loc = 4;
            skip = 1;
        }
        
        if (global.item[5] == arg0 && skip == 0)
        {
            loc = 5;
            skip = 1;
        }
        
        if (global.item[6] == arg0 && skip == 0)
        {
            loc = 6;
            skip = 1;
        }
        
        if (global.item[7] == arg0 && skip == 0)
        {
            loc = 7;
            skip = 1;
        }
        
        if (global.item[8] == arg0 && skip == 0)
        {
            loc = 8;
            skip = 1;
        }
        
        if (global.item[9] == arg0 && skip == 0)
        {
            loc = 9;
            skip = 1;
        }
        
        if (global.item[10] == arg0 && skip == 0)
        {
            loc = 10;
            skip = 1;
        }
        
        if (global.item[11] == arg0 && skip == 0)
        {
            loc = 11;
            skip = 1;
        }
        
        scr_itemshift(loc, 0);
        removed = 1;
    }
}

function scr_itemshift(arg0, arg1)
{
    global.item[12] = arg1;
    
    for (i = arg0; i < 12; i += 1)
        global.item[i] = global.item[i + 1];
    
    scr_iteminfo_all();
    scr_itemname();
}

function scr_itemshift_temp(arg0, arg1)
{
    tempitem[12][arg1] = 0;
    
    for (i = arg0; i < 12; i += 1)
        tempitem[i][arg1] = tempitem[i + 1][arg1];
}

function scr_healitem(chara, amnt)
{
    scr_heal(chara, amnt);
    healx = scr_charbox_x(chara);
    healtext = instance_create(healx + 70 + xx, yy + 430, obj_healwriter);
    healtext.healamt = amnt;
}

function scr_healitem_all(amnt)
{
    scr_healall(amnt);
    
    for (i = 0; i < chartotal; i += 1)
    {
        healx = scr_charbox_x(i);
        healtext = instance_create(healx + 70 + xx, yy + 430, obj_healwriter);
        healtext.healamt = amnt;
    }
}

function scr_itemuse(arg0)
{
    w = arg0;
    usable = 0;
    replaceable = 0;
    
    if (global.charselect < 3)
        _gc = global.char[global.charselect];
	
	if (w < 10000)
		scr_item_use_action_overworld(w);
	else
		scr_key_item_use_action_overworld(w - 10000);
}