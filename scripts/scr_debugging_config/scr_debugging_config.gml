function scr_debug() { return true; }
function scr_debug_get_start_room() { global.darkzone = true; return keyboard_check_direct(vk_anykey) ? PLACE_MENU : room_dw_test; }