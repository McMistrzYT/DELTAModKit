function scr_boltcheck(arg0)
{
    pressbuffer[global.char[arg0]] = 5;
    qualifybolt = -1;
    close = 99;
    topclose = 99;
    
    for (i = 0; i < bolttotal; i += 1)
    {
        if (boltchar[i] == arg0 && boltalive[i] == 1)
        {
            close = boltframe[i] - boltx;
            
            if (close < 15 && close > -5)
            {
                if (close < topclose)
                {
                    topclose = close;
                    qualifybolt = i;
                }
            }
        }
    }
    
    if (qualifybolt != -1)
    {
        p = abs(topclose);
        burstbolt = instance_create((x + 80 + (boltframe[qualifybolt] * boltspeed)) - (boltx * boltspeed), y + (38 * arg0), obj_burstbolt);
        
        if (p == 0)
        {
            points[arg0] += 150;
            
            with (burstbolt)
                image_blend = c_yellow;
            
            with (burstbolt)
                mag = 0.2;
        }
        
        if (p == 1)
            points[arg0] += 120;
        
        if (p == 2)
            points[arg0] += 110;
        
        if (p >= 3)
        {
            points[arg0] += 100 - (abs(topclose) * 2);
            burstbolt.image_blend = boltcolor[arg0];
        }
        
        if (p >= 15)
            burstbolt.image_blend = charcolor[arg0];
        
        boltalive[qualifybolt] = 0;
    }
}

function scr_boltcheck_onebutton()
{
    dualbolt = -1;
    dualboltid = -1;
    pressbuffer[0] = 5;
    pressbuffer[1] = 5;
    pressbuffer[2] = 5;
    pressbuffer[3] = 5;
    qualifybolt = -1;
    close = 99;
    topclose = 999;
    
    for (i = 0; i < bolttotal; i += 1)
    {
        if (boltalive[i] == 1)
        {
            close = boltframe[i] - boltx;
            
            if (close < 15 && close > -5)
            {
                if (close == topclose)
                {
                    dualbolt = 1;
                    dualboltid = i;
                }
                
                if (close < topclose)
                {
                    topclose = close;
                    qualifybolt = i;
                }
            }
        }
    }
    
    if (qualifybolt != -1)
    {
        bc = boltchar[qualifybolt];
        p = abs(topclose);
        burstbolt = instance_create((x + 80 + (boltframe[qualifybolt] * boltspeed)) - (boltx * boltspeed), y + (38 * bc), obj_burstbolt);
        
        if (p == 0)
        {
            points[bc] += 150;
            
            with (burstbolt)
                image_blend = c_yellow;
            
            with (burstbolt)
                mag = 0.2;
        }
        
        if (p == 1)
            points[bc] += 120;
        
        if (p == 2)
            points[bc] += 110;
        
        if (p >= 3)
        {
            points[bc] += 100 - (abs(topclose) * 2);
            burstbolt.image_blend = boltcolor[bc];
        }
        
        if (p >= 15)
            burstbolt.image_blend = charcolor[bc];
        
        boltalive[qualifybolt] = 0;
        
        if (dualbolt == 1)
        {
            bc = boltchar[dualboltid];
            p = abs(topclose);
            burstbolt = instance_create((x + 80 + (boltframe[dualboltid] * boltspeed)) - (boltx * boltspeed), y + (38 * bc), obj_burstbolt);
            
            if (p == 0)
            {
                points[bc] += 150;
                
                with (burstbolt)
                    image_blend = c_yellow;
                
                with (burstbolt)
                    mag = 0.2;
            }
            
            if (p == 1)
                points[bc] += 120;
            
            if (p == 2)
                points[bc] += 110;
            
            if (p >= 3)
            {
                points[bc] += 100 - (abs(topclose) * 2);
                burstbolt.image_blend = boltcolor[bc];
            }
            
            if (p >= 15)
                burstbolt.image_blend = charcolor[bc];
            
            boltalive[dualboltid] = 0;
        }
    }
}