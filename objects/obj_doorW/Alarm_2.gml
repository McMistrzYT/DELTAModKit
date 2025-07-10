global.entrance = 23;
instance_create(0, 0, obj_persistentfadein);
event_user(7);

switch (room) {
	case room_dw_test:
		room_goto(room_DARKbase_GMS2);
		break;
}