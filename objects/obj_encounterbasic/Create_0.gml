global.interact = 2;

if (global.flag[9] == 1)
    snd_volume(global.currentsong[1], 0, 20);

scr_encountersetup(global.encounterno);

count = -1;
for (i = 0; i < array_length(global.cinstance) + 1 && i < array_length(global.char); ++i) {
	var instance = obj_mainchara
	var cateri = i - 1
	if cateri >= 0 instance = global.cinstance[cateri]
	
	if !i_ex(instance) continue
	instance.visible = false
	instance.fun = false
	
	_sprite = instance.sprite_index
	_imagespeed = 0
	if variable_instance_exists(instance, "rsprite") _sprite = instance.rsprite
	
	scr_character_getbattleintro(global.char[i])
	
    c[i] = scr_dark_marker(instance.x, instance.y, _sprite);
	c[i].image_speed = _imagespeed
	count++
}

for (i = 0; i < (count + 1) && i < array_length(global.heromakex) && i < array_length(global.heromakey); i += 1){
    c[i].direction = point_direction(c[i].x, c[i].y, global.heromakex[i], global.heromakey[i]);
    c[i].speed = point_distance(c[i].x, c[i].y, global.heromakex[i], global.heromakey[i]) / 10;
    c[i].depth = 200 - (i * 20);
}

fightcon = 1;
counttimer = 0;
