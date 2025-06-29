xxx = camerax() + xoff;
yyy = cameray() + yoff;

if (global.darkzone == 0)
{
    var sidemod = side * 155;
    var boxwidth_real = 288;
    
    if (boxwidth != -1)
        boxwidth_real = boxwidth;
    
    draw_set_color(c_white);
    ossafe_fill_rectangle(xxx + 16, yyy + 5 + sidemod, xxx + 16 + boxwidth_real, ((yyy + 80) - 54) + (18 * boxheight) + sidemod, false);
    draw_set_color(c_black);
    ossafe_fill_rectangle(xxx + 19, yyy + 8 + sidemod, xxx + 13 + boxwidth, ((yyy + 77) - 54) + (18 * boxheight) + sidemod, false);
}

if (global.darkzone == 1)
{
    var boxwidth_real = 592;
    
    if (boxwidth != -1)
        boxwidth_real = boxwidth;
    
    var sidemod = side * 310;
    scr_darkbox_black(xxx + 24, yyy + 2 + sidemod, xxx + 24 + boxwidth_real, ((yyy + 168) - 108) + (36 * boxheight) + sidemod);
    draw_set_alpha(1);
}
