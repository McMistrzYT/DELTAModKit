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
        idealx = other.kris_x_jumpprepare_nosus;
        
        if (scr_havechar(2))
            idealx = other.kris_x_jumpprepare_sus;
        
        scr_move_to_point_over_time(idealx, other.kris_y_jumpprepare, 6);
    }
    
    if (instance_exists(obj_caterpillarchara))
    {
        su_actor = scr_marker(obj_caterpillarchara.x, obj_caterpillarchara.y, spr_susie_walk_up_lw);
        
        with (su_actor)
        {
            scr_depth();
            image_speed = 0.25;
            scr_move_to_point_over_time(other.sus_x_jumpprepare, other.sus_y_jumpprepare, 6);
        }
        
        with (obj_caterpillarchara)
            instance_destroy();
    }
    
    scr_pan_lerp(camerapantox, camerapantoy, 6);
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
		transtimeoffset_baseval = other.transtimeoffset_baseval
		transtimeoffset_addskiprunback = other.transtimeoffset_addskiprunback
		rx1 = other.rx1
		ry1 = other.ry1
		rx2 = other.rx2
		ry2 = other.ry2
    }
    
    con = 4;
}
