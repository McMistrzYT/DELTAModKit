function scr_mnendturn()
{
    /*if (global.char[0] == 2)
        sus = 0;
    
    if (global.char[1] == 2)
        sus = 1;
    
    if (global.char[2] == 2)
        sus = 2;*/
		
	sus = arr_find_index(global.char, function(a) { return a == DRCharacter.Susie });
    
    techwon = 0;
    
    if (scr_monsterpop() == 0)
        techwon = 1;
    
    if (global.flag[39] == 1)
        techwon = 1;
    
    if (techwon == 1)
        scr_combat_result();
    
    if (techwon == 0)
    {
        with (obj_battlecontroller)
        {
            messagepriority = -1;
            attackpriority = -1;
        }
        
        scr_battlecursor_memory_reset();
        
        global.mnfight = 0;
        global.myfight = 0;
        global.bmenuno = 0;
        global.charturn = 0;
        skip = 0;
        
        for (i = 0; i < 3; i += 1)
        {
            global.hittarget[i] = 0;
            
            with (global.charinstance[i])
                tu = 0;
            
            hptarget = global.char[i];
            
            if (global.char[i] != 0 && global.hp[hptarget] <= 0)
            {
                healamt = ceil(global.maxhp[hptarget] / 8);
                dmgwr = instance_create(global.charinstance[i].x, (global.charinstance[i].y + global.charinstance[i].myheight) - 24, obj_dmgwriter);
                    
                with (dmgwr)
                {
                    delay = 1;
                    type = 3;
                }
                    
                dmgwr.damage = scr_heal(i, healamt);
                    
                if (global.hp[hptarget] >= 1)
                {
                    with (dmgwr)
                        specialmessage = 4;
                }
            }
        }
        
        if (global.charmove[0] == 0 || global.charauto[global.char[0]] == 1)
            global.charturn = 1;
        
        if (global.charturn == 1)
        {
            if (global.charmove[1] == 0 || global.charauto[global.char[1]] == 1)
                global.charturn = 2;
        }
        
        if (global.charturn == 2)
        {
            if (global.charmove[2] == 0 || global.charauto[global.char[2]] == 1)
                skip = 1;
        }
        
        for (i = 0; i < 3; i += 1)
        {
            global.acting[i] = 0;
            global.actingsingle[i] = 0;
            global.actingsimul[i] = 0;
            global.actingtarget[i] = 0;
            global.temptension[i] = global.tension;
            global.charspecial[i] = 0;
            global.targeted[i] = 0;
            global.charaction[i] = 0;
            global.faceaction[i] = 0;
            global.monsterattackname[i] = " ";
        }
        
        global.currentactingchar = 0;
        
        with (obj_monsterparent)
        {
            attacked = 0;
            talked = 0;
			for (i = 0; i < DRCharacter.__MAX__; i++)
				acting[i] = 0;
        }
        
        if (skip == 1)
        {
            if (global.char[0] == DRCharacter.Susie && global.charauto[DRCharacter.Susie] == 1)
            {
                global.acting[0] = 1;
                global.myfight = 3;
            }
            
            scr_endturn();
        }
        
        for (i = 0; i < 12; i += 1)
        {
            for (j = 0; j < 3; j += 1)
                tempitem[i][j] = global.item[i];
        }
    }
}

function scr_endturn()
{
    for (i = 0; i < 12; i += 1)
        global.item[i] = tempitem[i][global.charturn];
    
    for (i = 0; i < 12; i += 1)
    {
        for (j = 0; j < 3; j += 1)
            tempitem[i][j] = global.item[i];
    }
    
    moveswapped = 0;
    
    with (obj_writer)
        instance_destroy();
    
    with (obj_face)
        instance_destroy();
    
    with (obj_smallface)
        instance_destroy();
    
    global.attacking = 0;
    
    for (i = 0; i < 3; i += 1)
    {
        global.monsterattackname[i] = " ";
        
        if (global.charauto[global.char[i]] == 1 && global.hp[global.char[i]] > 0)
        {
            if (global.monster[2] == 1)
                global.chartarget[i] = 2;
            
            if (global.monster[1] == 1)
                global.chartarget[i] = 1;
            
            if (global.monster[0] == 1)
                global.chartarget[i] = 0;
        }
        
        if (global.charaction[i] == 1)
            global.attacking = 1;
    }
    
    __noactors = 1;
    
    if (global.acting[0] == 1)
        __noactors = 0;
    
    for (__noactorsi = 0; __noactorsi < 3; __noactorsi++)
    {
        if (global.actingsingle[__noactorsi] == 1)
            __noactors = 0;
			
		show_debug_message("global.actingsingle[{0}] = {1}", __noactorsi, global.actingsingle[__noactorsi]);
		show_debug_message("global.acting[{0}] = {1}", __noactorsi, global.acting[__noactorsi]);
		show_debug_message("global.actingsimul[{0}] = {1}", __noactorsi, global.actingsimul[__noactorsi]);
    }
    
    if (__noactors == 1)
    {
        scr_attackphase();
    }
    else
    {
		show_debug_message("Doing acts!");
        global.charturn = 3;
        global.myfight = 3;
        global.currentactingchar = 0;
        
        if (global.acting[0] == 0)
            scr_nextact();
        
        if (global.acting[0] == 1 && global.actingsimul[0] == 1)
            scr_act_simul();
    }
    
    with (obj_battlecontroller)
    {
        messagepriority = -1;
        attackpriority = -1;
    }
}

