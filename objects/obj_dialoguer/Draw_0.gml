if (active == 1)
{
    if (zurasu == 1 && zurasucon > 0)
    {
        if (zurasucon == 2)
        {
            if (i_ex(writer))
            {
                writer.writingx = remwriterx + camerax();
                writer.writingy = remwritery + cameray();
                
                if (global.fc != 0)
                {
                    obj_face.x = remfacex + camerax();
                    obj_face.y = remfacey + cameray();
                    writer.writingx += 58 * f;
                }
            }
        }
        
        if (zurasucon == 2 && remfacex == 0)
        {
            if (global.fc != 0)
            {
                remfacex = obj_face.x - camerax();
                remfacey = obj_face.y - cameray();
            }
        }
    }
    
    var ymod = 0;
    
    if (side == 1)
        ymod = 155;
    
    var cxx = camerax() + xoff;
    var cyy = cameray() + yoff;
    
    if (drawbox)
    {
        if (global.tempflag[19] == 0)
        {
            xxx = camerax() + xoff;
            yyy = cameray() + yoff;
			
            if (global.darkzone == 1)
            {
                var boxwidth_real = 592;
                
                if (boxwidth != -1)
                    boxwidth_real = boxwidth;
                
                var sidemod = side * 310;
                scr_darkbox_black(xxx + 24, yyy + 2 + sidemod, xxx + 24 + boxwidth_real, ((yyy + 168) - 108) + (36 * boxheight) + sidemod);
                draw_set_alpha(1);
            }
        }
    }
    
    if (!i_ex(writer))
    {
        if (stay > 0)
        {
            stayer = instance_create_depth(x, y, depth + 1, obj_writer_stay);
            stayer.side = side;
            stayer.xoff = xoff;
            stayer.yoff = yoff;
            stayer.boxwidth = boxwidth;
            stayer.boxheight = boxheight;
            stayer.cur_jewel = cur_jewel;
            scr_doom(stayer, stay);
        }
        
        instance_destroy();
    }
}
