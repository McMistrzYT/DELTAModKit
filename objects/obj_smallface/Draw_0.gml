if (global.darkzone == 0)
    exit;

var drawsurf = 0;

if (global.darkzone == 99)
    drawsurf = 1;

var cxoff = 0;
var cyoff = 0;

if (drawsurf)
{
    __mysurface = surface_create(640, 480);
    surface_set_target(__mysurface);
    cxoff = -camerax();
    cyoff = -cameray();
}

if (facealpha < 1)
    facealpha += 0.2;

draw_sprite_ext(sprite_index, image_index, x + cxoff, y + cyoff, image_xscale, image_yscale, image_angle, image_blend, facealpha);
draw_set_alpha(facealpha);

if (type == 0 || type == 3)
{
    draw_set_color(mycolor);
    draw_text(x + 70 + cxoff, y + 10 + cyoff, string_hash_to_newline(mystring));
}

if (type == 1 && active == 1 && getrid == 0)
{
    draw_set_color(mycolor);
    draw_text(x + 70 + cxoff, y + 15 + cyoff, string_hash_to_newline(mystring));
    finished = 1;
}

if (type == 2 || type == 4)
{
    if (active == 1)
    {
        draw_set_color(mycolor);
        
        if (finished == 0)
        {
            partstring += string_char_at(mystring, part);
            part += 1;
            
            if (part >= (string_length(mystring) + 1))
                finished = 1;
        }
        
        draw_text(x + 70 + random(1) + cxoff, y + 15 + random(1) + cyoff, string_hash_to_newline(partstring));
    }
}

draw_set_alpha(1);

if (drawsurf)
{
    surface_reset_target();
    
    if (i_ex(writergod))
    {
        var yoff = 0;
        
        if (writergod.y < (cameray() + 120))
            yoff = -78;
        
        draw_surface_ext(__mysurface, camerax(), cameray() + yoff, 0.5, 0.5, 0, c_white, 1);
    }
    
    surface_free(__mysurface);
}

if (i_ex(writergod))
{
    if (finished == 1 && getrid == 0)
        finished = 2;
}
else
{
    instance_destroy();
}

if (getrid == 1)
{
    direction = -nowdir;
    speed += 2;
    
    if (type == 3 || type == 4)
        instance_destroy();
}
