function scr_get_room_list()
{
	// MAKE SURE TO ADD ANY ROOMS THAT YOU CAN SAVE IN TO THIS LIST!
	// OTHERWISE YOU WONT BE ABLE TO LOAD A SAVE SAVED IN THAT ROOM!
    return [
		new scr_room(room_dw_test, 1 + global.chapter * 10000),
		new scr_room(room_lw_test, 2 + global.chapter * 10000)
	];
}

function scr_roomname(roomid)
{
    roomname = scr_debug() ? "! UNKNOWN ! scr_roomname" : "Dark World...?";
    
    switch (roomid) {
		case 0: roomname = "---"; break;
		
		case room_dw_test: roomname = "Dark World - Testbed"; break;
		case room_lw_test: roomname = "Light World - Testbed"; break;
	}
    
    return roomname;
}

function scr_get_completed_file_name(ch = 0)
{
    var _file_name = "";
    
    switch (ch)
    {
        case 1:
            _file_name = "Your Room";
            break;
        
        case 2:
            _file_name = "Kris's House";
            break;
			
		case 3:
			_file_name = "Outside Shelter";
			break;
        
        default:
            break;
    }
    
    var full_file_name = stringsetsub("~1 [Chapter ~2 END]", _file_name, string(ch));
    return full_file_name;
}