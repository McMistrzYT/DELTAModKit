if con == 0 && place_meeting(x, y, obj_mainchara) {
	con = 1
	global.interact = 1
	
	cutscenemaster = scr_cutscene_make()
	scr_maincharacters_actors(["kris"])
	
	star = 10
	scr_actor_quick_setup(findspriteinfo(spr_npc_originalstarwalker), star, "starwalker")
	
	var marker_walkto = findspriteinfo(spr_krisd_dark, "DEBUG_ASSETS", #00FFFF)
	var marker_landat = findspriteinfo(spr_krisd_dark, "DEBUG_ASSETS", #5C7AFF)
	var marker_landexit = findspriteinfo(spr_krisd_dark, "DEBUG_ASSETS", c_red)
	var marker_camera = findspriteinfo(spr_debug_cameraregionpreview, "DEBUG_ASSETS", #FF7F7F)
	var marker_walk2posslip = findspriteinfo(spr_krisr_dark, "DEBUG_ASSETS", #5400FF)
	var marker_cateystart = findspriteinfo(spr_krisr, "DEBUG_ASSETS", #663082)
	
	var originalcam = new Vector2(camerax(), cameray())
	c_sel(kr)
	c_walkdirect_wait(marker_walkto.x, marker_walkto.y, point_distance(kr_actor.x, kr_actor.y, marker_walkto.x, marker_walkto.y) / 4)
	c_facing("d")
	c_wait(12)
	c_debugprint("Mike, Play the Music!")
	c_mus2("initloop", "cybercity_old.ogg")
	
	// Go To The Unreachable Spot
	c_facing("r")
	c_wait(15)
	
	c_pannable(true)
	c_pan(marker_camera.x, marker_camera.y, 55)
	c_soundplay(snd_jump)
	c_jump_sprite(marker_landat.x, marker_landat.y, 20, 60, spr_kris_fall_ball, spr_kris_dw_landed)
	c_wait(59)
	c_soundplay(snd_wing)
	
	// Whatever stuff
	c_sel(star)
	c_autowalk(false)
	c_wait(5)
	c_walk_wait("d", 5, 20)
	c_sel(kr)
	c_facing("u")
	c_shakeobj()
	c_sel(star)
	c_soundplay(snd_sparkle_gem)
	c_speaker("none")
	c_msgset(0, "\\S0* The Test\n\n             \\cYStarwalker\\cW./%")
	c_talk_wait()
	c_soundplay(snd_jump)
	c_jump_sprite(0, room_height, 30, 120, spr_npc_originalstarwalker, spr_npc_originalstarwalker)
	c_wait(5)	
	
	for (var i = 1; i < 3; i++) {
		if global.char[i] >= DRCharacter.None {
			c_sel(i + 1)
			c_setxy(marker_cateystart.x, marker_cateystart.y + (i * 40))
			c_facing("r")
		}
	}	
	
	c_sel(kr)
	
	c_customfunc(function(){
		if times == 0 {
			with npc_theonlyonewhoreadthesign {
				y += 100000
			}
		}
	})
	
	// Leave
	c_facing("l")
	c_wait(10)
	c_panobj(marker_landexit, 25)
	//c_pan(originalcam.x, originalcam.y, 25)
	
	
	c_soundplay(snd_jump)
	c_jump_sprite(marker_landexit.x, marker_landexit.y, 20, 30, spr_kris_fall_ball, 0)
	c_wait(10)
	c_sprite(spr_kris_fell)
	c_shake()
	c_flip("h")
	
	// Smash against the Ground as Hard as Possible or Not work with the Knight, your Choice Kris.
	c_wait(27)
	c_debugprint("Mike, Kill the Music! Kris just broke their Bones!!")
	c_mus("free")
	c_shake()
	
	c_soundplay(snd_impact)
	c_soundplay(snd_hurt1)
	c_customfunc(function(){ // Doing this stuff Manually so that it doesn't attempt to Retarget to someone else, not even paying attention to the Party.
		var damageamt = irandom_range(10, global.maxhp[DRCharacter.Kris] / 3)
		var hp = global.hp[DRCharacter.Kris]
		global.hp[DRCharacter.Kris] = max(global.hp[DRCharacter.Kris] - damageamt, 1)
		
		dmgwriter = instance_create(kr_actor.x, kr_actor.y, obj_dmgwriter)
        dmgwriter.damage = abs(hp - global.hp[DRCharacter.Kris]);
        dmgwriter.type = -1;
		times++
	})
	c_var_instance(kr_actor, "friction", 0.25)
	c_var_instance(kr_actor, "hspeed", -10)
	c_autowalk(0)
	c_wait(30)
	c_flip("h")
	c_shakeobj()
	c_facing("r")
	c_wait(10)
	c_var_instance(kr_actor, "friction", 0)
	c_facing("r")
	c_autowalk(1)
	c_wait(5)
	c_walkdirect_wait(marker_walk2posslip.x, marker_walk2posslip.y, 40)
	c_panobj(kr_actor, 10)
	c_facing("d")
	
	c_wait(20)
	c_actortokris()
	c_actortocaterpillar() // Goes AFTER kris so they don't go towards the old position
	c_pannable(false)
	c_terminatekillactors()
}

if con == 1 && !i_ex(cutscenemaster) {
	global.interact = 0
	con = 2
}
if con == 2 && !place_meeting(x, y, obj_mainchara) con = 0