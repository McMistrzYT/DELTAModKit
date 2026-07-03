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
		scr_createdefeatanimation(obj_defeatanim, function() { return true     })       // Lowest Priorty, Default Battle Run
		scr_createdefeatanimation(obj_deathanim,  function() { return fatal    },  10)  // Only seen on Slaying Titan Spawns or using Snowgrave on Regular Enemies.
		scr_createdefeatanimation(obj_frozennpc,  function() { return __frozen },  60,  function(instance) { instance.depth = depth instance.inbattle = true }) // Frozen Solid.
		scr_createdefeatanimation(obj_spareanim,  function() { return __spared  }, 100, function(instance) { _spritetochangeto = sparedsprite }) // Spared and Pacified.
	#endregion
}

function scr_enemy_drawstatus_battle(enemyId){
	switch enemyId {
		default:
		  // Comment
          draw_set_color(c_gray);
          draw_text(xx + 80 + namewidth + 60, yy + 375 + (i * 30), string_hash_to_newline(global.monstercomment[i]));
          
		  // HealthBar
          draw_set_color(c_maroon);
          draw_rectangle(xx + 420, yy + 380 + (i * 30), xx + 500, yy + 380 + (i * 30) + 15, false);
          draw_set_color(c_lime);
          draw_rectangle(xx + 420, yy + 380 + (i * 30), xx + 420 + ((global.monsterhp[i] / global.monstermaxhp[i]) * 80), yy + 380 + (i * 30) + 15, false);
          draw_set_color(c_white);
		  
		  // HP Text
          draw_text_transformed(xx + 424, yy + 364, "HP", 1, 0.5, 0);
          draw_text_transformed(xx + 424, yy + 380 + (i * 30), string(ceil((global.monsterhp[i] / global.monstermaxhp[i]) * 100)) + "%", 1, 0.5, 0);
		break
	}
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

// DefeatTypes
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
			case MONSTERS_DEFEATTYPES_Frozen: global.flag[926]++ break // All Enemies Frozen.
		}
	}
}

function scr_chaseenemy_init() {
	if extflag == "ModularEnemiesRoundabout" {
		sprite_index = spr_diamond_overworld
		myencounter = DREncounter.TestEnemies
		alerttype = 2
		pacetype = pacetype_followpath
		path_start(path_chaseenemy_dwtestloop, pathSpeed, path_action_restart, 0)
		offscreen_frozen = 0
	}
}

function scr_chaseenemy_chasetype(Type) {
	var movestopointusingspeed = true
	switch Type {
		default:	
			alerttimer = 0
			alertcon = 0
			pacecon = 0
			movestopointusingspeed = false
		break
		
		case 0: {
			if (speed < ct0minspeed) speed = ct0minspeed
			if (speed < ct0topspeed) speed += ct0acc
		break}
		case 3: {
			if (speed < 2) speed = 2
			if (speed < 4) speed += 0.5
		break}
		case 4: {
			if (speed < 6) speed = 6
			if (speed < 14) speed += 0.5
		break}
		case 5.5: 
		case 5: {
			hspeed += lengthdir_x(0.5, point_direction(x, y, targetx, targety))
			vspeed += lengthdir_y(0.5, point_direction(x, y, targetx, targety))
			
			if Type == 5 {
				if (speed < 4)  speed = 4
				if (speed < 7)  speed += 0.5
				if (speed >= 7) speed = 7
			} else {
				if (speed < startchasespeed) speed = startchasespeed
				if (speed != topchasespeed) speed = lerp(speed, topchasespeed, chaseaccel)				
			}
		break}
		case 6: {
			speed = 8 
		break}
		case 7: {
			if (speed == 0) speed = 6
			if (speed < 10) speed *= 1.1
			
			image_speed = 0.25
		break}
		
		case 9: {
			hspeed += lengthdir_x(0.5, point_direction(x, y, targetx, targety))
			vspeed += lengthdir_y(0.5, point_direction(x, y, targetx, targety))
			speed = clamp(speed, minspeed, maxspeed)
		break}
		
		case 8: {
			mymidx = x + (sprite_width / 2)
			mymidy = y + ((bbox_bottom - y) / 2)
			
			if (point_distance(mymidx, mymidy, charaHeartX(), charaHeartY()) > 50)
				direction = point_direction(mymidx, mymidy, charaHeartX(), charaHeartY()) + 180
			
			speed = 6
			movestopointusingspeed = false
		break}
		
		case 1: {
			movestopointusingspeed = false
			if (alerttimer == 0) move_towards_point(targetx, targety, 10)
			
			alerttimer += 1
			if (alerttimer >= 20) speed *= 0.75
			if (alerttimer >= 25) speed = 0
			if (alerttimer >= 27) alerttimer = 0
		break}
		
		case 2: {
			movestopointusingspeed = false
			if (alerttimer == 0) {
				xnext = 0
				ynext = 0
				
				if (right_h()) xnext =  132
				if (left_h())  xnext = -132
				if (down_h())  ynext =  132
				if (up_h())    ynext = -132
				move_towards_point(targetx + xnext, targety + ynext, 10)
			}
			
			alerttimer += 1
			
			if (alerttimer >= 20) speed *= 0.75
			if (alerttimer >= 25) speed = 0
			if (alerttimer >= 27) alerttimer = 0
		break}
	}
	
	if movestopointusingspeed move_towards_point(targetx, targety, speed)
}
	
