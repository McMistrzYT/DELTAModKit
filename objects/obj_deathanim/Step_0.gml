if (t == 0)
{
    truew = sprite_get_width(sprite_index);
    trueh = sprite_get_width(sprite_index);
    imgx = image_xscale;
    imgy = image_yscale;
    
    if (truew >= 50 || trueh >= 50)
        bsize = 8;
    
    if (truew >= 100 || truew >= 100)
        bsize = 16;
    
    xs = ceil(truew / bsize);
    ys = ceil(trueh / bsize);
    
    for (i = 0; i <= xs; i += 1)
    {
        for (j = 0; j <= ys; j += 1)
        {
            bl[i][j] = i * bsize;
            bh[i][j] = j * bsize;
            bx[i][j] = x + (i * bsize * imgx);
            bspeed[i][j] = 0;
            bsin[i][j] = (4 + (j * 3)) - i;
        }
    }
}

if (t >= 1)
{
    if (redup < 10)
        redup += 1;
    
    image_blend = merge_color(c_white, c_red, redup / 10);
    
    for (i = 0; i <= xs; i += 1)
    {
        for (j = 0; j <= ys; j += 1)
        {
            if (bsin[i][j] <= 0)
                bspeed[i][j] += 1;
            
            bx[i][j] += bspeed[i][j];
            bsin[i][j] -= 1;
        }
    }
}

t += 1;
