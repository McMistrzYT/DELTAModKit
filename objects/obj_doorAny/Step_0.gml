if (init == 0)
{
    switch (image_index)
    {
        case 1:
            doorRoom = room_next(room);
            break;
        
        case 2:
            doorRoom = room_previous(room);
            break;
        
        case 3:
            doorRoom = room_next(room_next(room));
            break;
        
        case 4:
            doorRoom =  room_previous(room_previous(room));
            break;
        
        case 5:
            doorRoom = room_next(room_next(room_next(room)));
            break;
        
        case 6:
            doorRoom =  room_previous(room_previous(room_previous(room)));
            break;
        
        default:
            break;
    }
    
    if (image_index != 0)
        doorEntrance = image_index;
    
    if (doorSpecial != "none")
    {
    }
    
    init = 1;
}
