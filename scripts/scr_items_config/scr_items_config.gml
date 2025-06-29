enum DRIcon { // frame # of spr_dmenu_items
    None = 0,
    Sword = 1,
    Axe = 2,
    Scarf = 3,
    Shield = 4,
    Sparkles = 5,
    DOWNStat = 6,
    UPStat = 7,
    VerticalDown = 8,
    FireMagic = 9,
    Smile = 10,
    Dog = 11,
    Fluff = 12,
    EvilSmile = 13,
    Ring = 14,
    Staff = 15,
    ExclamationMark = 16,
    Snowflake = 17,
    Shard = 18,
    GingerbreadCutout = 19
}

enum DRItem {
	None = 0,
	
	// Chapter 1
	DarkCandy = 1,
	ReviveMint = 2,
	Glowshard = 3,
	Manual = 4,
	BrokenCake = 5,
	TopCake = 6,
	Spincake = 7,
	Darkburger = 8,
	LancerCookie = 9,
	GigaSalad = 10,
	ClubsSandwich = 11,
	HeartsDonut = 12,
	ChocDiamond = 13,
	Favwich = 14,
	RouxlsRoux = 15,
	
	// Chapter 2
	CDBagel = 16,
	Mannequin = 17,
	KrisTea = 18,
	NoelleTea = 19,
	RalseiTea = 20,
	SusieTea = 21,
	DDBurger = 22,
	LightCandy = 23,
	ButJuice = 24,
	SpagettiCode = 25,
	JavaCookie = 26,
	TensionBit = 27,
	TensionGem = 28,
	TensionMax = 29,
	ReviveDust = 30,
	ReviveBrite = 31,
	SPoison = 32,
	DogDollar = 33,
	
	// Chapter 3
	TVDinner = 34,
	Pipis = 35,
	FlatSoda = 36,
	TVSlop = 37,
	ExecBuffet = 38,
	DeluxeDinner = 39,
	
	// Chapter 4
	AncientSweet = 60,
	Rhapsotea = 61,
	Scarlixir = 62,
	BitterTear = 63,
}

enum DRKeyItem {
    None = 0,

    // Chapter 1
    CellPhone = 1,
    Egg = 2,
    BrokenCake = 3,
    BrokenKeyA = 4,
    DoorKey = 5,
    BrokenKeyB = 6,
    BrokenKeyC = 7,

    // Chapter 2
    Lancer = 8,
    RouxlsKaard = 9,
    EmptyDisk = 10,
    LoadedDisk = 11,
    KeyGen = 12,
    ShadowCrystal = 13,
    Starwalker = 14,
    PureCrystal = 15,
    
    // Chapter 3
    OddController = 16,
    BackstagePass = 17,
    TripTicket = 18,
    LancerCon = 19,
	
	// Chapter 4
	SheetMusic = 30,
	ClaimbClaws = 31,
}

