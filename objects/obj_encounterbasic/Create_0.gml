global.interact = 2;

if (global.flag[9] == 1)
    snd_volume(global.currentsong[1], 0, 20);

scr_encountersetup(global.encounterno);

with (obj_mainchara)
    visible = 0;

with (global.cinstance[0])
    visible = 0;

with (global.cinstance[1])
    visible = 0;

with (obj_mainchara)
    fun = 0;

with (obj_caterpillarchara)
    fun = 0;

count = 0;
c[0] = scr_dark_marker(obj_mainchara.x, obj_mainchara.y, spr_kris_sword_jump_down);

if (i_ex(global.cinstance[0]))
{
    count += 1;
    c[1] = scr_dark_marker(global.cinstance[0].x, global.cinstance[0].y, global.cinstance[0].rsprite);
    
    if (global.cinstance[0].rsprite == spr_susier_dark)
        c[1].sprite_index = spr_susier_wall;
    
    /*if (global.cinstance[0].name == "noelle")
    {
        var _sideb = scr_sideb_get_phase();
        c[1].sprite_index = spr_noelleb_battleintro;
        
        if (_sideb >= 2)
            c[1].sprite_index = spr_noelleb_battleintro_sideb;
        
        c[1].image_speed = 0.5;
    }*/
}

if (i_ex(global.cinstance[1]))
{
    count += 1;
    c[2] = scr_dark_marker(global.cinstance[1].x, global.cinstance[1].y, global.cinstance[1].rsprite);
    
    if (global.cinstance[1].rsprite == spr_susier_dark)
        c[2].sprite_index = spr_susier_wall;
    
    /*if (global.cinstance[1].name == "noelle")
    {
        c[2].sprite_index = spr_noelleb_battleintro;
        c[2].image_speed = 0.5;
    }*/
}

for (i = 0; i < (count + 1); i += 1)
{
    c[i].direction = point_direction(c[i].x, c[i].y, global.heromakex[i], global.heromakey[i]);
    c[i].speed = point_distance(c[i].x, c[i].y, global.heromakex[i], global.heromakey[i]) / 10;
    c[i].depth = 200 - (i * 20);
}

fightcon = 1;
counttimer = 0;
