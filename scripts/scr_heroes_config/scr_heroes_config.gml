enum DRHero {
	Kris = 0,
	Susie = 1,
	Ralsei = 2,
	Noelle = 3,
	
	Starwalker = 4,
	
	__MAX__ = 5,
}

enum DRCharacter {
	None = 0,
	Kris = 1,
	Susie = 2,
	Ralsei = 3,
	Noelle = 4,
	
	Starwalker = 5,
	
	__MAX__ = 6,
}

function scr_hero_has_pacify(heroIdx) {
	return heroIdx == DRHero.Ralsei || heroIdx == DRHero.Noelle;
}

function scr_hero_get_pacify_spell_cost(heroIdx) {
	switch (heroIdx) {
		case DRHero.Ralsei: return 40;
		case DRHero.Noelle: return 80;
		
		default: return -1;
	}
}

function scr_hero_uses_acts_instead_of_spells(heroIdx) {
	switch (heroIdx) {
		case DRHero.Kris: return true;
		
		default: return false;
	}
}

function scr_hero_get_color(heroIdx) {
	switch (heroIdx) {
		case DRHero.Kris:	return c_aqua;
		case DRHero.Susie:	return c_fuchsia;
		case DRHero.Ralsei: return c_lime;
		case DRHero.Noelle: return c_yellow;
		
		case DRHero.Starwalker: return c_yellow;
		
		default: return c_white;
	}
}

function scr_hero_get_battle_instance(heroIdx) {
	switch (heroIdx) {
		case DRHero.Kris:	return obj_herokris;
		case DRHero.Susie:	return obj_herosusie;
		case DRHero.Ralsei: return obj_heroralsei;
		case DRHero.Noelle: return obj_heronoelle;
		
		case DRHero.Starwalker: return obj_herostarwalker;
		
		default: return obj_herokris;
	}
}

function scr_hero_get_nameplate(heroIdx) {
	switch (heroIdx) {
		default:
		case DRHero.Kris: {
			headspr = spr_headkris;
			namespr = spr_bnamekris;
			break;	
		}
		
		case DRHero.Susie: {
			headspr = spr_headsusie;
			namespr = spr_bnamesusie;
			break;
		}
				
		case DRHero.Ralsei: {
			headspr = spr_headralsei;
			namespr = spr_bnameralsei;
			break;
		}
				
		case DRHero.Noelle: {
			headspr = spr_headnoelle;
			namespr = spr_bnamenoelle;
			break;
		}
		
		// mod
		case DRHero.Starwalker: {
			headspr = spr_headstarwalker;
			namespr = spr_bnamestarwalker;
			break;
		}
	}	
}

