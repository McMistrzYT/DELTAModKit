global.entrance = 5;
instance_create(0, 0, /* obj_persistentfadein */ obj_fadein);
event_user(7);
room_goto(room_next(room_next(room_next(room))));
