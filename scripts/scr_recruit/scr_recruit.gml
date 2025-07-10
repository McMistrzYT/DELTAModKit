function scr_recruit_info(recruitid)
{
    _recruitcount = 1;
    _sprite = spr_darkconfigbt;
    _spritex = 0;
    _spritey = 0;
    _imagespeed = 0;
    _name = "Known Quantity " + string(recruitid);
    _desc = "It is known.";
    _like = " ";
    _dislike = " ";
    _chapter = 0;
    _level = 0;
    _attack = 0;
    _defense = 0;
    _element = " ";
    _dialogueboxes = 1;
    _dialogue[0] = "%%";
    _placeable = 1;
    
    switch (recruitid)
    {
        case 5:
            _sprite = spr_diamond_overworld;
            _name = "Rudinn";
            _desc = "Said to be someone's best friend, but maybe not. Shine on, you lazy diamond!";
            _like = "Shiny Things";
            _dislike = "Effort";
            _chapter = 1;
            _level = 2;
            _attack = 4;
            _defense = 5;
            _element = "JEWEL";
            _dialogue[0] = "* Hey^1, boss^1! I'll have a Dark Candy Starfait!/%";
            break;
        
        case 6:
            _sprite = spr_heartenemy_overworld;
            _name = "Hathy";
            _desc = "A heart with a big heart. Always supporting others with her bullets.";
            _like = "Lip Gloss";
            _dislike = "Drama";
            _chapter = 1;
            _level = 2;
            _attack = 4;
            _defense = 5;
            _element = "HEART";
            _dialogue[0] = "* (Hathy is going to order a heart-foam latte.)/%";
            break;
        
        case 11:
            _sprite = spr_ponman_idle;
            _name = "Ponman";
            _desc = "A simple organism that takes life one square at a time.";
            _like = "Sleeping";
            _dislike = "Moving Backwards";
            _chapter = 1;
            _level = 3;
            _attack = 4;
            _defense = 5;
            _element = "ORDER";
            _dialogue[0] = "* (Looks like it wants to osmose some flavorful cubes.)/%";
            break;
        
        case 13:
            _sprite = spr_npc_rabbick_clean;
            _name = "Rabbick";
            _desc = "A real dust bunny. Known to play dirty, but loves to play clean.";
            _like = "Dusty Places";
            _dislike = "Vacuum";
            _chapter = 1;
            _level = 4;
            _attack = 4;
            _defense = 5;
            _element = "RABBIT:DUST";
            _dialogue[0] = "* (Looks like it wants to be dabbed with rubbing alcohol.)/%";
            break;
        
        case 14:
            _sprite = spr_blockguy_spared;
            _name = "Bloxer";
            _desc = "A shape changing fighter. Ironically, blocking is not its forte.";
            _like = "Cross-Trainers";
            _dislike = "Formal Shoewear";
            _chapter = 1;
            _level = 4;
            _attack = 4;
            _defense = 5;
            _element = "FIGHT";
            _dialogue[0] = "* Everything tastes better with a normally-shaped body!/%";
            break;
        
        case 15:
            _sprite = spr_jigsawry_spared;
            _name = "Jigsawry";
            _desc = "It cries tears of joy that you are its boss.";
            _like = "Fitting In";
            _dislike = "Susie's Ax";
            _chapter = 1;
            _level = 1;
            _attack = 4;
            _defense = 5;
            _element = "MOUSE:PUZZ";
            _dialogue[0] = "* Lemonade? ..^1. Please./%";
            break;
        
        case 20:
            _sprite = spr_joker_main;
            _name = "JEVIL";
            _desc = "An agent of CHAOS, he became DEVILSKNIFE to the pocket.";
            _like = "CHAOS";
            _dislike = "BOREDOM";
            _chapter = 1;
            _level = "???";
            _attack = 10;
            _defense = 5;
            _element = "CHAOS:CHAOS";
            _dialogue[0] = stringsetloc("", "scr_recruit_info_slash_scr_recruit_info_gml_122_0");
            _placeable = 0;
            break;
        
        case 22:
            _sprite = spr_diamond_knight_overworld;
            _name = "Rudinn Ranger";
            _desc = "Obsessed with ranger shows, it lets everyone know it's better than Rudinn.";
            _like = "Sucking Up";
            _dislike = "Show Getting Taped Over";
            _chapter = 1;
            _level = 5;
            _attack = 4;
            _defense = 5;
            _element = "JEWEL:BLADE";
            _dialogue[0] = "* Boss...? You're treating me...? Oh^1, you shouldn't have^1! (smile)/%";
            break;
        
        case 23:
            _sprite = spr_hathyx_overworld;
            _name = "Head Hathy";
            _desc = "Although stronger than Hathy, seems to have fewer friends.";
            _like = "Peace And Quiet";
            _dislike = "Being Alone";
            _chapter = 1;
            _level = 5;
            _attack = 5;
            _defense = 5;
            _element = "HEART:ICE";
            _dialogue[0] = "* (Head Hathy drinks an ice tea in silence...)/%";
            break;
        
        case 30:
            _sprite = spr_omawaroid_idle;
            _name = "Ambyu-Lance";
            _desc = "An aggressive antivirus. It's not down with the sickness.";
            _like = "Loud Sirens";
            _dislike = "Funny Sound Effects";
            _chapter = 2;
            _level = 8;
            _attack = 8;
            _defense = 8;
            _element = "ORDER:ELEC";
            _dialogue[0] = "* Pipooo^1! Nothing beats a nice shot of espresso..^1. Want me to give you a \"shot\"^1, too!?/%";
            _recruitcount = 4;
            break;
        
        case 31:
            _sprite = spr_poppup_idle;
            _name = "Poppup";
            _desc = "Known to say ASOBOH, which means \"Let's Play!\" ... does it know that?";
            _like = "LEEMO FRUIT";
            _dislike = "ADBLOCK";
            _chapter = 2;
            _level = 8;
            _attack = 9;
            _defense = 3;
            _element = "VIRUS";
            _dialogue[0] = "* NOMU NOMU.&* BERRY GOOD!/%";
            _recruitcount = 3;
            break;
        
        case 32:
            _sprite = spr_tasque_idle;
            _name = "Tasque";
            _desc = "This cat loves you!";
            _like = "Cat Food";
            _dislike = "Cat Food";
            _chapter = 2;
            _level = 7;
            _attack = 8;
            _defense = 6;
            _element = "CAT:ELEC";
            _dialogue[0] = "* (It's drinking K_K's electric milk JPEG.)/%";
            _recruitcount = 5;
            break;
        
        case 33:
            _sprite = spr_werewire_idle;
            _name = "Werewire";
            _desc = "It was controlled by Queen. But, it's stronger and cooler now, so?";
            _like = "Shock Therapy";
            _dislike = "Emotional Therapy";
            _chapter = 2;
            _level = 7;
            _attack = 8;
            _defense = 7;
            _element = "ELEC";
            _dialogue[0] = "* (It has some kind of energy drink.)/%";
            _recruitcount = 6;
            break;
        
        case 34:
            _sprite = spr_maus_idle;
            _name = "Maus";
            _desc = "It dreams of re-enacting scenes from cat and mouse cartoons.";
            _like = "Clicking";
            _dislike = "Clicking On Poppup";
            _chapter = 2;
            _level = 6;
            _attack = 8;
            _defense = 2;
            _element = "MOUSE:ELEC";
            _dialogue[0] = "* (It's drinking melted cheese.)/%";
            _recruitcount = 3;
            break;
        
        case 35:
            _sprite = spr_virovirokun_idle;
            _name = "Virovirokun";
            _desc = "A virus with a slightly criminal streak... and a heart of gold.";
            _like = "Retro Games";
            _dislike = "Federal Justice System";
            _chapter = 2;
            _level = 7;
            _attack = 8;
            _defense = 6;
            _element = "VIRUS";
            _dialogue[0] = "* Wanna share my soda? We'll both get sick that way..^1. Hee hee./%";
            _recruitcount = 4;
            break;
        
        case 36:
            _sprite = spr_npc_butler;
            _name = "Swatchling";
            _desc = "Colorful and dandy, you can always count on him to work hard.";
            _like = "Paint By Numbers";
            _dislike = "Mixed Messages";
            _chapter = 2;
            _level = 9;
            _attack = 9;
            _defense = 9;
            _element = "COLOR";
            _dialogue[0] = "* Boss? Shall we sit down and enjoy a nice earl grey?/%";
            _recruitcount = 5;
            break;
        
        case 40:
            _sprite = spr_werewerewire_idle;
            _name = "Werewerewire";
            _desc = "It absorbed the wire with fighting spirit. Gets flustered easily.";
            _like = "Supercharged Fighting";
            _dislike = "Interpersonal Relationships";
            _chapter = 2;
            _level = 14;
            _attack = 11;
            _defense = 11;
            _element = "ELEC:FIGHT";
            _dialogue[0] = "* (..^1. it's crushing its energy drink with its hand...)/%";
            _recruitcount = 1;
            break;
        
        case 42:
            _sprite = spr_npc_tasquemanager;
            _name = "Tasque Manager";
            _desc = "Loves to coordinate outfits. Strongly dislikes clowns.";
            _like = "New Wave Synth Pop";
            _dislike = "Mismatched Socks";
            _chapter = 2;
            _level = 10;
            _attack = 10;
            _defense = 7;
            _element = "CAT:ORDER";
            _dialogue[0] = stringsetloc("", "scr_recruit_info_slash_scr_recruit_info_gml_288_0");
            _placeable = 0;
            _recruitcount = 1;
            break;
        
        case 44:
            _sprite = spr_mauswheel_idle;
            _name = "Mauswheel";
            _desc = "You recruited 3 big mice and you're stuck with it.";
            _like = "Pretending To Be A Tire";
            _dislike = "Losing Momentum";
            _chapter = 2;
            _level = 13;
            _attack = 10;
            _defense = 11;
            _element = "MOUSE:MOUSE:MOUSE";
            _dialogue[0] = "* (It's getting electricity from the melted cheese like a water wheel)/%";
            _recruitcount = 1;
            break;
        
        case 54:
            _sprite = spr_shadowman_idle_a;
            _name = "Shadowguy";
            _desc = "Passionate about music, but often taken advantage of by sinister types.";
            _like = "Creative";
            _dislike = "Business";
            _chapter = 3;
            _level = 18;
            _attack = 13;
            _defense = 13;
            _element = "CHAOS:MUSIC";
            _dialogue[0] = "* (Seems to just be enjoying the musical ambience.)/%";
            _recruitcount = 25;
            break;
        
        case 55:
            _sprite = spr_shutta_idle;
            _name = "Shuttah";
            _desc = "Don't scream...! It's not the real monster, just the Darkner. Ooo la la.";
            _like = "Fashion Shoot";
            _dislike = "The word \"ugly\"";
            _chapter = 3;
            _level = 20;
            _attack = 14;
            _defense = 20;
            _element = "COPY";
            _dialogue[0] = "* Shush^1! Don't do the move..^1. I am photographing the drink!/%";
            _recruitcount = 2;
            break;
        
        case 56:
            _sprite = spr_npc_zapper;
            _name = "Zapper";
            _desc = "A bouncer that favors brute force over beauty. Gets lost easily.";
            _like = "Laser Tag";
            _dislike = "Buttons Pushed";
            _chapter = 3;
            _level = 19;
            _attack = 16;
            _defense = 18;
            _element = "ORDER:ELEC";
            _dialogue[0] = "* Say da word^1, boss..^1. I'll give dis drink a sip it won't forget./%";
            _recruitcount = 2;
            break;
        
        case 57:
            _sprite = spr_ribbick_Idle;
            _name = "Ribbick";
            _desc = "A real dust... frog. Known to play dirty, but loves to play... dirty.";
            _like = "Dusty Places";
            _dislike = "Imposter";
            _chapter = 3;
            _level = 16;
            _attack = 15;
            _defense = 12;
            _element = "FROG:DUST";
            _dialogue[0] = "* (Looks like it want to be dabbed with rubbing alcohol.)/%";
            _recruitcount = 3;
            break;
        
        case 58:
            _sprite = spr_watercooler;
            _name = "Watercooler";
            _desc = "The chatty office star. Obviously quite a looker despite her prudish wear.";
            _like = "Small talk";
            _dislike = "Feeling contained";
            _chapter = 3;
            _level = 24;
            _attack = 20;
            _defense = 12;
            _element = "WATER";
            _dialogue[0] = "* (Seems like they're drinking water.)&* (..^1. feels questionable.)/%";
            _recruitcount = 1;
            break;
        
        case 59:
            _sprite = spr_pippins_idle;
            _name = "Pippins";
            _desc = "A sly customer that takes risk until luck strikes. ... cheating also works.";
            _like = "Gacha Game";
            _dislike = "Consequences";
            _chapter = 3;
            _level = 17;
            _attack = 14;
            _defense = 10;
            _element = "CHAOS:LUCK";
            _dialogue[0] = "* This drink's not mine? It's fine. I'm just keeping it warm./%";
            _recruitcount = 5;
            break;
        
        case 60:
            _sprite = spr_elnina_idle_left;
            _name = "Elnina";
            _desc = "The weather girl who really \"makes it rain.\" Like... with water, though.";
            _like = "Lanino";
            _dislike = "Being Alone";
            _chapter = 3;
            _level = 22;
            _attack = 21;
            _defense = 22;
            _element = "WATER:ICE";
            _dialogue[0] = "* Oh no^1, where's Lanino? He better not be having a team relationship.../%";
            _recruitcount = 1;
            break;
        
        case 61:
            _sprite = spr_lanino_idle_left;
            _name = "Lanino";
            _desc = "A charming weatherman who can control the weather. Which, seems like cheating.";
            _like = "Elnina";
            _dislike = "Being Alone";
            _chapter = 3;
            _level = 22;
            _attack = 22;
            _defense = 21;
            _element = "FIRE:WIND";
            _dialogue[0] = "* Haven't been on a date alone for a while^1! ..^1. which^1, isn't a date./%";
            _recruitcount = 1;
            break;
    }
    
    if (_sprite == spr_darkconfigbt)
    {
        _sprite = floor(random(500));
        _placeable = 0;
    }
    
    _recruitcountcurrent = round(global.flag[recruitid + 600] / (1 / _recruitcount));
}

