if (!init)
{
    ignoredepth = 0;
    init = 1;
    
    if (name == "susie")
    {
        if (scr_havechar("no") && global.darkzone == 0)
            target = 8;
        
        halign = (global.darkzone == 0) ? 3 : 6;
        valign = (global.darkzone == 0) ? 6 : 16;
    }
    
    if (name == "noelle")
    {
        //usprite = (global.darkzone == 1) ? spr_noelle_walk_up_dw : spr_noelle_walk_up_lw;
        //rsprite = (global.darkzone == 1) ? spr_noelle_walk_right_dw : spr_noelle_walk_right_lw;
        //lsprite = (global.darkzone == 1) ? spr_noelle_walk_left_dw : spr_noelle_walk_left_lw;
        //dsprite = (global.darkzone == 1) ? spr_noelle_walk_down_dw : spr_noelle_walk_down_lw;
        
        if (global.darkzone == 0)
            target = scr_havechar("su") ? 17 : 12;
        
        halign = (global.darkzone == 0) ? 2 : 4;
        valign = (global.darkzone == 0) ? 9 : 18;
    }
    
    if (name == "ralsei")
    {
        climbsprite = 4220;
        halign = 2;
        valign = 12;
    }
}

if (!ignoredepth)
{
    scr_depth();
    depth += 5;
    
    if (name == "ralsei")
        depth -= 80;
    
    if (name == "susie" && global.darkzone == 1)
        depth -= 60;
    
    if (name == "noelle")
        depth -= 5;
}

nowx = x;
nowy = y;
moved = 0;
walk = 0;
runmove = 0;
slided = 0;

if (obj_mainchara.x != remx[0])
    moved = 1;

if (obj_mainchara.y != remy[0])
    moved = 1;

if (sliding[target] == 1)
    moved = 1;

if (moved == 1 && follow == 1)
{
    blushtimer = 0;
    
    for (i = 75; i > 0; i -= 1)
    {
        remx[i] = remx[i - 1];
        remy[i] = remy[i - 1];
        facing[i] = facing[i - 1];
        sliding[i] = sliding[i - 1];
    }
    
    remx[0] = obj_mainchara.x;
    remy[0] = obj_mainchara.y;
    sliding[0] = obj_mainchara.sliding;
    facing[0] = global.facing;
    x = remx[target] - halign;
    y = remy[target] - valign;
    
    if (sliding[target] == 1)
    {
        x = remx[target];
        y = remy[target];
        sprite_index = slidesprite;
        slided = 1;
    }
    
    if (abs(remx[target + 1] - remx[target]) > 4)
        runmove = 1;
    
    if (abs(remy[target + 1] - remy[target]) > 4)
        runmove = 1;
    
    dir = facing[target];
}

if (x != nowx)
    walk = 1;

if (y != nowy)
    walk = 1;

if (walk == 1)
    walkbuffer = 6;

if (walkbuffer > 3 && fun == 0)
{
    walktimer += 1.5;
    
    if (runmove == 1)
        walktimer += 1.5;
    
    if (walktimer >= 40)
        walktimer -= 40;
    
    if (walktimer < 10)
        image_index = 0;
    
    if (walktimer >= 10)
        image_index = 1;
    
    if (walktimer >= 20)
        image_index = 2;
    
    if (walktimer >= 30)
        image_index = 3;
}

if (walkbuffer <= 0 && fun == 0)
{
    if (walktimer < 10)
        walktimer = 9.5;
    
    if (walktimer >= 10 && walktimer < 20)
        walktimer = 19.5;
    
    if (walktimer >= 20 && walktimer < 30)
        walktimer = 29.5;
    
    if (walktimer >= 30)
        walktimer = 39.5;
    
    image_index = 0;
}

walkbuffer -= 0.75;

if (fun == 0 && slided == 0)
{
    if (facing[target] == 0)
        sprite_index = dsprite;
    
    if (facing[target] == 1)
        sprite_index = rsprite;
    
    if (facing[target] == 2)
        sprite_index = usprite;
    
    if (facing[target] == 3)
        sprite_index = lsprite;
}

if ((/*dsprite == spr_ralseid || */dsprite == spr_ralsei_walk_down) && global.interact == 0 && fun == 0)
{
    distfrommcx = obj_mainchara.x - (x + 2);
    distfrommcy = obj_mainchara.y - (y + 12);
    
    if (abs(distfrommcy) <= 14 && abs(distfrommcx) <= 20)
    {
        if (distfrommcx <= 0 && global.facing == 1)
            blushtimer += 1;
        
        if (distfrommcx >= 0 && global.facing == 3)
            blushtimer += 1;
    }
    else
    {
        blushtimer = 0;
    }
    
    if (blushtimer >= 300)
    {
        if (sprite_index == dsprite)
            sprite_index = dsprite_blush;
        
        if (sprite_index == rsprite)
            sprite_index = rsprite_blush;
        
        if (sprite_index == usprite)
            sprite_index = usprite_blush;
        
        if (sprite_index == lsprite)
            sprite_index = lsprite_blush;
    }
}
else
{
    blushtimer = 0;
}

if (name == "ralsei")
{
    if (sprite_index == dsprite)
        depth += 20;
}
