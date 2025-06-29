scr_depth();
image_speed = 0;

if (global.darkzone)
    scr_darksize(id);

walk = 0;
fun = 0;
follow = 1;
runmove = 0;
dir = 0;
walkbuffer = 0;
walktimer = 0;
slided = 0;
specialed = 0;
init_clothes = false;
blushtimer = 0;
shadow_force_off = false;
name = "susie";
target = 12;
sprite_init = false;
target = 12;
usprite = spr_susieu_dark;
dsprite = spr_susied_dark;
rsprite = spr_susier_dark;
lsprite = spr_susiel_dark;
slidesprite = spr_susied_dark;
climbsprite = spr_susieu_dark;

parent = obj_mainchara;
pd = parent.dsprite;
pr = parent.rsprite;
pl = parent.lsprite;
pu = parent.usprite;

for (i = 0; i < 75; i += 1)
{
    remx[i] = parent.x;
    remy[i] = parent.y;
    facing[i] = global.facing;
    sliding[i] = 0;
    special[i] = 0;
}

depth = parent.depth + 5;
mywidth = sprite_width;
myheight = sprite_height;
xoffset = 0;
yoffset = 0;
init = 0;
forget = 0;
ignoredepth = 0;
halign = 6;
valign = 16;
