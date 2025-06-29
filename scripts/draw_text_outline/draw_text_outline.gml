function draw_text_outline(xx, yy, text, color = c_black, thickness = 1)
{
    resetcolor = draw_get_color();
    var _s = thickness;
    draw_set_color(c_black);
    
    if (argument_count >= 4)
        draw_set_color(color);
    
    draw_text(xx - _s, yy, text);
    draw_text(xx - _s, yy - _s, text);
    draw_text(xx - _s, yy + _s, text);
    draw_text(xx + _s, yy, text);
    draw_text(xx + _s, yy + _s, text);
    draw_text(xx + _s, yy - _s, text);
    draw_text(xx, yy + _s, text);
    draw_text(xx, yy - _s, text);
    draw_set_color(resetcolor);
    draw_text(xx, yy, text);
}

function draw_text_shadow(arg0, arg1, arg2)
{
    __txtcolor__ = draw_get_color();
    draw_set_color(c_black);
    draw_text(arg0 + 1, arg1 + 1, string_hash_to_newline(arg2));
    draw_set_color(__txtcolor__);
    draw_text(arg0, arg1, string_hash_to_newline(arg2));
}

function draw_text_shadow_width(arg0, arg1, arg2, arg3)
{
    __txtcolor__ = draw_get_color();
    draw_set_color(c_black);
    draw_text_width(arg0 + 1, arg1 + 1, string_hash_to_newline(arg2), arg3);
    draw_set_color(__txtcolor__);
    draw_text_width(arg0, arg1, string_hash_to_newline(arg2), arg3);
}

function draw_text_width(arg0, arg1, arg2, arg3)
{
    var _stringxscale = 1;
    var _stringwidth = string_width(arg2);
    
    if (_stringwidth >= arg3)
        _stringxscale = arg3 / _stringwidth;
    
    draw_text_transformed(arg0, arg1, arg2, _stringxscale, 1, 0);
}

function draw_background_part_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
{
    draw_sprite_part_ext(arg0, 0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);
}
