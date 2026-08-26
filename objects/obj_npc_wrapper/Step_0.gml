if (npc == noone) instance_destroy(self) // Idk why "self" is being put in since that's the default anyways, but I'm not gonna touch it.

with (npc) {
	if (con == 0) {
		if (myinteract == 3 && global.interact == 0 && !d_ex()) {
			global.interact = 1
			global.msc = -99
			global.choice = -1
			global.choicemsg[0] = stringset("")
			global.choicemsg[1] = stringset("")
			global.choicemsg[2] = stringset("")
			global.choicemsg[3] = stringset("")
			other.con = other.setdialogue(talked)
			
			if (other.con == -3) {
				other.con = 0
				myinteract = 0
				exit
			}
			
			if (other.con == -2) {
				other.con = 0
				myinteract = 0
				talked++
				exit
			}
			
			if (other.con == -1){
				other.con = 0
				myinteract = 0
				global.interact = 0
				talked++
				exit
			}
			
			d_make(dialogue_side)
			myinteract = 100
		}
		
		if (other.con == undefined) other.con = 0
		
		if (myinteract == 100 && other.con == 0) {
			myinteract = 999
			talked++
		}
		
		if (myinteract == 999 && !d_ex()) {
			myinteract = 0
			global.interact = 0
		}
	}
	
	if (other.alwaysanimate) {
		marker.image_index += other.animspeed
	} else if (myinteract > 3 && d_ex()) {
		var trig = 0
		
		if (!i_ex(obj_writer)) trig = 1
		
		with (obj_writer) if (halt) trig = 1
		
		if (array_length(other.anim_messages) > 0 && other.anim_messages[obj_writer.msgno] == false) trig = 1
		
		if (!trig) marker.image_index += other.animspeed
	}
}

step_function()

if (con > 0 && (global.choice != -1 || !d_ex())) {
	k_d(1)
	global.choicemsg[0] = stringset("")
	global.choicemsg[1] = stringset("")
	global.choicemsg[2] = stringset("")
	global.choicemsg[3] = stringset("")
	global.msc = -99
	
	with (npc) other.con = other.choices[other.con - 1]() // ??? What
	
	global.choice = -1
	
	if (con == undefined)
		con = 0
	else
		d_make(npc.dialogue_side)
	
	if (con == 0) {
		with (npc) {
			myinteract = 999
			talked++
		}
	}
}
