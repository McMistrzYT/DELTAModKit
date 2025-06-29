show_debug_message("starting existance");

char = 0;
myself = 0;
points = 0;
becomeflash = 0;
state = 0;
flash = 0;
siner = 0;
fsiner = 0;
attacktimer = 0;
attacked = 0;
combatdarken = 1;
darkentimer = 0;
darkify = 0;
image_xscale = 2;
image_yscale = 2;
myheight = 37;
mywidth = 34;
index = 0;
specdraw = 0;
is_auto_susie = 0;
poisonamount = 0;
poisontimer = 0;
_sideb = 0;
_victoried = 0;
maxframes = 0;
force = 0;
normalsprite = spr_krisr_dark;
idlesprite = spr_krisb_idle;
actreadysprite = spr_krisb_actready;
actsprite = spr_krisb_act;
hurtsprite = spr_krisb_hurt;
defendsprite = spr_krisb_attackready;
attackreadysprite = spr_krisb_attackready;
attacksprite = spr_krisb_attack;
itemsprite = spr_krisb_item;
itemreadysprite = spr_krisb_itemready;
spellreadysprite = spr_ralsei_spellready;
spellsprite = spr_ralsei_spell;
defeatsprite = spr_krisb_defeat;
victorysprite = spr_krisb_victory;
victoryanim = 0;
actframes = 7;
victoryframes = 9;
defendframes = 1;
itemframes = 3;
attackframes = 3;
attackspeed = 0.5;
actframes = 7;
actreturnframes = 10;
spellframes = 10;
hurt = 0;
hurttimer = 0;
hurtindex = 0;
acttimer = 0;
defendtimer = 0;
itemed = 0;
tu = 0;
finishattacktimer = 0;
spelltimer = 0;
gotupcon = 0;
gachapondead = false;

scr_hero_set_sprites(object_index);

/*if (object_index == obj_heronoelle)
{
    attackframes = 4;
    itemframes = 9;
    defendframes = 0;
    actframes = 7;
    actreturnframes = 10;
    attackspeed = 0.5;
    spellframes = 6;
    normalsprite = spr_noelle_walk_right_dw;
    idlesprite = spr_noelleb_idle;
    
    if (global.encounterno == 73)
        idlesprite = spr_noelle_shocked_dw;
    
    defendsprite = spr_noelleb_defend;
    hurtsprite = spr_noelleb_hurt;
    attackreadysprite = spr_noelleb_attackready;
    attacksprite = spr_noelleb_attack;
    itemsprite = spr_noelleb_item;
    itemreadysprite = spr_noelleb_itemready;
    spellreadysprite = spr_noelleb_spellready;
    
    if (global.encounterno == 82)
        spellreadysprite = spr_noelleb_spellready;
    
    spellsprite = spr_noelleb_spell;
    defeatsprite = spr_noelleb_defeat;
    victorysprite = spr_noelleb_victory;
    actreadysprite = spr_noelleb_actready;
    actsprite = spr_noelleb_act;
    victoryframes = sprite_get_number(victorysprite);
    _sideb = 0;
    
    if (_sideb == 1)
    {
        attackreadysprite = spr_noelleb_idle;
        attacksprite = spr_noelleb_spell;
        attackframes = 6;
        victorysprite = spr_noelleb_pray;
        victoryframes = 10;
        defendframes = 5;
        defendsprite = spr_noelleb_defend_sideb;
        hurtsprite = spr_noelleb_hurt_sideb;
        idlesprite = spr_noelleb_idle_sideb;
    }
    
    mywidth = 52;
    myheight = 86;
}*/

remspellframes = spellframes;
remspellsprite = spellsprite;
thissprite = idlesprite;
actspriteobject = -1;
caster = 0;
