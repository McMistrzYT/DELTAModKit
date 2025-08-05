if (writedisplay == 1)
{
    debug_printline("instance_count=" + string(instance_count), 1);
    
    if (instance_count > 150)
    {
        debug_printline("THAT'S A LOT OF INSTANCES", 2);
    }
}

lastval[0] = 0;

if (interactshower == 1)
{
    draw_set_color(c_yellow);
    draw_set_font(fnt_mainbig);
    draw_text_outline(20, 20, "global.interact=" + string(global.interact), 0);
    draw_set_color(c_white);
}