/// @desc Not all pacetypes are here yet, mainly because of how many there is
function scr_chaseenemy_pacetype(Type) {
	#macro pacetype_rightandleftwithpauses 1
	#macro pacetype_circlearound 2
	#macro pacetype_upanddown 5
	#macro pacetype_standinplace 6
	#macro pacetype_movesin 7
	#macro pacetype_movesin_duplicated 7.1
	#macro pacetype_movesin_flipped 7.5
	#macro pacetype_movesin_vertical 8
	#macro pacetype_leftrightmove 9
	#macro pacetype_leftrightmove_alt 9.5
	#macro pacetype_slidetokris 10
	
	#macro pacetype_followpath 11
	#macro pacetype_doublesiner 12	
	#macro pacetype_hovering 13
	
	
	
	switch Type {
		default: if DEBUGMODE && scr_debug() show_debug_message("Entity ({1}) using Unknown Pacing Type {0}", Type, string(real(id)) + " | " + string(object_get_name(object_index))) break	
		
		case pacetype_rightandleftwithpauses: {
			if (pacetimer == 10) hspeed = 2
			if (pacetimer == 34) hspeed = 0
			if (pacetimer == 50) hspeed = -2
			if (pacetimer == 74) hspeed = 0
			if (pacetimer == 80) pacetimer = 0
		break}
		case pacetype_circlearound: {
			hspeed = sin(pacetimer / 24) * 4
			vspeed = cos(pacetimer / 24) * 4			
		break}
		case pacetype_upanddown: {
			if (pacetimer == 1)  vspeed = 6
			if (pacetimer == 25) vspeed = -6
			if (y < ystart) pacetimer = 0			
		break}
		case pacetype_standinplace: {
			cancelwalk = 1
			walk_index += 0.25			
		break}
		case pacetype_movesin:
		case pacetype_movesin_duplicated: {
			hspeed = -sin(pacetimer / 30) * 10	
		break}
		case pacetype_movesin_flipped: {
			hspeed = sin(pacetimer / 30) * 10
		break}
		case pacetype_movesin_vertical: {
			vspeed = -sin(pacetimer / 25) * 12.5			
		break}
		case pacetype_leftrightmove: {
			if (float != 0) y = yy - (sin(pacetimer / 5) * float)
			
			hspeed = sin(pacetimer / (pacespeed * 30)) * (moveradius / 20)
			pacespeed = 0.8
		break}
		
		case pacetype_leftrightmove_alt: {
			if (float != 0) y = yy - sin(pacetimer / float)
			
			hspeed = 2 * (sin(pacetimer / 24) * (moveradius / 20))
		break}
		case pacetype_slidetokris: {
			if (pacecon2 == 0) {
				if (vspeed > 0) vspeed *= 0.9
				
				if (vspeed <= 0.5 && pacecon2 == 0) pacecon2 = 1
			}
			
			if (pacecon2 == 1) move_towards_point(obj_mainchara.x, obj_mainchara.y, 4)			
		break}
		case pacetype_followpath: {
			cancelwalk = 1
			image_speed = 0.25
			
			if (pathSpeed == 0)
				pathSpeed = 6
			
			if (direction >= 136 && direction <= 225)
				facing = 0
			
			if (direction >= 306 || direction <= 45)
				facing = 1			
		break}
		case pacetype_doublesiner: {
			hspeed = -sin(pacetimer / 30) * 10
			vspeed = (-sin(pacetimer / 12) * 12.5) / 10
		break}
		case pacetype_hovering: {
			t = (t + increment) % 360
			shift = amplitude * dsin(t)
			y = yy + shift
		break}
	}
}
