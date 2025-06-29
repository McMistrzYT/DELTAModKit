function ossafe_fill_rectangle(arg0, arg1, arg2, arg3, arg4)
{
    var x1 = arg0;
    var y1 = arg1;
    var x2 = arg2;
    var y2 = arg3;
    var outline = false;
    
    if (argument_count > 4)
        outline = arg4;
    
    if (x1 > x2)
    {
        var temp = x1;
        x1 = x2;
        x2 = temp;
    }
    
    if (y1 > y2)
    {
        var temp = y1;
        y1 = y2;
        y2 = temp;
    }
    
    if (os_type == os_ps4 || os_type == os_ps5 || os_type == os_psvita)
    {
        x2++;
        y2++;
    }
    
    draw_rectangle(x1, y1, x2, y2, outline);
}

function setxy(arg0, arg1)
{
    x = arg0;
    y = arg1;
}

function draw_background_tiled_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    draw_sprite_tiled_ext(arg0, 0, arg1, arg2, arg3, arg4, arg5, arg6);
}

function scr_moveheart()
{
    global.inv = 0;
    return instance_create(obj_herokris.x + 10, obj_herokris.y + 40, obj_moveheart);
}

function ossafe_ini_open(arg0)
{
    if (!global.is_console)
    {
        ini_open(arg0);
    }
    else
    {
        var name = string_lower(arg0);
        global.current_ini = name;
        var file = ds_map_find_value(global.savedata, name);
        var data;
        
        if (is_undefined(file))
            data = "";
        else
            data = file;
        
        ini_open_from_string(data);
    }
}

function ossafe_ini_close()
{
    if (!global.is_console)
    {
        return ini_close();
    }
    else if (!is_undefined(global.current_ini))
    {
        ds_map_set(global.savedata, global.current_ini, ini_close());
        global.current_ini = undefined;
    }
}

function draw_background_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    draw_sprite_ext(arg0, 0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
}

function ossafe_file_text_open_read(arg0)
{
    if (!global.is_console)
    {
        return file_text_open_read(arg0);
    }
    else
    {
        var name = string_lower(arg0);
        var file = ds_map_find_value(global.savedata, name);
        
        if (is_undefined(file))
            return undefined;
        
        var data = file;
        var num_lines = 0;
        var lines;
        
        while (string_byte_length(data) > 0)
        {
            var newline_pos = string_pos("\n", data);
            var line;
            
            if (newline_pos > 0)
            {
                var nextline_pos = newline_pos + 1;
                
                if (newline_pos > 1 && string_char_at(data, newline_pos - 1) == "\r")
                    newline_pos--;
                
                if (newline_pos > 1)
                    line = substr(data, 1, newline_pos - 1);
                else
                    line = "";
                
                if (nextline_pos <= strlen(data))
                    data = substr(data, nextline_pos);
                else
                    data = "";
            }
            else
            {
                line = data;
                data = "";
            }
            
            lines[num_lines++] = line;
        }
        
        handle = ds_map_create();
        ds_map_set(handle, "is_write", false);
        ds_map_set(handle, "text", lines);
        ds_map_set(handle, "num_lines", num_lines);
        ds_map_set(handle, "line", 0);
        ds_map_set(handle, "line_read", false);
        return handle;
    }
}

function ossafe_file_text_read_string(arg0)
{
    if (!global.is_console)
    {
        return file_text_read_string(arg0);
    }
    else
    {
        var handle = arg0;
        
        if (ds_map_find_value(handle, "line_read"))
            return "";
        
        var line = ds_map_find_value(handle, "line");
        
        if (line >= ds_map_find_value(handle, "num_lines"))
            return "";
        
        ds_map_set(handle, "line_read", true);
        text = ds_map_find_value(handle, "text");
        return text[line];
    }
}

function ossafe_file_text_read_real(arg0)
{
    if (!global.is_console)
    {
        return file_text_read_real(arg0);
    }
    else
    {
        var handle = arg0;
        
        if (ds_map_find_value(handle, "line_read"))
            return 0;
        
        var line = ds_map_find_value(handle, "line");
        
        if (line >= ds_map_find_value(handle, "num_lines"))
            return 0;
        
        ds_map_set(handle, "line_read", true);
        text = ds_map_find_value(handle, "text");
        return real(text[line]);
    }
}

