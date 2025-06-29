function scr_wincombat()
{
    if (global.flag[60] == 0 || global.flag[36] == 1)
    {
        global.myfight = 7;
        global.mnfight = -1;
        
        with (obj_battlecontroller)
            victory = 1;
        
        for (i = 0; i < 3; i += 1)
        {
            if (global.monster[i] == 1 && i_ex(global.monsterinstance[i]))
            {
                with (global.monsterinstance[i])
                    scr_monsterdefeat();
            }
        }
    }
    else
    {
        for (i = 0; i < 3; i += 1)
        {
            if (global.monster[i] == 1 && i_ex(global.monsterinstance[i]))
            {
                with (global.monsterinstance[i])
                    scr_monsterdefeat();
            }
        }
        
        global.encounterno = global.flag[60];
        scr_encountersetup(global.encounterno);
        global.flag[60] = 0;
        
        for (__j = 0; __j < 3; __j++)
        {
            if (global.monstertype[__j] != 0)
            {
                _newmonster = scr_monster_add(global.monstertype[__j], global.monsterinstancetype[__j]);
                global.monsterinstance[_newmonster].x = camerax() + 800;
                global.monsterinstance[_newmonster].y = global.monstermakey[__j];
                
                with (global.monsterinstance[_newmonster])
                    scr_move_to_point_over_time(global.monstermakex[myself], global.monstermakey[myself], 10);
            }
        }
        
        global.myfight = 5;
        myfightreturntimer = 15;
        global.mnfight = -1;
    }
}

function scr_endcombat()
{
    global.fighting = 0;
    
    if (global.specialbattle == 0 || global.specialbattle == 2 || global.specialbattle == 3)
    {
        if (global.specialbattle == 2)
        {
            with (obj_mainchara)
            {
                cutscene = 1;
                x = global.charinstance[0].x;
                y = global.charinstance[0].y;
            }
            
            with (global.cinstance[0])
            {
                x = global.charinstance[1].x;
                y = global.charinstance[1].y;
            }
            
            with (global.cinstance[1])
            {
                x = global.charinstance[2].x;
                y = global.charinstance[2].y;
            }
            
            with (obj_caterpillarchara)
                scr_caterpillar_interpolate();
            
            scr_pan_to_obj(obj_mainchara, 30);
            
            with (obj_mainchara)
                visible = 1;
            
            with (obj_caterpillarchara)
                visible = 1;
        }
        
        instance_create(0, 0, obj_endbattle);
        
        with (obj_monsterparent)
            instance_destroy();
        
        with (obj_bulletparent)
            instance_destroy();
        
        with (obj_heroparent)
            instance_destroy();
        
        global.charinstance[0] = obj_mainchara;
        global.charinstance[1] = global.cinstance[0];
        global.charinstance[2] = global.cinstance[1];
        instance_destroy();
    }
}