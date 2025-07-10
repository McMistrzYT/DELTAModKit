global.entrance = 24;
instance_create(0, 0, obj_persistentfadein);
event_user(7);

switch (room) {
	case room_dw_test: room_goto(room_dw_castle_area_1); break;
	case room_dw_castle_area_1: room_goto(room_dw_test); break;
}