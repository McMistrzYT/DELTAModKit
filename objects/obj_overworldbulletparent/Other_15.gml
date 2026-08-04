if (active == 1){
	snd_stop(snd_hurt1)
	snd_play(snd_hurt1)
	
	if (target != 3) scr_damage()	
	if (target == 3) scr_damage_all_overworld()
	
	with (obj_darkcontroller)
		charcon = 1
	
	global.interact = 1
	
	with (obj_mainchara)	  alarm[1] = 7	
	//with (obj_mainchara_dash) alarm[11] = 7
	
	hit = 1
}
