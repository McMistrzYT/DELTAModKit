cur_jewel = 0;
saved = 0;
xcoord = 0;
ycoord = 0;
ini_ex = 0;
buffer = 3;
name = "Kris";
level = 1;
love = 1;
time = 0;
roome = 0;
saved = 0;
endme = 0;
menuno = 0;
mpos = global.filechoice;
overwrite = 0;
overcoord = 0;
init = 0;
type = 0;

if (global.chapter >= 2 && global.darkzone == 1)
{
    if (global.plot >= 12)
        type = 1;
}

if (global.chapter >= 3)
    type = 1;

haverecruited = 1;
recruitsubtype = 1;

if (global.chapter > 2)
{
    recruitsubtype = 2;
    haverecruited = 0;
    
    for (var i = 1; i < global.chapter; i++)
    {
        var total_recruits = scr_get_total_recruits(i);
        
        if (total_recruits > 0)
        {
            haverecruited = 1;
            break;
        }
    }
}

global.currentroom = scr_get_id_by_room_index(room);
global.interact = 1;

if (ossafe_file_exists("dr.ini"))
{
    ini_ex = 1;
    iniread = ossafe_ini_open("dr.ini");
    name = ini_read_string(scr_ini_chapter(global.chapter, global.filechoice), "Name", "Kris");
    level = ini_read_real(scr_ini_chapter(global.chapter, global.filechoice), "Level", 1);
    love = ini_read_real(scr_ini_chapter(global.chapter, global.filechoice), "Love", 1);
    time = ini_read_real(scr_ini_chapter(global.chapter, global.filechoice), "Time", 0);
    roome = ini_read_real(scr_ini_chapter(global.chapter, global.filechoice), "Room", scr_get_id_by_room_index(room));
    ossafe_ini_close();
    ossafe_savedata_save();
}

d = global.darkzone + 1;
minutes = floor(time / 1800);
seconds = round(((time / 1800) - minutes) * 60);

if (seconds == 60)
    seconds = 59;

if (seconds < 10)
    seconds = "0" + string(seconds);

scr_roomname(roome);

if (d == 2)
    heartsprite = spr_heart;

if (d == 1)
    heartsprite = spr_heartsmall;

if (d == 1)
    name = "Kris";

name_current = global.truename;
love_current = global.llv;
room_current = scr_roomname(room);
level_current = global.lv;
time_current = global.time;

for (var i = 0; i < 3; i++)
{
    name_file[i] = "Kris";
    level_file[i] = 0;
    love_file[i] = 1;
    time_file[i] = 0;
    roome_file[i] = 0;
    
    if (ossafe_file_exists("dr.ini"))
    {
        ini_ex_file[i] = 1;
        iniread_file[i] = ossafe_ini_open("dr.ini");
        name_file[i] = ini_read_string(scr_ini_chapter(global.chapter, i), "Name", "Kris");
        level_file[i] = ini_read_real(scr_ini_chapter(global.chapter, i), "Level", 0);
        love_file[i] = ini_read_real(scr_ini_chapter(global.chapter, i), "Love", 1);
        time_file[i] = ini_read_real(scr_ini_chapter(global.chapter, i), "Time", 0);
        var room_id = ini_read_real(scr_ini_chapter(global.chapter, i), "Room", scr_get_id_by_room_index(room));
        roome_file[i] = scr_get_room_by_id(room_id);
        ossafe_ini_close();
        ossafe_savedata_save();
    }
}

quittimer = 0;
quitxcoord = 0;