function scr_recruit()
{
    if (recruitable == 1 && global.flag[61] == 0)
    {
        if (global.flag[global.monstertype[myself] + 600] >= 0 && global.flag[global.monstertype[myself] + 600] < 1 && recruitcount > 0)
        {
            if (recruitcount == -1)
            {
                scr_recruit_info(global.monstertype[myself]);
                recruitcount = _recruitcount;
            }
            
            global.flag[global.monstertype[myself] + 600] += 1 / recruitcount;
            
            if (global.flag[global.monstertype[myself] + 600] > 1)
                global.flag[global.monstertype[myself] + 600] = 1;
            
            snd_play(snd_sparkle_gem);
            _recruitanim = instance_create(global.monsterx[myself], global.monstery[myself] - 40, obj_recruitanim);
            _recruitanim.firstnumber = round(global.flag[global.monstertype[myself] + 600] / (1 / recruitcount));
            _recruitanim.secondnumber = recruitcount;
        }
    }
}

function scr_recruited_all()
{
    var recruited_all = true;
    var min_chapter = 1;
    var max_chapter = global.chapter + 1;
    
    for (var i = min_chapter; i < max_chapter; i++)
    {
        recruited_all = scr_recruited_all_in_chapter(i);
        
        if (!recruited_all)
            break;
    }
    
    return recruited_all;
}

