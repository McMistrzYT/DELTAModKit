if (open == 1)
{
    xsin += 0.01;
    
    if (xsin > 1)
        xsin = 1;
    
    siner += 1;
    image_index = 1;
    amt = sin(siner / 16) * 0.1;
    
    for (i = 1; i < 6; i += 1)
        draw_sprite_ext(sprite_index, 2, x, y + sprite_height, 1, (3 / i) + amt, 0, c_white, xsin * (amt + 0.2));
    
    ht = amt * sprite_height * 3;
    wt = amt * sprite_width * 3;
    draw_sprite_ext(sprite_index, 2, x - (wt / 2), y - ht, 1 + (amt * 3), 1 + (amt * 3), 0, c_white, xsin * (amt + 0.2));
    ht = amt * sprite_height * 2;
    wt = amt * sprite_width * 2;
    draw_sprite_ext(sprite_index, 2, x - (wt / 2), y - ht, 1 + (amt * 2), 1 + (amt * 2), 0, c_white, xsin * (amt + 0.2));
}

draw_self();
