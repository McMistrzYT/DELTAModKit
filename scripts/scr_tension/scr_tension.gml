function scr_tensionheal(amnt)
{
    global.tension += amnt;
    
    if (global.tension > global.maxtension)
        global.tension = global.maxtension;
    
    if (global.chapter == 3)
    {
        obj_battlecontroller.mercytotal += amnt;
        
        if (obj_battlecontroller.mercytotal < 0)
            obj_battlecontroller.mercytotal = 0;
        
        if (obj_battlecontroller.mercytotal >= 250)
            obj_battlecontroller.mercytotal = 250;
    }
}
