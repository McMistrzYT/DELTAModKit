function scr_damage(){
	if global.inv > 0 return;
	
	var lhpmode = DamageInLightDeductsFromLightHP && !global.darkzone
	var canretarget = true
	if lhpmode {
		target = 0
		canretarget = false
	}
	
    scr_damage_cache();
    var __element = 0;
        
    if (variable_instance_exists(id, "element") && is_real(element))
        __element = element;
        
	if canretarget {
	    if (target < 3)
	    {
	        var skipthis = false;
            
	        if (!skipthis)
	        {
	            if (global.hp[global.char[target]] <= 0)
	            {
	                scr_randomtarget_old();
	                target = mytarget;
                    
	                with (global.charinstance[target])
	                {
	                    image_blend = c_white;
	                    darkify = 0;
	                }
	            }
	        }
	    }
        
	    var __remtarget = -1;
        
	    if (target == 4) {
	        __remtarget = 4;
	        scr_randomtarget_old();
	        target = mytarget;
	        var getList = array_length(global.char);
            
	        if ((global.hp[global.char[target]] / global.maxhp[global.char[target]]) < (scr_party_hpaverage() / 2))
	        {
	            scr_randomtarget_old();
	            target = mytarget;
	        }
            
	        if ((global.hp[global.char[target]] / global.maxhp[global.char[target]]) < (scr_party_hpaverage() / 2))
	        {
	            scr_randomtarget_old();
	            target = mytarget;
	        }
            
	        if (target == 0 && (global.hp[global.char[target]] / global.maxhp[global.char[target]]) < 0.35)
	        {
	            scr_randomtarget_old();
	            target = mytarget;
	        }
            
	        with (global.charinstance[target])
	        {
	            image_blend = c_white;
	            darkify = 0;
	        }
	    }
	}
	
    chartarget = 3;
        
    tdamage = damage;
    var oldcalculation = 0;
        
    if (target < 3) {
        if (oldcalculation)
            tdamage = ceil(tdamage - (global.battledf[target] * 3));
        else
            tdamage = scr_damage_calculation(tdamage, target);
            
        chartarget = global.char[target];            
        if (global.charaction[target] == 10) tdamage = ceil((2 * tdamage) / 3); // DEFEND
            
            
        tdamage = ceil(tdamage * scr_element_damage_reduction(__element, global.char[target]));
        debug_log("The element is: " + string(__element));
            
        if (tdamage < 1) tdamage = 1;
    }
        
    if (!instance_exists(obj_shake)) instance_create(0, 0, obj_shake);
        
    with (global.charinstance[target]){
        hurt = 1;
        hurttimer = 0;
    }
        
    hpdiff = tdamage;
        
    with (obj_dmgwriter) {
        if (delaytimer >= 1)
            killactive = 1;
    }
    
	var targethp = global.hp[chartarget]
	var targetmaxhp = global.maxhp[chartarget]
	if lhpmode {
		targethp = global.lhp
		targetmaxhp = global.lmaxhp	
	}
	
    doomtype = -1;
        
    with (obj_heart) dmgnoise = 1;
        
    if (target < 3 || lhpmode) {
        if (targethp<= 0) {
            doomtype = 4;
            targethp -= round(tdamage / 4);
            hpdiff = round(tdamage / 4);
        } else {
            targethp -= tdamage;
                
            if (targethp <= 0) {
                hpdiff = abs(targethp - (targetmaxhp / 2));
                doomtype = 4;
                targethp = round(-targetmaxhp / 2);
                scr_dead(target);
            }
        }
            
        var __targx = -1;
        var __targy = -1;
            
        if (__targx == -1) {
            __targx = global.charinstance[target].x;
            __targy = (global.charinstance[target].y + global.charinstance[target].myheight) - 24;
        }
            
        dmgwriter = instance_create(__targx, __targy, obj_dmgwriter);
        dmgwriter.damage = hpdiff;
        dmgwriter.type = doomtype;
    }
    
	if lhpmode {
		global.lhp = targethp
		global.lmaxhp = targetmaxhp	
	} else {
		global.hp[chartarget]= targethp
		global.maxhp[chartarget] = targetmaxhp			
	}
	
    if (target == 3 && !lhpmode) {
        for (hpi = 0; hpi < 3; hpi += 1)
        {
            chartarget = global.char[hpi];
                
            if (global.hp[chartarget] >= 0)
            {
                if (oldcalculation)
                    tdamage = ceil(tdamage - (global.battledf[hpi] * 3));
                else
                    tdamage = scr_damage_calculation(tdamage, hpi);
                    
                tdamage = ceil(tdamage * scr_element_damage_reduction(__element, chartarget));
                    
                if (global.charaction[hpi] == 10)
                    global.hp[chartarget] -= ceil((3 * tdamage) / 4);
                else
                    global.hp[chartarget] -= tdamage;
                    
                if (global.hp[chartarget] <= 0)
                    global.hp[chartarget] = round(-global.maxhp[0] / 2);
            }
        }
    }
        
    global.inv = global.invc * 40;
        
    scr_damage_check();
    gameover = true;
	
	if lhpmode {
		if targethp > 0 { gameover = false }
	} else {
		for (var i = 0; i < array_length(global.char); i++) {
			if global.char[i] != DRCharacter.None && global.hp[global.char[i]] > 0 {
				gameover = false;
				break;	
			}
		}
	}
    
    if gameover scr_gameover();
        
    if (__remtarget != -1) target = __remtarget;
}

