if (encounterflag > 0 && init == 0)
{
	if (global.flag[encounterflag] == 1)
		instance_destroy()
	
	if (global.flag[encounterflag] == 6)
	{
		if (frozensprite == 0) frozensprite = touchsprite
		
		frozennpc = instance_create(x, y, obj_frozennpc)
		frozennpc.sprite_index = frozensprite
		frozennpc.fresh = 1
		instance_destroy()
	}
	
	init = 1
}

if (autodepth == 1)	scr_depth_alt()

targetx = (obj_mainchara.x + (obj_mainchara.sprite_width / 2)) + (sprite_xoffset) - (sprite_width / 2)
targety = (obj_mainchara.bbox_bottom - sprite_height) + (sprite_yoffset)

if (global.interact == 0 || global.interact == 4)
	frozen = 0

if (scr_outside_camera(200) && offscreen_frozen == 1)
	frozen = 1
else
	frozen = 0

if (global.interact != 0 && global.interact != 4)
	frozen = 1

if (frozen == 1 && ignorefreeze == 0)
{
	if (hadfrozen == 0)
	{
		remspeed = speed
		speed = 0
		hadfrozen = 1
	}
}

if (frozen == 0) {
	if (hadfrozen == 1) {
		if (speed == 0)
			speed = remspeed
		
		hadfrozen = 0
	}
	
	if (pacecon == 0) {
		pacetimer += 1
		
		scr_chaseenemy_pacetype(pacetype)
		
		if (pacetype == 9)
		{
			if (float != 0)
				y = yy - (sin(pacetimer / 5) * float)
			
			hspeed = sin(pacetimer / (pacespeed * 30)) * (moveradius / 20)
			pacespeed = 0.8
		}
		
		if (pacetype == 9.5)
		{
			if (float != 0)
				y = yy - sin(pacetimer / float)
			
			hspeed = 2 * (sin(pacetimer / 24) * (moveradius / 20))
		}
		
		if (pacetype == 10)
		{
			if (pacecon2 == 0)
			{
				if (vspeed > 0)
					vspeed *= 0.9
				
				if (vspeed <= 0.5 && pacecon2 == 0)
					pacecon2 = 1
			}
			
			if (pacecon2 == 1)
				move_towards_point(obj_mainchara.x, obj_mainchara.y, 4)
		}
		
		if (pacetype == 12)
		{
			hspeed = -sin(pacetimer / 30) * 10
			vspeed = (-sin(pacetimer / 12) * 12.5) / 10
		}
		
		if (pacetype == 13)
		{
			t = (t + increment) % 360
			shift = amplitude * dsin(t)
			y = yy + shift
		}
		
		if (pacetype == 14)
		{
			var _c = dcos(rotation)
			var _s = dsin(rotation)
			x = xx + (_c * distance) + (_s * distance)
			y = yy + (-_s * distance) + (_c * distance)
			rotation += spd
			
			if (rotation > 359)
				rotation -= 360
		}
		
		if (pacetype == 15)
		{
			if (float != 0)
				y = yy - sin(pacetimer / float)
			
			t = (t + increment) % 360
			shift = amplitude * dsin(t)
			x = xx + shift
			vspeed = (-sin(pacetimer / 12) * 12.5) / 10
		}
		
		if (pacetype == 16)
		{
			if (pacecon2 == 0)
			{
				hspeed *= 1.2
				hspeed = clamp(hspeed, -12, 12)
				
				if (x <= 240)
					pacecon2 = 0.1
			}
			
			if (pacecon2 == 0.1)
			{
				hspeed *= 0.7
				
				if (abs(hspeed) < 0.5)
				{
					hspeed = 1
					pacecon2 = 1
				}
			}
			
			if (pacecon2 == 1)
			{
				hspeed *= 1.2
				hspeed = clamp(hspeed, -12, 12)
				
				if (x >= 860)
					pacecon2 = 1.1
			}
			
			if (pacecon2 == 1.1)
			{
				hspeed *= 0.7
				
				if (abs(hspeed) < 0.5)
				{
					hspeed = -1
					pacecon2 = 0
				}
			}
		}
		
		if (pacetype == 17)
		{
			y = yy - sin(pacetimer / 5)
			x = xx - (sin(pacetimer / 20) * 10)
			
			if (x > xprevious)
				facing = 1
			else
				facing = 0
		}
		
		if (pacetype == 18)
			y = yy - sin(pacetimer / 5)
		
		if (pacetype == 19)
		{
			x = xx - (sin(pacetimer / 20) * 20)
			
			if (x > xprevious)
				facing = 1
			else
				facing = 0
		}
		
		if (pacetype == 20)
		{
			if (float != 0)
				y = yy - sin(pacetimer / float)
			
			image_speed = 0.25
			cancelwalk = 1
			
			if (pacecon2 == 0)
			{
				if (x < (xstart + moveradius))
				{
					x += pacespeed
				}
				else
				{
					x = xstart + moveradius
					pacecon2 = 1
				}
			}
			
			if (pacecon2 == 1)
			{
				if (x > (xstart - moveradius))
				{
					x -= pacespeed
				}
				else
				{
					x = xstart - moveradius
					pacecon2 = 0
				}
			}
			
			if (x > xprevious)
				facing = 1
			else
				facing = 0
		}
		
		if (pacetype == 21 || pacetype == 22)
		{
			if (paceinit == 0)
			{
				leftbound = 0
				leftboundcheck = 0
				
				while (leftboundcheck == 0)
				{
					if (place_meeting(x - leftbound, y, obj_solidblock) || place_meeting(x - leftbound, y, obj_solidenemy) || place_meeting(x - leftbound, y, obj_solidenemy_2) || leftbound >= 480)
					{
						leftboundcheck = 1
						show_debug_message("leftbound:" + string(leftbound))
					}
					else
					{
						leftbound++
					}
				}
				
				rightbound = 0
				rightboundcheck = 0
				
				while (rightboundcheck == 0)
				{
					if (place_meeting(x + rightbound, y, obj_solidblock) || place_meeting(x + rightbound, y, obj_solidenemy) || place_meeting(x + rightbound, y, obj_solidenemy_2) || rightbound >= 480)
					{
						rightboundcheck = 1
						show_debug_message("rightbound:" + string(rightbound))
					}
					else
					{
						rightbound++
					}
				}
				
				if (leftbound < rightbound)
					moveradius = leftbound - 8
				else
					moveradius = rightbound - 8
				
				show_debug_message("moveradius:" + string(moveradius))
				siner = 0
				pacesinspeed = moveradius / (pacespeed * 3)
				paceinit = 1
			}
			
			siner++
			
			if (pacetype == 21)
				x = xx - (sin(siner / pacesinspeed) * moveradius)
			
			if (pacetype == 22)
				x = xx + (sin(siner / pacesinspeed) * moveradius)
			
			if (x > xprevious)
				facing = 1
			else
				facing = 0
		}
		
		if (pacetype == 23)
		{
			y = yy - sin(pacetimer / 5)
			x = xx - (sin(pacetimer / 20) * moveradius)
			
			if (x > xprevious)
				facing = 1
			else
				facing = 0
		}
		
		if (pacetype == 24)
		{
			pacespeed = 25
			y = yy + (sin(pacetimer / 20) * 10)
			x = xx - (sin(pacetimer / pacespeed) * moveradius)
			
			if (x > xprevious)
				facing = 1
			else
				facing = 0
		}
	}
	
	viewblocked = 0
	viewpointx = ((bbox_left + bbox_right) / 2) + detectpointxoffset
	viewpointy = bbox_bottom + detectpointyoffset
	
	if (canAlertThroughWalls == 0)
	{
		mcx = (obj_mainchara.bbox_left + obj_mainchara.bbox_right) / 2
		mcy = obj_mainchara.bbox_bottom
		
		if (collision_line(viewpointx, viewpointy, mcx, mcy, obj_solidblock, 1, 1) > 0)
			viewblocked = 1
		
		if (collision_line(viewpointx, viewpointy, mcx, mcy, obj_interactablesolid, 1, 0) > 0)
			viewblocked = 1
		
		if (collision_line(viewpointx, viewpointy, mcx, mcy, obj_solidenemy, 1, 0) > 0)
			viewblocked = 1
	}
	
	if (alerted == 0)
	{
		if (alerttype == 0)
		{
			if (point_distance(viewpointx, viewpointy, charaHeartX(), charaHeartY()) <= radius && blind == 0)
				alerted = 1
		}
		
		if (alerttype == 1)
		{
			if (direction >= 45 && direction <= 135)
			{
				if (point_in_rectangle(obj_mainchara.x + 20, obj_mainchara.y + 35, (x + sprite_width) - radius, y + (sprite_height / 2), x + radius, (y + (sprite_height / 2)) - ((radius * 3) / 4)))
					alerted = 1
			}
			
			if (direction >= 225 && direction <= 315)
			{
				if (point_in_rectangle(obj_mainchara.x + 20, obj_mainchara.y + 35, (x + sprite_width) - radius, y + (sprite_height / 2), x + radius, y + (sprite_height / 2) + ((radius * 3) / 4)))
					alerted = 1
			}
			
			if ((direction >= 315 && direction <= 405) || (direction >= -45 && direction <= 45))
			{
				if (point_in_rectangle(obj_mainchara.x + 20, obj_mainchara.y + 35, x + (sprite_width / 2), (y + sprite_height) - radius, x + sprite_width + radius, y + radius))
					alerted = 1
			}
			
			if (direction >= 135 && direction <= 225)
			{
				if (point_in_rectangle(obj_mainchara.x + 20, obj_mainchara.y + 35, x - radius, (y + sprite_height) - radius, x + (sprite_width / 2), y + radius))
					alerted = 1
			}
		}
	}
	
	if (viewblocked == 1)
		alerted = 0
	
	if (alerted == 1)
	{
		speed = 0
		pacecon = 1
		alerttimer = 0
		alertcon = 1
		
		if (pacetype == pacetype_followpath)
			path_end()
		
		if (alertskip == 0)
		{
			if (noAlertSound == 0)
				snd_play(snd_b)
			
			targalarm = 20
			
			if (chasetype == 8)
				targalarm = 8
			
			excl = instance_create(x + (sprite_width / 2), y - 20, obj_excblcon)
			excl.alarm[0] = targalarm
			alarm[4] = targalarm
		}
		else
		{
			alertcon = 2
		}
		
		alerted = 2
	}
	
	if (alertcon == 2) scr_chaseenemy_chasetype(chasetype)
	
	facetimer += 1
	
	if (facetimer >= 10)
	{
		if (hspeed <= -0.2 && facing == 1)
		{
			facing = 0
			facetimer = 0
		}
		
		if (hspeed >= 0.2 && facing == 0)
		{
			facing = 1
			facetimer = 0
		}
	}
	
	if (cancelwalk == 0)
	{
		walk_index += (speed / 20)
		
		if (speed == 0) walk_index = 0
	}
	else walk_index = image_index
	
	if (test_release_bullet == 1)
	{
		test_release_bullet_timer++
		
		if (test_release_bullet_timer > 20)
		{
			bullet = instance_create(x, y, obj_encounter_bullet)
			bullet.creator = id
			
			with (bullet)
				move_towards_point(obj_mainchara.x + 20, obj_mainchara.y + 20, 4)
			
			test_release_bullet_timer = 0
		}
	}
}