timer++

if (timer >= delay){
	if (init == 0){
		if (global.plot >= plot && global.plot < highplot){
			if (!snd_is_playing(global.currentsong[1]))
			{
				global.currentsong[0] = snd_init(song)
				global.currentsong[1] = mus_loop_ext(global.currentsong[0], volume, pitch)
				
				if (fadein != -1)
				{
					snd_volume(global.currentsong[1], 0, 0)
					snd_volume(global.currentsong[1], volume, fadein)
				}
			}
		} else {
			debug_log("Plot is ({0}), which is not good enough for instance ('{1}', Music '{2}') to play.", global.plot, id, song)	
		}
		
		init = 1
		instance_destroy()
	}
}