function scr_iteminfo(itemid)
{
	usable = 0;
    replaceable = 0;
    value = 0;
    itemtarget = 0;
    itemnameb = " ";
    itemdescb = " ";
	__itemdesc = "---";
    
    switch (itemid)
    {
        case DRItem.None:
            itemnameb = " ";
            itemdescb = "---";
            __itemdesc = "---";
            break;
        
        // Chapter 1
        case DRItem.DarkCandy:
            itemnameb = "Dark Candy";
            itemdescb = "Heals#40HP";
            __itemdesc = "Heals 40 HP. A red-and-black star#that tastes like marshmallows.";
            itemtarget = 1;
            value = 25;
            usable = 1;
            break;
        
        case DRItem.ReviveMint:
            itemnameb = "ReviveMint";
            itemdescb = "Heal#Downed#Ally";
            __itemdesc = "Heals a fallen ally to MAX HP.#A minty green crystal.";
            itemtarget = 1;
            value = 400;
            usable = 1;
            break;
        
        case DRItem.Glowshard:
            itemnameb = "Glowshard";
            itemdescb = "Sell#at#shops";
            __itemdesc = "A shimmering shard.#Its use is unknown.";
            
            if (global.chapter >= 2)
                __itemdesc = "A shimmering shard.#Its value increases each Chapter.";
				
            itemtarget = 0;
            value = 200 + (global.chapter * 100);
            usable = 0;
            break;
        
        case DRItem.Manual:
            itemnameb = "Manual";
            itemdescb = "Read#out of#battle";
            __itemdesc = "Ralsei's handmade book full of#various tips and tricks.";
            itemtarget = 2;
            value = 1;
            usable = 0;
            break;
        
        case DRItem.BrokenCake:
            itemnameb = "BrokenCake";
            itemdescb = "Heals#20HP";
            __itemdesc = "Though broken, it seethes with power.#A master smith could fix it.";
            itemtarget = 1;
            value = 5;
            usable = 1;
            break;
        
        case DRItem.TopCake:
            itemnameb = "Top Cake";
            itemdescb = "Heals#team#160HP";
            __itemdesc = "This cake will make your taste buds#spin! Heals 160 HP to the team.";
            itemtarget = 2;
            value = 150;
            usable = 1;
            break;
        
        case DRItem.Spincake:
            var healamount = (global.chapter == 1) ? 80 : 140;
            itemnameb = "Spincake";
            itemdescb = stringsetsub("Heals#team#~1HP", string(healamount));
            __itemdesc = stringsetsub("A pastry in the shape of a top.#Heals ~1 HP to the team.", string(healamount));
            itemtarget = 2;
            value = 5;
            usable = 1;
            break;
        
        case DRItem.Darkburger:
            itemnameb = "Darkburger";
            itemdescb = "Heals#70HP";
            __itemdesc = "A mysterious black burger made of...#Hey, this is just burnt! +70HP";
            itemtarget = 1;
            value = 70;
            usable = 1;
            break;
        
        case DRItem.LancerCookie:
            itemnameb = "LancerCookie";
            itemdescb = "Heals#50HP";
            __itemdesc = "A cookie shaped like Lancer's face.#Maybe not a cookie. Heals 1 HP?";
            itemtarget = 1;
            value = 10;
            usable = 1;
            break;
        
        case DRItem.GigaSalad:
            itemnameb = "GigaSalad";
            itemdescb = "Heals#4HP";
            __itemdesc = "An enormous salad... but, it's just#lettuce, so it's worthless. +4HP";
            itemtarget = 1;
            value = 10;
            usable = 1;
            break;
        
        case DRItem.ClubsSandwich:
            itemnameb = "ClubsSandwich";
            itemdescb = "Heals#team#70HP";
            __itemdesc = "A sandwich that can be split into 3.#Heals 70 HP to the team.";
            itemtarget = 2;
            value = 70;
            usable = 1;
            break;
        
        case DRItem.HeartsDonut:
            itemnameb = "HeartsDonut";
            itemdescb = "Healing#varies";
            __itemdesc = "Hearts, don't it!? It's filled with#divisive, clotty red jam. +??HP";
            itemtarget = 1;
            value = 40;
            usable = 1;
            break;
        
        case DRItem.ChocDiamond:
            itemnameb = "ChocDiamond";
            itemdescb = "Healing#varies";
            __itemdesc = "It's quite small, but some#people REALLY like it. +??HP";
            itemtarget = 1;
            value = 40;
            usable = 1;
            break;
        
        case DRItem.Favwich:
            itemnameb = "Favwich";
            itemdescb = "Heals#ALL HP";
            __itemdesc = "You'd think it tastes perfect.#Heals 500HP.";
            itemtarget = 1;
            value = 10;
            usable = 1;
            break;
        
        case DRItem.RouxlsRoux:
            itemnameb = "RouxlsRoux";
            itemdescb = "Heals#50 HP";
            __itemdesc = "A dark roux with a delicate aroma.#Also... has worms in it. +50HP";
            itemtarget = 1;
            value = 50;
            usable = 1;
            break;
        
        // Chapter 2
        case DRItem.CDBagel:
            itemnameb = "CD Bagel";
            itemdescb = "Heals#80 HP";
            __itemdesc = "A bagel with a reflective inside.#Makes music with each bite. +80HP";
            itemtarget = 1;
            value = 100;
            usable = 1;
            break;
        
        case DRItem.Mannequin:
            itemnameb = "Mannequin";
            itemdescb = "Useless";
            __itemdesc = "It's a mannequin with the clothes#permanently attached. Useless";
            itemtarget = 0;
            value = 300;
            usable = 0;
            break;
        
        case DRItem.KrisTea:
        case DRItem.NoelleTea:
        case DRItem.RalseiTea:
        case DRItem.SusieTea:
            itemnameb = "RottenTea"; // scr_text(1458);
            itemdescb = "Heals#10HP"; // scr_text(1459);
            __itemdesc = "A tea that has deteriorated after a short while#due to its poor craftsmanship. +10HP";
            itemtarget = 1;
            value = 2;
            usable = 1;
            break;
        
        case DRItem.DDBurger:
            itemnameb = "DD-Burger";
            itemdescb = "Heals#60HP 2x";
            __itemdesc = "It's the Double-Dark-Burger.#It'll take two bites to finish!";
            itemtarget = 1;
            value = 110;
            usable = 1;
            replaceable = 8;
            break;
        
        case DRItem.LightCandy:
            itemnameb = "LightCandy";
            itemdescb = "Heals#120HP";
            __itemdesc = "White candy with a chalky texture.#It'll recover 120HP.";
            itemtarget = 1;
            value = 200;
            usable = 1;
            break;
        
        case DRItem.ButJuice:
            itemnameb = "ButJuice";
            itemdescb = "Heals#100HP";
            __itemdesc = "It's short for ButlerJuice.#It changes color with temperature.";
            itemtarget = 1;
            value = 200;
            usable = 1;
            break;
        
        case DRItem.SpagettiCode:
            itemnameb = "SpagettiCode";
            itemdescb = "Heals#team#30HP";
            __itemdesc = "Spaghetti woven by master coders, made#of macarons and ribbons. +30HP to all.";
            itemtarget = 2;
            value = 180;
            usable = 1;
            break;
        
        case DRItem.JavaCookie:
            itemnameb = "JavaCookie";
            itemdescb = "Healing#varies";
            __itemdesc = "A coffee-and-chocolate flavored cookie.#Words spark out when you bite it.";
            itemtarget = 1;
            value = 160;
            usable = 1;
            break;
        
        case DRItem.TensionBit:
            itemnameb = "TensionBit";
            itemdescb = "Raises#TP#32%";
            __itemdesc = "Raises TP by 32% in battle.";
            itemtarget = 2;
            value = 100;
            usable = 1;
            break;
        
        case DRItem.TensionGem:
            itemnameb = "TensionGem";
            itemdescb = "Raises#TP#50%";
            __itemdesc = "Raises TP by 50% in battle.";
            itemtarget = 2;
            value = 300;
            usable = 1;
            break;
        
        case DRItem.TensionMax:
            itemnameb = "TensionMax";
            itemdescb = "Raises#TP#Max";
            __itemdesc = "Raises TP to full in battle.";
            itemtarget = 2;
            value = 1000;
            usable = 1;
            break;
        
        case DRItem.ReviveDust:
            itemnameb = "ReviveDust";
            itemdescb = "Revives#team#25%";
            __itemdesc = "A minty powder that revives all#fallen party members to 25% HP.";
            itemtarget = 2;
            value = 100;
            usable = 1;
            break;
        
        case DRItem.ReviveBrite:
            itemnameb = "ReviveBrite";
            itemdescb = "Revives#team#100%";
            __itemdesc = "A breakable mint that revives all#fallen party members to 100% HP.";
            itemtarget = 2;
            value = 4000;
            usable = 1;
            break;
        
        case DRItem.SPoison:
            itemnameb = "S.POISON";
            itemdescb = "Hurts#party#member";
            __itemdesc = "A strange concoction made of#colorful squares. Will poison you.";
            itemtarget = 1;
            value = 110;
            usable = 1;
            break;
        
        case DRItem.DogDollar:
            itemnameb = "DogDollar";
            itemdescb = "Not#so#useful";
            __itemdesc = "A dollar with a certain dog on it.#Its value decreases each Chapter.";
            itemtarget = 0;
            value = floor(200 / global.chapter);
            usable = 0;
            break;
        
        // Chapter 3
        case DRItem.TVDinner:
            itemnameb = "TVDinner";
            itemdescb = "Heals#100HP";
            __itemdesc = "A TV-shaped premade meal. It even has#a giant crumb of your favorite pie.";
            
            if (global.filechoice == 1)
                __itemdesc = "A TV-shaped premade meal. The TV's pointy#nose is used as a cone for the ice cream.";
            
            if (global.filechoice == 2)
                __itemdesc = "A TV-shaped premade meal. Unfortunately,#the vegan steak seems to be a normal shape.";
				
            itemtarget = 1;
            value = 200;
            usable = 1;
            break;
        
        case DRItem.Pipis:
            itemnameb = "Pipis";
            itemdescb = "Does#nothing";
            __itemdesc = "A certain person's special \"???\"#Cannot be used in battle.";
            itemtarget = 1;
            value = 0;
            usable = 1;
            break;
        
        case DRItem.FlatSoda:
            itemnameb = "FlatSoda";
            itemdescb = "Heals#20HP";
            __itemdesc = "Flat soda someone already took#a big sip from. Recovers 20HP";
            itemtarget = 1;
            value = 2;
            usable = 1;
            break;
        
        case DRItem.TVSlop:
            itemnameb = "TVSlop";
            itemdescb = "Heals#80HP";
            __itemdesc = "Some sort of bland cafeteria food.#The ice cream cone is soggy and saggy.";
            itemtarget = 1;
            value = 180;
            usable = 1;
            break;
        
        case DRItem.ExecBuffet:
            itemnameb = "ExecBuffet";
            itemdescb = "Heals#team#100HP";
            __itemdesc = "A dinner for cushy TV executives.#The blue \"caviar\" is unforgettable.";
            itemtarget = 2;
            value = 600;
            usable = 1;
            break;
        
        case DRItem.DeluxeDinner:
            itemnameb = "DeluxeDinner";
            itemdescb = "Heals#140HP";
            __itemdesc = "A TV Dinner for high-ranking contestants.#Comes with detachable antennas. +140 HP.";
            itemtarget = 1;
            value = 600;
            usable = 1;
            break;
			
		// Chapter 4
		case DRItem.AncientSweet:
            itemnameb = "AncientSweet";
            itemdescb = "Kris only#+400";
			__itemdesc = "A chocolatey cone etched with arcane#glyphs. Only Kris can eat it. +400 HP.";
            itemtarget = 1;
            value = 1000;
            usable = 1;
            break;
        
        case DRItem.Rhapsotea:
            itemnameb = "Rhapsotea";
            itemdescb = "Heals#115HP";
			__itemdesc = "A smooth, silvery drink. It sounds like#whispered singing as it's poured. +115 HP.";
            itemtarget = 1;
            value = 250;
            usable = 1;
            break;
        
        case DRItem.Scarlixir:
            itemnameb = "Scarlixir";
            itemdescb = "Heals#160HP";
			__itemdesc = "A red brew with a sickeningly fruity taste.#Recovers 160 HP.";
            itemtarget = 1;
            value = 450;
            usable = 1;
            break;
        
        case DRItem.BitterTear:
            itemnameb = "BitterTear";
            itemdescb = "Heals#All HP";
			__itemdesc = "Bitter water that fell in droplets from the sky.#Recovers all HP.";
            itemtarget = 1;
            value = 0;
            usable = 1;
            break;
    }
}

