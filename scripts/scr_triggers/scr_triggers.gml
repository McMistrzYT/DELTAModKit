function scr_trigcheck(triggername){
	return scr_trigcheck_ext(triggername, obj_mainchara)
	/*
	var ____trig = 0
	
	if (is_string(triggername)) {
		with (obj_trigger){
			if (extflag == triggername) {
				if (place_meeting(x, y, obj_mainchara)) ____trig++
			}
		}
	}
	
	return ____trig;
	*/
}

function scr_trigcheck_ext(triggername, triggerinst = id){
	var ____trig = 0
	
	if (is_string(triggername)) {
		with (obj_trigger) {
			if (extflag == triggername){
				if (place_meeting(x, y, triggerinst)) ____trig++
			}
		}
	}
	
	return ____trig;
}
