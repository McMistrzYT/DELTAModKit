if (ds_map_find_value(async_load, "id") == global.savedata_async_id)
{
    global.savedata_async_id = -1;
    var type;
    
    if (global.savedata_async_load)
        type = "load";
    else
        type = "save";
    
    if (ds_map_find_value(async_load, "status") < 0)
    {
        global.savedata_error = true;
        global.savedata_debuginfo = type + " failed: " + string(ds_map_find_value(async_load, "status"));
        
        if (global.savedata_async_load)
        {
            global.savedata = ds_map_create();
            global.savedata_async_load = false;
        }
    }
    else
    {
        global.savedata_error = false;
        global.savedata_debuginfo = type + " succeeded";
        
        if (global.savedata_async_load)
        {
            var json = buffer_read(global.savedata_buffer, buffer_string);
            global.savedata = json_decode(json);
            global.savedata_async_load = false;
        }
        //else if (scr_is_switch_os())
        //{
        //    switch_save_data_commit();
        //}
    }
    
    buffer_delete(global.savedata_buffer);
    global.savedata_buffer = undefined;
}
