if (init == 0)
{
    var playsound = false;
    
    if (settingb == 0)
    {
        //var text_sound = scr_funnytext_get_sound(sprite_index);
        
        //if (text_sound != -4)
        {
            //playsound = true;
            //typingnoise = text_sound;
        }
    }
    else if (settingb == 1)
    {
        //if (sprite_index == scr_84_get_sprite("spr_funnytext_fun_o_meter"))
        {
            //if (i_ex(obj_ch3_GSA01G))
            {
                playsound = true;
                //typingnoise = 84;
            }
        }
    }
    
    if (settinga == 0)
        typingstyle = 0;
    
    if (settinga == 1)
        typingstyle = 1;
    
    y += 5;
    
    if (typingstyle == 0)
    {
        var spritename = sprite_get_name(sprite_index);
        loopsprite = asset_get_index(spritename + "_loop");
        
        if (loopsprite > 0)
        {
            typingstyle = 2;
        }
        else
        {
            x += (sprite_width / 2);
            y += (sprite_height / 2);
            image_xscale = 0;
            image_yscale = 0;
            lerpa = scr_lerpvar("image_xscale", 0, idealxscale, 10, -2, "out");
            lerpb = scr_lerpvar("image_yscale", 0, idealyscale, 10, -2, "out");
        }
    }
    
    init = 1;
    
    //if (playsound)
    //    snd_play(typingnoise);
}

if (i_ex(obj_writer))
{
    if (obj_writer.halt > 0)
        writerfinished = 1;
}

if (typingstyle == 0)
{
    if (writerfinished)
    {
        image_xscale = idealxscale;
        image_yscale = idealyscale;
        
        with (lerpa)
            instance_destroy();
        
        with (lerpb)
            instance_destroy();
    }
    
    image_index += 1;
}

if (typingstyle == 1)
{
    chartimer++;
    
    if (writerfinished)
    {
        charmax = image_number;
        typingfinished = 1;
    }
    
    if (!typingfinished)
    {
        if (chartimer >= typingspeed)
        {
            chartimer = 0;
            charmax++;
            
            if (charmax >= image_number)
                typingfinished = 1;
            
            //snd_play(typingnoise);
        }
    }
}

if (typingstyle == 2)
{
    if (con == 1)
        image_index += 1;
    
    if (con == 0)
    {
        image_index += 1;
        
        if (image_index >= image_number)
        {
            sprite_index = loopsprite;
            image_index = 0;
            con = 1;
        }
    }
}

if (!i_ex(obj_writer))
    instance_destroy();
