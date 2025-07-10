enum DRLightItem {
	None = 0,
	
	// Chapter 1
	HotChocolate = 1,
	Pencil = 2,
	Bandage = 3,
	Bouquet = 4,
	BallOfJunk = 5,
	HalloweenPencil = 6,
	LuckyPencil = 7,
	Egg = 8,
	
	// Chapter 2
	Cards = 9,
	BoxOfHeartCandy = 10,
	Glass = 11,
	Eraser = 12,
	MechanicalPencil = 13,
	Wristwatch = 14,
	
	// Chapter 4
	HolidayPencil = 15,
	CactusNeedle = 16,
	BlackShard = 17,
	QuillPen = 18
}

enum DRPhoneNumbers {
	None = 0,
	
	Home = 10001,
	Sans = 10002,
}

function scr_lightitem_name(litemId) {
	switch (litemId) {
		default:
		case DRLightItem.None: return " ";
		
		// Chapter 1
		case DRLightItem.HotChocolate: return "Hot Chocolate";
		case DRLightItem.Pencil: return "Pencil";
		case DRLightItem.Bandage: return "Bandage";
		case DRLightItem.Bouquet: return "Bouquet";
		case DRLightItem.BallOfJunk: return "Ball of Junk";
		case DRLightItem.HalloweenPencil: return "Halloween Pencil";
		case DRLightItem.LuckyPencil: return "Lucky Pencil";
		case DRLightItem.Egg: return "Egg";
		
		// Chapter 2
		case DRLightItem.Cards: return "Cards";
		case DRLightItem.BoxOfHeartCandy: return "Box of Heart Candy";
		case DRLightItem.Glass: return "Glass";
		case DRLightItem.Eraser: return "Eraser";
		case DRLightItem.MechanicalPencil: return "Mech. Pencil";
		case DRLightItem.Wristwatch: return "Wristwatch";
		
		// Chapter 4
		case DRLightItem.HolidayPencil: return "Holiday Pencil";
		case DRLightItem.CactusNeedle: return "CactusNeedle";
		case DRLightItem.BlackShard: return "BlackShard";
		case DRLightItem.QuillPen: return "QuillPen";
	}
}