function scr_recruited_all_previous()
{
    var recruited_all = true;
    var min_chapter = 1;
    var max_chapter = global.chapter;
    
    for (var i = min_chapter; i < max_chapter; i++)
    {
        recruited_all = scr_recruited_all_in_chapter(i);
        
        if (!recruited_all)
            break;
    }
    
    return recruited_all;
}

function scr_recruited_all_in_chapter(arg0)
{
    var chapter = arg0;
    var recruit_data = scr_get_chapter_recruit_data(chapter);
    var all_recruited = true;
    
    for (var i = 0; i < array_length_1d(recruit_data); i++)
    {
        if (global.flag[600 + recruit_data[i]] < 1)
        {
            all_recruited = false;
            break;
        }
    }
    
    return all_recruited;
}

// !MOD! !CHANGE! recruits
function scr_get_chapter_recruit_data(chapter)
{
    var recruit_ids = [];
	
	switch (chapter) {
		//case 1: recruit_ids = [5, 6, 11, 13, 14, 15, 22, 23]; break;
		//case 2: recruit_ids = [30, 31, 32, 33, 34, 35, 36, 40, 42, 44]; break;
		//case 3: recruit_ids = [54, 55, 56, 57, 58, 59, 60, 61]; break;
		default: recruit_ids = [ DREnemy.TestEnemy ]; break;
	}
	
    return recruit_ids;
}

function scr_get_total_recruits(chapter)
{
    var totalrecruits = 0;
    var recruit_data = scr_get_chapter_recruit_data(chapter);
    
    for (var i = 0; i < array_length(recruit_data); i++)
    {
        if (global.flag[600 + recruit_data[i]] == 1)
            totalrecruits++;
    }
    
    return totalrecruits;
}