function scr_item_get_battle_use_text(itemid) {
	scr_iteminfo(itemid);
	
	switch (itemid) {
		default: {
			msgset(0, stringsetsub("* ~1 used the ~2!/%", global.charname[global.char[caster]], string_upper(itemnameb)));
			break;
		}
		
		case DRItem.Glowshard: {
			msgset(0, stringsetsub("* ~1 used the GLOWSHARD!/", global.charname[global.char[caster]]));
            msgnext("* But nothing happened.../%");
            spec_shard = 0;
            
            for (_en = 0; _en < 3; _en += 1)
            {
                shardtest[_en] = 0;
                
                if (global.monster[_en] == 1)
                {
                    if (global.monstertype[_en] == 5)
                    {
                        spec_shard = 1;
                        shardtest[_en] = 1;
                        global.mercymod[_en] = 200;
                    }
                }
            }
            
            if (spec_shard > 0)
            {
                scr_itemshift(global.bmenucoord[4][arg1], 0);
                msgset(1, "");
                msgnext("* The GLOWSHARD disappeared!/%");
                
                for (_j = 0; _j < 3; _j += 1)
                {
                    if (shardtest[_j] == 1)
                        global.msg[1] += "* " + global.monstername[_j] + " became enraptured!&";
                }
                
                global.msg[1] += "/";
            }
			break;	
		}
			
		case DRItem.Manual: {
			msgset(0, stringsetsub("* ~1 read the MANUAL!/", global.charname[global.char[caster]]));
            msgnext("* But nothing happened.../%");
            spec_shard = 0;
            
            for (_en = 0; _en < 3; _en += 1)
            {
                shardtest[_en] = 0;
                
                if (global.monster[_en] == 1)
                {
                    if (global.monstertype[_en] == 5)
                    {
                        spec_shard = 1;
                        shardtest[_en] = 1;
                        global.monsterstatus[_en] = 1;
                        global.monstercomment[_en] = "(Tired)";
                    }
                    
                    if (global.monstertype[_en] == 6)
                    {
                        spec_shard = 1;
                        shardtest[_en] = 2;
                    }
                    
                    if (global.monstertype[_en] == 7 || global.monstertype[_en] == 16)
                    {
                        spec_shard = 1;
                        shardtest[_en] = 3;
                        
                        with (global.monsterinstance[_en])
                        {
                            battlecancel = 1;
                            
                            if (manual == 0)
                            {
                                manual = 1;
                                scr_mercyadd(myself, 50);
                            }
                        }
                    }
                }
            }
            
            if (spec_shard > 0)
            {
                msgset(1, "");
                
                for (_j = 0; _j < 3; _j += 1)
                {
                    if (shardtest[_j] == 1)
                        global.msg[1] += "* " + global.monstername[_j] + " was \\cBbored to tears\\cW!&";
                    
                    if (shardtest[_j] == 2)
                        global.msg[1] += "* " + global.monstername[_j] + " listened politely!&";
                    
                    if (shardtest[_j] == 3)
                        global.msg[1] += "* " + global.monstername[_j] + " became sentimental!&";
                }
                
                global.msg[1] += "/%";
            }
			break;
		}
		
		case DRItem.SPoison: {
			msgsetsub(0, "* ~1 administered S.POISON!/%", global.charname[global.char[caster]]);
            break;	
		}
		
        case DRItem.DogDollar: {
			msgsetsub(0, "* ~1 admired DOGDOLLAR!/%", global.charname[global.char[caster]]);
            break;
		}
	}
}

