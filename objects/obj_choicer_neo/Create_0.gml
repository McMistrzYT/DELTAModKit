alarm[1] = 3;
canchoose = 0;
dar = global.darkzone + 1;
global.flag[33] = 0;
fighting = 0;

depth = -15999;

if (global.fighting == 1 && i_ex(obj_battlecontroller)) fighting = 1;

image_xscale = dar;
image_yscale = dar;
remfc = global.fc;
global.fc = 0;
xx = camerax();
yy = cameray();
d = -1;

if (instance_exists(obj_dialoguer)) d = obj_dialoguer.side;

if (fighting == 1) d = 1;

d_add = 0;
is_platmode = false//i_ex(obj_plat_player)

if is_platmode d = 1

if (d == -1) {
    if (obj_mainchara.y <= (__view_get(e__VW.YView, view_current) + (130 * dar))) d_add = 155;
} else if (d != 0) {
    d_add = 155;
}

chx = (140 * dar) + xx;
chy = ((36 + d_add) * dar) + yy + (fighting * 30);
hx = chx;
hy = chy;

mychoice = -1;
global.choice = -1;
choiced = 0;
choicetotal = 3;
textposx[0] = 0;
textposy[0] = 0;
textposx[1] = 0;
textposy[1] = 0;
textposx[2] = 0;
textposy[2] = 0;
textposx[3] = 0;
textposy[3] = 0;
heartSprite = spr_heartsmall_white;
heartCol = c_red
highlightCol = c_yellow
choicerstyle = 0;

controlled = true;
remoteu = 0;
remoted = 0;
remotel = 0;
remoter = 0;
remote1 = 0;

font = global.darkzone ? fnt_mainbig : fnt_main

neostyle = DefaultChoicerStyle
neoinit = 0
neolinecount = []
neolerpstrength = 0.8

if (is_platmode || fighting) neostyle = DRChoicerNeoStyle.Old

opt0xoff = 0
opt0yoff = 0
opt1xoff = 0
opt1yoff = 0
opt2xoff = 0
opt2yoff = 0
opt3xoff = 0
opt3yoff = 0

heartxoff = 0
heartyoff = 0