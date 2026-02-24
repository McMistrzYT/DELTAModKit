enum DRBulletPattern {
	HomingDiamonds = 0,
	RisingDiamonds = 1,
	SwordThrow = 2, // in vanilla deltarune, this attack has the value of 3, but i dont care
}

function scr_bullet_pattern(bulletPatternId) {
	// btimer = bullet timer, increases every frame by 1
	// timermax
	// ratio = the ratio by which bullet timer stuff should be multiplied (increases with every enemy)
	
	switch (bulletPatternId) {
		case DRBulletPattern.HomingDiamonds: {
			if btimer < timermax * ratio break;
			
			btimer = 0;
			radius = 140 + random(80);
			var dir = 30 + random(120);
			
			var xx = lengthdir_x(radius, dir);
			var yy = lengthdir_y(radius, dir);
			
			// bullet maker, check out obj_dbullet_maker which you can use as a base
			if i_ex(obj_heart) {
				bm = instance_create(obj_heart.x + 8 + xx, obj_heart.y + 8 + yy, obj_dbullet_maker);
				scr_bullet_inherit(bm)
			
				if bm.y < cameray() + 40
					bm.y = cameray() + 40;
			}
			break;
		}
		
		case DRBulletPattern.RisingDiamonds: {
			if btimer < 9 * ratio break;
			
			btimer = 0;
			radius = 140 + random(40);
			var yy = radius * side;
			var xx = -100 + random(200);
			
			if choose(0, 1, 2, 3) == 3 xx = -10 + random(20);
			
			if i_ex(obj_heart) {
				d = instance_create(obj_heart.x + 8 + xx, obj_heart.y + 8 + yy, obj_dbullet_vert);
				scr_bullet_inherit(d)
			}
			break;
		}
		
		case DRBulletPattern.SwordThrow: {
			if !made break;
			made = true;
			
			if !i_ex(creatorid) break;
			with (creatorid) image_alpha = 0;
			
			var slasher = instance_create(creatorid.x, creatorid.y, obj_dknight_slasher);
			
			// inherit dbulletcontroller data
			scr_bullet_inherit(slasher);
			
			slasher.timepoints = 2;
			slasher.grazepoints = 6;
			break;
		}
	}
}