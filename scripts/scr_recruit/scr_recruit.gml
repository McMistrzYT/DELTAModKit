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
    
    for (var i = 0; i < array_length(recruit_data); i++)
    {
        if (global.flag[600 + recruit_data[i]] < 1)
        {
            all_recruited = false;
            break;
        }
    }
    
    return all_recruited;
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

function scr_recruits_to_array()
{
    var startnum = 0;
    var endnum = 80;
    var whichrecruit = "full";
    
    if (argument_count >= 1)
        whichrecruit = argument[0];
    
    if (argument_count >= 2)
    {
		var recruit_ids = scr_get_chapter_recruit_data(argument[1]);
		startnum = recruit_ids[0];
		endnum = recruit_ids[array_length(recruit_ids) - 1] + 1;
		
        /*if (argument[1] == 1)
            endnum = 25;
        
        if (argument[1] == 2)
            startnum = 30;
        
        if (argument[1] == 3)
            startnum = 54;
        
        if (argument[1] == 4)
            startnum = 62;*/
    }
    
    recruit[0] = 0;
    totalrecruits = 0;
    halfrecruits = 0;
    eitherrecruits = 0;
    
    for (var i = startnum; i < endnum; i++)
    {
        if (global.flag[i + 600] > 0)
        {
            if (whichrecruit == "either")
                recruit[eitherrecruits] = i;
            
            eitherrecruits++;
            
            if (global.flag[i + 600] == 1)
            {
                if (whichrecruit == "full")
                    recruit[totalrecruits] = i;
                
                totalrecruits++;
            }
            else
            {
                if (whichrecruit == "half")
                    recruit[halfrecruits] = i;
                
                halfrecruits++;
            }
        }
    }
    
    return totalrecruits;
}

function scr_recruit_info_all()
{
    if (argument_count < 1)
        allrecruits = scr_recruits_to_array();
    
    if (argument_count == 1)
        allrecruits = scr_recruits_to_array(argument[0]);
    
    if (argument_count == 1 && argument[0] == "total")
        allrecruits = scr_recruits_to_array();
    
    if (argument_count >= 2)
        allrecruits = scr_recruits_to_array(argument[0], argument[1]);
    
    if (argument_count >= 1)
    {
        if (argument[0] == "half")
            allrecruits = halfrecruits;
        
        if (argument[0] == "either")
            allrecruits = eitherrecruits;
    }
    
    for (__i = 0; __i < allrecruits; __i++)
    {
        scr_recruit_info(recruit[__i]);
        recruitID[__i] = recruit[__i];
        recruitSprite[__i] = _sprite;
        recruitSpriteX[__i] = _spritex;
        recruitSpriteY[__i] = _spritey;
        recruitImageSpeed[__i] = _imagespeed;
        recruitName[__i] = _name;
        recruitDesc[__i] = _desc;
        recruitLike[__i] = _like;
        recruitDislike[__i] = _dislike;
        recruitChapter[__i] = _chapter;
        recruitLevel[__i] = _level;
        recruitAttack[__i] = _attack;
        recruitDefense[__i] = _defense;
        recruitElement[__i] = _element;
        recruitDialogueBoxes[__i] = _dialogueboxes;
        recruitCountMax[__i] = _recruitcount;
        recruitCountCurrent[__i] = _recruitcountcurrent;
        recruitFullyRecruited[__i] = 0;
        
        if (global.flag[600 + recruitID[__i]] == 1)
            recruitFullyRecruited[__i] = 1;
        
        if (recruitFullyRecruited[__i] == 0)
        {
            recruitDesc[__i] = "Not yet fully recruited";
            recruitLike[__i] = "?";
            recruitDislike[__i] = "?";
        }
        
        recruitPlaceable[__i] = _placeable;
    }
}
