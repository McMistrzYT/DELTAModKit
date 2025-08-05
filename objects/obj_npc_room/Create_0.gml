extflag = "none";

event_inherited();

init = 0;
talked = 0;
tempvar = 0;
depthcancel = 0;
normalanim = 1;
remanimspeed = 0;
flag = 0;
alwaysanimate = false;
jpspecial = 0;
skip = 0;

scr_npc_config();

USECUSTOMFUNC = false
CUSTOM_FUNC = function() {}
TALKSPRITE = true
if (depthcancel == 0)
    scr_depth();
	
if CUSTOM
{
	if CUSTOM_IMAGESPEED != -1
	{
		TALKSPRITE = false;
		normalanim = false;
		image_speed = CUSTOM_IMAGESPEED;
	}
	sprite_index = CUSTOM_SPRITE;

	if !is_array(CUSTOM_TEXT)
	{
		if is_string(CUSTOM_TEXT)
		{
            var _method = noone
            if asset_get_index("scr_getmethodbykey") > 0  // Just incase if the methodkey system is missing.
			    _method = scr_getmethodbykey(CUSTOM_TEXT);
			if _method != noone
			{
				USECUSTOMFUNC = true;
				CUSTOM_FUNC = _method;
			}
			else
			{
				CUSTOM_TEXT = [string(CUSTOM_TEXT)];
			}
		}
		else
		{
			CUSTOM_TEXT = ["* The gash weaves down as if you cry./%"];
		}
	}

}
