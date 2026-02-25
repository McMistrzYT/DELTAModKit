enum DREncounter {
	TestEnemies = 101,	
}

enum DREnemy {
	None = 0,
	
	TestEnemy = 101,	
}

enum DREncounterPhase {
	Menu = 0,
	Acting = 1,
	Victory = 2,
	HeroesAttack = 3,
	SpellsItems = 4,
	EnemyTalk = 5,
	EnemyAttack = 6,
	
	CreateBulletArea = 7,
}

function scr_encounter_get(encId) {
	enemytemp = array_create(3); // 3 = max enemies (changing this and adding more than 3 enemies will require additional changes in multiple places)
	for (i = 0; i < array_length(enemytemp); i++)
		enemytemp[i] = { entry: DREnemy.None, instance: obj_baseenemy, xx: xx + 500, yy: yy + 40 };
	
	switch (encId) {
		default:
		case DREncounter.TestEnemies: {
			enemytemp[0].instance = obj_baseenemy;
			enemytemp[0].entry = DREnemy.TestEnemy;
			enemytemp[0].xx = xx + 480;
			enemytemp[0].yy = yy + 110;
			
			enemytemp[1].instance = obj_baseenemy;
			enemytemp[1].entry = DREnemy.TestEnemy;
			enemytemp[1].xx = xx + 500;
			enemytemp[1].yy = yy + 200;
			
			global.battlemsg[0] = "* Modular test enemies showed up.";
			break;	
		}
	}
}

function scr_enemy_set_sprites(enemyId) {
	switch (enemyId) {
		default:
		case DREnemy.TestEnemy: {
			idlesprite = spr_diamond_overworld;
			hurtsprite = spr_diamond_knight_overworld;
			sparedsprite = spr_diamond_overworld;
			break;	
		}
	}
}

function scr_monstersetup()
{
    scr_monster_actreset(myself);

	// simul acts mean simultaneous acts btw
    switch (global.monstertype[myself]) {
        case DREnemy.TestEnemy:
            global.monstername[myself] = "Enemy";
            global.monstermaxhp[myself] = 130;
            global.monsterhp[myself] = 130;
            global.monsterat[myself] = 7;
            global.monsterdf[myself] = 0;
            global.monsterexp[myself] = 10;
            global.monstergold[myself] = 20;
            global.sparepoint[myself] = 10;
            global.mercymod[myself] = 0;
            global.mercymax[myself] = 100;
			
            global.canact[DRCharacter.Kris][myself][0] = 1;
            global.actname[DRCharacter.Kris][myself][0] = "Check";
            global.canact[DRCharacter.Kris][myself][1] = 1;
            global.actname[DRCharacter.Kris][myself][1] = "Warning";
            global.canact[DRCharacter.Kris][myself][2] = 1;
            global.actname[DRCharacter.Kris][myself][2] = "Victory";
            global.canact[DRCharacter.Kris][myself][3] = 1;
            global.actname[DRCharacter.Kris][myself][3] = "SimuDance";
            global.actsimul[DRCharacter.Kris][myself][3] = 1;
            global.canact[DRCharacter.Kris][myself][4] = 1;
            global.actname[DRCharacter.Kris][myself][4] = "Victory (S)";
            global.canact[DRCharacter.Kris][myself][5] = 1;
            global.actname[DRCharacter.Kris][myself][5] = "Lecture";
			
            global.canact[DRCharacter.Susie][myself][0] = 1;
            global.actname[DRCharacter.Susie][myself][0] = "CoolDance";
            global.canact[DRCharacter.Susie][myself][1] = 1;
            global.actname[DRCharacter.Susie][myself][1] = "SimuDance";
            global.actsimul[DRCharacter.Susie][myself][1] = 1;
			
            global.canact[DRCharacter.Ralsei][myself][0] = 1;
            global.actname[DRCharacter.Ralsei][myself][0] = "CoolDance";
            global.canact[DRCharacter.Ralsei][myself][1] = 1;
            global.actname[DRCharacter.Ralsei][myself][1] = "SimuDance";
            global.actsimul[DRCharacter.Ralsei][myself][1] = 1;
            break;
    }
	
	for (i = 0; i < DRCharacter.__MAX__; i++) {
		if (!is_array(global.canact[i])) { // does not exist for this character
			global.canact[i] = global.canact[DRCharacter.Kris];
			global.actname[i] = global.actname[DRCharacter.Kris];
			global.actsimul[i] = global.actsimul[DRCharacter.Kris];
		}
	}
}

