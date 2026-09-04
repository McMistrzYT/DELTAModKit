con = -1
_trigger = noone

if (scr_flag_get(DRFLAG.SunState) == 0) {
	var sunset = scr_marker(0, 0, spr_schoollobby_sunsetoverlay)
	
	with (sunset)
	{
		image_alpha = 0.4
		depth = 2000
	}
	
	if (!snd_is_playing(global.currentsong[1])) {
		global.currentsong[0] = snd_init("mus_birdnoise.ogg")
		global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1)
	}
}

with obj_readable_room1 {
		
}


if (global.plot < 50)
{
	if (scr_litemcheck(19) == 1 && scr_flag_get(1467) == 0)
	{
		con = 0
		_trigger = instance_create(440, 360, obj_trigger)
		
		with (_trigger)
			image_xscale = 6
	}
}

var locker_readable = instance_create(50, 220, obj_readable_room1)
with (locker_readable) extflag = "dented_locker"

with obj_readable_room1 {
	USECUSTOMFUNC = true
	CUSTOM_TEXT = "%%";
	CUSTOM_FUNC = function() {	
		skip = 1
		mydialoguer = obj_room_schoollobby.show_convo(extflag, read)
		if mydialoguer > 0 && i_ex(mydialoguer) {
			_unfreeze = false
			debug_log("Starting School Lobby dialogue from [obj_room_schoollobby/show_convo]")
		} else {
		}
	}	
}
tempvar = 0

