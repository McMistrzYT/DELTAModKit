function scr_trigcheck(triggername){
	return scr_trigcheck_ext(triggername, obj_mainchara)
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

#region CUSTOM
	function scr_interacttrigcheck(triggername, clearinteractstate = false){
		var ___trig = 0
		if is_string(triggername) {
			with obj_trigger_interact {
				if extflag == triggername {
					if myinteract == 3 {
						___trig++
						if clearinteractstate myinteract = 0
					}
				}
			}
		}
	
		return ___trig
	}

	function scr_trigkill(triggername, includeinteract = false){
		var ___trig = 0
		if is_string(triggername) {
			with obj_trigger {
				if extflag == triggername {
					instance_destroy()
					___trig++
				}
			}
			if includeinteract {
				with obj_trigger_interact {
					if extflag == triggername {
						instance_destroy()
						___trig++
					}
				}	
			}
		}
	
		return ___trig			
	}
#endregion