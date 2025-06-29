if (delaytimer < delay)
{
    with (obj_dmgwriter)
        killtimer = 0;
}

delaytimer += 1;
mercytimer++;

if (delaytimer == delay)
{
    vspeed = -5 - random(2);
    hspeed = 10;
    vstart = vspeed;
    flip = 90;
}

if (delaytimer >= delay)
{
    draw_set_color(c_white);
    
    if (type == 0)
        draw_set_color(lightb);
    
    if (type == 1)
        draw_set_color(lightf);
    
    if (type == 2)
        draw_set_color(lightg);
    
    if (type == 3)
        draw_set_color(c_lime);
    
    if (type == 4)
        draw_set_color(c_red);
    
    if (type == 5 && damage < 0)
        draw_set_color(c_ltgray);
    
    if (type == 6)
        draw_set_color(lighty);
    
    message = specialmessage;
    
    if (damage == 0)
        message = 1;
    
    if (type == 4)
        message = 2;
    
    if (type == 5 && damage == 100)
        message = 5;
    
    if (type == 12)
        message = 10;
    
    if (type == 13)
    {
        message = 13;
        draw_set_color(aqcolor);
    }
    
    if (type != 5)
        draw_set_font(global.damagefont);
    
    if (type == 5)
        draw_set_font(global.damagefontgold);
    
    if (hspeed > 0)
        hspeed -= 1;
    
    if (hspeed < 0)
        hspeed += 1;
    
    if (abs(hspeed) < 1)
        hspeed = 0;
    
    if (init == 0)
    {
        damagemessage = string(damage);
        
        if (type == 5)
            damagemessage = "+" + string(damage) + "%";
        
        if (type == 5 && damage < 0)
            damagemessage = string(damage) + "%";
        
        init = 1;
    }
    
    if (message == 0)
    {
        draw_set_alpha(1 - kill);
        draw_set_halign(fa_right);
        
        if (spec == 0)
            draw_text_transformed(x + 30, y, damagemessage, 2 - stretch, stretch + kill, 0);
        
        if (spec == 1)
            draw_text_transformed(x + 30, y, damagemessage, 2 - stretch, stretch + kill, 90);
        
        draw_set_halign(fa_left);
        draw_set_alpha(1);
    }
    else
    {
        if (message == 1)
            draw_sprite_ext(message_sprite, 0, x + 30, y, 2 - stretch, stretch + kill, 0, draw_get_color(), 1 - kill);
        
        if (message == 2)
            draw_sprite_ext(message_sprite, 1, x + 30, y, 2 - stretch, stretch + kill, 0, c_red, 1 - kill);
        
        if (message == 3)
            draw_sprite_ext(message_sprite, 2, x + 30, y, 2 - stretch, stretch + kill, 0, c_lime, 1 - kill);
        
        if (message == 4)
            draw_sprite_ext(message_sprite, 3, x + 30, y, 2 - stretch, stretch + kill, 0, c_lime, 1 - kill);
        
        if (message == 5)
            draw_sprite_ext(message_sprite, 5, x + 30, y, 2 - stretch, stretch + kill, 0, c_lime, 1 - kill);
        
        if (message == 6)
            draw_sprite_ext(message_sprite, 8, x + 30, y, 2 - stretch, stretch + kill, 0, c_white, 1 - kill);
        
        if (message == 7)
            draw_sprite_ext(message_sprite, 9, x + 30, y, 2 - stretch, stretch + kill, 0, c_white, 1 - kill);
        
        if (message == 8)
            draw_sprite_ext(message_sprite, 10, x + 30, y, 2 - stretch, stretch + kill, 0, c_white, 1 - kill);
        
        if (message == 9)
            draw_sprite_ext(message_sprite, 11, x + 30, y, 2 - stretch, stretch + kill, 0, c_white, 1 - kill);
        
        if (message == 10)
            draw_sprite_ext(message_sprite, 13, x + 30, y, 2 - stretch, stretch + kill, 0, c_red, 1 - kill);
        
        if (message == 13)
            draw_sprite_ext(message_sprite, 14, x + 30, y, 2 - stretch, stretch + kill, 0, aqcolor, 1 - kill);
    }
    
    if (bounces < 2)
        vspeed += 1;
    
    if (y > ystart && bounces < 2 && killactive == 0)
    {
        y = ystart;
        vspeed = vstart / 2;
        bounces += 1;
    }
    
    if (bounces >= 2 && killactive == 0)
    {
        vspeed = 0;
        y = ystart;
    }
    
    if (stretchgo == 1)
        stretch += 0.4;
    
    if (stretch >= 1.2)
    {
        stretch = 1;
        stretchgo = 0;
    }
    
    killtimer += 1;
    
    if (killtimer > 35)
        killactive = 1;
    
    if (killactive == 1)
    {
        kill += 0.08;
        y -= 4;
    }
    
    if (kill > 1)
        instance_destroy();
}

if (global.fighting == 1)
{
    if (stayincamera == 1)
    {
        if (x >= (xx + 600))
            x = xx + 600;
    }
}
