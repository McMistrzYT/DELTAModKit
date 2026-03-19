// !!WARNING, things in here May be Moved to new Scripts once there is more similar battle related things!!
#region TENSIONBAR

	enum DRTENSIONCOLOR {
		Orange = 0,
		Blue,
	}

function scr_tensionbar_colors_init(){
	global.barcolors = []
	global.defaultbarcolor = DRTENSIONCOLOR.Orange


	scr_tensionbar_createcolor(c_red, c_orange, c_yellow, merge_color(c_red, c_black, 0.5), c_white, "TensionLight", DRTENSIONCOLOR.Orange)
}

// TENSIONBAR_COLORS_BASEFUNCTIONS
/// @desc Creates a Tension Bar Color.
/// @arg UsedTP The Color Used when Using Tension
/// @arg CurrentTP The Color Used for the Current Amount of Tension
/// @arg MaxTP The Color Used when At MAXTension
/// @arg Backing The Color for the Background of the TensionBar
/// @arg Glow The Usually White Line seen on the Bar
/// @arg Name The Name of the TensionBar Color (Shows up in Debug Logs)
/// @arg ID The ID the Bar is assigned To
function scr_tensionbar_createcolor(usedtp, currenttp, maxtp, backing, glow, name, colorid = array_length(global.barcolors)) {	var color = {}
	color.usedtp = usedtp
	color.currenttp = currenttp
	color.maxtp = maxtp
	color.backing = backing
	color.glow = glow
	color.name = name
	color.id = colorid
	global.barcolors[colorid] = color
	return color
}
#endregion