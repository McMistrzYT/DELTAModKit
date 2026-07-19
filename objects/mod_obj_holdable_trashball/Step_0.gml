if held {
	if scr_flag_get(DRFLAG.HeldOverworldItemId_ForceStart) == DROverworldItem.None scr_flag_set(DRFLAG.HeldOverworldItemId_ForceStart, DROverworldItem.trashballCh2)
	
	if i_ex(obj_testoverworldenemy) && destroyed == 0 {
		snd_play(snd_bageldefeat)
		repeat (30) {
			var anim = scr_marker(x, y, spr_sparestar_anim)
			anim.gravity = -0.1*scale
			anim.friction = 0.05/scale
			scr_darksize(anim)
			anim.hspeed = random_range(-1.5*scale, 1.5*scale)
			anim.vspeed = random_range(1.5*scale, -3*scale)
			anim.image_speed = 0.5
			scr_depth(anim)
			scr_doom(anim, 90)
		}
		event_user(1)
		visible = false
		destroyed = 1
		x = -9999
		y = -9999
	}
}

if destroyed == 1 && global.interact == 0 {
	destroyed = 2
	global.interact = 1
	scr_speaker("none")
	msgset(0, "* (^1.^1.^1. the trashball was destroyed in the heat of the battle.)/%")
	mydialoguer = instance_create(0, 0, obj_dialoguer)
}
if destroyed == 2 && !d_ex() {
	global.interact = 0
	instance_destroy()
}