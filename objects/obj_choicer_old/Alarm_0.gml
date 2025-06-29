if (instance_exists(obj_dialoguer))
{
    with (obj_dialoguer)
    {
        if (i_ex(writer))
        {
            wwx = writer.x;
            wwy = writer.y;
        }
        
        with (obj_face)
            instance_destroy();
        
        with (writer)
            instance_destroy();
        
        global.msc += 1;
        scr_text(global.msc);
        event_user(0);
    }
}

with (obj_choicer_old)
    instance_destroy();