function scr_enemy_process_phase(enemyId, phase) {
	show_debug_message("scr_enemy_process_phase({0}, {1})", enemyId, phase);
	
	switch (enemyId) {
		default:
		case DREnemy.TestEnemy: {
			switch (phase) {
				case DREncounterPhase.EnemyTalk: {
					if talked {
						scr_blconskip(15);
						break;	
					}
					
					scr_randomtarget();
					myattackchoice = choose(DRBulletPattern.HomingDiamonds, DRBulletPattern.RisingDiamonds, DRBulletPattern.SwordThrow);
					myattackpriority = myattackchoice == DRBulletPattern.SwordThrow ? 2 : 0;
					scr_attackpriority(myattackpriority);
					
					if !instance_exists(obj_darkener) // no this isnt supposed to be "darkner" its literally just something that darkens things, a darkener lol
						instance_create(0, 0, obj_darkener);
					
					global.typer = 50;
					msgset(0, stringsetsub("Message&~1", choose("1", "2", "3", "4")));
					scr_enemyblcon(x - 160, y, 3);
					
					talked = true;
					break;
				}
				
				case DREncounterPhase.CreateBulletArea: {
					show_debug_message("My Attack Priority, before pass: {0}", myattackpriority);
					if !scr_attackpriority(myattackpriority + 1) break;
					show_debug_message("My Attack Priority, pass: {0}", myattackpriority);
					
					if !instance_exists(obj_growtangle) instance_create(camerax() + 320, cameray() + 170, obj_growtangle);
					
					if myattackchoice == DRBulletPattern.SwordThrow {
						obj_growtangle.x = camerax() + 240;
						obj_growtangle.maxxscale = 1.5;
					}
					
					if !instance_exists(obj_moveheart) scr_moveheart();
					
					global.mnfight = 2;
					scr_turntimer(90);
					break;
				}
				
				case DREncounterPhase.EnemyAttack: {
					rtimer++;
					if rtimer != 12 break;
					
					var _attacks = ["HomingDiamonds", "RisingDiamonds", "SwordThrow"] // Moved to here to stop GameMakerStudio2-Beta's Main Code Viewer from Complaining.
					global.monsterattackname[myself] = _attacks[myattackchoice];
					dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
					dc.type = myattackchoice;
					
					scr_turntimer(140);
					turns++;
					
					global.typer = 6;
					global.fc = 0;
					
					if scr_messagepriority(random(2))
						global.battlemsg[0] = stringsetsub("* Placeholder Message ~1~2.", choose("A", "B", "C", "D"), string(myself));
						
					if global.monsterhp[myself] <= global.monstermaxhp[myself] / 3
						if scr_messagepriority(100 + random(2)) global.battlemsg[0] = stringsetsub("* Damaged message ~1.", string(myself));
					
					attacked = true;
					break;
				}
				
				case DREncounterPhase.Acting: {
					xx = camerax();
					yy = cameray();
					
					// acting[charId] == actId (as defined in enemy config)
					// from what i can tell, actcon is just a helper value to make sure things get called correctly
					// and so acts dont repeat
					
					// Kris's ACTs
					//if actcon[DRCharacter.Kris] == 0 && acting[DRCharacter.Kris] != 0 {
					if actcon[DRCharacter.Kris] == 1 {
					    actcon[DRCharacter.Kris] = 0;
					    nextact = 1;
						
						if acting[DRCharacter.Kris] == 1 {
							msgset(0, "* ENEMY - AT 1 DF 1&* Susceptible to Brainshock./%");
							scr_battletext_default();
						}
					
						if acting[DRCharacter.Kris] == 2 {
					        if (global.automiss[myself] == 0)
					        {
					            msgset(0, "* You warned the enemy^1.&* It guarded from Susie's attack./%");
					            global.monstercomment[myself] = "(Warned)";
					            global.automiss[myself] = 1;
					        }
        
					        scr_battletext_default();
						}
					
						if acting[DRCharacter.Kris] == 3 {
					        msgset(0, "* Its body was filled with a kind feeling./%");
					        scr_mercyadd(myself, 100);
					        scr_battletext_default();
					    }
					
						if acting[DRCharacter.Kris] == 4 {
							nextact = 0;
							actcon[DRCharacter.Kris] = simulorder[DRCharacter.Kris] == 0 ? 20 : 0;
						
							msgset(0, simultotal == 1 ? "* Kris decided to have a really long message when acting alone." : "* Kris's simul act!");
						
							scr_mercyadd(myself, 35);
							scr_simultext(DRCharacter.Kris);
						}
					
						if acting[DRCharacter.Kris] == 5 {
							msgset(0, "* Its body will result in a speech after attack./%");
							scr_battletext_default();
						}
					
						if acting[DRCharacter.Kris] == 6 {
							msgset(0, "* Its body became tired./%");
							scr_monster_make_tired(myself);
							scr_battletext_default();
						}
					}
					
					// Susie's ACTs
					if actcon[DRCharacter.Susie] == 1 {
						if acting[DRCharacter.Susie] == 1 {
							nextact = 1;
					        actcon[DRCharacter.Susie] = 0;
						
					        msgset(0, "* Susie's unique act A!./%");
					        scr_mercyadd(myself, 35);
					        scr_battletext_default();
					    }
    
					    if acting[DRCharacter.Susie] == 2 {
					        actcon[DRCharacter.Susie] = simulorder[DRCharacter.Susie] == 0 ? 20 : 0;
						
					        msgset(0, "* Susie's simul act!");
					        scr_mercyadd(myself, 35);
					        scr_simultext(DRCharacter.Susie);
					    }	
					}
					
					// Ralsei's ACTs
					if actcon[DRCharacter.Ralsei] == 1 {
						if acting[DRCharacter.Ralsei] == 1 {
							nextact = 1;
					        actcon[DRCharacter.Ralsei] = 0;
						
					        msgset(0, "* Ralsei's unique act A!./%");
					        scr_mercyadd(myself, 35);
					        scr_battletext_default();
					    }
    
					    if acting[DRCharacter.Ralsei] == 2 {
					        actcon[DRCharacter.Ralsei] = simulorder[DRCharacter.Ralsei] == 0 ? 20 : 0;
							
					        msgset(0, "* Ralsei's simul act!");
					        scr_mercyadd(myself, 35);
					        scr_simultext(DRCharacter.Ralsei);
					    }
					}
					
					// Finish handling
					if arr_contains(actcon, 20) && scr_terminate_writer()
						for (i = 0; i < DRCharacter.__MAX__; i++) { actcon[i] = -1; nextact = 1; }//i == DRCharacter.Kris ? 1 : -1;
						
					//if actcon[DRCharacter.Kris] == 1 && !instance_exists(obj_writer)
					if nextact && !instance_exists(obj_writer)
						scr_nextact();
						
					break;
				}
			}
			
			break;
		}
	}
}

