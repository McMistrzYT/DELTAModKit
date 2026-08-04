if (scr_flag_get(1324) == 0) {
	var sunset = scr_marker(0, 0, spr_doorarea_sunsetoverlay)
	
	with (sunset) {
		image_alpha = 0.4
		depth = 2000
	}
	
	if (!snd_is_playing(global.currentsong[1])) {
		global.currentsong[0] = snd_init("mus_birdnoise.ogg")
		global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1)
	}
}