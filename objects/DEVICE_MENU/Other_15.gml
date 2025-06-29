iniwrite = ossafe_ini_open("dr.ini");
_NEWNAME = ini_read_string(scr_ini_chapter(global.chapter, MENUCOORD[2]), "Name", "------");
_NEWTIME = ini_read_real(scr_ini_chapter(global.chapter, MENUCOORD[2]), "Time", 0);
_NEWROOM = ini_read_real(scr_ini_chapter(global.chapter, MENUCOORD[2]), "Room", 0);
_NEWLEVEL = ini_read_real(scr_ini_chapter(global.chapter, MENUCOORD[2]), "Level", 0);
_NEWDATE = ini_read_real(scr_ini_chapter(global.chapter, MENUCOORD[2]), "Date", 0);
_NEWINITLANG = ini_read_real(scr_ini_chapter(global.chapter, MENUCOORD[2]), "InitLang", 0);
_NEWURABOSS = ini_read_real(scr_ini_chapter(global.chapter, MENUCOORD[2]), "UraBoss", 0);
_NEWVERSION = ini_read_string(scr_ini_chapter(global.chapter, MENUCOORD[2]), "Version", "0");
ini_write_string(scr_ini_chapter(global.chapter, MENUCOORD[3]), "Name", _NEWNAME);
ini_write_real(scr_ini_chapter(global.chapter, MENUCOORD[3]), "Time", _NEWTIME);
ini_write_real(scr_ini_chapter(global.chapter, MENUCOORD[3]), "Room", _NEWROOM);
ini_write_real(scr_ini_chapter(global.chapter, MENUCOORD[3]), "Level", _NEWLEVEL);
ini_write_real(scr_ini_chapter(global.chapter, MENUCOORD[3]), "Date", _NEWDATE);
ini_write_real(scr_ini_chapter(global.chapter, MENUCOORD[3]), "InitLang", _NEWINITLANG);
ini_write_real(scr_ini_chapter(global.chapter, MENUCOORD[3]), "UraBoss", _NEWURABOSS);
ini_write_string(scr_ini_chapter(global.chapter, MENUCOORD[3]), "Version", _NEWVERSION);
ossafe_ini_close();
var result = scr_get_ura_value(global.chapter, MENUCOORD[2]);
scr_store_ura_result(global.chapter, MENUCOORD[3], result);
FILE[MENUCOORD[3]] = 1;
PLACE[MENUCOORD[3]] = PLACE[MENUCOORD[2]];
TIME[MENUCOORD[3]] = TIME[MENUCOORD[2]];
NAME[MENUCOORD[3]] = NAME[MENUCOORD[2]];
LEVEL[MENUCOORD[3]] = LEVEL[MENUCOORD[2]];
INITLANG[MENUCOORD[3]] = INITLANG[MENUCOORD[2]];
TIME_STRING[MENUCOORD[3]] = TIME_STRING[MENUCOORD[2]];
var CH = string(global.chapter);

if (!global.is_console)
{
    file_copy("filech" + CH + "_" + string(MENUCOORD[2]), "filech" + CH + "_" + string(MENUCOORD[3]));
    
    if (file_exists("config_" + string(MENUCOORD[2]) + ".ini"))
        file_copy("config_" + string(MENUCOORD[2]) + ".ini", "config_" + string(MENUCOORD[3]) + ".ini");
}
else
{
    var file_to_copy = ds_map_find_value(global.savedata, "filech" + CH + "_" + string(MENUCOORD[2]));
    var new_filename = "filech" + CH + "_" + string(MENUCOORD[3]);
    var new_file = ossafe_file_text_open_write(new_filename);
    ds_map_set(new_file, "data", file_to_copy);
    ossafe_file_text_close(new_file);
    ossafe_savedata_save();
    
    if (ossafe_file_exists("config_" + string(MENUCOORD[2]) + ".ini"))
    {
        ossafe_ini_open("config_" + string(MENUCOORD[2]) + ".ini");
        var copy_border = ini_read_string("BORDER", "TYPE", global.screen_border_id);
        var copy_controls_list = [];
        var shoulder_reassign = 0;//obj_gamecontroller.gamepad_shoulderlb_reassign;
        
        for (var i = 0; i < 10; i += 1)
            copy_controls_list[i] = ini_read_real("GAMEPAD_CONTROLS", string(i), global.input_g[i]);
        
        shoulder_reassign = ini_read_real("SHOULDERLB_REASSIGN", "SHOULDERLB_REASSIGN",0 /*obj_gamecontroller.gamepad_shoulderlb_reassign*/);
        ossafe_ini_close();
        ossafe_ini_open("config_" + string(MENUCOORD[3]) + ".ini");
        ini_write_string("BORDER", "TYPE", copy_border);
        
        for (var i = 0; i < 10; i += 1)
            ini_write_real("GAMEPAD_CONTROLS", string(i), copy_controls_list[i]);
        
        ini_read_real("SHOULDERLB_REASSIGN", "SHOULDERLB_REASSIGN", shoulder_reassign);
        ossafe_ini_close();
    }
}