function scr_enemy_defeatrunanimations(){
	#region Base Deltarune
		scr_createdefeatanimation(obj_defeatanim, function() { return true     })     // Lowest Priorty, Default Battle Run
		scr_createdefeatanimation(obj_deathanim,  function() { return fatal    }, 10) // Only seen on Slaying Titan Spawns or using Snowgrave on Regular Enemies.
		scr_createdefeatanimation(obj_frozennpc,  function() { return __frozen }, 60, function(instance) { instance.depth = depth instance.inbattle = true }) // Frozen Solid.
		scr_createdefeatanimation(obj_spareanim,  function() { return _spared  }, 100,function(instance) { _spritetochangeto = sparedsprite }) // Frozen Solid.
	#endregion
}

// Defeat Run System Core Data Config init
variable_global_set("@@DefeatAnimationData@@", [])

function scr_createdefeatanimation(object, condition = function() { return false }, priority = 0, postcreate = function(instance) {}) {
		var defeatanimdata = {}
		defeatanimdata.object = object
		defeatanimdata.condition = condition
		defeatanimdata.priority = priority
		defeatanimdata.postcreate = postcreate
		array_push(scr_getdefeatanimationdataarray(), defeatanimdata)
}

function scr_getdefeatanimationdataarray() {
	if !variable_global_exists("@@DefeatAnimationData@@") variable_global_set("@@DefeatAnimationData@@", [])
	return 	variable_global_get("@@DefeatAnimationData@@")
}

function scr_monster_get_defeattypes(mode = "init", monsterslotbattleendflag = global.flag[51 + self.myself]) {
	// For more Precise Control go to 'scr_monster->scr_monsterdefeat' and 'scr_turn->scr_defeatrun'
	#macro MONSTERS_DEFEATTYPES_None 0
	#macro MONSTERS_DEFEATTYPES_Violence 1
	#macro MONSTERS_DEFEATTYPES_Spare 2
	#macro MONSTERS_DEFEATTYPES_Pacify 3
	#macro MONSTERS_DEFEATTYPES_AutoViolenced 5
	#macro MONSTERS_DEFEATTYPES_Frozen 6
	if mode == "all" || mode == "init" {
        _amt_add = 0;
        _frozened = 0;
        _violenced = 0;
        _spared = 0;
        _pacified = 0;
	}
	if mode == "all" || mode == "tally" {
		_amt_add++
		switch monsterslotbattleendflag {
			case MONSTERS_DEFEATTYPES_None:		_amt_add--		break
			case MONSTERS_DEFEATTYPES_Violence: _violenced++	break
			case MONSTERS_DEFEATTYPES_Spare:	_spared++		break
			case MONSTERS_DEFEATTYPES_Pacify:	_pacified++		break
			case MONSTERS_DEFEATTYPES_Frozen:	_frozened++		break
		}
	}
	if mode == "all" || mode == "updatebattleendflags" {
        if (_frozened > 0)	global.flag[50] = MONSTERS_DEFEATTYPES_Frozen;
        if (_pacified > 0)	global.flag[50] = MONSTERS_DEFEATTYPES_Pacify;
        if (_spared > 0)	global.flag[50] = MONSTERS_DEFEATTYPES_Spare;
        if (_violenced > 0) global.flag[50] = MONSTERS_DEFEATTYPES_Violence;
		
		switch global.flag[50] {
			case MONSTERS_DEFEATTYPES_Frozen: global.flag[926]++ break
		}
	}
}