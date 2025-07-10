function scr_encountersetup(encounterid)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    
    for (i = 0; i < 3; i += 1)
    {
        global.heromakex[i] = xx + 80;
        global.heromakey[i] = yy + 50 + (80 * i);
        global.monsterinstancetype[i] = obj_baseenemy;
        global.monstertype[i] = 1;
        global.monstermakex[i] = xx + 500 + (20 * i);
        global.monstermakey[i] = yy + 40 + (90 * i);
    }
    
    global.monstertype[1] = 0;
    global.monstertype[2] = 0;
    
    if (global.char[0] != DRCharacter.None && global.char[1] == DRCharacter.None && global.char[2] == DRCharacter.None)
        global.heromakey[0] = yy + 140;
    
    if (global.char[0] != DRCharacter.None && global.char[1] != DRCharacter.None && global.char[2] == DRCharacter.None)
    {
        global.heromakey[0] = yy + 100;
        global.heromakey[1] = yy + 180;
    }
    
    global.battlemsg[0] = "* It is known.";
	
	scr_encounter_get(encounterid);
	
	for (p = 0; p < array_length(enemytemp); p++) {
		global.monsterinstancetype[p] = enemytemp[p].instance;
		global.monstertype[p] = enemytemp[p].entry;
		global.monstermakex[p] = enemytemp[p].xx;
		global.monstermakey[p] = enemytemp[p].yy;
	}
	
	show_debug_message(enemytemp);
    
    /*switch (encounterid)
    {
        default:
        case DREncounter.TestEnemies:
            global.monsterinstancetype[0] = obj_baseenemy;
            global.monstertype[0] = 1;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 110;
            global.monsterinstancetype[1] = obj_baseenemy;
            global.monstertype[1] = 1;
            global.monstermakex[1] = xx + 500;
            global.monstermakey[1] = yy + 200;
            global.monstertype[2] = 0;
            global.battlemsg[0] = "* Test enemies showed up.";
            break;
        
        case 2:
            global.heromakex[0] = xx + 94;
            global.heromakey[0] = yy + 50;
            global.heromakex[1] = xx + 80;
            global.heromakey[1] = yy + 122;
            global.heromakex[2] = xx + 72;
            global.heromakey[2] = yy + 200;
            global.monsterinstancetype[0] = obj_watercooler_enemy;
            global.monstertype[0] = 58;
            global.monstermakex[0] = xx + 480;
            global.monstermakey[0] = yy + 110;
            global.monstertype[1] = 0;
            global.monstertype[2] = 0;
            global.battlemsg[0] = "* A strong aura emanates from the Watercooler.";
            break;
    }*/
}

function scr_isphase(arg0)
{
    __isphase = 0;
    
    if ((arg0 == "menu" || arg0 == DREncounterPhase.Menu) && global.myfight == 0)
        __isphase = 1;
    
    if ((arg0 == "acting" || arg0 == DREncounterPhase.Acting) && global.myfight == 3)
        __isphase = 1;
    
    if ((arg0 == "victory" || arg0 == DREncounterPhase.Victory) && global.myfight == 7)
        __isphase = 1;
    
    if (arg0 == "attack" || arg0 == "fight" || arg0 == DREncounterPhase.HeroesAttack)
    {
        if (global.myfight == 1)
            __isphase = 1;
    }
    
    if (arg0 == "spell" || arg0 == "item" || arg0 == DREncounterPhase.SpellsItems)
    {
        if (global.myfight == 4)
            __isphase = 1;
    }
    
    if (arg0 == "enemytalk" || arg0 == "balloon" || arg0 == DREncounterPhase.EnemyTalk)
    {
        if (global.mnfight == 1)
            __isphase = 1;
    }
    
    if (arg0 == "enemyattack" || arg0 == "bullets" || arg0 == DREncounterPhase.EnemyAttack)
    {
        if (global.mnfight == 2)
            __isphase = 1;
    }
    
    return __isphase;
}

function scr_randomtarget()
{
    abletotarget = 1;
    
    if (global.charcantarget[0] == 0 && global.charcantarget[1] == 0 && global.charcantarget[2] == 0)
        abletotarget = 0;
    
    mytarget = choose(0, 1, 2);
    
    if (abletotarget == 1)
    {
        while (global.charcantarget[mytarget] == 0)
            mytarget = choose(0, 1, 2);
    }
    else
    {
        mytarget = 3;
    }
    
    global.targeted[mytarget] = 1;
    
    if (global.chapter >= 2 && mytarget != 3)
    {
        if (global.charcantarget[0])
            global.targeted[0] = 1;
        
        if (global.charcantarget[1])
            global.targeted[1] = 1;
        
        if (global.charcantarget[2])
            global.targeted[2] = 1;
        
        mytarget = 4;
    }
}

