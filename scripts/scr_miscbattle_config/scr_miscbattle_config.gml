#region TENSIONBAR

enum DRTensionColor {
	Orange = 0,
	Blue,
}

// Chapter 1 Accurate Settings: {EnableTensionbarAlphaFix 1, EnableTensionbarSlicedCorners 0}
// Chapter 2+Accurate Settings: {EnableTensionbarAlphaFix 0, EnableTensionbarSlicedCorners 1}
#macro EnableTensionbarAlphaFix 0
#macro EnableTensionbarSlicedCorners 1
function scr_tensionbar_colors_init(){
	global.barcolors = []
	global.defaultbarcolor = DRTensionColor.Orange

	scr_tensionbar_createcolor(c_red, c_orange, c_yellow, c_maroon, c_white, "TensionLight", DRTensionColor.Orange)
	scr_tensionbar_createcolor(c_blue, merge_color(c_blue, c_teal, 0.5), c_teal, c_navy, c_white, "TensionDark", DRTensionColor.Blue)
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
function scr_tensionbar_createcolor(usedtp = c_red, currenttp = c_orange, maxtp = c_yellow, backing = merge_color(c_red, c_black, 0.5), glow = c_white, name = "UNDEFINED", colorid = array_length(global.barcolors)) {	var color = {}
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

#region SOUL
	enum DRSoulMode {
		Red = 0,
		Yellow,
	}
	function scr_soulmodes_init() {
		global.soulmodesdata = []
		global.defaultsoulmode = DRSoulMode.Red
		
		scr_soulmodes_createdata(spr_dodgeheart, undefined, undefined, undefined, undefined, "Red", DRSoulMode.Red)
		scr_soulmodes_createdata(spr_yellowheart, function() { // Initialization
			z_hold = 0;
			siner = 0;
			z_charge = 0;
			f = 2;
			z_hold_f = 0;
			chargeshot_delay = 0;
			superchargetimer = 0;
			chargeshotcount = 0;
		    wspeed = 5;
		with obj_grazebox sprite_index = spr_grazeappear_yellow
		}, 
		function() { // Draw
			z_charge_nolimit = z_hold - 35
	
			if (z_charge_nolimit >= 0){
				var scale = abs(sin(z_charge_nolimit / 10))
				draw_sprite_ext(sprite_index, 0, x - (scale * 10), y - (scale * 10), 1 + scale, 1 + scale, image_angle, image_blend, 0.3)
				scale = abs(sin(z_charge_nolimit / 14))
				draw_sprite_ext(sprite_index, 0, x - 2 - (scale * 10), y - 2 - (scale * 10), 1.2 + scale, 1.2 + scale, image_angle, image_blend, 0.3)
			}
	
			if (z_hold >= 15){
				z_charge = z_hold - 15
		
				if (z_charge >= 35) z_charge = 35
		
				for (i = 0; i < 4; i += 1){
					rotx = (i * 90) + (z_charge * 5)
					xx = sin(degtorad(rotx)) * (35 - z_charge)
					yy = cos(degtorad(rotx)) * (35 - z_charge)
					draw_sprite_ext(spr_yheart_charge, 0, (x + 9) - xx, (y + 10) - yy, 4 - ((z_charge * 2) / 35), 4 - ((z_charge * 2) / 35), 0, c_white, z_charge / 5)
				}
			}
			
			draw_self()
		}, 
		function() { // Step
		    if (chargeshot_delay > 0) chargeshot_delay--;
			
		    if (button1_p() || (z_hold >= 10 && z_hold <= 39 && button1_r())) {
		        if (instance_number(obj_yheart_shot) < 3 && chargeshot_delay == 0) {
		            instance_create(x + 10, y + 10, obj_yheart_shot);
		            snd_play(snd_heartshot_dr_b);
		        }
		    }
    
		    if (z_hold == 20){
		        chargeshot_sound = snd_loop(snd_chargeshot_charge);
		        snd_pitch(chargeshot_sound, 0.1);
		        snd_volume(chargeshot_sound, 0, 0);
		        snd_volume(chargeshot_sound, 0.3, 20);
		    }
    
		    if (z_hold >= 20 && z_hold < 40) snd_pitch(chargeshot_sound, 0.1 + ((z_hold - 20) / 20));
			if (z_hold >= 40) image_index = 2;
    	    if (z_charge < 15) chargeshotcount = 0;
    
		    if (z_hold >= 40 && button1_r()) {
		        snd_stop(chargeshot_sound);
		        snd_play(snd_chargeshot_fire);
		        bigshot = instance_create(x + 10, y + 10, obj_yheart_shot);
				with bigshot {
					big = 1;
					sprite_index = spr_yheart_bigshot;
					hspeed = 4 * other.f;
					friction = -0.2 * other.f;
					image_alpha = 0.5;
					image_xscale = 0.1;
					image_yscale = 2;
				}
		        z_hold = 0;
		        chargeshot_delay = 5;
		        image_index = 0;
		        chargeshotcount++;
		    }
    
		    if (button1_h()){
		        z_hold_f += 1;
		    } else {
		        z_hold_f = 0;
		        snd_stop(chargeshot_sound);
		    }
    
		    z_hold = z_hold_f * 2;	
		}, undefined, "Yellow", DRSoulMode.Yellow)
	}
	
	function scr_soulmodes_createdata(specialsprite = spr_dodgeheart, init = function() {}, specialdraw = function() {draw_self()}, specialstep = function() {}, overridemovement = false, debugname = "UNLABELED", modeid = array_length(global.soulmodesdata)) {
		var soulmode = {}
		soulmode.variableinit = init
		soulmode.sprite_index = specialsprite
		soulmode.draw = specialdraw
		soulmode.step = specialstep
		soulmode.overridemovementcode = bool(overridemovement)
		soulmode.name = debugname
		soulmode.id = modeid
		global.soulmodesdata[modeid] = soulmode
		return soulmode
	}
	
	function scr_heartcolor(__heartcolor = DRSoulMode.Red, target = obj_heart){
		if !is_nan(__heartcolor) && __heartcolor < array_length(global.soulmodesdata) && __heartcolor >= 0 {
			with target {
				color = __heartcolor
				_soulmodedata = global.soulmodesdata[color]
				method(self, _soulmodedata.variableinit)() 
				sprite_index = _soulmodedata.sprite_index
				debug_log("***** Soul Mode set to ({0}) | {1}", _soulmodedata.id, _soulmodedata.name)
			}
		}
	}
#endregion