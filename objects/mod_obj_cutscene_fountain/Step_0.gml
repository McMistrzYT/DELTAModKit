if con == 0 && obj_mainchara.x < x {
	con = 2;
	
	scr_cutscene_make();
	scr_maincharacters_actors();
	
	c_pannable(true);
	c_panobj(mod_obj_marker_k, 35);
	
	c_sel(kr);
		c_walktoobject(mod_obj_marker_a, 0, 0, 35);
		
	c_sel(su);
		c_walktoobject(mod_obj_marker_b, 0, 0, 35);
		
	c_wait(35);
	
	c_sel(kr); c_facing("d");
	c_sel(su); c_facing("l");
	
	c_wait(10);
	
	c_speaker("susie");
	c_msgset(0, "* Kris, do your thing./%");
	
	c_talk_wait();
	
	c_panobj(mod_obj_marker_a, 35);
	c_wait(40);
	
	fountain = instance_create(mod_obj_marker_a.x - 6, mod_obj_marker_a.y - 22, obj_make_fountain);
	c_sel(kr);
	c_visible(false);
	c_var_instance(fountain, "active", true);
	c_var_instance(fountain, "ceilheight", 300);
	
	c_wait_if(fountain, "ceiltimer", ">=", 700);
	c_var_instance(id, "go_to_dark_world", true);
}

if go_to_dark_world && con != 3 {
	con = 3;
	c_actortokris();
	c_actortocaterpillar();
	c_terminatekillactors();
	
	//trans = instance_create(mod_obj_marker_a.x, mod_obj_marker_a.y, obj_dw_transition);
	//trans.nextroom = room_dw_test;
	
	scr_become_dark();
	instance_create(0, 0, obj_persistentfadein);
	room_goto(room_dw_test);
}