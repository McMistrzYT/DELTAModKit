if (bon == 0 && obj_mainchara.x >= (x - 100) && global.interact == 0)
	bon = 1

if (con == 0 && obj_mainchara.x >= x && global.interact == 0)
{
	con = 1
	global.interact = 1
}

if (con == 1){
	con = 2
	cutscene_master = scr_cutscene_make()
	kr = 0
	kr_actor = instance_create(obj_mainchara.x, obj_mainchara.y, obj_actor)
	scr_actor_setup(kr, kr_actor, "kris")
	kr_actor.sprite_index = spr_krisr_dark
	
	with (obj_mainchara) visible = 0
	
	su = 1
	su_actor = instance_create(obj_mainchara.x + 300, obj_mainchara.y, obj_actor)
	scr_actor_setup(su, su_actor, "susie")
	su_actor.sprite_index = spr_susiel_dark
	su_actor.specialsprite[6] = spr_susie_shock_r
	
	with (kr_actor) scr_emote("!", 30)
	
	c_sel(su)
	c_speaker("susie")
	c_msgsetloc(0, "* Pee pee town./", "obj_example_cutscene_slash_Step_0_gml_34_0")
	c_msgnextloc(" * Box 1/", "obj_example_cutscene_slash_Step_0_gml_35_0")
	c_msgnextloc(" * Box 2/", "obj_example_cutscene_slash_Step_0_gml_36_0_b")
	c_msgnextloc(" * Box 3/", "obj_example_cutscene_slash_Step_0_gml_37_0")
	c_facenext("ralsei", 0)
	c_msgnextloc("* Funny./%", "obj_example_cutscene_slash_Step_0_gml_36_0")
	c_talk()
	c_sel(kr)
	c_wait_box(1)
	c_facing("d")
	c_emote("!", 30)
	c_script_instance(kr_actor, scr_afterimage, 3)
	c_var_lerp_instance(kr_actor, "x", kr_actor.x, camerax() + 100, 30, 1)
	c_wait_box(2)
	c_script_instance_stop(kr_actor, scr_afterimage)
	c_facing("l")
	c_var_lerp_instance(kr_actor, "x", kr_actor.x, camerax() + 100, 30, 2, "out")
	c_wait_box(3)
	c_facing("u")
	c_var_lerp_instance(kr_actor, "x", kr_actor.x, camerax() + 100, 30, 3, "in")
	c_wait_talk()
	c_facing("r")
	c_emote("!", 30, 0)
	c_sel(kr)
	c_script_instance(id, snd_play_pitch, 25, 160, 0.5 + random(1.2))
	c_shakestep_x(15, -4, 15, 25, 5, 1)
	c_wait(150)
	c_script_instance_stop(id, snd_play_pitch)
	c_shakestep(-15, 0)
	c_wait(30)
	c_flip("y")
	c_pannable(1)
	c_panspeed_wait(2.9, 0, 80)
	c_sel(1)
	c_var_lerp("image_angle", "init", 180, 30)
	c_walkdirect_wait(968, 182, 70)
	c_var("image_angle", 0)
	c_var_lerp("image_xscale", "init", 4, 30)
	c_wait(30)
	c_speaker("susie")
	c_speaker("susie")
	c_msgsetloc(0, "\\E3* ..^1. Man^1, it got late^1, didn't it...?/%", "obj_example_cutscene_slash_Step_0_gml_55_0")
	c_talk_wait()
	c_var_instance(id, "honkcon", 1)
	c_speaker("susie")
	c_msgsetloc(0, "\\E0* Well. Guess you should go home^1, huh?/%", "obj_example_cutscene_slash_Step_0_gml_60_0")
	c_talk_wait()
	c_speaker("susie")
	c_msgsetloc(0, "\\EQ* Alright^1, you don't have to say it./%", "obj_example_cutscene_slash_Step_0_gml_64_0")
	c_talk_wait()
	c_speaker("susie")
	c_msgsetloc(0, "\\E2* Don't wanna walk home by yourself^1, huh?/%", "obj_example_cutscene_slash_Step_0_gml_68_0")
	c_talk_wait()
	c_speaker("susie")
	c_msgsetloc(0, "\\EQ* Well^1, if you're gonna MAKE me^1, I guess.../%", "obj_example_cutscene_slash_Step_0_gml_72_0")
	c_talk_wait()
	c_speaker("susie")
	c_msgsetloc(0, "\\E9* Let's go./%", "obj_example_cutscene_slash_Step_0_gml_76_0")
	c_talk_wait()
	c_fadeout_color(4, c_white)
	c_wait(5)
	c_specialsprite(5)
	c_wait(1)
	c_fadein(4)
	c_wait(30)
	c_walk_wait("r", 4, 43.75)
	c_sel(0)
	c_walk_wait("r", 4, 39.25)
	c_wait(30)
	c_sel(1)
	c_specialsprite(3)
	c_wait(30)
	c_specialsprite(0)
	c_wait(30)
	c_specialsprite(1)
	c_wait(30)
	c_msgsetloc(0, "* I'm going home/%", "obj_example_cutscene_slash_Step_0_gml_95_0")
	c_talk_wait()
	c_walkdirect_wait(1446, 142, 50)
	c_sel(0)
	c_specialsprite(0)
	c_panobj(kr_actor, 30)
	c_wait(30)
	c_pannable(0)
	c_actortokris()
}

if (con == 2)
{
	if (!instance_exists(obj_cutscene_master))
	{
		con = 3
		global.interact = 0
	}
}

if (honkcon == 1)
{
	honkcount++
	
	if (honkcount >= 30)
		honkcon = 2
	else
		snd_play(snd_cantselect)
	
	with (su_actor)
		scr_flip(choose("x", "y"))
}
