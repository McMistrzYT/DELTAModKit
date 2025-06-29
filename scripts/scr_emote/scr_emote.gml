function scr_emote()
{
    __dmult = 1 + global.darkzone;
    __emotebubble = instance_create(x, y - 15, obj_excblcon);
    __emotebubble.alarm[0] = argument[1];
    __emotebubble.image_xscale = __dmult;
    __emotebubble.image_yscale = __dmult;
    __emotexoff = 0;
    __emoteyoff = 0;
    __anchorx = sprite_get_xoffset(sprite_index);
    
    if (argument[0] == "!")
    {
        __emotebubble.sprite_index = spr_exc;
        __emotebubble.y = y - (10 * __dmult);
        __emotexoff = 10 * __dmult;
    }
    
    if (argument[0] == "?")
    {
        __emotebubble.sprite_index = spr_emote_questionmark;
        __emotebubble.y = y - (10 * __dmult);
        __emotexoff = 10 * __dmult;
    }
    
    if (argument[0] == "...")
    {
        __emotebubble.sprite_index = spr_emote_ellipsis;
        __emotebubble.y = y - (10 * __dmult);
        __emotexoff = 10 * __dmult;
    }
    
    if (argument[0] == "note")
    {
        __emotebubble.sprite_index = spr_musblc;
        __emotebubble.y = y - (10 * __dmult);
        __emotexoff = 10 * __dmult;
    }
    
    if (argument_count >= 3)
        __emotexoff = argument[2];
    
    if (argument_count >= 4)
        __emoteyoff = argument[3];
    
    __emotebubble.y += __emoteyoff;
    
    if (image_xscale > 0)
        __emotebubble.x = (((x - (__anchorx * image_xscale)) + ((sprite_width / 2) * sign(image_xscale))) - (__emotebubble.sprite_width / 2)) + __emotexoff;
    else
        __emotebubble.x = ((x + (__anchorx * image_xscale)) - ((sprite_width / 2) * sign(image_xscale)) - (__emotebubble.sprite_width / 2)) + __emotexoff;
}
