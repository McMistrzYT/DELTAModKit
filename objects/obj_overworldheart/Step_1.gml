event_inherited()
if i_ex(owner) && sprite_index != owner.heartsprite {
	sprite_index = owner.heartsprite 
	switch sprite_index {
		default: mask_index = -1 break
		case spr_dodgeheart: mask_index = spr_dodgeheartmask break;
		case spr_heart_outline2: mask_index = spr_heart break;
	}
}