if con == 0 && obj_mainchara.x < x {
	getsStarwalker = !scr_havechar(DRCharacter.Starwalker);
	con = 2;
	
	scr_cutscene_make();
	scr_maincharacters_actors();
	
	star = 0;
	star_actor = getsStarwalker ?
		instance_create(mod_obj_marker_z.x, mod_obj_marker_z.y, obj_actor) :
		instance_create(obj_caterpillarchara.x, obj_caterpillarchara.y, obj_actor);
		
	scr_character_set_caterpillar_sprites(DRCharacter.Starwalker)
	star_actor.sprite_index = rsprite;
	star_actor.auto_walk = false;
	star_actor.auto_facing = false;
	
	scr_actor_setup_nofacing(star, star_actor, "starwalker");
	
	c_pannable(true);
	c_panobj(mod_obj_marker_k, 35);
	
	c_sel(kr);
		c_walktoobject(mod_obj_marker_a, 0, 0, 35);
		
	c_sel(star);
		c_walktoobject(mod_obj_marker_b, 0, 0, 35);
		
	c_wait(35);
	
	if (i_ex(obj_caterpillarchara))
    {
        with (obj_caterpillarchara)
            instance_destroy();
    }
	
	if getsStarwalker {
		scr_losechar();
		scr_getchar(DRCharacter.Starwalker);
		
		var starcat = scr_makecaterpillar(obj_mainchara.x + 40, cameray() - 100, DRCharacter.Starwalker, 0);
		starcat.visible = false;
	} else {
		scr_losechar();
		scr_getchar(DRCharacter.Susie);
		scr_getchar(DRCharacter.Ralsei);
		
		var suscat = scr_makecaterpillar(obj_mainchara.x + 40, cameray() - 100, DRCharacter.Susie, 1);
		suscat.visible = false;
		var ralcat = scr_makecaterpillar(obj_mainchara.x + 80, cameray() - 100, DRCharacter.Ralsei, 2);
		ralcat.visible = false;
	}
	
	c_sel(su);
	c_walktoobject(mod_obj_marker_c, 0, 0, 35);
			
	c_sel(ra);
	c_walktoobject(mod_obj_marker_d, 0, 0, 35);
	
	c_wait(35);
	
	if getsStarwalker {
		c_sel(su); c_facing("r");
		c_sel(ra); c_facing("r");
	
		c_wait(20);
		c_sel(su); c_walk("l", 20, 30);
		c_sel(ra); c_walk("l", 20, 30);
	} else {
		c_wait(20);
		c_sel(star); c_walk("l", 20, 30);
	}
	
	c_wait(30);
	
	c_panobj(kr_actor, 15);
	c_wait(16);
	c_pannable(false);
	
	c_sel(kr);
	c_facing("d");
	
	c_actortokris();
	c_actortocaterpillar();
	c_terminatekillactors();
}

if con == 2 && obj_mainchara.x > x + 10 {
	con = 0;
}