function ossafe_file_text_readln(arg0)
{
    if (!global.is_console)
    {
        return file_text_readln(arg0);
    }
    else
    {
        var handle = arg0;
        ds_map_set(handle, "line_read", false);
        var line = ds_map_set_post(handle, "line", ds_map_find_value(handle, "line") + 1);
        
        if (line >= ds_map_find_value(handle, "num_lines"))
            return "";
        
        text = ds_map_find_value(handle, "text");
        return text[line] + "\r\n";
    }
}

function scr_ds_list_read(arg0)
{
    var new_list = ds_list_create();
    var list_string = ossafe_file_text_read_string(arg0);
    
    if (list_string != "")
        ds_list_read(new_list, list_string);
    
    return new_list;
}

function safe_delete(arg0)
{
    if (i_ex(arg0))
    {
        with (arg0)
            instance_destroy();
    }
}

function ossafe_file_delete(arg0)
{
    if (!global.is_console)
        return file_delete(arg0);
    else if (!is_undefined(ds_map_find_value(global.savedata, arg0)))
        ds_map_delete(global.savedata, arg0);
}

function ossafe_savedata_save()
{
    if (global.is_console)
    {
        if (global.savedata_async_id >= 0 || global.savedata_async_load)
            return 0;
        
        var slot_size = 31457280;
        buffer_async_group_begin("Deltarune");
        buffer_async_group_option("showdialog", 0);
        buffer_async_group_option("savepadindex", 0);
        buffer_async_group_option("slottitle", "DELTARUNE");
        buffer_async_group_option("subtitle", "DELTARUNE Save Data");
        buffer_async_group_option("saveslotsize", slot_size);
        var json = json_encode(global.savedata);
        global.savedata_buffer = buffer_create(string_byte_length(json) + 1, buffer_grow, 1);
        buffer_write(global.savedata_buffer, buffer_string, json);
        buffer_save_async(global.savedata_buffer, "deltarune.sav", 0, buffer_get_size(global.savedata_buffer));
        global.savedata_async_load = false;
        global.savedata_debuginfo = "save in progress";
        global.savedata_async_id = buffer_async_group_end();
    }
}

function ossafe_savedata_load()
{
    if (global.is_console)
    {
        if (global.savedata_async_id >= 0 || global.savedata_async_load)
            return 0;
        
        var slot_size = 31457280;
        buffer_async_group_begin("Deltarune");
        buffer_async_group_option("showdialog", 0);
        buffer_async_group_option("savepadindex", 0);
        buffer_async_group_option("slottitle", "DELTARUNE");
        buffer_async_group_option("subtitle", "DELTARUNE Save Data");
        buffer_async_group_option("saveslotsize", slot_size);
        global.savedata_buffer = buffer_create(1, buffer_grow, 1);
        buffer_load_async(global.savedata_buffer, "deltarune.sav", 0, -1);
        global.savedata_async_load = true;
        global.savedata_debuginfo = "load in progress";
        global.savedata_async_id = buffer_async_group_end();
    }
}

function ossafe_game_end()
{
    if (!global.is_console)
        game_end();
    else
        game_restart_true();
}

function ossafe_file_exists(arg0)
{
    if (!global.is_console)
        return file_exists(arg0);
    else
        return variable_global_exists("savedata") && !is_undefined(ds_map_find_value(global.savedata, arg0));
}

function ossafe_file_text_open_write(arg0)
{
    if (!global.is_console)
    {
        return file_text_open_write(arg0);
    }
    else
    {
        var handle = ds_map_create();
        ds_map_set(handle, "is_write", true);
        ds_map_set(handle, "filename", string_lower(arg0));
        ds_map_set(handle, "data", "");
        return handle;
    }
}

function ossafe_file_text_write_string(arg0, arg1)
{
    if (!global.is_console)
    {
        return file_text_write_string(arg0, arg1);
    }
    else
    {
        var handle = arg0;
        ds_map_set(handle, "data", ds_map_find_value(handle, "data") + arg1);
    }
}

