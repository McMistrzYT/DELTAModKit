global.entrance = 3;
instance_create(0, 0, obj_persistentfadein);
event_user(7);

/*if (global.chapter == 3)
{
    if (room == room_town_krisyard_dark)
    {
        room_goto(room_town_church);
        exit;
    }
}*/

room_goto(room_next(room_next(room)));