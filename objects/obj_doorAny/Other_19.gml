if !room_exists(doorRoom) {
	if !touched debug_log("doorAny ({1}) attempted to go to room id ({0}) Which does not exist", doorRoom, id)
	touched = true
	exit;
}
global.interact = 3;
if (!i_ex(obj_fadeout)) instance_create(0, 0, obj_fadeout);

if (touched == 0){
    alarm[2] = 8;
    event_user(8);
    touched = 1;
}

global.marker_lerpX = noone
global.marker_lerpY = noone