extflag = "none";

event_inherited();

init = 0;
talked = 0;
tempvar = 0;
depthcancel = 0;
normalanim = 1;
remanimspeed = 0;
flag = 0;
alwaysanimate = false;
jpspecial = 0;
skip = 0;

scr_npc_config();

if (depthcancel == 0)
    scr_depth();