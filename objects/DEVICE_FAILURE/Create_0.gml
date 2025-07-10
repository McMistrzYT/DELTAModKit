EVENT = 0;
TIMER = 0;
HEARTMADE = 0;
HSINER = 0;
OBMADE = 0;
global.flag[20] = 0;
global.flag[6] = 1;
global.typer = 667;
scr_windowcaption("THE DEATH");
FADEFACTOR = 0;
WHITEFADE = 0;
FADEUP = 0;
DARK_WAIT = 0;
text_timer = 30;
restart = false;
restart_timer = 0;
gamepad_controls = [gp_face1, gp_face2, gp_face3, gp_face4, gp_shoulderl, gp_shoulderlb, gp_shoulderr, gp_shoulderrb, gp_select, gp_start, gp_stickl, gp_stickr, gp_padu, gp_padd, gp_padl, gp_padr];

if (global.chapter > 1)
{
    var gameover_bg = instance_create(0, 20, obj_gameoverbg);
    
    with (gameover_bg)
        scr_depth();
}