function scr_keyiteminfo(keyitemid)
{
    tempkeyitemdesc = "---";
    tempkeyitemname = " ";
    tempkeyitemusable = false;
    
    switch (keyitemid)
    {
        case DRKeyItem.None:
            tempkeyitemdesc = "---";
            tempkeyitemname = " ";
            break;
        
        case DRKeyItem.CellPhone:
            tempkeyitemdesc = "It can be used to make calls.";
            tempkeyitemname = "Cell Phone";
            tempkeyitemusable = true;
            break;
        
        case DRKeyItem.Egg:
            tempkeyitemdesc = "Not too important, not too unimportant.";
            tempkeyitemname = "Egg";
            tempkeyitemusable = true;
            break;
        
        case DRKeyItem.BrokenCake:
            tempkeyitemdesc = "Though broken, it seethes with power.#A master smith could fix it.";
            tempkeyitemname = "BrokenCake";
            break;
        
        case DRKeyItem.BrokenKeyA:
            tempkeyitemdesc = "It's the top part of a key.#A smith could fix all three parts.";
            tempkeyitemname = "Broken Key A";
            break;
        
        case DRKeyItem.DoorKey:
            tempkeyitemdesc = "The key to a mysterious cell.#Something feels strange about it.";
            tempkeyitemname = "Door Key";
            break;
        
        case DRKeyItem.BrokenKeyB:
            tempkeyitemdesc = "It's the middle part of a key.#A smith could fix all three parts.";
            tempkeyitemname = "Broken Key B";
            break;
        
        case DRKeyItem.BrokenKeyC:
            tempkeyitemdesc = "It's the bottom part of a key.#A smith could fix all three parts.";
            tempkeyitemname = "Broken Key C";
            break;
        
        case DRKeyItem.Lancer:
            tempkeyitemdesc = "Hohoho! I'm a tough boy!#Treat me like one of your ITEMS!";
            
            if (global.chapter == 2)
            {
                if (global.plot >= 20)
                    tempkeyitemdesc = "Hohoho! ROUXLS jumped out of your#pocket! How dadcrobatic! (Lesser)";
                
                if (global.plot >= 55)
                    tempkeyitemdesc = "Hohoho! That game looked fun!#Let me be the stool next!";
                
                if (global.plot >= 60)
                    tempkeyitemdesc = "Sounded like milk out there. Splat!#Were you three osmosing without me!?";
                
                if (global.plot >= 65)
                    tempkeyitemdesc = "We fell! But don't worry. I'm a strong boy.#I won't be trounced by a mere bounce!";
                
                if (global.plot >= 66)
                    tempkeyitemdesc = "Split up? We'll solve this mystery fast!#You? You can be the un-talking dog.";
                
                if (global.plot >= 70)
                    tempkeyitemdesc = "Ho-ho! A soft cream is following you!#Can we make them a bad guy?";
                
                if (global.plot >= 75)
                {
                    tempkeyitemdesc = "That golden statue... Could it be...#The illusory nipple technique!?";
                    
                    if (global.flag[418] == 1)
                        tempkeyitemdesc = "Wow! Thanks for the free sample!#I couldn't eat another bite!!";
                }
                
                if (global.plot >= 79)
                    tempkeyitemdesc = "The bluebird of crappiness.#Fly high, bluebird. Fly high.";
                
                if (global.plot >= 85)
                    tempkeyitemdesc = "Did I miss something? I was doing my#calisthetics. Stay handsome.";
                
                if (global.plot >= 90)
                    tempkeyitemdesc = "Hey! Thanks for the tape! I was hungry!#Push my tummy to hear a cool song!";
                
                if (global.plot >= 99)
                    tempkeyitemdesc = "Hoho! It's me, Lancer! Release me and#I will release you!";
                
                //if (scr_sideb_get_phase() >= 1 && global.flag[915] >= 1.5)
                {
                    //tempkeyitemdesc = "(Innocent boys are fast asleep.)";
                    
                    //if (scr_sideb_get_phase() >= 3)
                    //    tempkeyitemdesc = "A stone statue.#Strangely, it looks like Lancer...";
                }
                
                if (global.plot >= 200)
                {
                    tempkeyitemdesc = "Hoho! What a terrific boy's adventure.#Time to kick off my feet and relax...";
                    
                    //if (room == room_dw_castle_restaurant)
                    //    tempkeyitemdesc = "Oo la la! Who is that handsome#mustachioed boy! I think I'm in love!";
                    
                    //if (room == room_cc_lancer || room == room_dw_ralsei_castle_2f)
                    //    tempkeyitemdesc = "(huff, puff) There, I got back into your#pocket! Now you can use my power!";
                }
            }
            
            if (global.chapter == 3)
            {
                tempkeyitemdesc = "Ho ho ho!#Enjoy my prescence for a single room!";
                var lancercount = 0;
                
                for (var __l = 0; __l < 12; __l++)
                {
                    if (global.keyitem[__l] == 8)
                        lancercount++;
                }
                
                if (lancercount >= 2)
                    tempkeyitemdesc = "The best thing about me is that#I'm the only one!";
            }
            
            tempkeyitemname = "Lancer";
            tempkeyitemusable = true;
            break;
        
        case DRKeyItem.RouxlsKaard:
            tempkeyitemdesc = "Thou gazeth upon a man most handsometh.#This daringst genius, adoredeth beyondth all hey let me speakst";
            tempkeyitemname = "Rouxls Kaard";
            
            if (global.plot >= 200)
                tempkeyitemdesc = "Oh, milord! Tis I, your humblest servante,#righte here where I never lefteth!";
            
            break;
        
        case DRKeyItem.EmptyDisk:
            tempkeyitemdesc = "A data disk from a strange machine.#Didn't someone want this?";
            tempkeyitemname = "EmptyDisk";
            break;
        
        case DRKeyItem.LoadedDisk:
            tempkeyitemdesc = "A strange disk. You can feel it#smiling in your hand.";
            tempkeyitemname = "LoadedDisk";
            break;
        
        case DRKeyItem.KeyGen:
            tempkeyitemdesc = "A shady-looking program that can#open certain doors.";
            tempkeyitemname = "KeyGen";
            break;
        
        case DRKeyItem.ShadowCrystal:
            var crystal_amount = 0;
            
            if (global.flag[241] >= 6)
                crystal_amount++;
            
            if (global.flag[309] >= 9)
                crystal_amount++;
            
            if (global.flag[1047] == 1)
                crystal_amount++;
            
            tempkeyitemusable = true;
            tempkeyitemdesc = stringsetsub("A sharp shadow moves like water in the hand.#You have collected [~1].", crystal_amount);
            tempkeyitemname = "ShadowCrystal";
            break;
        
        case DRKeyItem.Starwalker:
            tempkeyitemname = "Starwalker";
            tempkeyitemdesc = "The original                     #         (Starwalker)";
            break;
        
        case DRKeyItem.PureCrystal:
            tempkeyitemname = "PureCrystal";
            tempkeyitemdesc = "The shadow purified by the cat";
            break;
        
        case DRKeyItem.OddController:
            tempkeyitemname = "OddController";
            tempkeyitemdesc = "A gamepad no one wanted to use.#The buttons are an ugly pink and yellow.";
            break;
        
        case DRKeyItem.BackstagePass:
            tempkeyitemname = "BackstagePass";
            tempkeyitemdesc = "A pass for big shots allowed backstage.#Show it to Ramb in front of the door.";
            break;
        
        case DRKeyItem.TripTicket:
            tempkeyitemname = "TripTicket";
            tempkeyitemdesc = "A ticket to nowhere. It shows a map#pointing to the left of a red X...";
            break;
        
        case DRKeyItem.LancerCon:
            tempkeyitemname = "LancerCon";
            tempkeyitemdesc = "Lancer's controller. It's covered in dirt.";
            
            if (global.flag[1099] > 1)
            {
                tempkeyitemname = stringsetsub("LancerConX~1", string(global.flag[1099]));
                tempkeyitemdesc = "Lancer's controllers. They're covered in dirt.";
            }
            
            break;
			
		case DRKeyItem.SheetMusic:
			tempkeyitemname = "SheetMusic";
			tempkeyitemdesc = "Music that Susie attempted to transcribe.#USE it to read it.";
			tempkeyitemusable = true;
			break;
			
		case DRKeyItem.ClaimbClaws:
			tempkeyitemname = "ClaimbClaws";
			tempkeyitemdesc = "Claws so small they conveniently can't#be seen. Use them to climb up obvious walls.";
			break;
    }
}

