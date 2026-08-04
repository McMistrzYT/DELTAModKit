if (scr_flag_get(1324) == 0) {
	var sunset = scr_marker(0, 0, spr_torielclass_sunsetoverlay)
	
	with (sunset) {
		image_alpha = 0.4
		depth = 2000
	}
}

obj = []
var _createobj = function(x, y, sprite, spawndepth = 0) {
	var thisobj = array_length(obj)
	obj[thisobj] = scr_marker(x, y, sprite)
	with obj[thisobj] if spawndepth != 0 depth = spawndepth else scr_depth()
	return obj[thisobj]
}

var toridesk = _createobj(126, 63, spr_torieldesk)
_createobj(107, 116, spr_smalldesk)
_createobj(158, 116, spr_smalldesk)
_createobj(208, 116, spr_smalldesk)
_createobj(107, 145, spr_smalldesk)
_createobj(158, 145, spr_smalldesk)
_createobj(208, 145, spr_smalldesk)
_createobj(261, 174, spr_torielclass_chairs)
var desk_obj = _createobj(200, 65, spr_torielclass_flowers, toridesk.depth - 10)

with obj_readable_room1 {
	USECUSTOMFUNC = true
	CUSTOM_TEXT = "%%";
	CUSTOM_FUNC = function() {	
		skip = 1
		mydialoguer = obj_room_torielclass.show_convo(extflag, read)
		if i_ex(mydialoguer) {
			_unfreeze = false
			debug_log("Starting Toriel Class dialogue from [obj_room_torielclass/show_convo]")
		} else {
		}
	}	
}

show_convo = function(extflag, read) {
	scr_speaker("no_name")
	switch extflag {	
		default: return noone;
		case "toriname":
			msgset(0, "* (\"Ms. Toriel\" is written in cursive on the dry-erase board.)/", "obj_readable_room1_slash_Other_10_gml_473_0")
			msgnext("* (Seems like it hasn't been erased in a very long time.)/%", "obj_readable_room1_slash_Other_10_gml_474_0")
		break;
		case "Torielcomputer":
			msgset(0, "* (It's your mom's computer wallpaper.)/", "obj_readable_room1_slash_Other_10_gml_295_0")
			msgnext("* (You're wearing a cowboy hat^1, sitting on somebody's lap.)/%", "obj_readable_room1_slash_Other_10_gml_296_0_b")
		break;
		case "markers":
			if (read == 0) {
				msgset(0, "* (You uncapped the yellow scented marker and gave it a sniff.)/", "obj_readable_room1_slash_Other_10_gml_304_0")
				msgnext("* (You're hit with an overpowering^1, floral bouquet...)/", "obj_readable_room1_slash_Other_10_gml_305_0")
				msgnext("* (..^1. actually^1, it's hard to tell with the flowers behind you.)/%", "obj_readable_room1_slash_Other_10_gml_306_0")
			} else {
				msgset(0, "* (You opened a marker and held it aloft.)/", "obj_readable_room1_slash_Other_10_gml_310_0")
				msgnext("* (..^1. hard to tell what to do with it if you can't smell it.)/%", "obj_readable_room1_slash_Other_10_gml_311_0")
			}
			
			if (scr_havechar("susie")) {
				if (read == 0) {
					msgset(0, "* (You uncapped the yellow-scented marker and presented it to Susie.)/", "obj_readable_room1_slash_Other_10_gml_319_0")
					scr_anyface_next("susie", "8")
					msgnext("\\E8* For me^1? Hey^1, you shouldn't have.../", "obj_readable_room1_slash_Other_10_gml_321_0")
					scr_anyface_next("no_name", 0)
					msgnext("* (The two of you held the marker and sniffed it together.)/", "obj_readable_room1_slash_Other_10_gml_323_0")
					scr_anyface_next("susie", "8")
					msgnext("\\E8* Dude^1, it's.../", "obj_readable_room1_slash_Other_10_gml_325_0")
					msgnext("\\EC* ..^1. I can't smell it^1. Stupid flowers./%", "obj_readable_room1_slash_Other_10_gml_326_0")
				} else {
					scr_speaker("susie")
					msgset(0, "\\EK* Maybe if we go under the desk to smell it^1? ..^1. nah./%", "obj_readable_room1_slash_Other_10_gml_330_0")
				}
			}
		break;
		case "flowers":
			if (read == 0) {
				msgset(0, "* (Flowers.)/%", "obj_readable_room1_slash_Other_10_gml_340_0")
			} else {
				msgset(0, "* (Never seems to be the right season for them.)/%", "obj_readable_room1_slash_Other_10_gml_344_0_b")
			}
			
			if (scr_havechar("susie")) {
				scr_speaker("susie")
				msgset(0, "\\EA* Hey^1, maybe I could take these flowers^1, and.../", "obj_readable_room1_slash_Other_10_gml_350_0_b")
				msgnext("\\Ev* ..^1. nah^1, that's stupid./%", "obj_readable_room1_slash_Other_10_gml_351_0_b")
			}
		break;
		case "shapes":
			msgset(0, "* (It's a poster of several basic shapes.^1)&* (Circle, Oval, Square...)/", "obj_readable_room1_slash_Other_10_gml_521_0")
			msgnext("* (Hyperdodecahedron...)/%", "obj_readable_room1_slash_Other_10_gml_522_0")
		break;
		case "books":
			msgset(0, "* (Kids' books.^1)&* (Some of them used to be yours.)/%", "obj_readable_room1_slash_Other_10_gml_526_0")
		break;
		case "drawings":
			msgset(0, "* (It's a primitive drawing of your mom.)/%", "obj_readable_room1_slash_Other_10_gml_530_0");
		break;
		case "blocks":
			msgset(0, "* (Some kind of primitive sculpture.)&* (Who knows what it represents?)/%", "obj_readable_room1_slash_Other_10_gml_537_0")
		break;
		case "towerofgods":
			msgset(0, "* (...^1? There's a white napkin on top of the tower.)/", "obj_readable_room1_slash_Other_10_gml_383_0_b")
			msgnext("* (Imagining someone eating on top of this..^1. you felt ill.)/%", "obj_readable_room1_slash_Other_10_gml_384_0_b")
		break;
	}
	return d_make()
}