show_convo = function(extflag, read) {
	scr_speaker("no_name")
	switch extflag {	
		default: return false;
		case "locker_left": 
			if (tempvar == 0) msgset(0, "* The locker is locked./%", "obj_readable_room1_slash_Other_10_gml_335_0")		
			if (tempvar == 1) msgset(0, "* The locker's lock is locked./%", "obj_readable_room1_slash_Other_10_gml_336_0")		
			if (tempvar == 2) msgset(0, "* The lock's locker is locked./%", "obj_readable_room1_slash_Other_10_gml_337_0")		
			if (tempvar == 3) msgset(0, "* The locker's lock's locker is locked./%", "obj_readable_room1_slash_Other_10_gml_338_0")		
			if (tempvar >= 4) msgset(0, "* The locker is locked./%", "obj_readable_room1_slash_Other_10_gml_339_0")
			tempvar++
		break
		case "locker_jock":
			msgset(0, "* (The locker is covered in Jockington memorabilia.)/%", "obj_readable_room1_slash_Other_10_gml_344_0")
		break
		case "dented_locker":
			scr_speaker("no_name")
			msgset(0, "* (Lockers^1. They are dented.)/%", "obj_readable_room1_slash_Other_10_gml_246_0")
		
			if (scr_havechar(DRCharacter.Susie)) {
				if (read == 0) {
					scr_speaker("susie")
					msgset(0, "\\ED* ..^1. yeah^1, uh..^1. these lockers are kinda dented^1, huh./", "obj_readable_room1_slash_Other_10_gml_253_0_b")
					msgnext("\\EV* .../", "obj_readable_room1_slash_Other_10_gml_254_0")
					msgnext("\\ER* I don't think I ever said I.../", "obj_readable_room1_slash_Other_10_gml_255_0")
					msgnext("\\ES* Y'now^1, I was a goddamn idiot^1, and.../", "obj_readable_room1_slash_Other_10_gml_256_0")
					msgnext("\\EH* What^1? No^1, I'm not picking you up again^1, dumbass!/%", "obj_readable_room1_slash_Other_10_gml_257_0")
				} else {
					scr_speaker("susie")
					msgset(0, "\\EH* You're not picking me up either^1, idiot!/%", "obj_readable_room1_slash_Other_10_gml_261_0")
				}
			}
		break
		case "locker_kris":
			msgset(0, "* (It's your locker.^1)&* (It's empty.)/%", "obj_readable_room1_slash_Other_10_gml_400_0")
		break
		case "locker_asriel":
			msgset(0, "* (This used to be your brother's locker.)/%", "obj_readable_room1_slash_Other_10_gml_396_0")
		break
		case "locker_right":
			msgset(0, "* (Locker^1. It's locked.)/%", "obj_readable_room1_slash_Other_10_gml_390_0")
		break
		
		case "alphysdoor_class":
			scr_speaker("no_name")
			msgset(0, "* (You look through the frosted window.)/", "obj_readable_room1_slash_Other_10_gml_356_0")
			msgnext("* (A blurry yellow object is teaching a bunch of blurry bored-looking objects.)/%", "obj_readable_room1_slash_Other_10_gml_357_0")
		break
		
		case "fountain":
			if (read == 0) {
				scr_speaker("no_name")
				msgset(0, "* (Water fountain. You turned it on and blocked the stream with your finger.)/", "obj_readable_room1_slash_Other_10_gml_203_0")
				msgnext("* (The fountain was sealed...)/%", "obj_readable_room1_slash_Other_10_gml_204_0")
			} else {
				scr_speaker("no_name")
				msgset(0, "* (For some reason^1, you thought about showing this to Susie later.)/%", "obj_readable_room1_slash_Other_10_gml_208_0")
			
				if (scr_havechar("susie")) {
					scr_speaker("susie")
					msgset(0, "\\E9* Pfft^1, you sealing the fountain^1, idiot?/%", "obj_readable_room1_slash_Other_10_gml_213_0_b")
				}
			}
		break
		
		case "board_left":
			msgset(0, "* (The flyer is hard to read because the background is entirely soccerballs)/%", "obj_readable_room1_slash_Other_10_gml_187_0")
			if (read == 0) {
				msgset(0, "* (There's a flyer.)/", "obj_readable_room1_slash_Other_10_gml_182_0")
				msgnext("* (\"Today^1, is the Festival^1! Why the heck are you in^1? School!?\")/%", "obj_readable_room1_slash_Other_10_gml_183_0")
			}		
		break
		case "board_right":
			msgset(0, "* (It's a flyer encouraging you to vote Jockington as Festival King and Queen.)/", "obj_readable_room1_slash_Other_10_gml_221_0")
			msgnext("* (..^1. maybe^1. It's impossible to read as the background is all basketballs.)/%", "obj_readable_room1_slash_Other_10_gml_222_0")		
		break
	}
	return d_make()
}
/*
if (room == room_schoollobby)
{
	if (scr_flag_get(DRFLAG.SunState) == 3) skip = 1
	
	if (x >= 140 && x < 240) {
		scr_speaker("no_name")
		
		if (tempvar == 0) global.msg[0] = stringsetloc("* The locker is locked./%", "obj_readable_room1_slash_Other_10_gml_335_0")		
		if (tempvar == 1) global.msg[0] = stringsetloc("* The locker's lock is locked./%", "obj_readable_room1_slash_Other_10_gml_336_0")		
		if (tempvar == 2) global.msg[0] = stringsetloc("* The lock's locker is locked./%", "obj_readable_room1_slash_Other_10_gml_337_0")		
		if (tempvar == 3) global.msg[0] = stringsetloc("* The locker's lock's locker is locked./%", "obj_readable_room1_slash_Other_10_gml_338_0")		
		if (tempvar >= 4) global.msg[0] = stringsetloc("* The locker is locked./%", "obj_readable_room1_slash_Other_10_gml_339_0")
		
		with (obj_readable_room1) tempvar += 1
	}
	
	if (x == 240)
	{
		scr_speaker("no_name")
		global.msg[0] = stringsetloc("* (The locker is covered in Jockington memorabilia.)/%", "obj_readable_room1_slash_Other_10_gml_344_0")
	}
	
	if (x >= 280)
	{
		if (read == 0)
		{
			scr_speaker("no_name")
			msgsetloc(0, "* (There's a flyer.)/", "obj_readable_room1_slash_Other_10_gml_182_0")
			msgnextloc("* (\"Today^1, is the Festival^1! Why the heck are you in^1? School!?\")/%", "obj_readable_room1_slash_Other_10_gml_183_0")
		}
		else
		{
			scr_speaker("no_name")
			msgsetloc(0, "* (The flyer is hard to read because the background is entirely soccerballs)/%", "obj_readable_room1_slash_Other_10_gml_187_0")
		}
	}
	
	if (x < 140)
	{
		scr_speaker("no_name")
		global.msg[0] = stringsetloc("* (You look through the frosted window.)/", "obj_readable_room1_slash_Other_10_gml_356_0")
		global.msg[1] = stringsetloc("* (A blurry yellow object is teaching a bunch of blurry bored-looking objects.)/%", "obj_readable_room1_slash_Other_10_gml_357_0")
	}
	
	if (x >= 520) {
		if (read == 0) {
			scr_speaker("no_name")
			msgsetloc(0, "* (Water fountain. You turned it on and blocked the stream with your finger.)/", "obj_readable_room1_slash_Other_10_gml_203_0")
			msgnextloc("* (The fountain was sealed...)/%", "obj_readable_room1_slash_Other_10_gml_204_0")
		} else {
			scr_speaker("no_name")
			msgsetloc(0, "* (For some reason^1, you thought about showing this to Susie later.)/%", "obj_readable_room1_slash_Other_10_gml_208_0")
			
			if (scr_havechar("susie")) {
				scr_speaker("susie")
				msgsetloc(0, "\\E9* Pfft^1, you sealing the fountain^1, idiot?/%", "obj_readable_room1_slash_Other_10_gml_213_0_b")
			}
		}
	}
	
	if (x >= 560) {
		scr_speaker("no_name")
		msgsetloc(0, "* (It's a flyer encouraging you to vote Jockington as Festival King and Queen.)/", "obj_readable_room1_slash_Other_10_gml_221_0")
		msgnextloc("* (..^1. maybe^1. It's impossible to read as the background is all basketballs.)/%", "obj_readable_room1_slash_Other_10_gml_222_0")
	}
	
	if (extflag == "") {
		scr_speaker("no_name")
		global.msg[0] = stringsetloc("* (Locker^1. It's locked.)/%", "obj_readable_room1_slash_Other_10_gml_390_0")
	}
	
	if (x == 760) {
		scr_speaker("no_name")
		global.msg[0] = stringsetloc("* (This used to be your brother's locker.)/%", "obj_readable_room1_slash_Other_10_gml_396_0")
	}
	
	if (x == 780) {
		scr_speaker("no_name")
		global.msg[0] = stringsetloc("* (It's your locker.^1)&* (It's empty.)/%", "obj_readable_room1_slash_Other_10_gml_400_0")
	}
	
	if (extflag == "dented_locker") {
		scr_speaker("no_name")
		msgsetloc(0, "* (Lockers^1. They are dented.)/%", "obj_readable_room1_slash_Other_10_gml_246_0")
		
		if (scr_havechar("susie"))
		{
			if (read == 0)
			{
				scr_speaker("susie")
				msgsetloc(0, "\\ED* ..^1. yeah^1, uh..^1. these lockers are kinda dented^1, huh./", "obj_readable_room1_slash_Other_10_gml_253_0_b")
				msgnextloc("\\EV* .../", "obj_readable_room1_slash_Other_10_gml_254_0")
				msgnextloc("\\ER* I don't think I ever said I.../", "obj_readable_room1_slash_Other_10_gml_255_0")
				msgnextloc("\\ES* Y'now^1, I was a goddamn idiot^1, and.../", "obj_readable_room1_slash_Other_10_gml_256_0")
				msgnextloc("\\EH* What^1? No^1, I'm not picking you up again^1, dumbass!/%", "obj_readable_room1_slash_Other_10_gml_257_0")
			}
			else
			{
				scr_speaker("susie")
				msgsetloc(0, "\\EH* You're not picking me up either^1, idiot!/%", "obj_readable_room1_slash_Other_10_gml_261_0")
			}
		}
	}
}
*/