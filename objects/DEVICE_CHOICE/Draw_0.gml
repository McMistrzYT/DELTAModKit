draw_set_font(global.main_font);
xfade = (10 - fadebuffer) / 10;

if (xfade > 1)
    xfade = 1;

if (TYPE <= 2)
{
    if (DRAWHEART == 1)
        draw_sprite_ext(IMAGE_SOUL_BLUR, 0, HEARTX + xoff, HEARTY + yoff, 1, 1, 0, c_white, 0.6 * xfade);
    
    draw_set_alpha(xfade);
    
    if (TYPE < 2)
    {
        for (i = 0; i <= XMAX; i += 1)
        {
            draw_set_color(c_white);
            
            if (CURX == i)
                draw_set_color(c_yellow);
            
            draw_text(NAMEX[i][0], NAMEY[i][0] + choice_y_offset, string_hash_to_newline(NAME[i][0]));
        }
    }
    
    if (TYPE == 2)
    {
        for (i = 0; i <= YMAX; i += 1)
        {
            draw_set_color(c_white);
            
            if (CURY == i)
                draw_set_color(c_yellow);
            
            draw_text(NAMEX[0][i], NAMEY[0][i], string_hash_to_newline(NAME[0][i]));
        }
    }
    
    draw_set_alpha(1);
}

if (TYPE == 3)
{
    if (DRAWHEART == 1)
        draw_sprite_ext(IMAGE_SOUL_BLUR, 0, HEARTX, HEARTY, 1, 1, 0, c_white, 0.5 * xfade);
    
    draw_set_alpha(xfade);
    
    for (j = 0; j <= YMAX; j += 1)
    {
        for (i = 0; i <= XMAX; i += 1)
        {
            draw_set_color(c_white);
            
            if (CURX == i && CURY == j)
                draw_set_color(c_yellow);
            
            var str = string_hash_to_newline(NAME[i][j]);
            
            if (string_char_at(str, 1) == "(" && string_length(str) > 3)
                str = string_copy(str, 4, string_length(str) - 3);
            
            if (str != "<" && str != ">")
                draw_text(NAMEX[i][j], NAMEY[i][j], str);
        }
    }
    
    draw_set_color(c_white);
    
    if (string_length(NAMESTRING) == STRINGMAX)
        draw_set_color(c_yellow);
    
    var width = string_width(NAMESTRING);
    draw_text((320 - width) / 2, PLAYERNAMEY, string_hash_to_newline(NAMESTRING));
    draw_set_alpha(1);
}
