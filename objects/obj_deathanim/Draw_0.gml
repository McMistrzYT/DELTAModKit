if (t == 0)
    draw_self();

if (t >= 1)
{
    for (i = 0; i <= xs; i += 1)
    {
        for (j = 0; j <= ys; j += 1)
            draw_sprite_part_ext(sprite_index, image_index, bl[i][j], bh[i][j], bsize, bsize, bx[i][j], y + (j * bsize * imgy), imgx, imgy, image_blend, 1 - (bspeed[i][j] / 12));
    }
    
    if (bspeed[0][ys] >= 12)
        instance_destroy();
}
