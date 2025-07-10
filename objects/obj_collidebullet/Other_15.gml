if active {
	if target == 3 scr_damage_all();
	else scr_damage();
	
	if destroyonhit
		instance_destroy();
}