waiting = 0;
cs_wait_timer = 0;
cs_wait_amount = 0;
cs_wait_dialogue = 0;
cs_wait_custom = 0;
cs_wait_box = -1;
cs_wait_box_end = false;
customfunc = -1;
customfuncs = [];
customfuncs_delayed = [];
cs_wait_if = -1;
cs_wait_if_objectid = id;
cs_wait_if_varname = "cs_wait_if_varvalue";
cs_wait_if_operator = "=";
cs_wait_if_varvalue = 0;
mydialoguer = 438438943;
kill_actors = 0;
loadedState = 0;
instant = 0;
breakme = 0;
debug_pause = false;
current_command = 0;
maximum_command = 1;
master_object = 9999999;
msgside = -1;
stay = 0;
runcheck = 0;
preventcskip = false;
zurasu = 0;
mysound = -1;
initialized = 0;
actor_selected = "noone";
actor_selected_id = 99999999;

for (i = 0; i < 20; i++)
{
    actor_id[i] = 99999999;
    actor_name[i] = "noone";
}

for (i = 0; i < 10; i++)
    save_object[i] = 99999999;
	
function scr_cutscene_master_commands_initialize()
{
    for (i = 0; i < 800; i++)
    {
        command[i] = "terminate";
        command_actor[i] = 99999999;
        command_arg1[i] = 0;
        command_arg2[i] = 0;
        command_arg3[i] = 0;
        command_arg4[i] = 0;
        command_arg5[i] = 0;
        command_arg6[i] = 0;
    }
    
    current_command = 0;
    maximum_command = 1;
}


scr_cutscene_master_commands_initialize();
terminate_this_frame = 0;

