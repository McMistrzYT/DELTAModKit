function scr_monster_statreset(monsterid)
{
    global.monster[monsterid] = 0;
    global.monsterx[monsterid] = 0;
    global.monstery[monsterid] = 0;
    global.monstername[monsterid] = " ";
    global.monsterat[monsterid] = 0;
    global.monsterdf[monsterid] = 0;
    global.monsterhp[monsterid] = 0;
    global.monstermaxhp[monsterid] = 0;
    global.monsterinstance[monsterid] = 12913921839;
    global.monstergold[monsterid] = 0;
    global.monsterexp[monsterid] = 0;
    global.sparepoint[monsterid] = 0;
    global.hittarget[monsterid] = 0;
    global.mercymod[monsterid] = 0;
    global.mercymax[monsterid] = 0;
    global.monstercomment[monsterid] = " ";
    global.monsterattackname[monsterid] = " ";
    global.monsterstatus[monsterid] = 0;
    scr_monster_actreset(monsterid);
}

function scr_monster_actreset(arg0)
{
    for (__fj = 0; __fj < 6; __fj += 1)
        for (__charIdx = DRCharacter.None; __charIdx < DRCharacter.__MAX__; __charIdx++) {
			global.canact[__charIdx][arg0][__fj] = 0;
	        global.actname[__charIdx][arg0][__fj] = " ";
	        global.actactor[__charIdx][arg0][__fj] = 1;
	        global.actdesc[__charIdx][arg0][__fj] = " ";
	        global.actcost[__charIdx][arg0][__fj] = 0;
	        global.actsimul[__charIdx][arg0][__fj] = 0;	
		}
}

function scr_monster_add(arg0, arg1)
{
    __returnid = -1;
    
    for (__mopenslot = 0; __mopenslot < 3; __mopenslot++)
    {
        if (global.monster[__mopenslot] == 0)
        {
            global.monstertype[__mopenslot] = arg0;
            global.monsterinstancetype[__mopenslot] = arg1;
            scr_monster_statreset(__mopenslot);
            scr_monster_makeinstance(__mopenslot);
            __returnid = __mopenslot;
            break;
        }
    }
    
    return __returnid;
}

function scr_spareanim()
{
    spareanim = instance_create(x, y, obj_spareanim);
    spareanim.sprite_index = sprite_index;
    spareanim.sprite_index = sparedsprite;
    spareanim.image_index = 0;
    spareanim.image_xscale = image_xscale;
    spareanim.image_yscale = image_yscale;
}

function scr_monster_makeinstance(monsterid)
{
    global.monster[monsterid] = 1;
    
    with (global.monsterinstance[monsterid])
        instance_destroy();
    
    global.monsterinstance[monsterid] = instance_create(global.monstermakex[monsterid], global.monstermakey[monsterid], global.monsterinstancetype[monsterid]);
    global.monsterinstance[monsterid].myself = monsterid;
	global.monsterinstance[monsterid].enemyId = global.monstertype[monsterid];
    
    with (global.monsterinstance[monsterid])
        event_user(12);
    
    with (global.monsterinstance[monsterid])
        event_user(15);
}

function scr_monsterdefeat()
{
    if (global.monster[myself] == 1)
    {
        global.monstergold[3] += global.monstergold[myself];
        global.monsterexp[3] += global.monsterexp[myself];
        global.monster[myself] = 0;
        
        if (global.flag[51 + myself] == 0)
        {
            global.flag[51 + myself] = 2;
            
            if (global.monsterhp[myself] <= 0)
                global.flag[51 + myself] = 1;
        }
        
        if (global.flag[51 + myself] == 1)
        {
            global.flag[40] += 1;
            
            if (fatal == 1)
                global.flag[44]++;
        }
        
        if (global.flag[51 + myself] == 2)
            global.flag[41] += 1;
        
        if (global.flag[51 + myself] == 3)
            global.flag[42] += 1;
        
        if (global.flag[51 + myself] == 5)
            global.flag[43] += 1;
        
        if (global.flag[51 + myself] == 6)
        {
            global.flag[45] += 1;
            global.monstergold[3] += 24;
        }
        
        if (scr_monsterpop() == 0)
        {
            _amt_add = 0;
            _frozened = 0;
            _violenced = 0;
            _spared = 0;
            _pacified = 0;
            
            for (d_i = 0; d_i < 3; d_i += 1)
            {
                if (global.flag[51 + d_i] != 0)
                    _amt_add += 1;
                
                if (global.flag[51 + d_i] == 1)
                    _violenced += 1;
                
                if (global.flag[51 + d_i] == 2)
                    _spared += 1;
                
                if (global.flag[51 + d_i] == 3)
                    _pacified += 1;
                
                if (global.flag[51 + d_i] == 6)
                    _frozened += 1;
            }
            
            if (_frozened > 0)
                global.flag[50] = 6;
            
            if (_pacified > 0)
                global.flag[50] = 3;
            
            if (_spared > 0)
                global.flag[50] = 2;
            
            if (_violenced > 0)
                global.flag[50] = 1;
            
            if (global.flag[50] == 6)
                global.flag[926]++;
            
            if (global.flag[54] != 0)
            {
                global.flag[global.flag[54]] = global.flag[50];
                show_debug_message("=====Encounter Results=====");
                show_debug_message("encounter flag: global.flag[" + string(global.flag[54]) + "]=" + string(global.flag[50]));
                show_debug_message("=======");
                global.flag[54] = 0;
            }
        }
        
        event_user(11);
    }
}

