siner += 1;

if (OBSPEED > 0)
    alpha = sin(siner / 34) * 0.2;

ystretch += OBSPEED;
xstretch += OBSPEED;

if (b_insurance < 0)
    b_insurance += 0.01;

if (ystretch > 2)
{
    o_insurance += 0.01;
    
    if (o_insurance >= 0.5)
        instance_destroy();
}
