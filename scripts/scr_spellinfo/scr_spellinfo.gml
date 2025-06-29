function scr_spellinfo_all()
{
    for (j = 0; j < DRCharacter.__MAX__; j += 1)
    {
        for (i = 0; i < 12; i += 1)
        {
            spellid = global.spell[j][i];
            scr_spellinfo(spellid);
            global.spellname[j][i] = spellname;
            global.spellnameb[j][i] = spellnameb;
            global.spelldescb[j][i] = spelldescb;
            global.spelldesc[j][i] = spelldesc;
            global.spellcost[j][i] = cost;
            global.spellusable[j][i] = spellusable;
            global.spelltarget[j][i] = spelltarget;
        }
    }
}

function scr_spelltext(spellid, arg1)
{
    spell = spellid;
    caster = arg1;
    star = global.chartarget[arg1];
    spelltext = " ";
	
	if spellid < 10000
		scr_spell_get_battle_use_text(spellid);
	else
		scr_item_get_battle_use_text(spellid - 10000);
}

function scr_spellmenu_setup()
{
    var __actnamecheck = 0;
    var __monstertype = global.monstertype[0];
    
    for (__monsterIdx = 1; __monsterIdx < 3; __monsterIdx++)
    {
        if (global.monster[__monsterIdx] == 1 && global.monstertype[__monsterIdx] != __monstertype)
            __actnamecheck = 1;
    }
    
    for (__charIdx = 0; __charIdx < 3; __charIdx++)
    {
        for (__actIdx = 0; __actIdx < 6; __actIdx++)
        {
            global.battlespell[__charIdx][__actIdx] = DRSpell.None;
            
            if (global.canact[global.char[__charIdx]][0][__actIdx] == 1)
            {
                global.battlespell[__charIdx][__actIdx] = -1;
                    
                if (global.battleactcount[__charIdx] < (__actIdx + 1))
                    global.battleactcount[__charIdx] = __actIdx + 1;
                    
                global.battlespellcost[__charIdx][__actIdx] = global.actcost[global.char[__charIdx]][0][__actIdx];
                global.battlespellname[__charIdx][__actIdx] = global.actname[global.char[__charIdx]][0][__actIdx];
                global.battlespelldesc[__charIdx][__actIdx] = global.actdesc[global.char[__charIdx]][0][__actIdx];
				
				var override = scr_character_get_act_name_override(global.char[__charIdx]);
				if (string_length(override) > 0)
					global.battlespellname[__charIdx][__actIdx] = override;
				
                global.battlespelltarget[__charIdx][__actIdx] = string_length(override) > 0 ? 2 : 0;
                global.battlespellspecial[__charIdx][__actIdx] = global.char[__charIdx];
            }
        }
    }
    
    scr_spellinfo_all();
    
    for (__charIdx = 0; __charIdx < 3; __charIdx++)
    {
        for (__actIdx = 0; __actIdx < 12; __actIdx++)
        {
            __charIdxb = global.battleactcount[__charIdx] + __actIdx;
            global.battlespell[__charIdx][__charIdxb] = global.spell[global.char[__charIdx]][__actIdx];
            global.battlespellcost[__charIdx][__charIdxb] = global.spellcost[global.char[__charIdx]][__actIdx];
            global.battlespellname[__charIdx][__charIdxb] = global.spellnameb[global.char[__charIdx]][__actIdx];
            global.battlespelldesc[__charIdx][__charIdxb] = global.spelldescb[global.char[__charIdx]][__actIdx];
            global.battlespelltarget[__charIdx][__charIdxb] = global.spelltarget[global.char[__charIdx]][__actIdx];
        }
    }
}