function scr_litemdesc(litemId)
{
    global.msg[0] = "* Your eyesight became blurry./%";
    
    switch (litemId)
    {
        case DRLightItem.None:
            global.msg[0] = "* Your heartbeat quickened./%";
            break;
        
        case DRLightItem.HotChocolate:
            global.msg[0] = "* \"Hot Chocolate\" - Topped with home-made marshmallows in the shape of bunnies./%";
            break;
        
        case DRLightItem.Pencil:
            global.msg[0] = "* \"Pencil\" - Weapon 1 AT&* Mightier than a sword?&* Maybe equal at best./%";
            break;
        
        case DRLightItem.Bandage:
            global.msg[0] = "* \"Bandage\" - Heals 10 HP&* It has cartoon characters on it./%";
            break;
        
        case DRLightItem.Bouquet:
            global.msg[0] = "* \"Bouquet\" - A bouquet of beautiful flowers in many colors./";
            global.msg[1] = "* Perhaps it could be offered to someone./%";
            break;
        
        case DRLightItem.BallOfJunk:
            global.msg[0] = "* \"Ball of Junk\" - A small ball of accumulated things in your pocket./%";
            
            if (scr_itemcheck(DRItem.DarkCandy))
            {
                global.msg[0] = "* \"Ball of Junk\" - A small ball of accumulated things in your pocket./";
                global.msg[1] = "* It smells like scratch'n'sniff marshmallow stickers./%";
            }
            
            break;
        
        case DRLightItem.HalloweenPencil:
            global.msg[0] = "* \"Halloween Pencil\" - Weapon 1 AT&* Orange with black bats on it./%";
            break;
        
        case DRLightItem.LuckyPencil:
            global.msg[0] = "* \"Lucky Pencil\" - Weapon 1 AT&* Covered in green clovers and rainbows./%";
            break;
        
        case DRLightItem.Egg:
            global.msg[0] = "* \"Egg\" - Not too important^1, not too unimportant./%";
            break;
        
        case DRLightItem.Cards:
            global.msg[0] = "* \"Cards\" - The Jack of Spades^1, and the Rules Card./%";
            break;
        
        case DRLightItem.BoxOfHeartCandy:
            global.msg[0] = "* \"Box of Heart Candy\" - It's not yours^1. Will that stop you?/%";
            break;
        
        case DRLightItem.Glass:
            global.msg[0] = "* There is a small shard of something in your pocket./";
            global.msg[1] = "* It feels like glass, but.../%";
            break;
        
        case DRLightItem.Eraser:
            global.msg[0] = "* \"Eraser\" - Weapon 1 AT&* Pink^1, it bounces when thrown on the ground./%";
            break;
        
        case DRLightItem.MechanicalPencil:
            global.msg[0] = "* \"Mechanical Pencil\" - 1 AT&* It's tempting to click it repeatedly./%";
            break;
        
        case DRLightItem.Wristwatch:
            global.msg[0] = "* \"Wristwatch\" - Armor 1 DF&* Maybe an expensive antique.&* Stuck before half past noon./%";
            break;
        
        case DRLightItem.HolidayPencil:
            global.msg[0] = "* \"Holiday Pencil\" - 1 AT&* A festive candycane pencil.&* Do not eat./%";
            break;
        
        case DRLightItem.CactusNeedle:
            global.msg[0] = "* \"CactusNeedle\" - 2 AT&* Ouch! ... It's somewhat sentimental in a way./%";
            break;
        
        case DRLightItem.BlackShard:
            global.msg[0] = "* \"BlackShard\" - A small chip of extremely hard glass.&* Oddly^1, it's nearly opaque./%";
            break;
        
        case DRLightItem.QuillPen:
            global.msg[0] = "* \"QuillPen\" - 1 AT&* A pen fashioned from a white feather./%";
            break;
    }
}

function scr_phonename()
{
    for (i = 0; i < 8; i += 1) {
		itemid = global.phone[i];
		if itemid <= DRPhoneNumbers.None {
			global.phonename[i] = " ";
			continue;
		}
        
        switch (itemid)
        {
            case DRPhoneNumbers.Home:
                global.phonename[i] = "Call Home";
                
                if (global.chapter == 2 && global.plot == 9)
                    global.phonename[i] = "Call Toriel";
                break;
            
            case DRPhoneNumbers.Sans:
                global.phonename[i] = "Sans's Number";
                
                if (global.flag[274] >= 2)
                    global.phonename[i] = "Not Sans's Number";
                break;
        }
	}
}

