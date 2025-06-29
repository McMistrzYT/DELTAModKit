function scr_actinfo_temp(monsterid)
{
    for (__acti = 0; __acti < 6; __acti++)
    {
        canact[__acti] = global.canact[global.char[global.charturn]][monsterid][__acti] ?? 0;
        acttpcost[__acti] = global.actcost[global.char[global.charturn]][monsterid][__acti];
        actsimul[__acti] = global.actsimul[global.char[global.charturn]][monsterid][__acti];
    }
}
