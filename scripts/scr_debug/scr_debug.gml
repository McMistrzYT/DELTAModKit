function scr_debug(){
	return true;
}

function scr_debug_keycheck(key)
{
    return scr_debug() && keyboard_check_pressed(key);
}
