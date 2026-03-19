if !i_ex(parent) exit;

if (!ignoredepth) {
    scr_depth();
    depth += depthbonus;
}

nowx = x;
nowy = y;
moved = false;
walk = false;
runmove = false;
slided = false;

if (parent.x != remx[0]) || (parent.y != remy[0]) 
	moved = true;

if (sliding[target] == true) moved = true;

if (moved == true && follow == true) {
    blushtimer = 0;
    
    for (i = maxtarget; i > 0; i -= 1) {
        remx[i] = remx[i - 1];
        remy[i] = remy[i - 1];
        facing[i] = facing[i - 1];
        sliding[i] = sliding[i - 1];
    }
    
    remx[0] = parent.x;
    remy[0] = parent.y;
    sliding[0] = parent.sliding;
    facing[0] = global.facing;
    x = remx[target] - halign + parent.halign;
    y = remy[target] - valign + parent.valign;
    
    if (sliding[target] == true) {
        x = remx[target];
        y = remy[target];
        sprite_index = slidesprite;
        slided = true;
    }
    
    if (abs(remy[target + 1] - remy[target]) > 4) || (abs(remx[target + 1] - remx[target]) > 4) runmove = true;
    
    dir = facing[target];
}

if fun == false {

	var hascustomcode = is_method(facingcodeoverride)

	scr_overworldcharwalking_shared((hascustomcode || slided) ? -1 : facing[target])

	if hascustomcode && !slided {
		facingcodeoverride()	
	}
}

if ((/*dsprite == spr_ralseid || */dsprite == spr_ralsei_walk_down) && global.interact == 0 && fun == 0)
{
    distfrommcx = parent.x - (x + 2);
    distfrommcy = parent.y - (y + 12);
    
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
