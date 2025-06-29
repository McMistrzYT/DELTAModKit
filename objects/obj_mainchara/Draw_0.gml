if (swordmode == 0)
    draw_self();

if (button1_p() && scr_debug())
{
    draw_set_color(c_red);
    
    if (global.darkzone == 0)
    {
        if (global.facing == 1)
            draw_rectangle(x + (sprite_width / 2), y + 6 + (sprite_height / 2), x + sprite_width + 13, y + sprite_height, true);
        
        if (global.facing == 3)
            draw_rectangle(x + (sprite_width / 2), y + 6 + (sprite_height / 2), x - 13, y + sprite_height, true);
        
        if (global.facing == 0)
            draw_rectangle(x + 4, y + 28, (x + sprite_width) - 4, y + sprite_height + 15, true);
        
        if (global.facing == 2)
            draw_rectangle(x + 3, (y + sprite_height) - 5, (x + sprite_width) - 5, y + 5, true);
    }
    
    if (global.darkzone == 1)
    {
        if (global.facing == 1)
            draw_rectangle(x + (sprite_width / 2), y + 12 + (sprite_height / 2), x + sprite_width + 26, y + sprite_height, true);
        
        if (global.facing == 3)
            draw_rectangle(x + (sprite_width / 2), y + 12 + (sprite_height / 2), x - 26, y + sprite_height, true);
        
        if (global.facing == 0)
            draw_rectangle(x + 4, y + 56, (x + sprite_width) - 8, y + sprite_height + 30, true);
        
        if (global.facing == 2)
            draw_rectangle(x + 3, (y + sprite_height) - 10, (x + sprite_width) - 10, y + 10, true);
    }
    
    draw_set_color(c_white);
}

if (battlemode == 1)
{
    becamebattle = 1;
    
    if (battlealpha < 0.8 && drawbattlemode)
        battlealpha += 0.04;
    
    global.heartx = (x + 12) - camerax();
    global.hearty = (y + 40) - cameray();
}
else if (battlealpha > 0)
{
    battlealpha -= 0.08;
}

battleheart.image_alpha = battlealpha;

if (swordmode == 0)
{
    if (fun == 0)
    {
        if (global.facing == 0)
            draw_sprite_ext(spr_krisd_heart, image_index, x, y, image_xscale, image_yscale, 0, image_blend, battlealpha);
        
        if (global.facing == 1)
            draw_sprite_ext(spr_krisr_heart, image_index, x, y, image_xscale, image_yscale, 0, image_blend, battlealpha);
        
        if (global.facing == 2)
            draw_sprite_ext(spr_krisu_heart, image_index, x, y, image_xscale, image_yscale, 0, image_blend, battlealpha);
        
        if (global.facing == 3)
            draw_sprite_ext(spr_krisl_heart, image_index, x, y, image_xscale, image_yscale, 0, image_blend, battlealpha);
    }
    //else if (sprite_index == spr_krisd_slide)
    //{
    //    draw_sprite_ext(spr_krisd_slide_heart, image_index, x, y, image_xscale, image_yscale, 0, image_blend, battlealpha);
    //}
    else if (global.chapter == 3)
    {
    }
    else
    {
        //scr_draw_battle_outline(255, battlealpha);
    }
}

draw_sprite_ext(spr_heart_outline2, 0, x + 12, y + 40, 1, 1, 0, c_white, battlealpha * 2);
battleheart.x = x + 12;
battleheart.y = y + 40;

if (battlemode == 4)
{
    draw_set_color(c_lime);
    draw_set_alpha(0.5);
    draw_rectangle(x + 12, y + 40, x + 27, y + 49, 0);
    draw_line(x + 12, y + 49, x + 19, y + 57);
    draw_line(x + 26, y + 49, x + 19, y + 57);
    draw_set_alpha(1);
}

if (swordmode == 1)
{
    if (swordfacing == 1)
        draw_sprite_ext(swordsprite, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    
    if (swordfacing == -1)
        draw_sprite_ext(swordsprite, image_index, x + sprite_width, y, -image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

if (scr_debug())
{
    if (keyboard_check(vk_control) && keyboard_check(vk_alt) && keyboard_check_pressed(ord("I")))
        drawdebug = !drawdebug;
    
    if (drawdebug)
    {
        draw_set_color(c_white);
        draw_set_font(global.main_font);
        draw_text_outline(x + sprite_width, y, "floorheight=" + string(floorheight), 0);
    }
}
