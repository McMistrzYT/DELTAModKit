// Wait
waiting = 0;
cs_wait_timer = 0;
cs_wait_amount = 0;
cs_wait_dialogue = 0;
cs_wait_custom = 0;

cs_wait_box = -1;
cs_wait_box_end = false;
cs_wait_plat_dialogue = 0

cs_wait_if = -1;
cs_wait_if_objectid = id;
cs_wait_if_varname = "cs_wait_if_varvalue";
cs_wait_if_operator = "=";
cs_wait_if_varvalue = 0;

// Custom Funcs
customfunc = -1;
customfuncs = [];
customfuncs_delayed = [];

mydialoguer = 438438943;
msgside = -1;
zurasu = 0;

kill_actors = 0;
loadedState = 0;
instant = 0;
breakme = 0;
debug_pause = false;
current_command = 0;
maximum_command = 1;
master_object = 9999999;
stay = 0;
runcheck = 0;
preventcskip = false;
mysound = -1;
initialized = 0;
actor_selected = "noone";
actor_selected_id = 99999999;


actor_id = array_create(20, 99999999)
actor_name = array_create(20, "noone")

/*
for (i = 0; i < 20; i++)
{
    actor_id[i] = 99999999;
    actor_name[i] = "noone";
}
*/
for (i = 0; i < 10; i++) save_object[i] = 99999999;
	
function scr_cutscene_master_commands_initialize(){
	/*
    for (i = 0; i < 800; i++) {
        command[i] = "terminate";
        command_actor[i] = 99999999;
        command_arg1[i] = 0;
        command_arg2[i] = 0;
        command_arg3[i] = 0;
        command_arg4[i] = 0;
        command_arg5[i] = 0;
        command_arg6[i] = 0;
    }
    */
	command = array_create(800, "terminate")
	command_actor = array_create(800, 99999999)
	command_arg1 = array_create(800, 0)
	command_arg2 = array_create(800, 0)
	command_arg3 = array_create(800, 0)
	command_arg4 = array_create(800, 0)
	command_arg5 = array_create(800, 0)
	command_arg6 = array_create(800, 0)
	
    current_command = 0;
    maximum_command = 1;
}


scr_cutscene_master_commands_initialize();
terminate_this_frame = 0;

