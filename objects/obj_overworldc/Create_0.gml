buffer = 0;
saved = 0;
selnoise = 0;
movenoise = 0;
depth = 10;
threebuffer = 0;
hasitems = false;

if (global.chapter >= 2)
{
	// light world characters
	var skippedchars = 1;
	for (pipis = 1; pipis < 3; pipis++) {
		if global.char[pipis] == DRCharacter.None { skippedchars++; continue; }
		if !scr_character_is_lightner(global.char[pipis]) { skippedchars++; continue; }
		
		global.cinstance[pipis - skippedchars] = instance_create(obj_mainchara.x - 3, obj_mainchara.y - 6, obj_caterpillarchara);
		with (global.cinstance[pipis - skippedchars])
			scr_character_set_caterpillar_sprites(global.char[other.pipis]);
	}
}
