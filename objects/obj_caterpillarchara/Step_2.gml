if (!init) {
    ignoredepth = false;
    init = true;
    
    scr_character_set_caterpillar_offsets(characterslot)
	
	var uselegacyinit = false // Reverses it to Deltarune's Init.
	
	if uselegacyinit {
	    if (name == "susie") {
	        if (scr_havechar("no") && global.darkzone == 0)
	            target = 8;
        
	        halign = (global.darkzone == 0) ? 3 : 6;
	        valign = (global.darkzone == 0) ? 6 : 16;
	    }
    
	    if (name == "noelle") {
	        //usprite = (global.darkzone == 1) ? spr_noelle_walk_up_dw : spr_noelle_walk_up_lw;
	        //rsprite = (global.darkzone == 1) ? spr_noelle_walk_right_dw : spr_noelle_walk_right_lw;
	        //lsprite = (global.darkzone == 1) ? spr_noelle_walk_left_dw : spr_noelle_walk_left_lw;
	        //dsprite = (global.darkzone == 1) ? spr_noelle_walk_down_dw : spr_noelle_walk_down_lw;
        
	        if (global.darkzone == 0)
	            target = scr_havechar("su") ? 17 : 12;
        
	        halign = (global.darkzone == 0) ? 2 : 4;
	        valign = (global.darkzone == 0) ? 9 : 18;
	    }
    
	    if (name == "ralsei") {
	        climbsprite = 4220;
	        halign = 2;
	        valign = 12;
	    }
	}
}

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

if (obj_mainchara.x != remx[0]) || (obj_mainchara.y != remy[0]) 
	moved = true;

if (sliding[target] == true) moved = true;

if (moved == true && follow == true) {
    blushtimer = 0;
    
    for (i = 75; i > 0; i -= 1) {
        remx[i] = remx[i - 1];
        remy[i] = remy[i - 1];
        facing[i] = facing[i - 1];
        sliding[i] = sliding[i - 1];
    }
    
    remx[0] = obj_mainchara.x;
    remy[0] = obj_mainchara.y;
    sliding[0] = obj_mainchara.sliding;
    facing[0] = global.facing;
    x = remx[target] - halign + obj_mainchara.halign;
    y = remy[target] - valign + obj_mainchara.valign;
    
    if (sliding[target] == true) {
        x = remx[target];
        y = remy[target];
        sprite_index = slidesprite;
        slided = true;
    }
    
    if (abs(remy[target + 1] - remy[target]) > 4) runmove = true;
    
    dir = facing[target];
}

scr_overworldcharwalking_shared(facing[target])

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
