buffer += 1;

if (global.interact == 5)
{
    xx = __view_get(e__VW.XView, view_current);
    yy = __view_get(e__VW.YView, view_current) + 10;
    moveyy = yy;
    var stat_right = langopt(263, 300);
    
    if (obj_mainchara.y > (yy + 120))
        moveyy += 135;
    
    if (global.menuno != 4)
    {
        draw_set_color(c_white);
        ossafe_fill_rectangle(16 + xx, 16 + moveyy, 86 + xx, 70 + moveyy, false);
        ossafe_fill_rectangle(16 + xx, 74 + yy, 86 + xx, 147 + yy, false);
        
        if (global.menuno == 1 || global.menuno == 5 || global.menuno == 6)
            ossafe_fill_rectangle(94 + xx, 16 + yy, 266 + xx, 196 + yy, false);
        
        if (global.menuno == 2)
            ossafe_fill_rectangle(94 + xx, 16 + yy, stat_right + 3 + xx, 224 + yy, false);
        
        if (global.menuno == 3)
            ossafe_fill_rectangle(94 + xx, 16 + yy, 266 + xx, 150 + yy, false);
        
        if (global.menuno == 7)
            ossafe_fill_rectangle(94 + xx, 16 + yy, 266 + xx, 216 + yy, false);
        
        draw_set_color(c_black);
        ossafe_fill_rectangle(19 + xx, 19 + moveyy, 83 + xx, 67 + moveyy, false);
        ossafe_fill_rectangle(19 + xx, 77 + yy, 83 + xx, 144 + yy, false);
        
        if (global.menuno == 1 || global.menuno == 5 || global.menuno == 6)
            ossafe_fill_rectangle(97 + xx, 19 + yy, 263 + xx, 193 + yy, false);
        
        if (global.menuno == 2)
            ossafe_fill_rectangle(97 + xx, 19 + yy, stat_right + xx, 221 + yy, false);
        
        if (global.menuno == 3)
            ossafe_fill_rectangle(97 + xx, 19 + yy, 263 + xx, 147 + yy, false);
        
        if (global.menuno == 7)
            ossafe_fill_rectangle(97 + xx, 19 + yy, 263 + xx, 213 + yy, false);
        
        draw_set_color(c_white);
        draw_set_font(fnt_small);
        draw_text(23 + xx, 49 + moveyy, string_hash_to_newline(stringsetsub("HP  ~1/~2", string(global.lhp), string(global.lmaxhp))));
        draw_text(23 + xx, 40 + moveyy, string_hash_to_newline(stringsetsub("LV  ~1", string(global.llv))));
        draw_text(23 + xx, 58 + moveyy, string_hash_to_newline(stringsetsub("$   ~1", string(global.lgold))));
        draw_set_font(fnt_main);
        draw_text(23 + xx, 20 + moveyy, string_hash_to_newline(global.lcharname));
        var _itemTextColor = hasitems ? c_white : c_gray;
        draw_set_color(_itemTextColor);
        draw_text(42 + xx, 84 + yy, string_hash_to_newline("ITEM"));
        draw_set_color(c_white);
        draw_text(42 + xx, 102 + yy, string_hash_to_newline("STAT"));
        draw_text(42 + xx, 120 + yy, string_hash_to_newline("CELL"));
        
        if (global.menuno == 1 || global.menuno == 5)
        {
            for (i = 0; i < 8; i += 1)
                draw_text(116 + xx, 30 + yy + (i * 16), string_hash_to_newline(global.litemname[i]));
            
            draw_text(116 + xx, 170 + yy, string_hash_to_newline("USE"));
            draw_text(116 + xx + 48, 170 + yy, string_hash_to_newline("INFO"));
            draw_text(116 + xx + 105, 170 + yy, string_hash_to_newline("DROP"));
        }
    }
    
    if (global.menuno == 3)
    {
        for (i = 0; i < 7; i += 1)
            draw_text(116 + xx, 30 + yy + (i * 16), string_hash_to_newline(global.phonename[i]));
    }
    
    if (global.menuno == 2)
    {
        draw_text(108 + xx, 32 + yy, string_hash_to_newline(stringsetsub("\"~1\"", global.lcharname)));
        draw_text(108 + xx, 62 + yy, string_hash_to_newline(stringsetsub("LV  ~1", string(global.llv))));
        draw_text(108 + xx, 78 + yy, string_hash_to_newline(stringsetsub("HP  ~1 / ~2", string(global.lhp), string(global.lmaxhp))));
        draw_text(108 + xx, 110 + yy, string_hash_to_newline(stringsetsub("AT  ~1 (~2)", string(global.lat), string(global.lwstrength))));
        draw_text(108 + xx, 126 + yy, string_hash_to_newline(stringsetsub("DF  ~1 (~2)", string(global.ldf), string(global.ladef))));
        weaponname = "None";
        armorname = "None";
		
		if (global.lweapon > DRLightItem.None) weaponname = scr_lightitem_name(global.lweapon);
		if (global.larmor > DRLightItem.None) armorname = scr_lightitem_name(global.larmor);
        
        draw_text(108 + xx, 156 + yy, string_hash_to_newline(stringsetsub("WEAPON: ~1", weaponname)));
        draw_text(108 + xx, 172 + yy, string_hash_to_newline(stringsetsub("ARMOR: ~1", armorname)));
        draw_text(108 + xx, 192 + yy, string_hash_to_newline(stringsetsub("MONEY: ~1", string(global.lgold))));
        
        if (string_length(global.lcharname) >= 7)
        {
            draw_text(192 + xx, 32 + yy, string_hash_to_newline("???"));
        }
        else if (global.flag[914] > 0)
        {
            var krispreservationsociety = stringsetsub("Since#Chapter ~1", global.flag[914]);
            draw_text(192 + xx, 32 + yy, string_hash_to_newline(krispreservationsociety));
        }
        
        nextlevel = 0;
        draw_text(192 + xx, 110 + yy, string_hash_to_newline(stringsetsub("EXP: ~1", string(global.lxp))));
        
        if (global.llv == 1)
            nextlevel = 10 - global.lxp;
        
        if (global.llv == 2)
            nextlevel = 30 - global.lxp;
        
        if (global.llv == 3)
            nextlevel = 70 - global.lxp;
        
        if (global.llv == 4)
            nextlevel = 120 - global.lxp;
        
        if (global.llv == 5)
            nextlevel = 200 - global.lxp;
        
        if (global.llv == 6)
            nextlevel = 300 - global.lxp;
        
        if (global.llv == 7)
            nextlevel = 500 - global.lxp;
        
        if (global.llv == 8)
            nextlevel = 800 - global.lxp;
        
        if (global.llv == 9)
            nextlevel = 1200 - global.lxp;
        
        if (global.llv == 10)
            nextlevel = 1700 - global.lxp;
        
        if (global.llv == 11)
            nextlevel = 2500 - global.lxp;
        
        if (global.llv == 12)
            nextlevel = 3500 - global.lxp;
        
        if (global.llv == 13)
            nextlevel = 5000 - global.lxp;
        
        if (global.llv == 14)
            nextlevel = 7000 - global.lxp;
        
        if (global.llv == 15)
            nextlevel = 10000 - global.lxp;
        
        if (global.llv == 16)
            nextlevel = 15000 - global.lxp;
        
        if (global.llv == 17)
            nextlevel = 25000 - global.lxp;
        
        if (global.llv == 18)
            nextlevel = 50000 - global.lxp;
        
        if (global.llv == 19)
            nextlevel = 99999 - global.lxp;
        
        if (global.llv >= 20)
            nextlevel = 0;
        
        draw_text(192 + xx, 126 + yy, string_hash_to_newline(stringsetsub("NEXT: ~1", string(nextlevel))));
    }
    
    if (global.menuno == 444)
    {
    }
    
    if (global.menuno == 0)
        draw_sprite(spr_heartsmall, 0, 28 + xx, 88 + yy + (18 * global.menucoord[0]));
    
    if (global.menuno == 1)
        draw_sprite(spr_heartsmall, 0, 104 + xx, 34 + yy + (16 * global.menucoord[1]));
    
    if (global.menuno == 3)
        draw_sprite(spr_heartsmall, 0, 104 + xx, 34 + yy + (16 * global.menucoord[3]));
    
    if (global.menuno == 6)
        draw_sprite(spr_heartsmall, 0, 104 + xx, 34 + yy + (16 * global.menucoord[6]));
    
    if (global.menuno == 7)
        draw_sprite(spr_heartsmall, 0, 104 + xx, 34 + yy + (16 * global.menucoord[7]));
    
    if (global.menuno == 5)
    {
        if (global.menucoord[5] == 0)
            draw_sprite(spr_heartsmall, 0, 104 + xx + (45 * global.menucoord[5]), 174 + yy);
        
        if (global.menucoord[5] == 1)
            draw_sprite(spr_heartsmall, 0, 104 + xx + ((45 * global.menucoord[5]) + 3), 174 + yy);
        
        if (global.menucoord[5] == 2)
            draw_sprite(spr_heartsmall, 0, 104 + xx + ((45 * global.menucoord[5]) + 15), 174 + yy);
    }
}
