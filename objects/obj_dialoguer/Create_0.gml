cur_jewel = 0;
active = 0;
alarm[0] = 1;
skippable = 1;
free = 0;
zurasu = 1;
zurasucon = 0;
stay = 0;
xxx = camerax();
yyy = cameray();
writer = 432432;
side = 1;
remfacex = 0;
remfacey = 0;
remwriterx = 0;
remwritery = 0;
myface = -4;
jpspecial = 0;

if (instance_exists(obj_mainchara))
{
    if (global.darkzone == 0)
    {
        if (obj_mainchara.y > (yyy + 130))
            side = 0;
    }
    
    if (global.darkzone == 1)
    {
        if (obj_mainchara.y > (yyy + 250))
            side = 0;
    }
}

f = 1;

if (global.darkzone == 1)
    f = 2;

drawdebug = 0;
drawdebugdialoguer = 0;
drawbox = true;
boxheight = 3;
boxwidth = -1;
xoff = 0;
yoff = 0;

show_debug_message("dialoguer made on depth " + string(depth));

function scr_facechoice()
{
    myface = instance_create(writer.x + (8 * f), writer.y + (5 * f), obj_face);
}
