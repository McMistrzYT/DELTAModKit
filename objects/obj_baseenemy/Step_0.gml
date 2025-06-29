if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0)
    {
        scr_randomtarget();
        myattackchoice = choose(0, 1, 2);
        myattackpriority = 1;
        
        if (myattackchoice == 2)
            myattackpriority = 50;
        
        scr_attackpriority(myattackpriority - 1);
        
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        
        global.typer = 50;
        rr = choose(0, 1, 2, 3);
        
        if (rr == 0)
            msgset(0, "Message&A");
        
        if (rr == 1)
            msgset(0, "Message&B");
        
        if (rr == 2)
            msgset(0, "Message&C");
        
        if (rr == 3)
            msgset(0, "Message&D");
        
        scr_enemyblcon(x - 160, y, 3);
        talked = 1;
        talktimer = 0;
        rtimer = 0;
    }
    
    if (talked == 1 && scr_isphase("enemytalk"))
        scr_blconskip(15);
    
    if (global.mnfight == 1.5)
    {
        if (scr_attackpriority(myattackpriority))
        {
            if (!instance_exists(obj_growtangle))
                instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
            
            if (myattackchoice == 2)
            {
                with (obj_growtangle)
                {
                    x = camerax() + 240;
                    maxxscale = 1.5;
                }
            }
            
            if (!instance_exists(obj_moveheart))
                scr_moveheart();
            
            global.mnfight = 2;
            scr_turntimer(90);
        }
    }
    
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        
        if (rtimer == 12)
        {
            if (myattackchoice == 0)
            {
                global.monsterattackname[myself] = "HomingDiamonds";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 0;
            }
            else if (myattackchoice == 1)
            {
                global.monsterattackname[myself] = "RisingDiamonds";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 1;
            }
            else if (myattackchoice == 2)
            {
                global.monsterattackname[myself] = "SwordThrow";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 3;
            }
            
            scr_turntimer(140);
            turns += 1;
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3);
            
            if (scr_messagepriority(random(2)))
            {
                var substringr = string(myself);
                
                if (rr == 0)
                    global.battlemsg[0] = stringsetsub("* Placeholder Message A~1.", substringr);
                
                if (rr == 1)
                    global.battlemsg[0] = stringsetsub("* Placeholder Message B~1.", substringr);
                
                if (rr == 2)
                    global.battlemsg[0] = stringsetsub("* Placeholder Message C~1.", substringr);
                
                if (rr == 3)
                    global.battlemsg[0] = stringsetsub("* Placeholder Message D~1.", substringr);
            }
            
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
            {
                if (scr_messagepriority(100 + random(2)))
                {
                    var substringr = string(myself);
                    global.battlemsg[0] = stringsetsub("* Damaged message ~1.", substringr);
                }
            }
            
            attacked = 1;
        }
    }
}

if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
	
	if !mod_debug_printed {
		show_debug_message("acting");
		show_debug_message(acting);
	
		show_debug_message("actcon");
		show_debug_message(actcon);
		
		mod_debug_printed = true;
	}
    
    if (acting[DRCharacter.Kris] == 1 && actcon[DRCharacter.Kris] == 0)
    {
        actcon[DRCharacter.Kris] = 1;
        msgset(0, "* ENEMY - AT 1 DF 1&* Susceptible to Brainshock./%");
        scr_battletext_default();
    }
    
    if (acting[DRCharacter.Kris] == 2 && actcon[DRCharacter.Kris] == 0)
    {
        actcon[DRCharacter.Kris] = 1;
        
        if (global.automiss[myself] == 0)
        {
            msgset(0, "* You warned the enemy^1.&* It guarded from Susie's attack./%");
            global.monstercomment[myself] = "(Warned)";
            global.automiss[myself] = 1;
        }
        
        scr_battletext_default();
    }
    
    if (acting[DRCharacter.Kris] == 3 && actcon[DRCharacter.Kris] == 0)
    {
        msgset(0, "* Its body was filled with a kind feeling./%");
        scr_mercyadd(myself, 100);
        scr_battletext_default();
        actcon[DRCharacter.Kris] = 1;
    }
    
    if (acting[DRCharacter.Kris] == 4 && actcon[DRCharacter.Kris] == 0)
    {
        msgset(0, "* Kris's simul act!");
        
        if (simultotal == 1)
            msgset(0, "* Kris decided to have a really long message when acting alone.");
        
        scr_mercyadd(myself, 35);
        scr_simultext(DRCharacter.Kris);
        
        if (simulorder[DRCharacter.Kris] == 0)
            actcon[DRCharacter.Kris] = 20;
        else
            actcon[DRCharacter.Kris] = -1;
    }
    
    if (acting[DRCharacter.Kris] == 5 && actcon[DRCharacter.Kris] == 0)
    {
        msgset(0, "* Its body will result in a speech after attack./%");
        scr_battletext_default();
        actcon[DRCharacter.Kris] = 1;
    }
    
    if (acting[DRCharacter.Kris] == 6 && actcon[DRCharacter.Kris] == 0)
    {
        msgset(0, "* Its body became tired./%");
        scr_monster_make_tired(myself);
        scr_battletext_default();
        actcon[DRCharacter.Kris] = 1;
    }
    
    if (acting[DRCharacter.Susie] == 1 && actcon[DRCharacter.Susie] == 1)
    {
        msgset(0, "* Susie's unique act A!./%");
        scr_mercyadd(myself, 35);
        scr_battletext_default();
        actcon[DRCharacter.Kris] = 1;
        actcon[DRCharacter.Susie] = 0;
    }
    
    if (acting[DRCharacter.Susie] == 2 && actcon[DRCharacter.Susie] == 1)
    {
        msgset(0, "* Susie's simul act!");
        scr_mercyadd(myself, 35);
        scr_simultext(DRCharacter.Susie);
        
        if (simulorder[DRCharacter.Susie] == 0)
            actcon[DRCharacter.Susie] = 20;
        else
            actcon[DRCharacter.Susie] = 0;
    }
    
    if (acting[DRCharacter.Ralsei] == 1 && actcon[DRCharacter.Ralsei] == 1)
    {
        msgset(0, "* Ralsei's unique act A!./%");
        scr_mercyadd(myself, 35);
        scr_battletext_default();
        actcon[DRCharacter.Kris] = 1;
        actcon[DRCharacter.Ralsei] = 0;
    }
    
    if (acting[DRCharacter.Ralsei] == 2 && actcon[DRCharacter.Ralsei] == 1)
    {
        msgset(0, "* Ralsei's simul act!");
        scr_mercyadd(myself, 35);
        scr_simultext(DRCharacter.Ralsei);
        
        if (simulorder[DRCharacter.Ralsei] == 0)
            actcon[DRCharacter.Ralsei] = 20;
        else
            actcon[DRCharacter.Ralsei] = 0;
    }
    
    if (arr_contains(actcon, 20))
    {
        if (scr_terminate_writer())
        {
            for (i = 0; i < DRCharacter.__MAX__; i++)
				actcon[i] = i == DRCharacter.Kris ? 1 : -1;
        }
    }
    
    if (actcon[DRCharacter.Kris] == 1 && !instance_exists(obj_writer))
        scr_nextact();
}

if (state == 3)
{
    scr_enemyhurt_tired_after_damage(0.5);
    scr_enemy_hurt();
}
