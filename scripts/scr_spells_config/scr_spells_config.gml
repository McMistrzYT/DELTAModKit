enum DRSpell {
	None = 0,
	
	RudeSword = 1, // unused
	HealPrayer = 2,
	Pacify = 3,
	RudeBuster = 4,
	RedBuster = 5,
	DualHeal = 6,
	ACT = 7, // only used in the Spells menu in the dark world menu
	SleepMist = 8,
	IceShock = 9,
	SnowGrave = 10,
	UltraHeal = 11,
	
	Spare = 100,
}

function scr_spellinfo(spellid)
{
    cost = -1;
    spelltarget = 1;
    spellname = " ";
    spellnameb = " ";
    spelldescb = " ";
    spelldesc = " ";
    spellanim = 0;
    spellusable = 0;
    spelltext = " ";
    
    switch (spellid)
    {
        case DRSpell.None:
            spellname = " ";
            spellnameb = " ";
            spelltarget = 0;
            cost = -1;
            spelldescb = "None";
            break;
        
        case DRSpell.RudeSword:
            spellname = "Rude Sword";
            spellnameb = "RudeSword";
            spelldescb = "Rude#Damage#";
            spelldesc = "Deals moderate Rude-elemental damage to#one foe. Depends on Attack & Magic.";
            spelltarget = 2;
            cost = 125;
            spellusable = 0;
            break;
        
        case DRSpell.HealPrayer:
            spellname = "Heal Prayer";
            spellnameb = "Heal Prayer";
            spelldescb = "Heal#Ally";
            spelldesc = "Heavenly light restores a little HP to#one party member. Depends on Magic.";
            spelltarget = 1;
            cost = 80;
            usable = 0;
            spellusable = 0;
            break;
        
        case DRSpell.Pacify:
            spellname = "Pacify";
            spellnameb = "Pacify";
            spelldescb = "Spare#TIRED foe";
            spelldesc = "SPARE a tired enemy by putting them to sleep.";
            spelltarget = 2;
            cost = 40;
            usable = 0;
            spellusable = 0;
            break;
        
        case DRSpell.RudeBuster:
            spellname = "Rude Buster";
            spellnameb = "Rude Buster";
            spelldescb = "Rude#Damage#";
            spelldesc = "Deals moderate Rude-elemental damage to#one foe. Depends on Attack & Magic.";
            spelltarget = 2;
            cost = 125;
            
            if (global.charweapon[DRCharacter.Susie] == 7)
                cost = 100;
            
            spellusable = 0;
            break;
        
        case DRSpell.RedBuster:
            spellname = "Red Buster";
            spellnameb = "Red Buster";
            spelldescb = "Red#Damage#";
            spelldesc = " ";
            spelltarget = 2;
            cost = 0;
            spellusable = 0;
            break;
        
        case DRSpell.DualHeal:
            spellname = "Dual Heal";
            spellnameb = "Dual Heal";
            spelldescb = "Heal All#30 HP";
            spelldesc = " ";
            spelltarget = 0;
            cost = 0;
            spellusable = 0;
            break;
        
        case DRSpell.ACT:
            spellname = "ACT";
            spellnameb = "ACT";
            spelldescb = "Use#action";
            spelldesc = "Do all sorts of things.#It isn't magic.";
            
            if (global.chapter >= 3)
                spelldesc = "Many different skills.#It has nothing to do with magic.";
            
            spelltarget = 0;
            cost = 0;
            spellusable = 0;
            break;
        
        case DRSpell.SleepMist:
            spellname = "SleepMist";
            spellnameb = "Sleep Mist";
            spelldescb = "Spare#TIRED foes";
            spelldesc = "A cold mist sweeps through,#sparing all TIRED enemies.";
            spelltarget = 0;
            cost = 80;
            spellusable = 0;
            break;
        
        case DRSpell.IceShock:
            spellname = "IceShock";
            spellnameb = "IceShock";
            spelldescb = "Damage#w/ ICE";
            spelldesc = "Deals magical ICE damage to#one enemy.";
            spelltarget = 2;
            cost = 40;
            
            if (global.charweapon[DRCharacter.Noelle] == 13)
                cost *= 0.5;
            
            spellusable = 0;
            break;
        
        case DRSpell.SnowGrave:
            spellname = "SnowGrave";
            spellnameb = "SnowGrave";
            spelldescb = "Fatal";
            spelldesc = "Deals the fatal damage to#all of the enemies.";
            spelltarget = 0;
            cost = global.maxtension * 2;
            
            if (global.charweapon[DRCharacter.Noelle] == 13)
                cost *= 0.5;
            
            spellusable = 0;
            break;
        
        case DRSpell.UltraHeal:
            spellname = "UltraHeal";
            spellnameb = "UltraHeal";
            spelldescb = "Best#healing";
            spelldesc = "An awesome healing spell.#... right?";
            spelltarget = 1;
            cost = 225 - round(global.flag[1045] * 2.5);
            spellusable = 0;
            break;
    }
}

