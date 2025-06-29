var skipplmove = false;

alarm[0] = 15;
con = 0;

with (obj_battleback)
    destroy = 1;

count = 0;
global.flag[49] = global.tension;
global.tension = 0;

if (!skipplmove)
{
    if (global.specialbattle == 0 || global.specialbattle == 3)
    {
        c[0] = scr_dark_marker(global.heromakex[0], global.heromakey[0], spr_krisr_dark);
        
        if (i_ex(global.cinstance[0]))
        {
            count += 1;
            c[1] = scr_dark_marker(global.heromakex[1], global.heromakey[1], global.cinstance[0].rsprite);
        }
        
        if (i_ex(global.cinstance[1]))
        {
            count += 1;
            c[2] = scr_dark_marker(global.heromakex[2], global.heromakey[2], global.cinstance[1].rsprite);
        }
        
        for (i = 0; i < (count + 1); i += 1)
        {
            if (i == 0)
            {
                c[i].direction = point_direction(c[i].x, c[i].y, obj_mainchara.x, obj_mainchara.y);
                c[i].speed = point_distance(c[i].x, c[i].y, obj_mainchara.x, obj_mainchara.y) / 10;
                c[i].depth = 200 - (i * 20);
            }
            
            if (i == 1 || i == 2)
            {
                c[i].direction = point_direction(c[i].x, c[i].y, global.cinstance[i - 1].x, global.cinstance[i - 1].y);
                c[i].speed = point_distance(c[i].x, c[i].y, global.cinstance[i - 1].x, global.cinstance[i - 1].y) / 10;
                c[i].depth = 200 - (i * 20);
            }
        }
        
        alarm[0] = 10;
    }
}

if (global.flag[9] == 1)
    snd_volume(global.batmusic[1], 0, alarm[0]);