function scr_damage_cache()
{
    global.damage_cache = [];
    
    for (var i = 0; i < 3; i++)
        global.damage_cache[array_length(global.damage_cache)] = global.hp[global.char[i]];
}

function scr_damage_check()
{
    if (!variable_global_exists("damage_cache"))
        global.damage_cache = [];
    
    var took_damage = false;
    
    for (var i = 0; i < array_length(global.damage_cache); i++)
    {
        var hp_cache = global.damage_cache[i];
        
        if (global.hp[global.char[i]] < hp_cache)
        {
            took_damage = true;
            break;
        }
    }
}

function scr_party_hpaverage()
{
    var _totalhp = 0;
    var _totalmaxhp = 0;
    var _members = 0;
    
    for (var _hpi = 0; _hpi < array_length(global.char); _hpi++)
    {
        if (global.char[_hpi] > 0)
        {
            _members++;
            _totalhp += global.hp[global.char[_hpi]];
            _totalmaxhp += global.maxhp[global.char[_hpi]];
        }
    }
    
    if (_totalhp > 0)
        return floor(_totalhp / _totalmaxhp);
    else
        return 0;
}

function scr_damage_calculation(tdamage, tslot){
    var _tdamage = tdamage;
	var _tdef = 0
	if variable_global_exists("battledf") && is_array(global.battledf) _tdef = global.battledf[tslot]
    var _tmaxhp = global.maxhp[global.char[tslot]];
	if global.darkzone == 0 && DamageInLightDeductsFromLightHP {
		_tmaxhp = global.lmaxhp
		_tdef = global.ldf
	}
    var _finaldamage = 1;
    var _hpthresholda = _tmaxhp / 5;
    var _hpthresholdb = _tmaxhp / 8;
    
    for (var _di = 0; _di < _tdef; _di++) {
        if (_tdamage > _hpthresholda)
            _tdamage -= 3;
        else if (_tdamage > _hpthresholdb)
            _tdamage -= 2;
        else
            _tdamage -= 1;
    }
    
    return max(_tdamage, _finaldamage);
}
enum DRElement {
	/* 0 */		None,
	/* 1 */		Elec_Holy,
	/* 2 */ 
	/* 3 */ 
	/* 4 */ 
	/* 5 */		Dark_Star = 5,
	/* 6 */		Cats_Doll,
	/* 7 */ 
	/* 8 */ 
	/* 9 */		Unknown_Resist2and8 = 9,
	/* 10 */	Unknown_ResistAll,
	
}

function scr_element_damage_reduction(element, char){
    var ___element = element;
    var ___char = char;
    var ___reduction = 1;
    
    if (___element != DRElement.None) {
        for (var ___itemi = 0; ___itemi < 2; ___itemi++) {
			var ___itemelement = global.itemelement[___char][___itemi + 1]
			var _rundefaultelementcode = true
			switch ___itemelement {
				case DRElement.None: _rundefaultelementcode = false break;
				case DRElement.Unknown_ResistAll: ___reduction -= global.itemelementamount[___char][___itemi + 1]; break;
				case DRElement.Unknown_Resist2and8: if (___element == 2 || ___element == 8) ___reduction -= global.itemelementamount[___char][___itemi + 1];
				default: break;
				
			}
			if _rundefaultelementcode && ___element == ___itemelement ___reduction -= global.itemelementamount[___char][___itemi + 1] 
        }
    }
    
    if (___reduction < 0.25) ___reduction = 0.25;
    
    return ___reduction;
}

function scr_damage_all(proportion = 1){
    if (global.inv < 0) {
        remdamage = damage;
        _temptarget = target;
        
        for (ti = 0; ti < array_length(global.char); ti += 1) {
            global.inv = -1;
            damage = remdamage;
            var _inverse_proportion = 1 - proportion;
            var _damscale = global.hp[global.char[ti]] / global.maxhp[global.char[ti]];
            var _dammod = (_damscale * _inverse_proportion) + (1 * proportion);
            damage *= _dammod;
            target = ti;
            
            if (global.hp[global.char[ti]] > 0 && global.char[ti] != DRCharacter.None) scr_damage();
        }
        
        global.inv = global.invc * 40;
        target = _temptarget;
    }
}

