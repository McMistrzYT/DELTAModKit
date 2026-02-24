if i_ex(obj_mainchara) && variable_instance_exists(obj_mainchara, "dsprite") && !spawnedfollowers {
	spawnedfollowers = true
	scr_overworldcontrollers_spawncharacters(true)
}