function scr_monsterpop()
{
    return global.monster[0] + global.monster[1] + global.monster[2];
}

function scr_enemy_object_init()
{
    becomeflash = 0;
    flash = 0;
    turnt = 0;
    turns = 0;
    talktimer = 0;
    state = 0;
    siner = 0;
    fsiner = 0;
    talked = 0;
    attacked = 0;
    hurt = 0;
    hurttimer = 0;
    hurtshake = 0;
    shakex = 0;
    mywriter = 343249823;
    acttimer = 0;
    con = 0;
    dodgetimer = 0;
    fatal = 0;
    candodge = 0;
    mytarget = 0;
    ambushed = 0;
    firststrike = 0;
    damage = -1;
    grazepoints = -1;
    timepoints = -1;
    inv = -1;
    target = -1;
    grazed = -1;
    grazetimer = -1;
    element = "none";
    acting = [];
	actcon = [];
	simulorder = [];
	for (i = 0; i < DRCharacter.__MAX__; i++) acting[i] = 0;
    for (i = 0; i < DRCharacter.__MAX__; i++) actcon[i] = 0;
	for (i = 0; i < DRCharacter.__MAX__; i++) simulorder[i] = 0;
    simultotal = 0;
    simulboss = -1;
    talkmax = 90;
    mercymod = 0;
    maxmercy = 100;
    recruitable = 1;
    freezable = 1;
    recruitcount = 1;
    sactionboxx = 0;
    sactionboxy = 0;
    hurtspriteoffx = 0;
    hurtspriteoffy = 0;
    image_xscale = 2;
    image_yscale = 2;
    image_speed = 0.2;
    idlesprite = spr_diamond_knight_overworld;
    hurtsprite = spr_diamond_knight_overworld;
    sparedsprite = spr_diamond_knight_overworld;
    custombody = 0;
	
	enemyId = DREnemy.None;
    
    for (i = 0; i < 10; i++)
        _charactsprite[i] = 382938298329;
    
    depth = 90 - ((y - cameray()) / 50);
}

function scr_monsterattacknamecount(arg0)
{
    __sameattack = 0;
    
    for (_sameattacki = 0; _sameattacki < 3; _sameattacki++)
    {
        if (global.monsterattackname[_sameattacki] == arg0 && global.monster[_sameattacki] == 1)
            __sameattack++;
    }
    
    return __sameattack;
}

function scr_mercyadd(arg0, arg1)
{
    global.mercymod[arg0] += arg1;
    
    if (global.mercymod[arg0] < 0)
        global.mercymod[arg0] = 0;
    
    if (global.mercymod[arg0] >= 100)
        global.mercymod[arg0] = 100;
    
    var _playsound = 1;
    
    if (arg1 <= 0)
        _playsound = 0;
    
    with (obj_dmgwriter)
    {
        if (type == 5 && mercytimer < 8)
            _playsound = 0;
    }
    
    if (_playsound)
    {
        var _pitch = 0.8;
        
        if (arg1 < 99)
            _pitch = 1;
        
        if (arg1 <= 50)
            _pitch = 1.2;
        
        if (arg1 <= 25)
            _pitch = 1.4;
        
        snd_play_x(snd_mercyadd, 0.8, _pitch);
    }
    
    __mercydmgwriter = instance_create(global.monsterx[arg0], (global.monstery[arg0] + 20) - (global.hittarget[arg0] * 20), obj_dmgwriter);
    __mercydmgwriter.damage = arg1;
    __mercydmgwriter.type = 5;
    global.hittarget[arg0]++;
}

function scr_enemy_drawhurt_generic()
{
    if (state == 3 && hurttimer >= 0)
        draw_sprite_ext(hurtsprite, 0, x + shakex + hurtspriteoffx, y + hurtspriteoffy, 2, 2, 0, image_blend, 1);
}

function scr_enemy_drawidle_generic(arg0)
{
    if (state == 0)
    {
        fsiner += 1;
        siner += arg0;
        thissprite = idlesprite;
        
        if (global.mercymod[myself] >= global.mercymax[myself])
            thissprite = sparedsprite;
        
        draw_monster_body_part(thissprite, siner, x, y);
    }
}

function draw_monster_body_part(arg0, arg1, arg2, arg3)
{
    draw_sprite_ext(arg0, arg1, arg2, arg3, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    
    if (flash == 1)
        draw_sprite_ext_flash(arg0, arg1, arg2, arg3, image_xscale, image_yscale, image_angle, image_blend, (-cos(fsiner / 5) * 0.4) + 0.6);
}

function draw_sprite_ext_flash(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    gpu_set_fog(true, arg7, 0, 1);
    draw_sprite_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
    gpu_set_fog(false, c_black, 0, 0);
}