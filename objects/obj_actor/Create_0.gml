scr_depth();
image_speed = 0;
walk = 1;
auto_walk = 1;
auto_facing = 1;
auto_depth = 1;
stopped = 0;
depthbonus = 0;
active = 0;
facing = "d";
usprite = spr_susieu_dark;
rsprite = spr_susier_dark;
dsprite = spr_susied_dark;
lsprite = spr_susiel_dark;
name = "susie";
number = -1;
spinspeed = 0;
spintimer = 0;
dz = 1;

if (global.darkzone == 1)
{
    dz = 2;
    image_xscale = 2;
    image_yscale = 2;
}

fake_speed = 0;
fake_direction = 0;
debug_killtimer = -1;
specialspriteno = 0;

for (i = 0; i < 10; i++)
    specialsprite[i] = dsprite;

sprite_palette = -1;
current_pal = 0;
color_blend = 16777215;
siner0 = 0;
siner_add0 = 0;
siner_amplitude0 = 0;
siner_direction0 = 0;
siner_type0 = "sin";
siner_visual0 = 1;
siner1 = 0;
siner_add1 = 0;
siner_amplitude1 = 0;
siner_direction1 = 270;
siner_type1 = "cos";
siner_visual1 = 1;
siner2 = 0;
siner_add2 = 0;
siner_amplitude2 = 0;
siner_direction2 = 0;
siner_type2 = "sin";
siner_visual2 = 1;
sinerx = 0;
sinery = 0;
shakeamt = 0;
shaketime = 1;
shaketimer = 0;
shakex = 0;
shakey = 0;
shaketype = 0;
stepsound = 0;
stepsound_count = 0;
