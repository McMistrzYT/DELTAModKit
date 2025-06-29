if (i_ex(target))
{
    if (init == 0)
    {
        dark = global.darkzone + 1;
        fakegravity = jumpspeed / (jumptime * 0.5);
        fakegravitystart = fakegravity;
        ignoredepth = 0;
        init = 1;
        
        if (board == false)
            body_obj = scr_dark_marker(target.x, target.y, target.sprite_index);
        else
            body_obj = scr_board_marker(target.x, target.y, target.sprite_index);
        
        body_obj.sprite_index = target.sprite_index;
        body_obj.image_index = target.image_index;
        body_obj.image_speed = target.image_speed;
        body_obj.image_xscale = target.image_xscale;
        body_obj.image_yscale = target.image_yscale;
        body_obj.depth = target.depth;
        checksprite = body_obj.sprite_index;
        var __depthcheck = 0;
        
        with (body_obj)
        {
            _remdepth = depth;
            scr_depth();
            
            if (_remdepth != depth)
                __depthcheck = 1;
            
            depth = _remdepth;
        }
        
        if (__depthcheck == 1)
            ignoredepth = 1;
        
        remy = y;
        shadowoffx = 0;
        shadowoffy = 0;
        shadowheight = sprite_get_height(checksprite);
        y = endy;
        scr_depth();
        y = remy;
        target.visible = 0;
        fakeendx = endx;
        fakeendy = endy;
        
        if (usesprites == 1)
        {
            usespritetimer = 0;
            
            if (landsprite > 0)
            {
                body_obj.sprite_index = landsprite;
                body_obj.image_speed = 0;
                body_obj.image_index = 0;
                
                if (landsprite == spr_kris_dw_landed)
                {
                    body_obj.x -= 2 * dark;
                    body_obj.y += 1 * dark;
                    fakeendx -= (4 * dark);
                    startx -= (4 * dark);
                    starty -= (4 * dark);
                }
                
                if (landsprite == spr_susie_dw_landed)
                {
                    body_obj.x -= 4 * dark;
                    fakeendx -= (4 * dark);
                    startx += (6 * dark);
                    starty -= (6 * dark);
                }
                
                if (global.chapter == 2)
                {
                    if (landsprite == spr_teacup_ralsei_land)
                    {
                        body_obj.y += 2 * dark;
                        starty += 4;
                        startx -= 6;
                        fakeendx -= 6;
                        fakeendy += (2 * dark);
                    }
                }
                
                if (jumpsprite == spr_ralsei_jump)
                {
                    shadowoffx -= 10;
                    shadowoffy -= 4;
                }
            }
            
            con = 1;
        }
        else
        {
            con = 2;
        }
    }
    
    if (con == 1)
    {
        usespritestimer++;
        
        if (usespritestimer >= 5)
        {
            body_obj.sprite_index = jumpsprite;
            body_obj.image_speed = 0.25;
            con = 2;
        }
    }
    
    if (con == 2)
    {
        if (titanslowmo && timer > 5)
        {
            titanslowmotimer++;
            timer += lerp(1, 0.1, titanslowmotimer / 70);
            fakegravity = lerp(fakegravitystart, fakegravitystart / 10, titanslowmotimer / 70);
            
            if (fakegravity < 0.1)
                fakegravity = 0.1;
            
            if (jumpspeed < 0.3)
                jumpspeed = 0.3;
        }
        else
        {
            timer++;
        }
        
        jumpspeed -= fakegravity;
        jumpy -= jumpspeed;
        x = lerp(startx, fakeendx, timer / jumptime);
        nowy = lerp(starty, fakeendy, timer / jumptime);
        y = nowy;
        target.x = x;
        target.y = nowy;
        body_obj.x = x;
        body_obj.y = nowy + jumpy;
        
        if (ignoredepth == 0)
        {
            scr_depth();
            depth -= 5000;
            body_obj.depth = depth;
        }
        
        if (timer >= jumptime)
        {
            body_obj.x = fakeendx;
            body_obj.y = fakeendy;
            target.x = endx;
            target.y = endy;
            con = 3;
            usespritestimer = 0;
        }
    }
    
    if (con == 3)
    {
        if (usesprites == 1)
        {
            body_obj.sprite_index = landsprite;
            usespritestimer++;
        }
        else
        {
            usespritestimer = 10;
        }
        
        if (usespritestimer >= 5)
        {
            target.visible = 1;
            instance_destroy();
        }
    }
}
else
{
    instance_destroy();
}

if (i_ex(body_obj))
    body_obj.image_alpha = image_alpha;

if (i_ex(body_obj) && i_ex(target))
{
    if (trackalpha)
        body_obj.image_alpha = target.image_alpha;
    
    if (trackblend)
        body_obj.image_blend = target.image_blend;
    
    if (trackindex)
        body_obj.image_index = target.image_index;
    
    if (tracksprite)
        body_obj.sprite_index = target.sprite_index;
    
    if (trackangle)
        body_obj.image_angle = target.image_angle;
}