function scr_hero_set_sprites(heroObject) {
	switch (heroObject) {
		default:
		case obj_herokris: {
			normalsprite = spr_krisr_dark;
		    idlesprite = spr_krisb_idle;
		    defendsprite = spr_krisb_defend;
		    hurtsprite = spr_krisb_hurt;
		    attackreadysprite = spr_krisb_attackready;
		    attacksprite = spr_krisb_attack;
		    itemsprite = spr_krisb_item;
		    actreadysprite = spr_krisb_actready;
		    actsprite = spr_krisb_act;
		    itemreadysprite = spr_krisb_itemready;
		    spellreadysprite = spr_krisb_actready;
		    spellsprite = spr_krisb_act;
		    defeatsprite = spr_krisb_defeat;
		    victorysprite = spr_krisb_victory;
		    actframes = 7;
		    actreturnframes = 10;
		    attackframes = 6;
		    itemframes = 6;
		    defendframes = 5;
		    spellframes = 10;
		    attackspeed = 0.5;
		    victoryframes = sprite_get_number(victorysprite);
		    mywidth = 68;
		    myheight = 74;
			break;	
		}
		
		case obj_herosusie: {
			attackframes = 5;
		    itemframes = 5;
		    defendframes = 5;
		    actframes = 7;
		    actreturnframes = 10;
		    spellframes = 8;
		    attackspeed = 0.5;
		    normalsprite = spr_susier_dark;
		    idlesprite = spr_susieb_idle;
		    defendsprite = spr_susieb_defend;
		    hurtsprite = spr_susieb_hurt;
		    actreadysprite = spr_susieb_actready;
		    actsprite = spr_susieb_act;
		    attackreadysprite = spr_susieb_attackready;
		    attacksprite = spr_susieb_attack;
    
		    itemsprite = spr_susieb_item;
		    itemreadysprite = spr_susieb_itemready;
		    spellreadysprite = spr_susieb_spellready;
		    spellsprite = spr_susieb_spell;
		    defeatsprite = spr_susieb_defeat;
	
		    victorysprite = spr_susieb_victory;
		    victoryframes = sprite_get_number(victorysprite);
		    mywidth = 70;
		    myheight = 82;
			break;
		}
		
		case obj_heroralsei: {
			attackframes = 6;
		    itemframes = 6;
		    defendframes = 7;
		    actframes = 7;
		    actreturnframes = 10;
		    attackspeed = 0.5;
		    normalsprite = spr_ralsei_walk_right;
		    idlesprite = spr_ralsei_idle;
		    defendsprite = spr_ralsei_defend;
		    hurtsprite = spr_ralsei_hurt_fixed;
		    attackreadysprite = spr_ralsei_attackready;
		    attacksprite = spr_ralsei_attack;
		    itemsprite = spr_ralsei_item;
		    itemreadysprite = spr_ralsei_itemready;
		    spellreadysprite = spr_ralsei_spellready;
		    spellsprite = spr_ralsei_spell;
		    defeatsprite = spr_ralsei_defeat;
		    victorysprite = spr_ralsei_victory;
		    actreadysprite = spr_ralsei_actready;
		    actsprite = spr_ralsei_act;
		    victoryframes = sprite_get_number(victorysprite);
		    mywidth = 52;
		    myheight = 86;
			break;
		}
		
		case obj_herostarwalker: {
			attackframes = 1;
		    itemframes = 1;
		    defendframes = 1;
		    actframes = 1;
		    actreturnframes = 1;
		    attackspeed = 0.5;
		    normalsprite = spr_npc_originalstarwalker;
		    idlesprite = spr_npc_originalstarwalker;
		    defendsprite = spr_npc_originalstarwalker;
		    hurtsprite = spr_npc_originalstarwalker;
		    attackreadysprite = spr_npc_originalstarwalker;
		    attacksprite = spr_npc_originalstarwalker;
		    itemsprite = spr_npc_originalstarwalker;
		    itemreadysprite = spr_npc_originalstarwalker;
		    spellreadysprite = spr_npc_originalstarwalker;
		    spellsprite = spr_npc_originalstarwalker;
		    defeatsprite = spr_npc_originalstarwalker;
		    victorysprite = spr_npc_originalstarwalker;
		    actreadysprite = spr_npc_originalstarwalker;
		    actsprite = spr_npc_originalstarwalker;
		    victoryframes = sprite_get_number(victorysprite);
		    mywidth = 37;
		    myheight = 36;
			break;
		}
	}
}

function scr_character_set_caterpillar_sprites(charIdx) {
	switch (charIdx) {
		case DRCharacter.Ralsei: {
			name = "ralsei";
                
            usprite = spr_ralsei_walk_up;
            dsprite = spr_ralsei_walk_down;
            rsprite = spr_ralsei_walk_right;
            lsprite = spr_ralsei_walk_left;
			break;
		}
		
		case DRCharacter.Noelle: { name = "noelle"; break; } // noelle has no sprites because i didnt wanna do allat importing
		
		case DRCharacter.Starwalker: {
			name = "starwalker";
			
			usprite = spr_npc_originalstarwalker;
            dsprite = spr_npc_originalstarwalker;
            rsprite = spr_npc_originalstarwalker;
            lsprite = spr_npc_originalstarwalker;
			break;
		}
	}
}

function scr_character_get_max_hp(charIdx) {
	var chapter = global.chapter;
	var defaultChapterIncreaseFormula = (chapter > 1 ? 30 : 0) + (chapter - 1) * 40;
	
	switch (charIdx) {
		case DRCharacter.Kris: return 90 + defaultChapterIncreaseFormula + 20;
		case DRCharacter.Susie: return 110 + defaultChapterIncreaseFormula + 20;
		case DRCharacter.Ralsei: return 70 + defaultChapterIncreaseFormula + 20;
		
		default:
		case DRCharacter.Noelle: return 999;
	}
}