function scr_retarget(arg0)
{
    thistarget = global.chartarget[arg0];
    cancelattack = 0;
    
    if (thistarget == 0)
    {
        if (global.monster[0] == 0)
            thistarget = 1;
    }
    
    if (thistarget == 1)
    {
        if (global.monster[1] == 0)
            thistarget = 2;
    }
    
    if (thistarget == 2)
    {
        if (global.monster[2] == 0)
            thistarget = 3;
        
        if (thistarget == 3 && global.monster[0] == 1)
            thistarget = 0;
        
        if (thistarget == 3 && global.monster[1] == 1)
            thistarget = 1;
        
        if (thistarget == 3)
            cancelattack = 1;
    }
    
    global.chartarget[arg0] = thistarget;
}

function scr_retarget_spell()
{
    cancelattack = 0;
    
    if (star == 0)
    {
        if (global.monster[0] == 0)
            star = 1;
    }
    
    if (star == 1)
    {
        if (global.monster[1] == 0)
            star = 2;
    }
    
    if (star == 2)
    {
        if (global.monster[2] == 0)
            star = 3;
        
        if (star == 3 && global.monster[0] == 1)
            star = 0;
        
        if (star == 3 && global.monster[1] == 1)
            star = 1;
        
        if (star == 3)
            cancelattack = 1;
    }
}

function scr_ambush()
{
    with (obj_writer)
        instance_destroy();
    
    with (obj_face)
        instance_destroy();
    
    global.charturn = 3;
    global.mnfight = 1;
    global.myfight = -1;
    
    with (obj_monsterparent)
        ambushed = 1;
}

function scr_nexthero()
{
    moveswapped = 0;
    prevturn = global.charturn;
    
    if (global.charturn == 0)
    {
        moveswapped = 1;
        
        if (global.charmove[1] == 1 && scr_charcan(1))
            global.charturn = 1;
        else if (global.charmove[2] == 1 && scr_charcan(2))
            global.charturn = 2;
        else
            scr_endturn();
    }
    
    if (global.charturn == 1 && moveswapped == 0)
    {
        moveswapped = 1;
        
        if (scr_charcan(2) && global.acting[1] == 0)
            global.charturn = 2;
        else
            scr_endturn();
    }
    
    var endturn = false;
    
    if ((global.charturn == 2 && moveswapped == 0) || endturn == true)
        scr_endturn();
    
    if (moveswapped == 1)
        global.bmenuno = 0;
    
    if (global.charturn > 0)
    {
        global.temptension[global.charturn] = global.tension;
        
        for (i = 0; i < 12; i += 1)
            tempitem[i][global.charturn] = tempitem[i][prevturn];
    }
}

function scr_prevhero()
{
    prevturn = global.charturn;
    moveswapped = 0;
    
    if (global.charturn == 1)
    {
        if (global.charmove[0] == 1)
        {
            global.charturn = 0;
            moveswapped = 1;
        }
    }
    
    if (global.charturn == 2)
    {
        moveswapped = 1;
        
        if (global.charmove[1] == 1 && global.acting[1] == 0)
            global.charturn = 1;
        else if (global.charmove[0] == 1)
            global.charturn = 0;
    }
    
    if (moveswapped == 1)
    {
        global.bmenuno = 0;
		
		with (obj_monsterparent)
			acting[global.char[global.charturn]] = 0;
        
        global.actingsingle[global.charturn] = 0;
        global.actingsimul[global.charturn] = 0;
        global.faceaction[global.charturn] = 0;
        global.chartarget[global.charturn] = 0;
        global.charaction[global.charturn] = 0;
        global.charspecial[global.charturn] = 0;
        movenoise = 1;
    }
    
    if (idefendedthisturn > 0)
    {
        idefendedthisturn--;
        mercytotal -= 40;
    }
    
    if (global.charturn == 0)
    {
        with (obj_monsterparent)
            for (i = 0; i < DRCharacter.__MAX__; i++)
				acting[i] = 0;
        
        global.acting[0] = 0;
        global.acting[1] = 0;
        global.acting[2] = 0;
        global.faceaction[1] = 0;
        global.chartarget[1] = 0;
        global.charaction[1] = 0;
        global.charspecial[1] = 0;
        global.faceaction[2] = 0;
        global.tension = global.temptension[0];
        
        for (i = 0; i < 12; i += 1)
            tempitem[i][0] = global.item[i];
    }
    else
    {
        global.tension = global.temptension[global.charturn];
        
        for (i = 0; i < 12; i += 1)
            tempitem[i][global.charturn] = tempitem[i][global.charturn - 1];
    }
}