function scr_spell_get_battle_use_text(spellid) {
	scr_spellinfo(spellid);
	
	switch (spellid) {
		default: {
			msgset(0, stringsetsub("* ~1 cast ~2!/%", global.charname[global.char[caster]], string_upper(spellname)));
			break;
		}
		
		// these spells use the word 'used' instead of 'cast'
		case DRSpell.RudeBuster:
		case DRSpell.RedBuster: {
			msgset(0, stringsetsub("* ~1 used ~2!/%", global.charname[global.char[caster]], string_upper(spellname)));
			break;
		}
		
		case DRSpell.Pacify: {
			global.msg[0] = stringsetsub("* ~1 cast PACIFY!/%", global.charname[global.char[caster]]);
            scr_retarget_spell();
            
            if (global.monster[star] == 1 && global.monsterstatus[star] != 1)
            {
                global.msg[0] = stringsetsub("* ~1 cast PACIFY^1!&* But the enemy wasn't \\cBTIRED\\cW.../%", global.charname[global.char[caster]]);
                    
                if (global.mercymod[star] >= 100)
                    global.msg[0] = stringsetsub("* ~1 cast PACIFY^1!&* But the foe wasn't \\cBTIRED\\cW... try \\cYSPARING\\cW!/%", global.charname[global.char[caster]]);
            }
            
            break;	
		}
		
		case DRSpell.Spare: {
			cancelattack = 0;
            global.msg[0] = stringsetsub("* ~1 spared ~2!/%", global.charname[global.char[caster]], global.monstername[star]);
            scr_retarget_spell();
            
            if (global.mercymod[star] >= 100)
            {
                global.msg[0] = stringsetsub("* ~1 spared ~2!/%", global.charname[global.char[caster]], global.monstername[star]);
            }
            else
            {
                global.msg[0] = stringsetsub("* ~1 spared ~2^2!&* But its name wasn't \\cYYELLOW\\cW.../%", global.charname[global.char[caster]], global.monstername[star]);
                
                if (global.monsterstatus[star] == 1)
                {
                    if (scr_havechar(DRCharacter.Ralsei))
                    {
                        global.msg[0] = stringsetsub("* ~1 spared ~2^2!&* But its name wasn't \\cYYELLOW\\cW.../", global.charname[global.char[caster]], global.monstername[star]);
                        global.msg[1] = "* (Try using Ralsei's \\cBPACIFY\\cW!)/%";
                    }
                    else if (scr_havechar(DRCharacter.Noelle))
                    {
                        msgsetsub(0, "* ~1 spared ~2^2!&* But its name wasn't \\cYYELLOW\\cW.../", global.charname[global.char[caster]], global.monstername[star]);
                        msgnext("* (Try using Noelle's \\cBSLEEPMIST\\cW!)/%");
                    }
                    else
                    {
                        msgsetsub(0, "* ~1 spared ~2^2!&* But its name wasn't \\cYYELLOW\\cW.../", global.charname[global.char[caster]], global.monstername[star]);
                        msgnext("* (Try using \\cBACTs\\cW!)/%");
                    }
                }
            }
            
            if (cancelattack == 1)
                global.msg[0] = stringsetsub("* ~1 spared!/%", global.charname[global.char[caster]]);
			break;
		}
	}
}
	
