if global.monster[myself]
{
    if scr_isphase(DREncounterPhase.EnemyTalk)
    {
		if talked {
			scr_blconskip(15);
		} else {
			scr_enemy_process_phase(enemyId, DREncounterPhase.EnemyTalk);
		
	        talked = true;
	        talktimer = 0;
	        rtimer = 0;
		} 
    }
    
    if (global.mnfight == 1.5) // CreateBulletArea
		scr_enemy_process_phase(enemyId, DREncounterPhase.CreateBulletArea);
    
    if scr_isphase(DREncounterPhase.EnemyAttack) && !attacked
		scr_enemy_process_phase(enemyId, DREncounterPhase.EnemyAttack);
}

if scr_isphase(DREncounterPhase.Acting)
{
	if scr_debug() && !mod_debug_printed {
		show_debug_message("acting");
		show_debug_message(acting);
	
		show_debug_message("actcon");
		show_debug_message(actcon);
		
		mod_debug_printed = true;
	}
	
	scr_enemy_process_phase(enemyId, DREncounterPhase.Acting);
}

if state == 3 // is in pain
{
    scr_enemyhurt_tired_after_damage(0.5);
    scr_enemy_hurt();
}
