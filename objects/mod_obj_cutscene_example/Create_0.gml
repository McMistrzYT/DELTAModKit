con = 0
cutscenemaster = noone
times = 0


if layer_get_visible("DEBUG_ASSETS") {
	debug_print("DEBUG_ASSETS was left visible, Hiding.")
	layer_set_visible("DEBUG_ASSETS", false)
}
// spr_joker_main

npc_theonlyonewhoreadthesign = scr_makenpc_fromasset(findsprite(spr_joker_main, "DEBUG_ASSETS"))
scr_setnpclogic(npc_theonlyonewhoreadthesign, {animspeed: 0}, function(talked){
	scr_speaker("no_name")
	msgset(0, "%%")
	switch times {
		case 1:
			if talked 
				msgset(0, "* YOU SHOULD REALLY READ THEM, THEM!/%")
			else 
				msgset(0, "* UHEE UHEE, AM I THE ONLY ONE WHO READ THE SIGNS?/%")		
		break;
		case 2:
			msgset(0, "* TRY AGAIN, AGAIN!/%")
		break;
		
		default:
		case 3:
			msgset(0, "* UHEHE, HOW MANY TIMES SHALL YOU DO THIS? THIS!/%")
		break;
	}
})
npc_theonlyonewhoreadthesign.y -= 100000