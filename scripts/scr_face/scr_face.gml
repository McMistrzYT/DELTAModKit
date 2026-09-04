function scr_smallface(smslot, smsprite, smimage, smx, smy, smmessage){
	scr_smallface_reset(smslot)
	global.smsprite[smslot] = spr_face_susie_alt
	
	if (is_string(smsprite)) {
		if (smsprite == "susie") global.smsprite[smslot] = spr_face_susie_alt		
		if (smsprite == "ralsei") global.smsprite[smslot] = spr_face_r_nohat		
		if (smsprite == "ralsei" && global.flag[1311]) global.smsprite[smslot] = spr_face_r_dark		
		if (smsprite == "lancer") global.smsprite[smslot] = spr_face_l0		
		if (smsprite == "noelle") global.smsprite[smslot] = spr_face_n_matome		
		if (smsprite == "noelle_cropped") global.smsprite[smslot] = spr_face_n_matome_cropped		
		if (smsprite == "queen") global.smsprite[smslot] = scr_84_get_sprite("spr_face_queen")		
		if (smsprite == "rouxls") global.smsprite[smslot] = spr_face_rurus		
		if (smsprite == "berdly") global.smsprite[smslot] = spr_face_berdly_dark		
		if (smsprite == "rudy") global.smsprite[smslot] = spr_face_rudy		
		//if (smsprite == "flowery") global.smsprite[smslot] = spr_face_flowery		
		if (smsprite == "toriel") global.smsprite[smslot] = spr_face_t0
		
		/*if (smsprite == "opuppet"){
			global.smsprite[smslot] = spr_miniface_orange
			global.smcolor[smslot] = c_orange
			global.smshake[smslot] = 1
		}
		*/
		if (smsprite == "sans") global.smsprite[smslot] = asset_get_index("spr_face_sans" + string(smimage))
		/*
		var flower_list = ["orange", "aqua", "green", "seth", "blue", "yellow"]
		
		for (var i = 0; i < array_length(flower_list); i++) {
			if (smsprite != flower_list[i]) continue
			
			global.smsprite[smslot] = spr_nothing
			break
		}
		*/
		if (smsprite == "orange") global.smcolor[smslot] = #FFAC87		
		if (smsprite == "aqua") global.smcolor[smslot] = #84F9FF		
		if (smsprite == "green") global.smcolor[smslot] = #AEFFBC		
		if (smsprite == "seth") global.smcolor[smslot] = #E2A8FC		
		if (smsprite == "blue") global.smcolor[smslot] = #86A7FF		
		if (smsprite == "yellow") global.smcolor[smslot] = #FFF8A1
		
		if (smsprite == "none" || smsprite == "empty") global.smsprite[smslot] = spr_nothing
	} else {
		global.smsprite[smslot] = smsprite
		
		if (smsprite == 0) global.smsprite[smslot] = spr_nothing
	}
	
	global.smimage[smslot] = smimage
	
	if (is_string(smx)) {
		if (global.fighting == 1) {			
			if (smx == "left") global.smxx[smslot] = 60			
			if (smx == "leftmid") global.smxx[smslot] = 160			
			if (smx == "mid" || smx == "middle") global.smxx[smslot] = 260			
			if (smx == "rightmid") global.smxx[smslot] = 360			
			if (smx == "right") global.smxx[smslot] = 460
		} else {
			if (smx == "left") global.smxx[smslot] = 70			
			if (smx == "leftmid") global.smxx[smslot] = 160
			if (smx == "mid" || smx == "middle") global.smxx[smslot] = 260
			if (smx == "rightmid") global.smxx[smslot] = 360
			if (smx == "right") global.smxx[smslot] = 400
		}
	} else global.smxx[smslot] = smx
	
	if (is_string(smy)) {
		if (global.fighting == 1) {
			if (smy == "top") global.smyy[smslot] = -10			
			if (smy == "topmid") global.smyy[smslot] = 10			
			if (smy == "mid" || smy == "middle") global.smyy[smslot] = 30			
			if (smy == "bottommid") global.smyy[smslot] = 45			
			if (smy == "bottom") global.smyy[smslot] = 56			
			if (smy == "bottom" || smy == "bottommid") {
				global.smdir[smslot] = 90
				global.smspeed[smslot] = 4
				global.smalarm[smslot] = 10
				global.smyy[smslot] += 40
				global.smxx[smslot] -= 40
			}
		} else {
			if (smy == "top") global.smyy[smslot] = -10			
			if (smy == "topmid") global.smyy[smslot] = 10			
			if (smy == "mid" || smy == "middle") global.smyy[smslot] = 30			
			if (smy == "bottommid") global.smyy[smslot] = 50			
			if (smy == "bottom") global.smyy[smslot] = 68			
			if (global.darkzone == 0) {
				if (smy == "top") global.smyy[smslot] = 160				
				if (smy == "topmid") global.smyy[smslot] = 180				
				if (smy == "mid" || smy == "middle") global.smyy[smslot] = 200				
				if (smy == "bottommid") global.smyy[smslot] = 240				
				if (smy == "bottom") global.smyy[smslot] = 240
			}
		}
	} else global.smyy[smslot] = smy
	
	global.smstring[smslot] = smmessage
}

function scr_smallface_reset(smslot){
	global.smalarm[smslot] = 5
	global.smyy[smslot] = 70
	global.smxx[smslot] = 170
	global.smdir[smslot] = 180
	global.smspeed[smslot] = 10
	global.smtype[smslot] = 3
	global.smimage[smslot] = global.fe
	global.smimagespeed[smslot] = 0
	global.smsprite[smslot] = spr_face_s6
	global.smcolor[smslot] = c_white
	global.smshake[smslot] = 0
	global.smstring[smslot] = stringsetloc("* ... what?", "scr_smallface_reset_slash_scr_smallface_reset_gml_12_0")
}

function scr_facechoice(){
    myface = instance_create(writer.x + (8 * f), writer.y + (5 * f), obj_face);
}