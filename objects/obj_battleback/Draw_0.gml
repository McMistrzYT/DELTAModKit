xx = __view_get(e__VW.XView, 0);
yy = __view_get(e__VW.YView, 0);
siner += (bgspeed / 2);
siner2 += bgspeed;

//if (room == room_dw_castle_dojo)
//    bgtype = 1;

draw_set_alpha(image_alpha);
draw_set_color(c_black);
draw_rectangle(-10, -10, room_width + 10, room_height + 10, false);
draw_set_alpha(1);

if (destroy == 0)
{
    if (image_alpha <= 1)
        image_alpha += 0.1;
}

if (bgtype == 0)
{
    draw_background_tiled_ext(bg_battleback1, round(-100 + siner), round(-100 + siner), 1, 1, image_blend, image_alpha / 2);
    draw_background_tiled_ext(bg_battleback1, round(-200 - siner2), round(-210 - siner2), 1, 1, image_blend, image_alpha);
}

if (bgtype == 1)
    draw_sprite_ext(spr_dojo_battlebg, 0, xx + (camerawidth() / 2), yy + 340, 2 + (sin(siner / 2) * 0.008), 2 + (cos(siner / 2) * 0.008), 0, image_blend, image_alpha);

if (siner >= 100)
    siner -= 100;

if (siner2 >= 100)
    siner2 -= 100;

if (destroy == 1)
{
    image_alpha -= 0.1;
    
    if (image_alpha <= 0)
        instance_destroy();
}