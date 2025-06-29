if (!other.active)
    exit;

var _grazetpfactor = grazetpfactor;
var _grazetimefactor = grazetimefactor;

with (other)
{
    if (global.inv < 0)
    {
        if (grazed == 1)
        {
            scr_tensionheal((grazepoints / 30) * _grazetpfactor);
            
            if (global.turntimer >= 10)
                global.turntimer -= ((timepoints / 30) * _grazetimefactor);
            
            with (obj_grazebox)
            {
                if (grazetimer >= 0 && grazetimer < 4)
                    grazetimer = 3;
                
                if (grazetimer < 2)
                    grazetimer = 2;
            }
        }
        
        if (grazed == 0)
        {
            with (obj_grazebox)
            {
                grazecount++;
            }
            
            grazed = 1;
            scr_tensionheal(grazepoints * _grazetpfactor);
            
            if (global.turntimer >= 10)
                global.turntimer -= (timepoints * _grazetimefactor);
            
            with (obj_battlecontroller)
                grazenoise = 1;
            
            with (obj_grazebox)
                grazetimer = 10;
        }
    }
}