function scr_dead(slot) {
	global.charmove[slot] = 0;
	global.charcantarget[slot] = 0;
	global.chardead[slot] = 1;
	global.charaction[slot] = 0;
	global.charspecial[slot] = 0;
}

function scr_damage_all_overworld(){
	if (global.inv < 0) {
		gameover = 1
		var lhpmode = DamageInLightDeductsFromLightHP && !global.darkzone
		if lhpmode {
			if (global.lhp > 1) gameover = 0
		} else {
			if (global.char[0] != 0 && global.hp[global.char[0]] > 1) gameover = 0		
			if (global.char[1] != 0 && global.hp[global.char[1]] > 1) gameover = 0		
			if (global.char[2] != 0 && global.hp[global.char[2]] > 1) gameover = 0
		}
		/*
		if (global.chapter == 5 && gameover && global.tempflag[57] == 1){
			if (global.char[0] != 0) global.hp[global.char[0]] = 0			
			if (global.char[1] != 0) global.hp[global.char[1]] = 0			
			if (global.char[2] != 0) global.hp[global.char[2]] = 0
			
			exit
		}
		*/
		
		if (gameover == 1) scr_gameover()
		
		remdamage = damage
		remtarget = target
		
		if (!instance_exists(obj_shake)) instance_create(0, 0, obj_shake)
		
		with (obj_dmgwriter) killactive = 1
		
		snd_stop(snd_hurt1)
		snd_play(snd_hurt1)
		var maxhpdiff = 0
		
		for (ti = 0; ti < 3; ti += 1) {
			global.inv = -1
			damage = remdamage
			target = ti
			tdamage = damage
			var curhp = lhpmode ? global.lhp : global.hp[global.char[target]]
			
			with (global.charinstance[target])
			{
				hurt = 1
				hurttimer = 0
			}
			
			hpdiff = tdamage
			
			if (hpdiff >= curhp) hpdiff = curhp - 1
			
			maxhpdiff = max(hpdiff, maxhpdiff)
			d_cancel = 0
			
			if (hpdiff <= 1) {
				if (curhp <= 0)
				{
					hpdiff = 0
					d_cancel = 1
				} else {
					hpdiff = 1
				}
			}
			
			if (d_cancel == 0)	{
				doomtype = -1
				curhp -= hpdiff
				
				if ((instance_exists(global.charinstance[target]) && global.charinstance[target].visible == true)/* || i_ex(obj_climb_kris) || i_ex(obj_plat_player)*/) {
					var trg = noone
					var nowriter = false
					/*
					if (i_ex(obj_plat_player)) {
						trg = obj_plat_player
						
						if (ti > 0) {
							with (obj_plat_follower) {
								if (name == "susie" && other.ti == 1) trg = self								
								if (name == "ralsei" && other.ti == 2) trg = self
							}
							
							if (trg == obj_plat_player) {
								if (hpdiff == maxhpdiff) {
									with (dmgwriter) damage = maxhpdiff
								}
								
								nowriter = true
							}
						}
					}
					else if (i_ex(obj_climb_kris)) {
						trg = obj_climb_kris
						
						if (ti > 0) {
							with (obj_climb_susie) {
								if (name == "susie" && other.ti == 1) trg = self								
								if (name == "ralsei" && other.ti == 2) trg = self
							}
							
							if (trg == obj_climb_kris) {
								if (hpdiff == maxhpdiff) {
									with (dmgwriter)
										damage = maxhpdiff
								}
								
								nowriter = true
							}
						}
					}
					*/
					if (!nowriter) {
						dmgwriter = instance_create(x, y, obj_dmgwriter)
						dmgwriter.damage = hpdiff
						dmgwriter.type = doomtype
						
						if false /*(i_ex(obj_climb_kris) || i_ex(obj_plat_player))*/ {
							dmgwriter.x = trg.x
							dmgwriter.y = trg.y
							dmgwriter.ystart = trg.y
							dmgwriter.depth = trg.depth - 100
							
							if (i_ex(obj_plat_player))
							{
								dmgwriter.depth = 1650
								
								if (obj_plat_player.dashing)
									dmgwriter.slidespeedx = obj_plat_player.hspeed
							}
							
							if (variable_instance_exists(trg, "onrotatingtower") && trg.onrotatingtower == true) dmgwriter.x = camerax() + (camerawidth() / 2)
						} else if (instance_exists(global.charinstance[target])) {
							dmgwriter.x = global.charinstance[target].x
							dmgwriter.y = (global.charinstance[target].y + global.charinstance[target].myheight) - 24
						}
						
					}
				}
				
				if (curhp < 1) curhp = 1
			}
				
			if lhpmode global.lhp = curhp else  
			global.hp[global.char[target]] = curhp
			
			
			if lhpmode break // No need to go to others, they don't have an light HP variable.
		}
		
		target = remtarget
		global.inv = global.invc * 40
	}
}
