if (fresh == 0)
{
    image_alpha = 1;
    
    if (skipsound == 0)
        snd_play(snd_petrify);
    
    if (global.flag[55] != 0 && global.flag[56] != 0)
        returntoxy = 1;
    
    fresh = 2;
}

if (fresh == 1)
{
    image_alpha = 0;
    scr_lerpvar_instance(id, "image_alpha", 0, 1, 2);
    timer = 1;
    fresh = 2;
    
    if (depth < 1000)
        scr_depth_alt();
    
    if (skipsolid == 0)
        mysolid = scr_create_hitbox_solid();
}

if (global.fighting == 0 && fresh == 2)
{
    fresh = 3;
    
    if (returntoxy == 1)
    {
        fresh = 5;
        remx = global.flag[55];
        remy = global.flag[56];
        
        global.flag[55] = 0;
        global.flag[56] = 0;
        
        if (remx == 0)
            instance_destroy();
    }
}

if (fresh == 5)
{
    image_alpha -= 0.2;
    
    if (image_alpha < 0)
        fresh = 6;
}

if (fresh == 6)
{
    x = remx;
    y = remy;
    
    if (depth < 1000)
        scr_depth_alt();
    
    if (image_alpha < 1)
        image_alpha += 0.2;
}

draw_self();

if (timer < 1)
    timer += 0.05;

var t = (sprite_height / 2) - (timer * (sprite_height / 2));
gpu_set_fog(true, specialcolor, 0, 0);
yoffset = -(sprite_get_yoffset(sprite_index) * image_yscale);
xoffset = -(sprite_get_xoffset(sprite_index) * image_xscale);
draw_sprite_part_ext(sprite_index, image_index, 0, t, sprite_width, sprite_height - t, (x - 2) + xoffset, (y - 2) + (t * 2) + yoffset, image_xscale, image_yscale, c_blue, image_alpha * 0.8);
draw_sprite_part_ext(sprite_index, image_index, 0, t, sprite_width, sprite_height - t, x + 2 + xoffset, (y - 2) + (t * 2) + yoffset, image_xscale, image_yscale, c_blue, image_alpha * 0.4);
draw_sprite_part_ext(sprite_index, image_index, 0, t, sprite_width, sprite_height - t, (x - 2) + xoffset, y + 2 + (t * 2) + yoffset, image_xscale, image_yscale, c_blue, image_alpha * 0.4);
draw_sprite_part_ext(sprite_index, image_index, 0, t, sprite_width, sprite_height - t, x + 2 + xoffset, y + 2 + (t * 2) + yoffset, image_xscale, image_yscale, c_blue, image_alpha * 0.8);
gpu_set_fog(false, c_white, 0, 0);
gpu_set_blendmode(bm_add);
draw_sprite_part_ext(sprite_index, image_index, 0, t, sprite_width, sprite_height - t, x + xoffset, y + (t * 2) + yoffset, image_xscale, image_yscale, specialcolor, image_alpha * 0.4);
gpu_set_blendmode(bm_normal);

//if (room == room_dw_city_berdly)
//{
//    timer++;
//    
//    if (timer > 60)
//        image_alpha = lerp(image_alpha, 0, 0.1);
//    
//    if (image_alpha == 0)
//        instance_destroy();
//}