function scr_litemuseb(idx, lightWorldId)
{
    var is_weapon = get_weapon_by_lw_id(lightWorldId) != -4;
	show_debug_message(get_weapon_by_lw_id(lightWorldId));
	show_debug_message("isweapon {0} lightworldid {1}", is_weapon, lightWorldId);
    
    if is_weapon && !scr_lweapon_can_equip(lightWorldId)
    {
        scr_speaker("no_name");
        msgset(0, "* For some reason you couldn't equip it./%");
        scr_writetext(0, "x", 0, 0);
        return;
    }
    
    switch (lightWorldId)
    {
		default:
        case DRLightItem.None:
            global.msg[0] = "* You grasped at nothing./%%";
            break;
        
        case DRLightItem.HotChocolate:
            global.msg[0] = "* You drank the hot chocolate^1.&* It tasted wonderful^1.&* Your throat tightened.../%";
            snd_play(snd_swallow);
            scr_writetext(0, "x", 0, 0);
            script_execute(scr_litemshift, idx, 0);
            break;
        
        case DRLightItem.Pencil:
            global.msg[0] = "* You equipped the Pencil./%";
            scr_lweaponeq(idx, lightWorldId);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        
        case DRLightItem.Bandage:
            global.msg[0] = "* You re-applied the bandage.";
            script_execute(scr_lrecoitem, 1);
            script_execute(scr_litemshift, idx, 0);
            break;
        
        case DRLightItem.Bouquet:
            global.msg[0] = "* You held out the flowers^1.&* A floral scent fills the air^1.&* Nothing happened./%";
            scr_writetext(0, "x", 0, 0);
            break;
        
        case DRLightItem.BallOfJunk:
            global.msg[0] = "* You looked at the junk ball in admiration^1.&* Nothing happened./%";
            scr_writetext(0, "x", 0, 0);
            break;
        
        case DRLightItem.HalloweenPencil:
            global.msg[0] = "* You equipped the Halloween Pencil./%";
            scr_lweaponeq(idx, lightWorldId);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        
        case DRLightItem.LuckyPencil:
            global.msg[0] = "* You equipped the Lucky Pencil./%";
            scr_lweaponeq(idx, lightWorldId);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        
        case DRLightItem.Egg:
            global.msg[0] = "* You used the Egg./%";
            snd_play(snd_egg);
            scr_writetext(0, "x", 0, 0);
            break;
        
        case DRLightItem.Cards:
            msgset(0, "* You held the cards^1.&* They felt flimsy between your fingers./%");
            scr_writetext(0, "x", 0, 0);
            break;
        
        case DRLightItem.BoxOfHeartCandy:
            var consume_item = 0;
            var have_susie = scr_havechar(DRCharacter.Susie);
            var sans_npc = 0;
            
            /*if (i_ex(obj_marker))
            {
                with (obj_marker)
                {
                    if (sprite_index == spr_sans_d && abs(obj_mainchara.x - x) <= 20 && abs(obj_mainchara.y - y) <= 40)
                        sans_npc = 1;
                }
            }*/
            
            var alphys_npc = 0;
            
            /*if (i_ex(obj_npc_sign))
            {
                with (obj_npc_sign)
                {
                    if (sprite_index == spr_alphysd && abs(obj_mainchara.x - x) <= 20 && abs(obj_mainchara.y - y) <= 40)
                        alphys_npc = 1;
                }
            }*/
            
            if (sans_npc)
            {
                consume_item = 1;
                global.lgold += 5;
                global.flag[342] = 4;
                scr_speaker("sans");
                msgset(0, "* what? a heart shaped box of chocolates?/");
                msgnext("\\E3* oh^1, i get it./");
                msgnext("\\E2* heh./");
                msgnext("* wow./");
                msgnext("\\E0* you're really.../");
                msgnext("* hm./");
                msgnext("\\E1* alright^1, alright./");
                msgnext("\\E0* ..^1. okay./");
                msgnext("\\E3* you wanna make a return on these^1, don't you?/");
                msgnext("\\E5* okay^1, okay^1, no need to break my heart./");
                msgnext("\\E0* here's five dollars./");
                scr_anyface_next("no_name", 0);
                msgnext("* (You traded the chocolates for 5 dollars.)/%");
            }
            else if (alphys_npc)
            {
                scr_speaker("no_name");
                msgset(0, "* (You could give Alphys the chocolate if you talk to her.)/%");
            }
            else if (have_susie)
            {
                consume_item = 1;
                global.lhp = 19;
                global.flag[342] = 2;
                scr_speaker("susie");
                msgset(0, "\\E7* Woah^1, Kris^1, where the hell'd you get that?/");
                msgnext("\\E6* ..^1. someone gave it to you?/");
                msgnext("\\EY* HAHAHA!^1! YEAH RIGHT!!^1! You stole it^1, didn't you!?/");
                msgnext("\\E2* Well^1, c'mon!^1! Let's eat it and hide the evidence!!/");
                scr_anyface_next("no_name", 0);
                msgnext("* (You and Susie shared the heart-shaped box of candies.)/");
                msgnext("* (Both of you had a feeling in your chest...)/");
                scr_anyface_next("susie", 12);
                msgnext("\\EC* Ow^1, my stomach.../");
                scr_anyface_next("no_name", 0);
                msgnext("* (..^1. that you shouldn't have eaten all of it.)/%");
            }
            else
            {
                consume_item = 1;
                global.lhp = 19;
                global.flag[342] = 1;
                scr_speaker("no_name");
                msgset(0, "* (You unhesitatingly devoured the box of heart shaped candies.)/");
                msgnext("* (Your guts are being destroyed.)/");
                msgnext("* (You accept this destruction as part of life...)/%");
                scr_writetext(0, "x", 0, 0);
            }
            
            d_make();
            
            if (consume_item)
                script_execute(scr_litemshift, idx, 0);
            
            break;
        
        case DRLightItem.Glass:
            scr_speaker("no_name");
            msgset(0, "* It doesn't seem very useful./%");
            
            if (scr_flag_get(1623) == 0)
            {
                var holiday_rooms = [107, 48, 49, 50, 52, 53, 54];
                var is_holiday_room = false;
                
                for (var i = 0; i < array_length(holiday_rooms); i++)
                {
                    if (room == holiday_rooms[i])
                    {
                        is_holiday_room = true;
                        break;
                    }
                }
                
                if (is_holiday_room)
                {
                    scr_flag_set(1623, 1);
                    scr_speaker("no_name");
                    msgset(0, "* You looked through the glass./");
                    msgnext("* For some strange reason^1, for just a brief moment.../");
                    msgnext("* You thought you saw Noelle close against you^1, whispering./");
                    msgnext("* You put the glass to your ear.../");
                    msgnext("* ..^1. of course^1, that didn't do anything.../%");
                }
            }
            
            scr_writetext(0, "x", 0, 0);
            break;
        
        case DRLightItem.Eraser:
            global.msg[0] = "* You equipped the Eraser./%";
            scr_lweaponeq(idx, lightWorldId);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        
        case DRLightItem.MechanicalPencil:
            global.msg[0] = "* You equipped the Mech. Pencil./%";
            scr_lweaponeq(idx, lightWorldId);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        
        case DRLightItem.HolidayPencil:
            global.msg[0] = "* You equipped the Holiday Pencil./%";
            scr_lweaponeq(idx, lightWorldId);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        
        case DRLightItem.CactusNeedle:
            global.msg[0] = "* You equipped the CactusNeedle./%";
            scr_lweaponeq(idx, lightWorldId);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        
        case DRLightItem.BlackShard:
            global.msg[0] = "* You equipped the BlackShard./%";
            scr_lweaponeq(idx, lightWorldId);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        
        case DRLightItem.QuillPen:
            global.msg[0] = "* You equipped the QuillPen./%";
            scr_lweaponeq(idx, lightWorldId);
            snd_play(snd_item);
            scr_writetext(0, "x", 0, 0);
            break;
        
		// Phone Calls
        case DRPhoneNumbers.Home:
            snd_play_x(snd_phone, 0.7, 1);
			
            global.msg[0] = "* Ring.../";
            global.msg[1] = "* (You noticed that there's no dialogue programmed for this call.)/";
            global.msg[2] = "* (That's because making it is YOUR job, silly!)/";
			global.msg[3] = "* (Click...)/%";
			
			scr_writetext(0, "x", 0, 0);
            break;
        
        case DRPhoneNumbers.Sans:
            snd_play_x(snd_phone, 0.7, 1);
			
            global.msg[0] = "* Ring.../";
            global.msg[1] = "* (Sans seems to be busy.)/";
			global.msg[2] = "* (Click...)/%";
			
            scr_writetext(0, "x", 0, 0);
		
			// not porting allat
            /*global.msc = 375;
            scr_text(global.msc);
            global.typer = 5;
            global.fc = 0;
            instance_create(0, 0, obj_dialoguer);*/
            break;
    }
}