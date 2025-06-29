if (i_ex(mywriter))
{
    mywriter.depth = depth - 5;
    
    if (remmsgno != obj_writer.msgno)
        reformatted = 0;
    
    if (auto_length == 0)
    {
        init = 1;
        reformatted = 1;
    }
    
    if (reformatted == 0)
    {
        if (mywriter.formatted == 0)
        {
            with (mywriter)
                event_user(5);
        }
        
        if (mywriter.formatted == 1)
        {
            if (init == 0)
            {
                initwritingx = mywriter.writingx;
                initwritingy = mywriter.writingy;
                init = 1;
            }
            
            writingx = mywriter.writingx;
            writingy = mywriter.writingy;
            stringmax = mywriter.stringmax;
            hspace = mywriter.hspace;
            vspace = mywriter.vspace;
            linecount = mywriter.linecount;
            balloonwidth = (stringmax * hspace) + 10;
            balloonheight = ((linecount + 1) * vspace) + 5;
            
            if (side == 1)
            {
                mywriter.writingx = initwritingx - (balloonwidth + 20);
                mywriter.writingy = initwritingy - (balloonheight / 2);
                writingx = initwritingx - (balloonwidth + 20);
                writingy = initwritingy - (balloonheight / 2);
            }
            
            if (side == -1)
            {
                xoffset = 20;
                mywriter.writingx = initwritingx;
                mywriter.writingy = initwritingy - (balloonheight / 2);
                writingx = initwritingx;
                writingy = initwritingy - (balloonheight / 2);
            }
            
            if (side == 2)
            {
                mywriter.writingx = initwritingx - (balloonwidth / 2);
                mywriter.writingy = initwritingy - (balloonheight + 20);
                writingx = initwritingx - (balloonwidth / 2);
                writingy = initwritingy - (balloonheight + 20);
            }
        }
    }
    
    if (auto_length == 0)
        draw_self();
    
    if (auto_length == 1 && init == 1)
    {
        blconscale = 1;
        
        if (balloonheight < 40)
            blconscale = 0.5;
        
        if (side == 1)
            draw_sprite_ext(spr_battleblcon_parts, 4, x, y, 1, blconscale, 0, c_white, 1);
        
        if (side == -1)
            draw_sprite_ext(spr_battleblcon_parts, 4, x - xoffset, y, -1, blconscale, 0, c_white, 1);
        
        if (side == 2)
            draw_sprite_ext(spr_battleblcon_parts, 4, x, y, 1, 1, -90, c_white, 1);
        
        draw_set_color(c_white);
        var _y = 0;
        
        draw_rectangle(writingx - 10, (writingy - 5) + _y, writingx + balloonwidth, ((writingy + balloonheight) - 5) + _y, false);
        draw_rectangle(writingx - 5, (writingy - 10) + _y, (writingx + balloonwidth) - 5, writingy + balloonheight + _y, false);
    }
    
    remmsgno = mywriter.msgno;
}