function scr_character_get_base_stats(charIdx) {
	var chapter = global.chapter;
	var defaultChapterHpIncreaseFormula = (chapter > 1 ? 30 : 0) + max((chapter - 2) * 40, 0);
	
	__hp = 250;
	__atk = 10;
	__def = 2;
	__mag = 0;
	__guts = 0;
	
	__weapon = DRWeapon.WoodBlade;
	__armors = [DRArmor.None, DRArmor.None];
	
	__spells = [];
	
	switch (charIdx) {
		case DRCharacter.Kris: {
			__hp = 90 + defaultChapterHpIncreaseFormula;
			__atk = 10 + chapter * 2 + max(chapter - 3, 0);
			__weapon = DRWeapon.WoodBlade;
			
			if chapter >= 2 __armors = [DRArmor.AmberCard, DRArmor.AmberCard];
			if chapter >= 3 {
				__weapon = DRWeapon.MechaSaber;
				__armors[1] = DRArmor.GlowWrist;
			}
			if chapter >= 4 {
				__weapon = DRWeapon.Saber10;
				__armors[0] = DRArmor.GingerGuard;
			}
			
			__spells[0] = DRSpell.ACT;
			break;
		}
		case DRCharacter.Susie: {
			__hp = 110 + defaultChapterHpIncreaseFormula;
			__atk = 14 + chapter * 2 + 2 * max(chapter - 3, 0);
			__mag = 1 + max(chapter - 2, 0);
			__weapon = DRWeapon.ManeAx;
			
			if chapter >= 2 __armors = [DRArmor.AmberCard, DRArmor.AmberCard];
			if chapter >= 3 {
				__weapon = DRWeapon.AutoAxe;
				__armors[1] = DRArmor.GlowWrist;
			}
			if chapter >= 4 {
				__weapon = DRWeapon.ToxicAxe;
				__armors[0] = DRArmor.GingerGuard;
			}
			
			__spells[0] = DRSpell.RudeBuster;
			__spells[1] = DRSpell.UltraHeal;
			break;
		}
		case DRCharacter.Ralsei: {
			__hp = 70 + defaultChapterHpIncreaseFormula;
			__atk = 8 + chapter * 2 + max(chapter - 3, 0);
			__mag = 7 + chapter * 2 + max(chapter - 3, 0);
			__weapon = DRWeapon.RedScarf;
			
			if chapter >= 2 __armors = [DRArmor.AmberCard, DRArmor.WhiteRibbon];
			if chapter >= 3 {
				__weapon = DRWeapon.FiberScarf;
				__armors = [DRArmor.GingerGuard, DRArmor.GlowWrist];
			}
			if chapter >= 4 __weapon = DRWeapon.FlexScarf;
			
			__spells[0] = DRSpell.Pacify;
			__spells[1] = DRSpell.HealPrayer;
			break;
		}
		
		case DRCharacter.Starwalker: {
			__hp = 130 + defaultChapterHpIncreaseFormula;
			__atk = 10 + chapter * 2 + max(chapter - 3, 0);
			__mag = 12 + chapter * 2 + max(chapter - 3, 0);
			__weapon = DRWeapon.TwistedSwd;
			__spells[0] = DRSpell.HealPrayer;
		    __spells[1] = DRSpell.SleepMist;
		    __spells[2] = DRSpell.IceShock;
			break;
		}
		
		default:
		case DRCharacter.Noelle: {
			__hp = 90;
			__atk = 3;
			__def = 1;
			__mag = 11;
			__weapon = DRWeapon.SnowRing;
			__armors = [DRArmor.SilverWatch, DRArmor.RoyalPin];
			__spells[0] = DRSpell.HealPrayer;
		    __spells[1] = DRSpell.SleepMist;
		    __spells[2] = DRSpell.IceShock;
			break;
		}
	}
}

