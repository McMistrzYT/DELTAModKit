function scr_enable_screen_border(enable)
{
    enable = enable != 0; // this is pointless
    
    if (enable != global.screen_border_active)
    {
        global.screen_border_active = enable != 0;
        global.screen_border_state = 0;
        global.screen_border_dynamic_fade_id = 0;
        global.screen_border_dynamic_fade_level = 0;
    }
}
