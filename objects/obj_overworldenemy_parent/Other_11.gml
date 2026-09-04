// Unused in Normal Play as SwordMode is unused in Chapter 2.
if (washit == 0) {
	washit = 1
	anim = instance_create(x, y, obj_animation)
	anim.sprite_index = spr_realisticexplosion
	event_user(0)
}