function scr_item_use_action_overworld(itemid) {
	switch (itemid)
    {
        default:
        case DRItem.None:
            itemnameb = " ";
            itemdescb = "---";
            break;
        
        // Chapter 1
        case DRItem.DarkCandy:
            scr_healitem(global.charselect, 40);
            usable = 1;
            break;
        
        case DRItem.ReviveMint:
            reviveamt = ceil(global.maxhp[global.char[global.charselect]] / 2);
            scr_healitem(global.charselect, reviveamt);
            usable = 1;
            break;
        
        case DRItem.Manual:
            global.interact = 6;
            
            with (obj_darkcontroller)
                charcon = 0;
            
            global.menuno = -1;
            charcon = 0;
            global.fc = 0;
            global.fe = 0;
            global.typer = 6;
            global.msg[0] = "* (You tried to read the manual^1, but it was so dense it made your head spin...)/%";
            instance_create(0, 0, obj_dialoguer);
            break;
        
        case DRItem.BrokenCake:
            scr_healitem(global.charselect, 20);
            usable = 1;
            break;
        
        case DRItem.TopCake:
            scr_healitem_all(160);
            usable = 1;
            break;
        
        case DRItem.Spincake:
            if (global.chapter == 1)
                scr_healitem_all(80);
            
            if (global.chapter >= 2)
                scr_healitem_all(140);
            
            usable = 1;
            break;
        
        case DRItem.Darkburger:
            _healchoice = 70;
            usable = 1;
            
            if (global.char[global.charselect] == DRCharacter.Noelle)
                _healchoice = 20;
            
            scr_healitem(global.charselect, _healchoice);
            break;
        
        case DRItem.LancerCookie:
            scr_healitem(global.charselect, 1);
            usable = 1;
            
            break;
        
        case DRItem.GigaSalad:
            _healchoice = 4;
            usable = 1;
            
            if (global.char[global.charselect] == DRCharacter.Noelle)
                _healchoice = 90;
            
            scr_healitem(global.charselect, _healchoice);
            break;
        
        case DRItem.ClubsSandwich:
            scr_healitem_all(70);
            usable = 1;
            break;
        
        case DRItem.HeartsDonut:
            usable = 1;
            
            if (global.char[global.charselect] == DRCharacter.Kris)
                scr_healitem(global.charselect, 20);
            
            if (global.char[global.charselect] == DRCharacter.Susie)
                scr_healitem(global.charselect, 80);
            
            if (global.char[global.charselect] == DRCharacter.Ralsei)
                scr_healitem(global.charselect, 50);
            
            if (global.char[global.charselect] == DRCharacter.Noelle)
                scr_healitem(global.charselect, 30);
            
            break;
        
        case DRItem.ChocDiamond:
            usable = 1;
            
            if (global.char[global.charselect] == DRCharacter.Kris)
                scr_healitem(global.charselect, 80);
            
            if (global.char[global.charselect] == DRCharacter.Susie)
                scr_healitem(global.charselect, 20);
            
            if (global.char[global.charselect] == DRCharacter.Ralsei)
                scr_healitem(global.charselect, 50);
            
            if (global.char[global.charselect] == DRCharacter.Noelle)
            {
                scr_healitem(0, 35);
                scr_healitem(global.charselect, 35);
            }
            
            break;
        
        case DRItem.Favwich:
            usable = 1;
            scr_healitem(global.charselect, 500);
            
            break;
        
        case DRItem.RouxlsRoux:
            scr_healitem(global.charselect, 50);
            usable = 1;
            
            break;
        
        // Chapter 2
        case DRItem.CDBagel:
            scr_healitem(global.charselect, 80);
            usable = 1;
            
            break;
        
        case DRItem.Mannequin:
            scr_speaker("noone");
            msgset(0, "* (The clothes are stuck to the doll...)/");
            msgnext("* (There's no way you can use this.)/%");
            scr_itemdialoguer();
            break;
        
        case DRItem.KrisTea:
		case DRItem.NoelleTea:
		case DRItem.RalseiTea:
		case DRItem.SusieTea:
            usable = 1;
            _healamount = 10;
            
            scr_healitem(global.charselect, _healamount);
            break;
        
        case DRItem.DDBurger:
            _healchoice = 60;
            usable = 1;
            replaceable = 8;
            
            if (global.char[global.charselect] == DRCharacter.Noelle)
                _healchoice = 20;
            
            scr_healitem(global.charselect, _healchoice);
            break;
        
        case DRItem.LightCandy:
            scr_healitem(global.charselect, 120);
            usable = 1;
            
            break;
        
        case DRItem.ButJuice:
            scr_healitem(global.charselect, 100);
            usable = 1;
            
            break;
        
        case DRItem.SpagettiCode:
            scr_healitem_all(30);
            usable = 1;
            
            break;
        
        case DRItem.JavaCookie:
            usable = 1;
            var heal_amount = 90;
            
            if (global.char[global.charselect] == DRCharacter.Kris)
                heal_amount = 100;
            
            scr_healitem(global.charselect, heal_amount);
            break;
        
        case DRItem.TensionBit:
		case DRItem.TensionGem:
		case DRItem.TensionMax:
            usable = 0;
            scr_speaker("noone");
            global.msg[0] = "* (You felt tense.)/";
            global.msg[1] = "* (... try using it in battle.)/%";
            scr_itemdialoguer();
            break;
        
        case DRItem.ReviveDust:
            usable = 1;
            scr_healitem_all(10);
            
            break;
        
        case DRItem.ReviveBrite:
            usable = 1;
            scr_healitem_all(50);
            
            break;
        
        case DRItem.SPoison:
            if (global.char[global.charselect] != DRCharacter.Noelle)
            {
                global.hp[_gc] = max(global.hp[_gc] - 20, 1);
                snd_play(snd_hurt1);
            }
            
            usable = 1;
            
            break;
        
        case DRItem.DogDollar:
            usable = 0;
            scr_speaker("noone");
            global.msg[0] = "* (Where'd this come from?)/%";
            scr_itemdialoguer();
            break;
        
        // Chapter 3
        case DRItem.TVDinner:
            usable = 1;
            
            scr_healitem(global.charselect, 100);
            break;
        
        case DRItem.Pipis:
            if (global.char[global.charselect] == DRCharacter.Kris)
            {
                usable = 1;
                scr_healitem(global.charselect, 100);
            }
            else
                usable = 0;
            
            break;
        
        case DRItem.FlatSoda:
            usable = 1;
            scr_healitem(global.charselect, 20);
            
            break;
        
        case DRItem.TVSlop:
            usable = 1;
            scr_healitem(global.charselect, 80);
            
            break;
        
        case DRItem.ExecBuffet:
            usable = 1;
            scr_healitem_all(100);
            
            break;
        
        case DRItem.DeluxeDinner:
            usable = 1;
            scr_healitem(global.charselect, 140);
            
            break;
			
		// Chapter 4
		case DRItem.AncientSweet:
			usable = 1;
			_healamount = global.char[global.charselect] == DRCharacter.Kris ? 400 : 40;
			
			scr_healitem(global.charselect, _healamount);
			break;
			
		case DRItem.Rhapsotea:
            usable = 1;
            _healamount = 115;
            
            scr_healitem(global.charselect, _healamount);
            break;
        
        case DRItem.Scarlixir:
            usable = 1;
            _healamount = 160;
            
            if (global.char[global.charselect] == DRCharacter.Noelle)
            {
                _healamount = 155;
                scr_healitem(0, 5);
            }
            
            scr_healitem(global.charselect, _healamount);
            break;
        
        case DRItem.BitterTear:
            usable = 1;
            _healamount = ceil(global.maxhp[global.char[global.charselect]]) + abs(global.hp[global.char[global.charselect]]);
            scr_healitem(global.charselect, _healamount);
            break;
    }
}
	
