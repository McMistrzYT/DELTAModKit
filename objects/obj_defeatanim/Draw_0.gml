if (t == 0)
    draw_self();

sweat = 0;

if (g <= 5)
    sweat = 1;

if (g >= 9 && g <= 13)
    sweat = 1;

if (sweat == 1 && dosweat == true)
    draw_sprite(spr_defeatsweat, 0, x - 6, y - 6);

if (t >= 1)
{
    for (i = 0; i <= 80; i += 1)
    {
        alph = 0.4;
        draw_sprite_ext(sprite_index, image_index, x + (4 * i), y, image_xscale, image_yscale, 0, image_blend, (alph - (t / 8)) + (i / 200));
    }
    
    if (t >= 15)
        instance_destroy();
}
