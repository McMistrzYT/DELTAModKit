xx = __view_get(e__VW.XView, 0);
yy = __view_get(e__VW.YView, 0);

if (saved == 0)
    time_current = global.time;

draw_set_font(global.main_font);

if (d == 2)
    draw_set_font(global.mainbig_font);

if (menuno == 0)
{
    if (d == 1)
    {
        draw_set_color(c_white);
        draw_rectangle(50 + xx, 49 + yy, 269 + xx, 135 + yy, false);
        draw_set_color(c_black);
        draw_rectangle((53 * d) + xx, (52 * d) + yy, (266 * d) + xx, (132 * d) + yy, false);
    }
    else
    {
        scr_darkbox(((54 * d) + xx) - 16, (49 * d) + yy, (265 * d) + xx + 16, (135 * d) + yy + (type * 45));
        draw_set_color(c_black);
        draw_rectangle(((64 * d) + xx) - 16, (59 * d) + yy, (255 * d) + xx + 16, (125 * d) + yy + (type * 45), false);
    }
    
    draw_set_color(c_white);
    
    if (xcoord == 2)
        draw_set_color(c_yellow);
    
    draw_set_halign(fa_left);
    draw_text((60 * d) + xx, (60 * d) + yy, string_hash_to_newline(name_current));
    
    draw_set_halign(fa_right);
    draw_text((200 * d) + xx, (60 * d) + yy, string_hash_to_newline(stringsetsub("LV ~1", global.chapter)));
    draw_text((261 * d) + xx, (60 * d) + yy, scr_timedisp(time_current));
    draw_set_halign(fa_center);
    draw_text_width((160 * d) + xx, (85 * d) + yy, string_hash_to_newline(scr_roomname(room)), 360);
    draw_set_halign(fa_left);
    
    if (xcoord < 2)
        draw_sprite(heartsprite, 0, xx + (71 * d) + (xcoord * 90 * d), yy + (114 * d) + (ycoord * 42));
    
    if (xcoord < 2)
    {
        draw_text(xx + (85 * d), yy + (110 * d), string_hash_to_newline("Save"));
        draw_text(xx + (175 * d), yy + (110 * d), string_hash_to_newline("Return"));
        
        if (type == 1)
        {
            draw_text(xx + (85 * d), yy + (130 * d), "Storage");
            
            if (!haverecruited)
                draw_set_color(c_gray);
            
            draw_text(xx + (175 * d), yy + (130 * d), "Recruits");
        }
    }
    else
    {
        draw_text(xx + (85 * d), yy + (110 * d), string_hash_to_newline("File saved."));
    }
}
else if (menuno == 1)
{
    if (overwrite == 0)
    {
        draw_set_color(c_black);
        draw_set_alpha(0.8);
        draw_rectangle(xx - 10, yy - 10, xx + 640 + 10, yy + 480 + 10, 0);
        draw_set_alpha(1);
    }
    
    var yoff = 0;
    var wmod = 28;
    var mwidth = 520;
    var mheight = 105;
    var mx = 60;
    var my = 12 + yoff;
    scr_darkbox_black(camerax() + mx, cameray() + my, camerax() + mx + mwidth, cameray() + my + mheight);
    mwidth = 520;
    mheight = 321;
    mx = 60;
    my = 124 + yoff;
    scr_darkbox_black(camerax() + mx, cameray() + my, camerax() + mx + mwidth, cameray() + my + mheight);
    
    for (var i = 0; i < 3; i++)
        draw_sprite_ext(spr_textbox_top, 0, camerax() + mx + 14, cameray() + 208 + (84 * i) + yoff, mwidth * 0.948, 2, 0, c_white, 1);
    
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(camerax() + 320, cameray() + 32 + yoff, global.truename);
    draw_set_halign(fa_left);
    draw_text(camerax() + mx + 40, cameray() + 32 + yoff, string_hash_to_newline(stringsetsub("LV ~1", global.chapter)));
    draw_set_halign(fa_right);
    draw_text(camerax() + mx + 483, cameray() + 32 + yoff, scr_timedisp(time_current));
    draw_set_halign(fa_center);
    draw_text(camerax() + 320, cameray() + 64 + yoff, room_current);
    draw_set_halign(fa_left);
    newfile = "New File";
    var mspace = 84;
    
    for (var i = 0; i < 3; i++)
    {
        draw_set_color(c_white);
        
        if (mpos == i)
            draw_set_color(c_yellow);
        
        if (level_file[i] != 0)
        {
            draw_set_halign(fa_left);
            draw_text(camerax() + mx + 40 + 24, cameray() + my + 20 + (i * mspace), string_hash_to_newline(stringsetsub("LV ~1", global.chapter)));
            draw_set_halign(fa_right);
            draw_text(camerax() + mx + 483, cameray() + my + 20 + (i * mspace), scr_timedisp(time_file[i]));
            draw_set_halign(fa_center);
            draw_text(camerax() + 320, cameray() + my + 52 + (i * mspace), scr_roomname(roome_file[i]));
            draw_text(camerax() + 320, cameray() + my + 20 + (i * mspace), name_file[i]);
            
            draw_set_halign(fa_left);
            draw_set_color(c_white);
        }
        else
        {
            draw_set_halign(fa_center);
            draw_text(camerax() + 320, cameray() + my + 36 + (i * mspace), newfile);
            draw_set_halign(fa_left);
            draw_set_color(c_white);
        }
    }
    
    draw_set_halign(fa_center);
    
    if (mpos == 3)
        draw_set_color(c_yellow);
    
    returntxt = "Return";
    draw_text(camerax() + 320, cameray() + my + 270, string_hash_to_newline(returntxt));
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    
    if (overwrite == 0)
    {
        if (mpos < 3)
        {
            if (level_file[mpos] != 0)
                draw_sprite(heartsprite, 0, camerax() + mx + 32, (cameray() + my + (mspace * mpos) + 62) - 34);
            else
                draw_sprite(heartsprite, 0, (camerax() + 320) - (string_width(newfile) / 2) - 32, cameray() + my + 36 + (mpos * mspace) + (string_height(newfile) / 4));
        }
        else
        {
            draw_sprite(heartsprite, 0, (camerax() + 320) - string_width(returntxt), cameray() + my + 270 + (string_height(returntxt) / 4));
        }
    }
    
    if (overwrite == 0)
    {
        if (down_p())
            mpos++;
        
        if (up_p())
            mpos--;
        
        mpos = clamp(mpos, 0, 3);
        
        if (button1_p() && buffer < 0)
        {
            if (mpos == 3)
            {
                menuno = 0;
                buffer = 3;
                mpos = global.filechoice;
                snd_play(snd_select);
            }
            else if (level_file[mpos] != 0 && mpos != global.filechoice)
            {
                overwrite = 0.5;
                buffer = 3;
                overcoord = 0;
            }
            else
            {
                menuno = 2;
                global.filechoice = mpos;
                snd_play(snd_save);
                scr_save();
                saved = 1;
                xcoord = 2;
                buffer = 3;
                
                if (d == 2)
                {
                    name = global.truename;
                    love = global.llv;
                }
                
                scr_roomname(room);
                level = global.lv;
                time = global.time;
                minutes = floor(time / 1800);
                seconds = round(((time / 1800) - minutes) * 60);
                
                if (seconds == 60)
                    seconds = 59;
                
                if (seconds < 10)
                    seconds = "0" + string(seconds);
            }
        }
        
        if (button2_p() && buffer < 0)
        {
            menuno = 0;
            buffer = 3;
            mpos = global.filechoice;
            snd_play(snd_select);
        }
    }
    
    if (overwrite == 1)
    {
        draw_set_color(c_black);
        draw_set_alpha(0.8);
        draw_rectangle(xx - 10, yy - 10, xx + 640 + 10, yy + 480 + 10, 0);
        draw_set_alpha(1);
        saved = 2;
        scr_darkbox_black(camerax() + 10, cameray() + 100, (camerax() + 640) - 10, (cameray() + 480) - 100);
        overwritetext = stringsetsub("Overwrite Slot ~1?", mpos + 1);
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_text(camerax() + 320, (((cameray() + 120) - 4) + 19) - 12, string_hash_to_newline(overwritetext));
        draw_set_color(c_yellow);

        var currentSpace = 70;
        var horzspace = 80;
        draw_set_halign(fa_left);
        draw_text(camerax() + horzspace, ((15 + cameray() + 180) - 30) + currentSpace, string_hash_to_newline(stringsetsub("LV ~1", global.chapter)));
        draw_set_halign(fa_right);
        draw_text((camerax() + 640) - horzspace, ((15 + cameray() + 180) - 30) + currentSpace, scr_timedisp(time_current));
        draw_set_halign(fa_center);
        draw_text(camerax() + 320, 15 + cameray() + 180 + currentSpace, room_current);
        draw_text(camerax() + 320, ((15 + cameray() + 180) - 30) + currentSpace, name_current);
        
        draw_set_halign(fa_left);
        draw_set_color(c_white);
        draw_set_color(c_white);
        draw_set_halign(fa_left);
        draw_text(camerax() + horzspace, (15 + cameray() + 180) - 30, string_hash_to_newline(stringsetsub("LV ~1", global.chapter)));
        draw_set_halign(fa_right);
        draw_text((camerax() + 640) - horzspace, (15 + cameray() + 180) - 30, scr_timedisp(time_file[mpos]));
        draw_set_halign(fa_center);
        draw_text(camerax() + 320, 15 + cameray() + 180, scr_roomname(roome_file[mpos]));
        draw_text(camerax() + 320, (15 + cameray() + 180) - 30, name_file[mpos]);
        
        draw_set_halign(fa_left);
        draw_set_color(c_white);
        savetxt = "Save";
        returntxt = "Return";
        
        if (left_p() || right_p())
            overcoord = 1 - overcoord;
        
        if (overcoord == 0)
            draw_set_color(c_yellow);
        else
            draw_set_color(c_white);
        
        draw_text(xx + 170, yy + 300 + 12 + 12, string_hash_to_newline(savetxt));
        
        if (overcoord == 1)
            draw_set_color(c_yellow);
        else
            draw_set_color(c_white);
        
        draw_text(xx + 350, yy + 300 + 12 + 12, string_hash_to_newline(returntxt));
        
        if (overcoord == 0)
            draw_sprite(heartsprite, 0, ((xx + 170) - 32) + 4, yy + 300 + 24 + (string_height(savetxt) / 4));
        else
            draw_sprite(heartsprite, 0, ((xx + 350) - 32) + 4, yy + 300 + 24 + (string_height(returntxt) / 4));
        
        if (button1_p() && buffer < 0)
        {
            if (overcoord == 0)
            {
                menuno = 2;
                global.filechoice = mpos;
                snd_play(snd_save);
                script_execute(scr_save);
                saved = 1;
                xcoord = 2;
                buffer = 3;
                
                if (d == 2)
                {
                    name = global.truename;
                    love = global.llv;
                }
                
                scr_roomname(room);
                level = global.lv;
                time = global.time;
                minutes = floor(time / 1800);
                seconds = round(((time / 1800) - minutes) * 60);
                
                if (seconds == 60)
                    seconds = 59;
                
                if (seconds < 10)
                    seconds = "0" + string(seconds);
            }
            else
            {
                overwrite = 0;
                buffer = 3;
                saved = 0;
            }
        }
        
        if (button2_p() && buffer < 0)
        {
            overwrite = 0;
            buffer = 3;
            saved = 0;
        }
    }
    
    if (overwrite == 0.5)
        overwrite = 1;
}
else if (menuno == 2)
{
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(xx - 10, yy - 10, xx + 640 + 10, yy + 480 + 10, 0);
    draw_set_alpha(1);
    var yoff = 0;
    var wmod = 28;
    var mwidth = 520;
    var mheight = 105;
    var mx = 60;
    var my = 12 + yoff;
    scr_darkbox_black(camerax() + mx, cameray() + my, camerax() + mx + mwidth, cameray() + my + mheight);
    mwidth = 520;
    mheight = 273;
    mx = 60;
    my = 124 + yoff;
    scr_darkbox_black(camerax() + mx, cameray() + my, camerax() + mx + mwidth, cameray() + my + mheight);
    
    for (var i = 0; i < 2; i++)
        draw_sprite_ext(spr_textbox_top, 0, camerax() + mx + 14, cameray() + 208 + (84 * i) + yoff, mwidth * 0.948, 2, 0, c_white, 1);
    
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
    draw_text(camerax() + 320, cameray() + 32 + yoff, global.truename);
    draw_set_halign(fa_left);
    draw_text(camerax() + mx + 40, cameray() + 32 + yoff, string_hash_to_newline(stringsetsub("LV ~1", global.chapter)));
    draw_set_halign(fa_right);
    draw_text(camerax() + mx + 483, cameray() + 32 + yoff, scr_timedisp(time_current));
    draw_set_halign(fa_center);
    draw_text(camerax() + 320, cameray() + 64 + yoff, room_current);
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    newfile = "New File";
    var mspace = 84;
    
    for (var i = 0; i < 3; i++)
    {
        draw_set_color(c_white);
        
        if (mpos == i)
            draw_set_color(c_yellow);
        
        if (mpos != i)
        {
            draw_set_color(#444444);
            
            if (level_file[i] != 0)
            {
                draw_set_halign(fa_left);
                draw_text(camerax() + mx + 40 + 24, cameray() + my + 20 + (i * mspace), string_hash_to_newline(stringsetsub("LV ~1", global.chapter)));
                draw_set_halign(fa_right);
                draw_text(camerax() + mx + 483, cameray() + my + 20 + (i * mspace), scr_timedisp(time_file[i]));
                draw_set_halign(fa_center);
                draw_text(camerax() + 320, cameray() + my + 52 + (i * mspace), scr_roomname(roome_file[i]));
                draw_text(camerax() + 320, cameray() + my + 20 + (i * mspace), name_file[i]);
                
                draw_set_halign(fa_left);
                draw_set_color(c_white);
            }
            else
            {
                draw_set_halign(fa_center);
                draw_text(camerax() + 320, cameray() + my + 36 + (i * mspace), newfile);
                draw_set_halign(fa_left);
                draw_set_color(c_white);
            }
        }
        else
        {
            filesaved = "File Saved";
            draw_set_halign(fa_center);
            draw_text(camerax() + 320, cameray() + my + 36 + (i * mspace), filesaved);
            draw_set_halign(fa_left);
            draw_set_color(c_white);
        }
    }
    
    draw_set_halign(fa_center);
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    
    if (button1_p() || button2_p())
    {
        if (buffer < 0)
        {
            global.interact = 0;
            
            with (obj_mainchara)
                onebuffer = 3;
            
            instance_destroy();
        }
    }
}