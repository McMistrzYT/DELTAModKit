function scr_iteminfo_all()
{
    for (i = 0; i < 12; i += 1)
    {
        itemid = global.item[i];
        scr_iteminfo(itemid);
        global.itemnameb[i] = itemnameb;
        global.itemdescb[i] = itemdescb;
        global.itemvalue[i] = value;
        global.itemusable[i] = usable;
    }
}

function scr_iteminfo_temp(arg0)
{
    for (i = 0; i < 12; i += 1)
    {
        itemid = tempitem[i][arg0];
        scr_iteminfo(itemid);
        tempitemnameb[i][arg0] = itemnameb;
        tempitemdescb[i][arg0] = itemdescb;
        tempitemvalue[i][arg0] = value;
        tempitemusable[i][arg0] = usable;
    }
}

function scr_itemdesc_single(arg0)
{
    __itemdesc = "---";
	scr_iteminfo(arg0);
    return __itemdesc;
}

function scr_itemname()
{
    for (i = 0; i < 12; i += 1)
    {
        itemid = global.item[i];
        scr_itemnamelist();
    }
}

function scr_itemnamelist()
{
    scr_iteminfo(itemid);
    global.itemname[i] = itemnameb;
}

function scr_keyiteminfo_all()
{
    for (i = 0; i < 12; i += 1)
    {
        keyitemid = global.keyitem[i];
        keyitemname[i] = " ";
        scr_keyiteminfo(keyitemid);
        keyitemusable[i] = tempkeyitemusable;
        keyitemname[i] = tempkeyitemname;
        keyitemdesc[i] = tempkeyitemdesc;
    }
}

function draw_item_icon(arg0, arg1, arg2)
{
    draw_sprite_ext(spr_dmenu_items, arg2, arg0, arg1, 2, 2, 0, draw_get_color(), 1);
}