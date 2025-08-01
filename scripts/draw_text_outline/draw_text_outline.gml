function draw_text_outline(x, y, text, color = c_black, thickness = 1)
{
    resetcolor = draw_get_color();
    var _s = thickness;
    draw_set_color(c_black);
    
    if (argument_count >= 4)
        draw_set_color(color);
    
    draw_text(x - _s, y, text);
    draw_text(x - _s, y - _s, text);
    draw_text(x - _s, y + _s, text);
    draw_text(x + _s, y, text);
    draw_text(x + _s, y + _s, text);
    draw_text(x + _s, y - _s, text);
    draw_text(x, y + _s, text);
    draw_text(x, y - _s, text);
    draw_set_color(resetcolor);
    draw_text(x, y, text);
}

function scr_84_draw_text_outline(x, y, text)
{
    var xx = x;
    var yy = y;
    var str = text;
    var __txtcolor__ = draw_get_color();
    draw_set_colour(c_black);
    draw_text(xx - 1, yy - 1, str);
    draw_text(xx + 1, yy - 1, str);
    draw_text(xx - 1, yy + 1, str);
    draw_text(xx + 1, yy + 1, str);
    draw_set_colour(__txtcolor__);
    draw_text(xx, yy, str);
}


function draw_text_shadow(x, y, text)
{
    __txtcolor__ = draw_get_color();
    draw_set_color(c_black);
    draw_text(x + 1, y + 1, string_hash_to_newline(text));
    draw_set_color(__txtcolor__);
    draw_text(x, y, string_hash_to_newline(text));
}

function draw_text_shadow_width(x, y, text, width)
{
    __txtcolor__ = draw_get_color();
    draw_set_color(c_black);
    draw_text_width(x + 1, y + 1, string_hash_to_newline(text), width);
    draw_set_color(__txtcolor__);
    draw_text_width(x, y, string_hash_to_newline(text), width);
}

function draw_text_width(x, y, text, width)
{
    var _stringxscale = 1;
    var _stringwidth = string_width(text);
    
    if (_stringwidth >= width)
        _stringxscale = width / _stringwidth;
    
    draw_text_transformed(x, y, text, _stringxscale, 1, 0);
}

function draw_background_part_ext(sprite, left, top, width, height, x, y, xscale, yscale, col, alpha)
{
    draw_sprite_part_ext(sprite, 0, left, top, width, height, x, y, xscale, yscale, col, alpha);
}
