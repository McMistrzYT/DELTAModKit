draw_set_alpha(FADEFACTOR);

if (WHITEFADE == 0)
    draw_set_color(c_black);
else
    draw_set_color(c_white);

ossafe_fill_rectangle(-10, -10, 999, 999, false);
draw_set_alpha(1);

if (FADEUP > 0)
{
    if (FADEFACTOR < 1)
        FADEFACTOR += FADEUP;
}