function ossafe_file_text_writeln(arg0)
{
    if (!global.is_console)
    {
        return file_text_writeln(arg0);
    }
    else
    {
        var handle = arg0;
        ds_map_set(handle, "data", ds_map_find_value(handle, "data") + "\r\n");
    }
}

function ossafe_file_text_write_real(arg0, arg1)
{
    if (!global.is_console)
    {
        return file_text_write_real(arg0, arg1);
    }
    else
    {
        var handle = arg0;
        ds_map_set(handle, "data", ds_map_find_value(handle, "data") + string(arg1));
    }
}

function scr_ds_list_write(arg0, arg1)
{
    var new_list = ds_list_create();
    
    for (var i = 0; i < arg1; i += 1)
        ds_list_add(new_list, arg0[i]);
    
    var list_string = ds_list_write(new_list);
    ds_map_set(myfileid, "data", ds_map_find_value(myfileid, "data") + list_string);
    ds_list_destroy(new_list);
}

function ossafe_file_text_close(arg0)
{
    if (!global.is_console)
    {
        return file_text_close(arg0);
    }
    else
    {
        var handle = arg0;
        
        if (ds_map_find_value(handle, "is_write"))
            ds_map_set(global.savedata, ds_map_find_value(handle, "filename"), ds_map_find_value(handle, "data"));
        
        ds_map_destroy(handle);
    }
}

function langopt(arg0, arg1)
{
    return (global.lang == "ja") ? arg1 : arg0;
}

function scr_timedisp(arg0)
{
    var minutes = floor(arg0 / 1800);
    var remmins = minutes % 60;
    var hours = (minutes - remmins) / 60;
    var seconds = floor((arg0 / 30) - (minutes * 60));
    var hourstring = string(hours) + ":";
    var minstring = string(remmins) + ":";
    
    if (remmins < 10)
        minstring = "0" + minstring;
    
    var secstring = string(floor(seconds));
    
    if (seconds < 10)
        secstring = "0" + secstring;
    
    var timedisp = hourstring + minstring + secstring;
    return timedisp;
}

function scr_chapterswitch(arg0 = 0)
{
    var parameters = get_chapter_switch_parameters();
    
    if (arg0 == 0)
    {
        switch (os_type)
        {
            case os_windows:
                game_change("/../", "-game data.win" + parameters);
                break;
                
            case os_ps4:
                game_change("", "-game /app0/games/game.win" + parameters);
                break;
                
            case os_ps5:
                game_change("", "-game /app0/games/game.win" + parameters);
                break;
                
            case os_macosx:
                game_change("..", parameters);
                break;
        }
    }
    else
    {
        var chapstring = string(arg0);
        switch (os_type)
        {
            case os_windows:
                game_change("/../chapter" + chapstring + "_windows", "-game data.win" + parameters);
                break;
                
            case os_ps4:
                game_change("", "-game /app0/games/chapter" + chapstring + "_ps4/game.win" + parameters);
                break;
                
            case os_ps5:
                game_change("", "-game /app0/games/chapter" + chapstring + "_ps5/game.win" + parameters);
                break;
                
            case os_macosx:
                game_change("../chapter" + chapstring + "_mac", parameters);
                break;
        }
    }
}

function scr_prefetch_textures()
{
    var texture_groups = ["Default", "ConsolePS4"];
    
    if (global.is_console)
    {
        //if (scr_is_switch_os())
        //    texture_groups = ["Default", "ConsoleSwitch"];
        
        texture_groups[array_length(texture_groups)] = "Console";
    }
    
    //array_push(texture_groups, "tenna");
    
    for (var i = 0; i < array_length(texture_groups); i++)
    {
        var _tex_array = texturegroup_get_textures(texture_groups[i]);
        
        for (var j = 0; j < array_length(_tex_array); j++)
        {
            if (texture_is_ready(_tex_array[j]))
                continue;
            
            texture_prefetch(_tex_array[j]);
        }
    }
}

function scr_windowcaption(ch1_title)
{
    if (global.tempflag[10] != 1 && global.chapter == 1)
        window_set_caption(ch1_title);
    else
        window_set_caption("DELTARUNE Chapter " + string(global.chapter));
}