function scr_spell_use_action(casterid, spellid) {
	spell = spellid;
	caster = casterid;
	
	switch (spell) {
		default:
		case DRSpell.None:
            break;
        
        case DRSpell.RudeSword: {
			cancelattack = 0;
            
            if (global.monster[star] == 0)
                scr_retarget_spell();
            
            if (cancelattack == 0)
            {
                damage = ceil((global.battleat[casterid] * 10) - (global.monsterdf[star] * 3));
                
                if (global.automiss[star] == 1)
                    damage = 0;
                
                scr_damage_enemy(star, damage);
                attack = instance_create(global.monsterx[star] + random(6), global.monstery[star] + random(6), obj_basicattack);
                attack.sprite_index = spr_attack_mash1;
                dm.delay = 8;
            }
            
            global.spelldelay = 30;
            break;	
		}
        
        case DRSpell.HealPrayer: {
			var _buff = 0;
            healnum = scr_heal_amount_modify_by_equipment(global.battlemag[casterid] * (5 + _buff));
            scr_heal(star, healnum);
            global.charinstance[star].healnum = healnum;
            
            with (global.charinstance[star])
            {
                ha = instance_create(x, y, obj_healanim);
                ha.target = id;
                dmgwr = scr_dmgwriter_selfchar();
                
                with (dmgwr)
                {
                    delay = 8;
                    type = 3;
                }
                
                if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
                {
                    with (dmgwr)
                        specialmessage = 3;
                }
                
                dmgwr.damage = healnum;
                tu += 1;
            }
            
            global.spelldelay = 15;
            break;
		}
        
        case DRSpell.Pacify: {
			if (global.monster[star] == 0)
                scr_retarget_spell();
            
            if (global.monster[star] == 1)
            {
                if (global.monsterstatus[star] == 1)
                {
                    with (global.monsterinstance[star])
                    {
                        if (global.monstertype[myself] != 19 && global.monstertype[myself] != 3 && global.monstertype[myself] != 52 && global.monstertype[myself] != 43)
                        {
                            var yoffy;
                            
                            if (global.monstertype[myself] == 33)
                                yoffy = -60;
                            else
                                yoffy = 0;
                            
                            _pspell = instance_create(global.monsterx[myself], global.monstery[myself] + yoffy, obj_pacifyspell);
                            _pspell.con = 20;
                            _pspell.target = id;
                            global.flag[51 + myself] = 3;
                            event_user(10);
                            scr_monsterdefeat();
                        }
                        else
                        {
                            if (global.monstertype[myself] == 52)
                            {
                                _pspell = instance_create(global.monsterx[myself], global.monstery[myself], obj_pacifyspell);
                                _pspell.con = 20;
                                _pspell.target = id;
                            }
                            
                            pacifycon = 1;
                            global.spelldelay = 999;
                        }
                    }
                }
                else
                {
                    if (global.monstertype[myself] == 52)
                        pacifycon = -2;
                    
                    _pspell = instance_create(0, 0, obj_pacifyspell);
                    _pspell.target = global.monsterinstance[star];
                    _pspell.fail = 1;
                }
            }
            
            global.spelldelay = 20;
            break;	
		}
        
        case DRSpell.RudeBuster: {
			cancelattack = 0;
            global.spelldelay = 30;
            
            if (global.monster[star] == 0)
                scr_retarget_spell();
            
            if (cancelattack == 0)
            {
                global.spelldelay = 70;
                damage = ceil(((global.battlemag[casterid] * 5) + (global.battleat[casterid] * 11)) - (global.monsterdf[star] * 3));
                
                if (global.automiss[star] == 1)
                    damage = 0;
                
                attack = instance_create(obj_herosusie.x, obj_herosusie.y, obj_rudebuster_anim);
                attack.damage = damage;
                attack.star = star;
                attack.caster = caster;
                attack.target = global.monsterinstance[star];
            }
            
            break;	
		}
        
        case DRSpell.RedBuster: {
			cancelattack = 0;
            global.spelldelay = 30;
            
            if (global.monster[star] == 0)
                scr_retarget_spell();
            
            if (cancelattack == 0)
            {
                global.spelldelay = 70;
                damage = ceil(((global.battlemag[casterid] * 6) + (global.battleat[casterid] * 13)) - (global.monsterdf[star] * 6));
                
                if (global.automiss[star] == 1)
                    damage = 0;
                
                attack = instance_create(obj_herosusie.x, obj_herosusie.y, obj_rudebuster_anim);
                attack.damage = damage;
                attack.star = star;
                attack.caster = caster;
                attack.target = global.monsterinstance[star];
                attack.red = 1;
            }
            
            break;	
		}
        
        case DRSpell.DualHeal: {
			healnum = ceil(global.battlemag[casterid] * 5.5);
            
            for (i = 0; i < 3; i += 1)
            {
                scr_heal(i, healnum);
                global.charinstance[i].healnum = healnum;
                
                with (global.charinstance[i])
                {
                    ha = instance_create(x, y, obj_healanim);
                    ha.target = id;
                    dmgwr = scr_dmgwriter_selfchar();
                    
                    with (dmgwr)
                    {
                        delay = 8;
                        type = 3;
                    }
                    
                    if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
                    {
                        with (dmgwr)
                            specialmessage = 3;
                    }
                    
                    dmgwr.damage = healnum;
                    tu += 1;
                }
            }
            
            global.spelldelay = 15;
            break;
		}
        
        /*case DRSpell.SleepMist:
            var _mistcount = 0;
            
            for (_spelli = 0; _spelli < 3; _spelli++)
            {
                if (global.monster[_spelli] == 1)
                {
                    with (global.monsterinstance[_spelli])
                    {
                        _icemist = instance_create(global.monsterx[myself], global.monstery[myself], obj_spell_mist);
                        _icemist.target = id;
                        _icemist.myself = myself;
                        _icemist.initdelay = _mistcount * 10;
                        _mistcount++;
                    }
                }
            }
            
            global.spelldelay = 20 + (_mistcount * 10);
            break;*/
        
        /*case DRSpell.IceShock:
            cancelattack = 0;
            global.spelldelay = 30;
            
            if (global.monster[star] == 0)
                scr_retarget_spell();
            
            if (cancelattack == 0)
            {
                global.flag[925]++;
                var minbattlemag = clamp(global.battlemag[casterid] - 10, 1, 999);
                global.spelldelay = 40;
                damage = ceil((minbattlemag * 30) + 90 + random(10));
                attack = instance_create(global.monsterx[star], global.monstery[star], obj_icespell);
                attack.damage = damage;
                attack.star = star;
                attack.caster = caster;
                attack.target = global.monsterinstance[star];
            }
            
            break;
        
        case DRSpell.SnowGrave:
            cancelattack = 0;
            global.spelldelay = 30;
            
            if (scr_monsterpop() == 0)
                cancelattack = 1;
            
            if (cancelattack == 0)
            {
                global.spelldelay = 30;
                damage = ceil((global.battlemag[casterid] * 40) + 600);
                attack = instance_create(x, y, obj_spell_snowgrave);
                attack.caster = caster;
                attack.damage = damage;
                global.spelldelay = 140;
            }
            
            break;*/
        
        case DRSpell.UltraHeal: {
			global.flag[1045]++;
            
            if (global.flag[1045] > 5)
                global.flag[1045] = 5;
            
            healnum = ceil(scr_heal_amount_modify_by_equipment((global.battlemag[casterid] * 1.5) + 5 + (1 * global.flag[1045])));
            scr_heal(star, healnum);
            global.charinstance[star].healnum = healnum;
            
            with (global.charinstance[star])
            {
                ha = instance_create(x, y, obj_healanim);
                ha.target = id;
                dmgwr = scr_dmgwriter_selfchar();
                
                with (dmgwr)
                {
                    delay = 8;
                    type = 3;
                }
                
                if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
                {
                    with (dmgwr)
                        specialmessage = 3;
                }
                
                dmgwr.damage = healnum;
                tu += 1;
            }
            
            global.spelldelay = 15;
            scr_spellmenu_setup();
            break;	
		}
        
		// yes, this is in fact a spell
        case DRSpell.Spare: {
			if (global.monster[star] == 0)
                scr_retarget_spell();
            
            if (global.monster[star] == 1)
            {
                if (global.mercymod[star] >= 100)
                {
                    if (global.monstertype[star] != 3 && global.monstertype[star] != 52)
                    {
                        with (global.monsterinstance[star])
                        {
                            global.flag[51 + myself] = 2;
                            event_user(10);
                            scr_monsterdefeat();
                        }
                    }
                    else
                    {
                        with (global.monsterinstance[star])
                            sparecon = 1;
                    }
                }
                else
                {
                    scr_mercyadd(star, global.sparepoint[star]);
                    _pspell = instance_create(0, 0, obj_pacifyspell);
                    _pspell.target = global.monsterinstance[star];
                    _pspell.fail = 1;
                    _pspell.flashcolor = c_yellow;
                }
            }
            
            global.spelldelay = 0;
            break;
		}
	}
}