grazetimer = 0;
grazetpfactor = 1;
grazetimefactor = 1;
grazesizefactor = 1;
grazecount = 0;
grazetpfactor += (scr_armorcheck_equipped_party(DRArmor.TensionBow) * 0.1);
grazetpfactor += (scr_armorcheck_equipped_party(DRArmor.LodeStone) * 0.05);
grazetpfactor -= (scr_armorcheck_equipped_party(DRArmor.PinkRibbon) * 0.2);
grazetpfactor -= (scr_armorcheck_equipped_party(DRArmor.TwinRibbon) * 0.25);
grazetimefactor += (scr_armorcheck_equipped_party(DRArmor.SilverWatch) * 0.1);
grazetimefactor -= (scr_armorcheck_equipped_party(DRArmor.PinkRibbon) * 0.2);
grazetimefactor -= (scr_armorcheck_equipped_party(DRArmor.TwinRibbon) * 0.25);
grazesizefactor += (scr_armorcheck_equipped_party(DRArmor.PinkRibbon) * 0.2);
grazesizefactor += (scr_armorcheck_equipped_party(DRArmor.TwinRibbon) * 0.25);

if (grazetimefactor > 3)
    grazetimefactor = 3;

if (grazetpfactor > 3)
    grazetpfactor = 3;

if (grazesizefactor > 3)
    grazesizefactor = 3;

image_xscale = grazesizefactor;
image_yscale = grazesizefactor;

if (instance_exists(obj_heart))
{
    sizexoff = 0;
    sizeyoff = 0;
    x = obj_heart.x + 10 + sizexoff;
    y = obj_heart.y + 10 + sizeyoff;
}
