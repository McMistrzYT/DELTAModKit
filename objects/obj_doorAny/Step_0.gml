if (init == 0)
{
    switch (image_index)
    {
        case 1:
            doorRoom = room + ROOM_INITIALIZE;
            break;
        
        case 2:
            doorRoom = room - ROOM_INITIALIZE;
            break;
        
        case 3:
            //doorRoom = room + room_title_placeholder;
            break;
        
        case 4:
            //doorRoom = room - room_title_placeholder;
            break;
        
        case 5:
            //doorRoom = room + room_battletest;
            break;
        
        case 6:
            //doorRoom = room - room_battletest;
            break;
        
        default:
			doorRoom = room_dw_test;
            break;
    }
    
    if (image_index != 0)
        doorEntrance = image_index;
    
    /*if (doorSpecial != "none")
    {
        if (global.chapter == 3)
        {
            if (doorSpecial == "pc")
            {
                if (room == room_dw_green_room)
                {
                    if (global.plot >= 280)
                    {
                        doorFadeMusic = false;
                        doorRoom = 218;
                    }
                }
            }
        }
    }*/
    
    init = 1;
}