function scr_messagepriority(arg0)
{
    if (i_ex(obj_battlecontroller))
    {
        if (obj_battlecontroller.messagepriority < arg0)
        {
            obj_battlecontroller.messagepriority = arg0;
            return true;
        }
        else
        {
            return false;
        }
    }
    else
    {
        return false;
    }
}

function scr_attackpriority(arg0)
{
    if (i_ex(obj_battlecontroller))
    {
        if (obj_battlecontroller.attackpriority < arg0)
        {
            obj_battlecontroller.attackpriority = arg0;
            return true;
        }
        else
        {
            return false;
        }
    }
    else
    {
        return false;
    }
}

function scr_enemyblcon(arg0, arg1, arg2)
{
    if (arg2 == 0)
    {
        mywriter = instance_create(arg0, arg1, obj_writer);
        return mywriter;
    }
    
    if (arg2 == 1)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        return myblcon;
    }
    
    if (arg2 == 2)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_v;
        return myblcon;
    }
    
    if (arg2 == 3)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_long;
        return myblcon;
    }
    
    if (arg2 == 4)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_long;
        myblcon.image_index = 0;
        myblcon.image_speed = 0;
        return myblcon;
    }
    
    if (arg2 == 5)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_long;
        myblcon.image_index = 1;
        myblcon.image_speed = 0;
        return myblcon;
    }
    
    if (arg2 == 6)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_clubs;
        myblcon.image_index = 2;
        myblcon.image_speed = 0;
        return myblcon;
    }
    
    if (arg2 == 7)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_long_r;
        myblcon.image_index = 2;
        myblcon.image_speed = 0;
        return myblcon;
    }
    
    if (arg2 == 8)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_long_tall;
        return myblcon;
    }
    
    if (arg2 == 10)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_long;
        myblcon.auto_length = 1;
        return myblcon;
    }
    
    if (arg2 == 11)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_v2_left;
        return myblcon;
    }
    
    if (arg2 == 12)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_v2_right;
        return myblcon;
    }
    
    if (arg2 == 12.1)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_v2_right2;
        return myblcon;
    }
    
    if (arg2 == 12.2)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_v2_right3;
        return myblcon;
    }
    
    if (arg2 == 12.3)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_v2_right4;
        return myblcon;
    }
    
    if (arg2 == 12.4)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_v2_right5;
        return myblcon;
    }
    
    if (arg2 == 13)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_long;
        myblcon.auto_length = 1;
        myblcon.side = 2;
        return myblcon;
    }
    
    if (arg2 == 14)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_long;
        myblcon.auto_length = 1;
        myblcon.side = -1;
        return myblcon;
    }
}

function scr_blconskip(arg0)
{
    if (arg0 >= 0)
    {
        if (button1_p() && talktimer > arg0)
            talktimer = talkmax;
        
        talktimer += 1;
        
        if (talktimer >= talkmax)
        {
            with (obj_writer)
                instance_destroy();
            
            global.mnfight = 1.5;
        }
    }
    else if (arg0 == -1)
    {
        if (instance_exists(obj_writer) == false)
            global.mnfight = 1.5;
    }
    else if (arg0 == -2)
    {
        talktimer += 1;
        
        if (talktimer > 15)
            talktimer = talkmax;
        
        if (talktimer >= talkmax)
        {
            with (obj_writer)
                instance_destroy();
            
            global.mnfight = 1.5;
        }
    }
}

function scr_bullet_inherit(arg0)
{
    if (i_ex(arg0))
    {
        if (damage != -1)
            arg0.damage = damage;
        
        if (grazepoints != -1)
            arg0.grazepoints = grazepoints;
        
        if (timepoints != -1)
            arg0.timepoints = timepoints;
        
        if (inv != -1)
            arg0.inv = inv;
        
        if (target != -1)
            arg0.target = target;
        
        if (grazed != -1)
            arg0.grazed = 0;
        
        if (grazetimer != -1)
            arg0.grazetimer = 0;
        
        if (object_index == obj_dbulletcontroller)
        {
            arg0.creatorid = creatorid;
            arg0.creator = creator;
        }
        
        arg0.element = element;
    }
}

function scr_bullet_init()
{
    grazed = 0;
    grazetimer = 0;
    destroyonhit = 1;
    target = 0;
    inv = 60;
    damage = 10;
    element = 0;
    grazepoints = 1;
    timepoints = 1;
    active = 1;
    updateimageangle = 0;
}