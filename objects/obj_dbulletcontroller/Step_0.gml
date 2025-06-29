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

/*if (type == 0 && i_ex(obj_heart))
{
    if (btimer >= (timermax * ratio))
    {
        btimer = 0;
        var dir = 30 + random(120);
        radius = 140 + random(80);
        var xx = lengthdir_x(radius, dir);
        var yy = lengthdir_y(radius, dir);
        bm = instance_create(obj_heart.x + 8 + xx, obj_heart.y + 8 + yy, obj_dbullet_maker);
        bm.grazepoints = grazepoints;
        
        if (bm.y < (__view_get(e__VW.YView, 0) + 40))
            bm.y = __view_get(e__VW.YView, 0) + 40;
        
        bm.damage = damage;
        bm.target = target;
    }
}

if (type == 1)
{
    if (btimer >= (9 * ratio))
    {
        btimer = 0;
        radius = 140 + random(40);
        var yy = radius * side;
        var xx = -100 + random(200);
        num = choose(0, 1, 2, 3);
        
        if (num == 3)
            xx = -10 + random(20);
        
        d = instance_create(obj_heart.x + 8 + xx, obj_heart.y + 8 + yy, obj_dbullet_vert);
        d.damage = damage;
        d.target = target;
    }
}*/