function scr_item_use_action_battle(casterid, itemid) {
	spell = itemid;
	caster = casterid;
	
	var item_use = true;
	
	starChara = global.char[star];
	starCharaInst = global.charinstance[star];
	
	switch (itemid)
    {
		default:
        case DRItem.None: {
			item_use = false;
			break;	
		}
        
		// Chapter 1
        case DRItem.DarkCandy: {
			scr_healitemspell(40);
            break;	
		}
        
        case DRItem.ReviveMint: {
			reviveamt = ceil(global.maxhp[starChara] / 2);
            
            if (global.hp[starChara] <= 0)
                reviveamt = ceil(global.maxhp[starChara]) + abs(global.hp[starChara]);
            
            scr_healitemspell(reviveamt);
            break;
		}
        
        case DRItem.BrokenCake: {
			scr_healitemspell(20);
            break;	
		}
        
        case DRItem.TopCake: {
			scr_healallitemspell(160);
            break;	
		}
        
        case DRItem.Spincake: {
			scr_healallitemspell((global.chapter == 1) ? 80 : 140);
			break;
		}
        
        case DRItem.Darkburger: {
			scr_healitemspell(70);
            break;	
		}
        
        case DRItem.LancerCookie: {
			scr_healitemspell(50);
            break;	
		}
        
        case DRItem.GigaSalad: {
			scr_healitemspell(4);
            break;	
		}
        
        case DRItem.ClubsSandwich: {
			scr_healallitemspell(70);
            break;	
		}
        
        case DRItem.HeartsDonut: {
			switch (starChara) {
				default:
				case DRCharacter.Kris:
					scr_healitemspell(20);
					break;
					
				case DRCharacter.Susie:
					scr_healitemspell(80);
					break;
					
				case DRCharacter.Ralsei:
					scr_healitemspell(30);
					break;
				
				case DRCharacter.Noelle:
					scr_healitemspell(30);
					break;
			}
            
            break;
		}
        
        case DRItem.ChocDiamond: {
			switch (starChara) {
				default:
				case DRCharacter.Kris:
					scr_healitemspell(80);
					break;
					
				case DRCharacter.Susie:
					scr_healitemspell(20);
					break;
					
				case DRCharacter.Ralsei:
					scr_healitemspell(50);
					break;
				
				case DRCharacter.Noelle:
					scr_healitemspell(70);
					break;
			}
            
            break;	
		}
		
        case DRItem.Favwich: {
			scr_healitemspell(500);
            break;	
		}
        
        case DRItem.RouxlsRoux: {
			scr_healitemspell(50);
            break;	
		}
        
		// Chapter 2
        case DRItem.CDBagel: {
			scr_healitemspell(80);
            break;	
		}
        
        case DRItem.KrisTea:
		case DRItem.NoelleTea:
		case DRItem.RalseiTea:
		case DRItem.SusieTea: {
			scr_healitemspell(10);
            break;	
		}
        
        case DRItem.DDBurger: {
			scr_healitemspell(60);
            break;	
		}
        
        case DRItem.LightCandy: {
			scr_healitemspell(120);
            break;	
		}
        
        case DRItem.ButJuice: {
			scr_healitemspell(100);
            break;	
		}
        
        case DRItem.SpagettiCode: {
			scr_healallitemspell(30);
            break;	
		}
        
        case DRItem.JavaCookie: {
			scr_healitemspell(starChara == DRCharacter.Kris ? 100 : 90);
            break;	
		}
        
        case DRItem.ReviveDust: {
			var healamount = 10;
            
            for (var __j = 0; __j < 3; __j++)
            {
                if (global.char[__j] > 0)
                {
                    healamount = 10;
                    star = __j;
                    
                    if (global.hp[starChara] <= 0)
                        healamount = ceil(global.maxhp[starChara] / 4) + abs(global.hp[starChara]);
                    
                    scr_healitemspell(healamount);
                }
            }
            
            break;	
		}
        
        case DRItem.ReviveBrite: {
			var healamount = 50;
            
            for (var __j = 0; __j < 3; __j++)
            {
                if (global.char[__j] > 0)
                {
                    healamount = 50;
                    star = __j;
                    
                    if (global.hp[starChara] <= 0)
                        healamount = 999;
                    
                    scr_healitemspell(healamount);
                }
            }
            
            break;	
		}
        
        case DRItem.SPoison: {
			if (i_ex(starCharaInst))
                starCharaInst.poisonamount = 60;
            
            snd_play(snd_hurt1);
            var healanim = scr_healitemspell(40);
            healanim.particlecolor = c_fuchsia;
            break;	
		}
		
		// Chapter 3
        case DRItem.TVDinner: {
			scr_healitemspell(100);
            break;	
		}
        
        case DRItem.FlatSoda: {
			scr_healitemspell(20);
			break;
		}
        
        case DRItem.TVSlop: {
			scr_healitemspell(80);
            break;	
		}
        
        case DRItem.ExecBuffet: {
			scr_healallitemspell(100);
            break;	
		}
        
        case DRItem.DeluxeDinner: {
			scr_healitemspell(140);
            break;	
		}
		
		// Chapter 4
		case DRItem.AncientSweet: {
			scr_healitemspell(scr_heal_amount_modify_by_equipment(starChara == DRCharacter.Kris ? 400 : 40));
			break;
		}
		
		case DRItem.Rhapsotea: {
			scr_healitemspell(scr_heal_amount_modify_by_equipment(115));
			break;	
		}
		
		case DRItem.Scarlixir: {
            if starChara == DRCharacter.Noelle
            {
                scr_healitemspell(scr_heal_amount_modify_by_equipment(155));
                scr_heal(0, 5);
                
                with (global.charinstance[0])
                {
                    ha = instance_create(x, y, obj_healanim);
                    ha.target = id;
                    dmgwr = scr_dmgwriter_selfchar();
                    
                    with (dmgwr)
                    {
                        delay = 8;
                        type = 3;
                        damage = 5;
                    }
                    
                    if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
                        with (dmgwr)
                            specialmessage = 3;
                    
                    tu += 1;
                }
            } else
				scr_healitemspell(160);
			break;
		}
		
		case DRItem.BitterTear: {
			reviveamt = ceil(global.maxhp[global.char[star]]) + abs(global.hp[global.char[star]]);
            scr_healitemspell(scr_heal_amount_modify_by_equipment(reviveamt));
			break;	
		}
    }
	
	show_debug_message("scr_item_use_action_battle({0}, {1}) = {2}", casterid, itemid, item_use);
	return item_use;
}

