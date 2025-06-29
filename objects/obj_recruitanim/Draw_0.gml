draw_self();

if (secondnumber > 1 && !showcount)
{
    draw_set_color(c_white);
    draw_set_font(global.damagefontgold);
    draw_set_alpha(image_alpha);
    draw_set_halign(fa_right);
    draw_text(x - 50, y + 35, firstnumber);
    draw_set_halign(fa_left);
    draw_text(x - 30, y + 35, secondnumber);
    draw_sprite(spr_numbersfontbig_gold, 13, x - 50, y + 35);
    draw_set_alpha(1);
}

if (showcount)
{
    var ypos = y + 22;
    draw_set_color(c_white);
    draw_set_font(global.damagefontgold);
    draw_set_alpha(image_alpha);
    draw_text(x - 70, ypos, firstnumber);
    var stringwid = round(string_width(string(firstnumber))) - 1;
    draw_sprite_ext(spr_numbersfontbig_gold_x, 0, (x - 70) + stringwid, ypos, 2, 2, 0, c_white, image_alpha);
    draw_set_alpha(1);
}
