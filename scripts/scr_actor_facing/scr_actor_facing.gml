function scr_actor_facing(arg0, arg1)
{
    __newfacing = arg1;
    arg0.facing = __newfacing;
    
    if (__newfacing == "d")
        arg0.sprite_index = arg0.dsprite;
    
    if (__newfacing == "r")
        arg0.sprite_index = arg0.rsprite;
    
    if (__newfacing == "l")
        arg0.sprite_index = arg0.lsprite;
    
    if (__newfacing == "u")
        arg0.sprite_index = arg0.usprite;
}
