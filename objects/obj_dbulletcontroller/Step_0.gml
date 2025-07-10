if (init == 0)
{
    sameattack = scr_monsterattacknamecount(global.monsterattackname[creator]);
    
    if (sameattack > 1)
    {
        if (creator == 2)
            sameattacker = sameattack - 1;
        else if (creator == 1)
            sameattacker = (sameattack == 3) ? creator : (global.monsterattackname[0] == global.monsterattackname[1]);
    }
    
    if (instance_exists(obj_growtangle))
    {
        miny = obj_growtangle.y - (obj_growtangle.sprite_height / 2);
        maxy = obj_growtangle.y + (obj_growtangle.sprite_height / 2);
        minx = obj_growtangle.x - (obj_growtangle.sprite_width / 2);
        maxx = obj_growtangle.x + (obj_growtangle.sprite_width / 2);
    }
    
    init = 1;
}

btimer += 1;

scr_bullet_pattern(type);