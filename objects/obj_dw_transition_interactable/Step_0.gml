if (talking == 2)
{
    if !instance_exists(obj_dialoguer)
    {
        global.interact = 0;
        talking = 0;
        myinteract = 0;
        global.facing = 0;
    }
}

if (con == 1)
{
    with (obj_mainchara)
    {
        cutscene = 1;
        idealx = 300;
        
        if (scr_havechar(2))
            idealx = 285;
        
        scr_move_to_point_over_time(idealx, 100, 6);
    }
    
    if (instance_exists(obj_caterpillarchara))
    {
        su_actor = scr_marker(obj_caterpillarchara.x, obj_caterpillarchara.y, spr_susie_walk_up_lw);
        
        with (su_actor)
        {
            scr_depth();
            image_speed = 0.25;
            scr_move_to_point_over_time(313, 86, 6);
        }
        
        with (obj_caterpillarchara)
            instance_destroy();
    }
    
    scr_pan_lerp(151, 0, 6);
    con = 2;
    alarm[4] = 7;
}

if (con == 3)
{
    with (obj_mainchara)
        visible = 0;
    
    instance_create(x, y, obj_dw_transition);
    
    if (scr_havechar(2))
    {
        with (su_actor)
            instance_destroy();
    }
    
    with (obj_dw_transition)
    {
        quick_mode = 1;
        
        if (!scr_havechar(2))
        {
            kris_x = obj_mainchara.x;
            kris_y = obj_mainchara.y;
            kris_only = 1;
        }
    }
    
    con = 4;
}