function scr_actselect(arg0, arg1)
{
    if (i_ex(global.monsterinstance[arg0]))
		global.monsterinstance[arg0].acting[global.char[global.charturn]] = arg1 + 1;
    
    if (global.char[global.charturn] == DRCharacter.Kris)
    {
        global.actingsimul[0] = actsimul[arg1];
        global.acting[0] = 1;
        global.actingsingle[0] = 1;
        global.actingtarget[global.charturn] = arg0;
        
        for (i = 0; i < 3; i += 1)
        {
            if (global.acting[i] == 1)
            {
                global.faceaction[i] = 6;
                global.charaction[i] = 9;
            }
        }
    }
    else
    {
        global.actingtarget[global.charturn] = arg0;
        global.actingsingle[global.charturn] = 1;
        global.actingsimul[global.charturn] = actsimul[arg1];
        global.faceaction[global.charturn] = 6;
        global.charaction[global.charturn] = 9;
    }
}

function scr_nextact()
{
	show_debug_message("------------ scr_nextact")
	
    global.acting[0] = 0;
    global.acting[1] = 0;
    global.acting[2] = 0;
    global.actingsingle[global.currentactingchar] = 0;
    __minstance = global.monsterinstance[global.actingtarget[global.currentactingchar]];
    
    with (__minstance)
    {
		acting[DRCharacter.Kris] = 0;
		for (i = 1; i < DRCharacter.__MAX__; i++) {
			//acting[i] = 0;
			actcon[i] = 0;
		}
    }
    
    var singleactcomplete = 0;
	show_debug_message("global.currentactingchar = {0}", global.currentactingchar);
    while (global.currentactingchar < 3)
    {
        global.currentactingchar++;
		show_debug_message("++global.currentactingchar = {0}", global.currentactingchar);
        
        if (global.currentactingchar < 3)
        {
			show_debug_message("global.actingsingle[{0}] = {1}", global.currentactingchar, global.actingsingle[global.currentactingchar]);
            if (global.actingsingle[global.currentactingchar] == 1)
            {
                __minstance = global.monsterinstance[global.actingtarget[global.currentactingchar]];
				with (__minstance)
					actcon[global.char[global.currentactingchar]] = 1;
					
				show_debug_message("actcon[{0}] = {1}", global.char[global.currentactingchar], 1);
				
				if (global.actingsimul[global.currentactingchar] == 0)
					singleactcomplete = 1;
					
				break;
            }
        }
    }
	
	show_debug_message("singleactcomplete = {0}", singleactcomplete);
	show_debug_message("------------")
    
    if (global.currentactingchar >= 3)
    {
		show_debug_message("Going to ATTACK phase", singleactcomplete);
        with (obj_monsterparent)
        {
			for (i = 1; i < DRCharacter.__MAX__; i++)
				acting[i] = 0;
        }
        
        global.currentactingchar = 0;
        scr_attackphase();
    }
    else if (!singleactcomplete)
    {
		show_debug_message("Going to ACT SIMUL phase", singleactcomplete);
        scr_act_simul();
    }
}

function scr_act_simul()
{
	show_debug_message("------------ scr_act_simul")
	__simulcount = 0;
    
    for (__ii = global.currentactingchar; __ii < 3; __ii++)
    {
        __foundsimul = 0;
        
        if (global.actingsingle[__ii] == 1 && instance_exists(obj_monsterparent))
        {
			if (global.actsimul[global.char[__ii]][global.actingtarget[__ii]][global.actingchoice[__ii]] == 1) {
				obj_monsterparent.simulorder[global.char[__ii]] = __simulcount;
                global.monsterinstance[global.actingtarget[__ii]].actcon[global.char[__ii]] = global.char[__ii] == DRCharacter.Kris ? 0 : 1;
					
				__foundsimul = 1;
			}
            
            if (__foundsimul)
            {
                global.actingsingle[__ii] = 0;
                __simulcount++;
            }
            
            obj_monsterparent.simultotal = __simulcount;
        }
    }
	
	show_debug_message("------------")
}

