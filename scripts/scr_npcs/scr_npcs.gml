/// @desc setup npc logic [Arguments After Interact are the Choice Functions]
/// @arg {Id.Instance} NPCInstance 
/// @arg {struct} Settings
/// @arg {function} Interact
function scr_setnpclogic(_npc = noone, settings = {}, oninteract = function(talked){}){
	if (_npc == noone) {
		scr_debug_print("Failed to add NPC logic")
		exit
	}
	
	if (_npc.marker.sprite_index == spr_debug_40x40) _npc.marker.visible = 0
	
	with (instance_create(0, 0, obj_npc_wrapper)) {
		if (variable_struct_exists(settings, "animspeed")) animspeed = settings.animspeed		
		if (variable_struct_exists(settings, "typer")) typer = settings.typer		
		if (variable_struct_exists(settings, "alwaysanimate")) alwaysanimate = settings.alwaysanimate
		
		npc = _npc
		
		if (!variable_instance_exists(npc.id, "dialogue_side")) npc.dialogue_side = -1
		
		setdialogue = oninteract
		choices = []
		
		for (var i = 3; i < argument_count; i++) array_push(choices, argument[i])
	}
}

/// @desc A thing Toby brought over from UT to DR, updates the sprite based off of the facing direction using the talking sprites.
function scr_npcdir(){
	if (facing == 0) sprite_index = dtsprite	
	if (facing == 1) sprite_index = rtsprite	
	if (facing == 2) sprite_index = utsprite	
	if (facing == 3) sprite_index = ltsprite
}

function scr_makenpc(arg0 = "", arg1 = "", arg2 = false, arg3 = false)
{
	var _mylayer = layer_get_id(arg0)
	
	if (_mylayer == -1)
	{
		scr_debug_print("Warning: Check Output Console")
		debug_message("scr_makenpc(" + arg0 + "," + arg1 + ") Result: Layer Not Found")
		return -4;
	}
	
	var sourcenpc = layer_sprite_get_id(_mylayer, arg1)
	
	if (sourcenpc == -1)
	{
		var _result = "scr_makenpc(\"" + arg0 + "\",\"" + arg1 + "\") Result: Sprite Not Found"
		debug_message(_result)
		scr_debug_print("Warning: Check Output Console")
		return -4;
	}
	
	var _mysprite = layer_sprite_get_sprite(sourcenpc)
	var _myx = layer_sprite_get_x(sourcenpc)
	var _myy = layer_sprite_get_y(sourcenpc)
	var _myxscale = layer_sprite_get_xscale(sourcenpc)
	var _myyscale = layer_sprite_get_yscale(sourcenpc)
	var _myalpha = layer_sprite_get_alpha(sourcenpc)
	var _myangle = layer_sprite_get_angle(sourcenpc)
	var _myblend = layer_sprite_get_blend(sourcenpc)
	var _myspeed = layer_sprite_get_speed(sourcenpc)
	var _myindex = layer_sprite_get_index(sourcenpc)
	var _npc = instance_create_depth(0, 0, 0, obj_trigger_interact)
	_npc.marker = scr_marker_ext(_myx, _myy, _mysprite, _myxscale, _myyscale, 0, _myindex, _myblend, undefined, undefined, undefined, _myalpha, arg2)
	var truex = _npc.marker.bbox_left
	var truey = _npc.marker.bbox_top
	var truexscale = _npc.marker.bbox_right - _npc.marker.bbox_left
	var trueyscale = _npc.marker.bbox_bottom - _npc.marker.bbox_top
	setxy(truex, truey, _npc)
	_npc.markerxoffset = truex - _npc.marker.x
	_npc.markeryoffset = truey - _npc.marker.y
	_npc.markerstick = true
	scr_sizeexact(truexscale, trueyscale, _npc)
	
	if (arg3)
	{
		_npc.visible = true
		_npc.image_alpha = 1
	}
	
	_npc.strict = true
	_npc.issolid = true
	_npc.talked = 0
	scr_depth_alt(_npc.marker)
	return _npc;
}

function scr_makenpc_fromasset(arg0, arg1 = false, arg2 = false)
{
	var sourcenpc = arg0
	var _mysprite = layer_sprite_get_sprite(sourcenpc)
	var _myx = layer_sprite_get_x(sourcenpc)
	var _myy = layer_sprite_get_y(sourcenpc)
	var _myxscale = layer_sprite_get_xscale(sourcenpc)
	var _myyscale = layer_sprite_get_yscale(sourcenpc)
	var _myalpha = layer_sprite_get_alpha(sourcenpc)
	var _myangle = layer_sprite_get_angle(sourcenpc)
	var _myblend = layer_sprite_get_blend(sourcenpc)
	var _myspeed = layer_sprite_get_speed(sourcenpc)
	var _myindex = layer_sprite_get_index(sourcenpc)
	var _npc = instance_create_depth(0, 0, 0, obj_trigger_interact)
	_npc.marker = scr_marker_ext(_myx, _myy, _mysprite, _myxscale, _myyscale, 0, _myindex, _myblend, _npc.depth, undefined, undefined, _myalpha, arg1)
	var truex = _npc.marker.bbox_left
	var truey = _npc.marker.bbox_top
	var truexscale = _npc.marker.bbox_right - _npc.marker.bbox_left
	var trueyscale = _npc.marker.bbox_bottom - _npc.marker.bbox_top
	setxy(truex, truey, _npc)
	_npc.markerxoffset = truex - _npc.marker.x
	_npc.markeryoffset = truey - _npc.marker.y
	_npc.markerstick = true
	scr_sizeexact(truexscale, trueyscale, _npc)
	
	if (arg2 && scr_debug())
	{
		_npc.visible = true
		_npc.image_alpha = 1
	}
	
	_npc.strict = true
	_npc.issolid = true
	_npc.talked = 0
	scr_depth_alt(_npc.marker)
	return _npc;
}

function scr_makenpc_from_marker(arg0, arg1 = false){
	var sourcenpc = arg0
	var _mysprite = sourcenpc.sprite_index
	var _myx = sourcenpc.x
	var _myy = sourcenpc.y
	var _myxscale = sourcenpc.image_xscale
	var _myyscale = sourcenpc.image_yscale
	var _myalpha = sourcenpc.image_alpha
	var _myangle = sourcenpc.image_angle
	var _myblend = sourcenpc.image_blend
	var _myspeed = sourcenpc.image_speed
	var _npc = instance_create_depth(0, 0, 0, obj_trigger_interact)
	_npc.marker = arg0
	var truex = _npc.marker.bbox_left
	var truey = _npc.marker.bbox_top
	var truexscale = _npc.marker.bbox_right - _npc.marker.bbox_left
	var trueyscale = _npc.marker.bbox_bottom - _npc.marker.bbox_top
	setxy(truex, truey, _npc)
	_npc.markerxoffset = truex - _npc.marker.x
	_npc.markeryoffset = truey - _npc.marker.y
	_npc.markerstick = true
	scr_sizeexact(truexscale, trueyscale, _npc)
	
	if (arg1)
	{
		if (scr_debug())
		{
			_npc.visible = true
			_npc.image_alpha = 1
		}
	}
	
	_npc.strict = true
	_npc.issolid = true
	_npc.talked = 0
	scr_depth_alt(_npc.marker)
	return _npc;
}
