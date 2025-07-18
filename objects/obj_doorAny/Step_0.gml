if (init == false)
{
    switch (image_index)
    {
        case 1:
            doorRoom = room + 1;
            break;
        
        case 2:
            doorRoom = room - 1;
            break;
        
        case 3:
            doorRoom = room + 2;
            break;
        
        case 4:
            doorRoom = room - 2;
            break;
        
        case 5:
            doorRoom = room + 3;
            break;
        
        case 6:
            doorRoom = room - 3;
            break;
        
        default
		doorRoom = room;
            break;
    }
    
    if (image_index != 0)
        doorEntrance = image_index;
    
    init = true;
}
