function scr_spell(spellid, casterid)
{
    spell = spellid;
    caster = casterid;
    star = global.chartarget[casterid];
    global.spelldelay = 10;
    var item_use = false;
	
	show_debug_message("scr_spell({0}, {1})", spellid, casterid);
	
	if spellid < 10000
		scr_spell_use_action(casterid, spellid);
	else
		item_use = scr_item_use_action_battle(casterid, spellid - 10000);
}

function scr_spellconsumeb()
{
    global.tension -= floor(floor((cost / global.maxtension) * 100) * 2.5);
    global.faceaction[global.charturn] = 2;
    global.charaction[global.charturn] = 2;
    
    if (global.flag[34] == 1)
        global.charspecial[global.charturn] = global.spell[global.char[global.charturn]][global.bmenucoord[2][global.charturn]];
    
    if (global.flag[34] == 0)
        global.charspecial[global.charturn] = global.battlespell[global.charturn][global.bmenucoord[2][global.charturn]];
    
    global.tensionselect = 0;
    
    if (spellanim == 1)
    {
        with (global.charinstance[global.charturn])
        {
            spellframes = 0;
            spellsprite = spellreadysprite;
        }
    }
    else
    {
        with (global.charinstance[global.charturn])
        {
            spellframes = remspellframes;
            spellsprite = remspellsprite;
        }
    }
    
    scr_nexthero();
}

function scr_itemconsumeb()
{
    global.faceaction[global.charturn] = 3;
    global.charaction[global.charturn] = 4;
    global.charspecial[global.charturn] = tempitem[global.bmenucoord[4][global.charturn]][global.charturn] + 10000;
    
    if (usable == 1 && replaceable == 0)
        scr_itemshift_temp(global.bmenucoord[4][global.charturn], global.charturn);
    else if (replaceable > 0)
        tempitem[global.bmenucoord[4][global.charturn]][global.charturn] = replaceable;
    
    scr_nexthero();
}

function scr_attackphase()
{
    with (obj_battlecontroller)
    {
        techwon = 0;
        
        if (scr_monsterpop() == 0)
            techwon = 1;
        
        if (techwon == 1)
            scr_wincombat();
        
        if (techwon == 0)
        {
            for (__hiti = 0; __hiti < 3; __hiti++)
                global.hittarget[__hiti] = 0;
            
            fightphase = 1;
            global.charturn = 3;
            
            if (global.charaction[0] == 4 || global.charaction[0] == 2)
                fightphase = 0;
            
            if (global.charaction[1] == 4 || global.charaction[1] == 2)
                fightphase = 0;
            
            if (global.charaction[2] == 4 || global.charaction[2] == 2)
                fightphase = 0;
            
            if (global.myfight == 4)
                fightphase = 1;
            
            if (fightphase == 1)
            {
                global.myfight = 1;
                instance_create(xx + 2, yy + 365, obj_attackpress);
            }
            else
            {
                global.myfight = 4;
                instance_create(0, 0, obj_spellphase);
            }
        }
    }
}