function scr_damage_enemy(arg0, arg1)
{
    dm = instance_create(global.monsterx[arg0], (global.monstery[arg0] + 20) - (global.hittarget[arg0] * 20), obj_dmgwriter);
    
    if (caster < 4)
    {
        dm.type = global.char[caster] - 1;
        
        if (global.char[caster] == 4)
            dm.type = 6;
    }
    
    if (caster == 5)
        dm.type = 5;
    
    dm.damage = arg1;
    global.monsterhp[arg0] -= arg1;
    
    if (arg1 > 0)
    {
        with (global.monsterinstance[arg0])
        {
            shakex = 9;
            state = 3;
            hurttimer = 30;
        }
        
        if (i_ex(global.monsterinstance[arg0]))
            global.monsterinstance[arg0].hurtamt = arg1;
    }
    
    global.hittarget[arg0] += 1;
    
    if (arg1 == 0)
    {
        with (global.monsterinstance[arg0])
        {
            hurtamt = 0;
            
            if (hurttimer <= 15 && candodge == 1)
            {
                dodgetimer = 0;
                state = 4;
            }
        }
    }
    
    var a = 0;
    
    if (global.monsterhp[arg0] <= 0 && a == 0)
    {
        with (global.monsterinstance[arg0])
            scr_monsterdefeat();
    }
}

function scr_turntimer(arg0)
{
    if (global.turntimer < arg0)
        global.turntimer = arg0;
}

function scr_bulletspawner(arg0, arg1, arg2)
{
    __dc = instance_create(arg0, arg1, arg2);
    __dc.creator = myself;
    __dc.creatorid = id;
    __dc.target = mytarget;
    __dc.damage = global.monsterat[myself] * 5;
    return __dc;
}

function scr_simultext(arg0)
{
    __yoffset = simulorder[arg0] * 30;
    global.typer = 4;
    battlewriter = instance_create(xx + 30, yy + 376 + __yoffset, obj_writer);
}

function scr_monster_make_tired(arg0)
{
    if (image_alpha > 0)
    {
        if (global.monsterstatus[arg0] == 0)
        {
            __tiredwriter = instance_create(global.monsterx[arg0], (global.monstery[arg0] - (global.hittarget[arg0] * 20)) + 20, obj_dmgwriter);
            __tiredwriter.type = 13;
            global.hittarget[arg0] += 1;
            snd_play_x(snd_spellcast, 0.5, 0.9);
        }
        
        global.monstercomment[arg0] = "(Tired)";
        global.monsterstatus[arg0] = 1;
    }
}

function scr_enemyhurt_tired_after_damage(arg0)
{
    if (global.monsterhp[myself] <= (global.monstermaxhp[myself] * arg0))
        scr_monster_make_tired(myself);
}

function scr_enemy_hurt()
{
    hurttimer -= 1;
    
    if (hurttimer < 0)
    {
        state = 0;
    }
    else
    {
        if (global.monster[myself] == 0)
            scr_defeatrun();
        
        hurtshake += 1;
        
        if (hurtshake > 1)
        {
            if (shakex > 0)
                shakex -= 1;
            
            if (shakex < 0)
                shakex += 1;
            
            shakex = -shakex;
            hurtshake = 0;
        }
    }
}

function scr_defeatrun()
{
    var __frozen;
    
    if (object_is_ancestor(object_index, obj_monsterparent))
    {
        __frozen = 0;
        
        if (global.flag[51 + myself] == 6)
            __frozen = 1;
        
        if (__frozen == 1)
        {
            _rtext = instance_create(global.monsterx[myself], global.monstery[myself] - 40, obj_recruitanim);
            _rtext.image_index = 12;
            
            if (recruitable == 1)
                global.flag[global.monstertype[myself] + 600] = -1;
            
            global.flag[63] = 1;
        }
        
        if (recruitable == 1 && global.flag[61] == 0 && __frozen == 0)
        {
            global.flag[63] = 1;
            
            if (global.flag[global.monstertype[myself] + 600] != -1)
            {
                global.flag[global.monstertype[myself] + 600] = -1;
                _rtext = instance_create(global.monsterx[myself], global.monstery[myself] - 40, obj_recruitanim);
                _rtext.image_index = 7;
            }
        }
    }
    else
    {
        fatal = 0;
    }
    
    //if (fatal == 1)
    //    defeatanim = instance_create(x, y, obj_deathanim);
    //else
        defeatanim = instance_create(x, y, obj_defeatanim);
    
    defeatanim.sprite_index = sprite_index;
    defeatanim.sprite_index = hurtsprite;
    defeatanim.image_index = 0;
    defeatanim.image_xscale = image_xscale;
    defeatanim.image_yscale = image_yscale;
    instance_destroy();
}