function scr_character_get_rank(charIdx) {
	char_desc = "LV1 ";
	
	switch (charIdx) {
		case DRCharacter.Kris: {
			char_desc = stringsetsub("LV~1 Tactician#Commands the party#by ACTs.", global.chapter);
			break;
		}
		
		case DRCharacter.Susie: {
			char_desc = stringsetsub("LV~1 Dark Knight#Does damage using#dark energy.", global.chapter);
			break;
		}
		
		case DRCharacter.Ralsei: {
			char_desc = stringsetsub("LV~1 Dark Prince#Dark-World being.#Has friends.", global.chapter);
			break;
		}
		
		case DRCharacter.Starwalker: {
			char_desc = "LV99 Starwalker#Starwalker";
			break;
		}
		
		default: { char_desc = stringsetsub("LV~1 Party Member#Came along for#the ride.", global.chapter); break; }
	}
}

function scr_character_get_powers(charIdx) {
	_powers = [false, false]; // array of [ color, text, customDrawFunc(ch_y), icon, value ]
	
	switch (charIdx) {
		case DRCharacter.Kris: {
			guts_amount = global.chapter > 1 ? 2 : 1;
			
			_powers[0] = false; // ???
			_powers[1] = [c_dkgray, "???", obj_darkcontroller.dograndom >= 97 ? function (ch_y) {
				draw_set_color(c_white);
		        draw_text(xx + 100, ch_y, string_hash_to_newline("Dog:"));
		        draw_sprite_ext(spr_dog_sleep, -threebuffer / 30, xx + 220, ch_y + 5, 2, 2, 0, c_white, 1);
			} : false, false, false] // Dog or ???
			break;
		}
		
		case DRCharacter.Susie: {
			guts_amount = global.chapter >= 3 ? 3 : 2;
			rude_amount = global.chapter >= 2 ? 89 : 100;
			
			_powers[0] = [c_white, "Rudeness", false, 13, rude_amount]; // Rudeness
			_powers[1] = false; // ???
			break;	
		}
		
		case DRCharacter.Ralsei: {
			guts_amount = global.chapter >= 3 ? 1 : 0;
			fluff_amount = 1;
			kindness_amount = obj_darkcontroller.dograndom >= 97 ? 1 : 100;
	        kind_icon = obj_darkcontroller.dograndom >= 97 ? 11 : 10;
	        kind_text = obj_darkcontroller.dograndom >= 97 ? "Dogness" : "Kindness";
			
			_powers[0] = false;
			_powers[1] = [c_dkgray, "???", function (ch_y) {
				draw_set_color(c_white);
				draw_text_transformed(xx + 100, ch_y, "Fluffiness", 0.8, 1, 0);
		        draw_item_icon(xx + 74, ch_y + 6, 12);
        
		        for (i = 0; i < fluff_amount; i += 1)
		            draw_item_icon(xx + 230 + (i * 20), ch_y + 6, 12);
			}];
			break;
		}
		
		case DRCharacter.Starwalker: {
			_powers[0] = [c_white, "Stars", function (ch_y) {
				draw_set_color(c_white);
		        draw_text(xx + 100, ch_y, string_hash_to_newline("Stars:"));
		        draw_sprite_ext(spr_sparestar, 0, xx + 260, ch_y + 10, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_sparestar, 0, xx + 260 - 16 - 2, ch_y + 10, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_sparestar, 0, xx + 260 - 32 - 4, ch_y + 10, 1, 1, 0, c_white, 1);
			}];
			_powers[1] = false;
			break;
		}
		
		default:
		case DRCharacter.Noelle: {
			// im too lazy, do it yourself
			_powers[0] = false;
			_powers[1] = false;
			break;
		}
	}
}

function scr_character_has_magic(charIdx) {
	switch (charIdx) {
		case DRCharacter.Kris: return false;
		
		default: return true;
	}
}

function scr_character_get_act_name_override(charIdx) {
	switch (charIdx) {
		default:
		case DRCharacter.Kris: return "";
		
		case DRCharacter.Susie: return "S-Action";
		case DRCharacter.Ralsei: return "R-Action";
		case DRCharacter.Noelle: return "N-Action";
		
		case DRCharacter.Starwalker: return "S-TARction";
	}
}

function scr_character_set_names() {
	global.lcharname = "Kris";
    global.charname[DRCharacter.None] = " ";
    global.charname[DRCharacter.Kris] = "Kris";
    global.charname[DRCharacter.Susie] = "Susie";
    global.charname[DRCharacter.Ralsei] = "Ralsei";
    global.charname[DRCharacter.Noelle] = "Noelle";	
	
	global.charname[DRCharacter.Starwalker] = "Starwalker";
}