function scr_key_item_use_action_overworld(itemid) {
	switch (itemid)
    {
        default:
        case DRKeyItem.None:
            break;
			
		// Chapter 1
        case DRKeyItem.CellPhone:
            with (obj_darkcontroller)
                charcon = 0;
            
            global.menuno = -1;
            charcon = 0;
            global.fc = 0;
            global.fe = 0;
            global.typer = 6;
            snd_play_x(snd_phone, 0.7, 1);
            global.msg[0] = "* (You tried to call on the Cell Phone.)";
            instance_create(0, 0, obj_dialoguer);
            instance_create(0, 0, obj_darkphone_event);
            global.interact = 1;
            break;
        
        case DRKeyItem.Egg:
            snd_play(snd_egg);
            scr_speaker("noone");
            global.msg[0] = "* (You used the Egg.)/%";
            scr_itemdialoguer();
            break;
			
		// Chapter 2
        case DRKeyItem.Lancer:
            snd_stop(snd_splat);
            snd_play_x(snd_splat, 1, (global.submenucoord[4] / 10) + 0.8);
            break;
        
        case DRKeyItem.ShadowCrystal:
            if (scr_flag_get(1269) == 0)
            {
                scr_flag_set(1269, 1);
                scr_speaker("no_name");
                msgset(0, "* You held the crystal up to your eye./");
                msgnext("* For some strange reason^1, for just a brief moment.../");
                msgnext("* You thought you saw a world you were able to design yourself using the power of GameMaker./%");
            }
            else if (scr_flag_get(1270) == 0)
            {
                scr_flag_set(1270, 1);
                scr_speaker("no_name");
                msgset(0, "* You held the crystal up to your eye./");
                msgnext("* ..^1. but nothing happened./%");
            }
            else
            {
                scr_speaker("no_name");
                msgset(0, "* It doesn't seem very useful./%");
            }
            
            scr_itemdialoguer();
            break;
			
		// Chapter 4
		// in other words i cba to port obj_dw_church_susiesnote
		case DRKeyItem.SheetMusic:
			scr_speaker("no_name");
			msgset(0, "* You looked down at the sheet music./");
			msgnext("* .../");
			msgnext("* You weren't able to read it.^1 After all, you're not in the Church anymore./%");
			
			scr_itemdialoguer();
			break;
    }
}