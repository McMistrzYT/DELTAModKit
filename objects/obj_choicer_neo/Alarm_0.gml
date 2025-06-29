var dialoguerObj = obj_dialoguer;

with (dialoguerObj)
{
	show_debug_message("DIALOGUER: " + string(global.msc) + " + 1");
    if (i_ex(writer))
    {
        wwx = writer.x;
        wwy = writer.y;
    }
    
    with (writer)
        instance_destroy();
    
    with (obj_choicer_neo)
        global.fc = remfc;
    
    global.msc += 1;
	scr_text(global.msc);
    event_user(0);
}

if (fighting == 1)
{
    with (obj_writer)
        instance_destroy();
}

with (obj_choicer_neo)
    instance_destroy();
