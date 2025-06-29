alarm[1] = 3;
canchoose = 0;
dar = global.darkzone + 1;
global.flag[33] = 0;
fighting = 0;

depth = -15999;

if (global.fighting == 1)
    fighting = 1;

image_xscale = dar;
image_yscale = dar;
remfc = global.fc;
global.fc = 0;
xx = camerax();
yy = cameray();
d = -1;

if (instance_exists(obj_dialoguer))
    d = obj_dialoguer.side;

if (fighting == 1)
    d = 1;

d_add = 0;

if (d == -1)
{
    if (obj_mainchara.y <= (__view_get(e__VW.YView, view_current) + (130 * dar)))
        d_add = 155;
}
else if (d != 0)
{
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
heartSprite = spr_heartsmall;
choicerstyle = 0;

controlled = true;
remoteu = 0;
remoted = 0;
remotel = 0;
remoter = 0;
remote1 = 0;