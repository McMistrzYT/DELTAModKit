function draw_sprite_ext_centerscale(sprite, subimg, x, y, xscale, yscale, rot, col, alpha){
	var _xoff = sprite_get_xoffset(sprite) * image_xscale
	var _yoff = sprite_get_yoffset(sprite) * image_yscale
	var _sprite_width = sprite_get_width(sprite) * image_xscale
	var _sprite_height = sprite_get_height(sprite) * image_yscale
	draw_sprite_ext(sprite, subimg, x - (((_sprite_width - _xoff) * (xscale - image_xscale)) / 2), y - (((_sprite_height - _yoff) * (yscale - image_yscale)) / 2), xscale, yscale, rot, col, alpha)
}


function scr_draw_outline_ext(sprite, subimg, x, y, xscale, yscale, rot, outlinecolor, alpha, size){
	gpu_set_fog(true, outlinecolor, 0, 0)
	var __xdirA = size
	var __xdirB = 0
	var __ydirA = 0
	var __ydirB = size
	
	if ((rot % 90) != 0) {
		__xdirA = lengthdir_x(size, rot)
		__xdirB = lengthdir_x(size, rot + 90)
		__ydirA = lengthdir_y(size, rot + 90)
		__ydirB = lengthdir_y(size, rot)
	}
	
	draw_sprite_ext(sprite, subimg, x + __xdirA, y + __ydirA, xscale, yscale, rot, c_white, alpha)
	draw_sprite_ext(sprite, subimg, x - __xdirA, y - __ydirA, xscale, yscale, rot, c_white, alpha)
	draw_sprite_ext(sprite, subimg, x + __xdirB, y + __ydirB, xscale, yscale, rot, c_white, alpha)
	draw_sprite_ext(sprite, subimg, x - __xdirB, y - __ydirB, xscale, yscale, rot, c_white, alpha)
	gpu_set_fog(false, c_white, 0, 0)
}

// Ch5+ Stuff, for some reason doesn't use the scr_ prefix

function findsprite(spriteid, layertosearch = "all", spriteblend = -99999, spritexscale = -99999, spriteyscale = -99999, spriteimageindex = -99999, spritespeed = -99999){
	var layerstocheck = []
	var spritestocheck = []
	
	if (layertosearch == "all")
		layerstocheck = layer_get_all()
	else
		layerstocheck = [layertosearch]
	
	for (var i = 0; i < array_length(layerstocheck); i++) {
		var elements = layer_get_all_elements(layerstocheck[i])
		
		for (var j = 0; j < array_length(elements); j++) {
			if (layer_get_element_type(elements[j]) == layerelementtype_sprite) {
				if (layer_sprite_get_sprite(elements[j]) == spriteid)
					array_push(spritestocheck, elements[j])
			}
		}
	}
	
	for (var i = 0; i < array_length(spritestocheck); i++) {
		var isitme = true
		if (spriteblend != -99999) {
			if (layer_sprite_get_blend(spritestocheck[i]) != spriteblend) isitme = false
		}
		
		if (spritexscale != -99999) {
			if (layer_sprite_get_xscale(spritestocheck[i]) != spritexscale) isitme = false
		}
		
		if (spriteyscale != -99999) {
			if (layer_sprite_get_yscale(spritestocheck[i]) != spriteyscale) isitme = false
		}
		
		if (sprite_get_speed_type(spriteid) == 0) show_debug_message_concat("Warning, sprite: ", sprite_get_name(spriteid), " is set to Frames Per Second instead of Frames Per Game Frame")		
		
		if (spriteimageindex != -99999) {
			if (layer_sprite_get_index(spritestocheck[i]) != spriteimageindex) isitme = false
		}
		
		if (spritespeed != -99999) {
			if (layer_sprite_get_speed(spritestocheck[i]) != spritespeed) isitme = false
		}
		
		if (isitme) return spritestocheck[i];
	}
	
	show_debug_message_concat("findsprite: asset not found:", sprite_get_name(spriteid), "| ", layertosearch)
	return noone;
}

function findsprite_all(spriteid, layertosearch = "all", spriteblend = -99999, spritexscale = -99999, spriteyscale = -99999, spriteimageindex = -99999, spritespeed = -99999) {
	var layerstocheck = []
	var spritestocheck = []
	
	if (layertosearch == "all")
		layerstocheck = layer_get_all()
	else
		layerstocheck = [layertosearch]
	
	for (var i = 0; i < array_length(layerstocheck); i++) {
		var elements = layer_get_all_elements(layerstocheck[i])
		
		for (var j = 0; j < array_length(elements); j++) {
			if (layer_get_element_type(elements[j]) == layerelementtype_sprite) {
				if (layer_sprite_get_sprite(elements[j]) == spriteid)
					array_push(spritestocheck, elements[j])
			}
		}
	}
	
	var matchingsprites = []
	
	for (var i = 0; i < array_length(spritestocheck); i++) {
		var isitme = true
		
		if (spriteblend != -99999) {
			if (layer_sprite_get_blend(spritestocheck[i]) != spriteblend) isitme = false
		}
		
		if (spritexscale != -99999) {
			if (layer_sprite_get_xscale(spritestocheck[i]) != spritexscale) isitme = false
		}
		
		if (spriteyscale != -99999) {
			if (layer_sprite_get_yscale(spritestocheck[i]) != spriteyscale) isitme = false
		}
		
		if (spriteimageindex != -99999) {
			if (layer_sprite_get_index(spritestocheck[i]) != spriteimageindex) isitme = false
		}
		
		if (spritespeed != -99999) {
			if (layer_sprite_get_speed(spritestocheck[i]) != spritespeed) isitme = false
		}
		
		if (isitme) array_push(matchingsprites, spritestocheck[i])
	}
	
	if (array_length(matchingsprites) > 0) {
		return matchingsprites;
	} else {
		show_debug_message_concat("findsprite_all: asset not found:", sprite_get_name(spriteid), "| ", layertosearch)
		return [];
	}
}

function findsprite_layer(layername){
	if (layer_exists(layername)) {
		var layerList = []
		var elements = layer_get_all_elements(layername)
		
		for (var j = 0; j < array_length(elements); j++) {
			if (layer_get_element_type(elements[j]) == layerelementtype_sprite) array_push(layerList, elements[j])
		}
		
		return layerList;
	} else {
		scr_debug_print("Asset Layer Not Found: findsprite_layer(" + layername + ")")
		return [];
	}
}

function findspriteinfo_layer(layername){
	if (layer_exists(layername)) {
		var layerList = []
		var elements = layer_get_all_elements(layername)
		
		for (var j = 0; j < array_length(elements); j++) {
			if (layer_get_element_type(elements[j]) == layerelementtype_sprite) {
				var spr = elements[j]
				var thisAsset = {
					sprite_index: layer_sprite_get_sprite(spr),
					mask_index: layer_sprite_get_sprite(spr),
					image_index: layer_sprite_get_index(spr),
					image_speed: layer_sprite_get_speed(spr),
					image_xscale: layer_sprite_get_xscale(spr),
					image_yscale: layer_sprite_get_yscale(spr),
					image_angle: layer_sprite_get_angle(spr),
					image_blend: layer_sprite_get_blend(spr),
					image_alpha: layer_sprite_get_alpha(spr),
					sprite_width: sprite_get_width(layer_sprite_get_sprite(spr)) * layer_sprite_get_xscale(spr),
					sprite_height: sprite_get_height(layer_sprite_get_sprite(spr)) * layer_sprite_get_yscale(spr),
					x: layer_sprite_get_x(spr),
					y: layer_sprite_get_y(spr),
					bbox_left: layer_sprite_get_x(spr) + sprite_get_bbox_left(layer_sprite_get_sprite(spr)),
					bbox_top: layer_sprite_get_y(spr) + sprite_get_bbox_top(layer_sprite_get_sprite(spr)),
					bbox_right: layer_sprite_get_x(spr) + (sprite_get_bbox_right(layer_sprite_get_sprite(spr)) * layer_sprite_get_xscale(spr)),
					bbox_bottom: layer_sprite_get_y(spr) + (sprite_get_bbox_bottom(layer_sprite_get_sprite(spr)) * layer_sprite_get_yscale(spr)),
					depth: 0
				}
				array_push(layerList, thisAsset)
			}
		}
		
		return layerList;
	} else {
		scr_debug_print("Asset Layer Not Found: findspriteinfo_layer(" + layername + ")")
		return [];
	}
}

function findspriteinfo(spriteid, layertosearch = "all", spriteblend = -99999, spritexscale = -99999, spriteyscale = -99999, spriteimageindex = -99999, spritespeed = -99999){
	var spr = findsprite(spriteid, layertosearch, spriteblend, spritexscale, spriteyscale, spriteimageindex, spritespeed)
	
	if (spr == noone) show_debug_message_concat("findspriteinfo: asset not found:", sprite_get_name(spriteid), "| ", layertosearch)
	
	var myreturn = {
		sprite_index: layer_sprite_get_sprite(spr),
		mask_index: layer_sprite_get_sprite(spr),
		image_index: layer_sprite_get_index(spr),
		image_speed: layer_sprite_get_speed(spr),
		image_xscale: layer_sprite_get_xscale(spr),
		image_yscale: layer_sprite_get_yscale(spr),
		image_angle: layer_sprite_get_angle(spr),
		image_blend: layer_sprite_get_blend(spr),
		image_alpha: layer_sprite_get_alpha(spr),
		sprite_width: sprite_get_width(layer_sprite_get_sprite(spr)) * layer_sprite_get_xscale(spr),
		sprite_height: sprite_get_height(layer_sprite_get_sprite(spr)) * layer_sprite_get_yscale(spr),
		x: layer_sprite_get_x(spr),
		y: layer_sprite_get_y(spr),
		bbox_left: layer_sprite_get_x(spr) + sprite_get_bbox_left(layer_sprite_get_sprite(spr)),
		bbox_top: layer_sprite_get_y(spr) + sprite_get_bbox_top(layer_sprite_get_sprite(spr)),
		bbox_right: layer_sprite_get_x(spr) + (sprite_get_bbox_right(layer_sprite_get_sprite(spr)) * layer_sprite_get_xscale(spr)),
		bbox_bottom: layer_sprite_get_y(spr) + (sprite_get_bbox_bottom(layer_sprite_get_sprite(spr)) * layer_sprite_get_yscale(spr)),
		depth: 0
	}
	return myreturn;
}

function findspriteinfo_all(spriteid, layertosearch = "all", spriteblend = -99999, spritexscale = -99999, spriteyscale = -99999, spriteimageindex = -99999, spritespeed = -99999){
	var spr = findsprite_all(spriteid, layertosearch, spriteblend, spritexscale, spriteyscale, spriteimageindex, spritespeed)
	var info_all = []
	
	for (var i = 0; i < array_length(spr); i++) {
		var myreturn = {
			sprite_index: layer_sprite_get_sprite(spr[i]),
			mask_index: layer_sprite_get_sprite(spr[i]),
			image_index: layer_sprite_get_index(spr[i]),
			image_speed: layer_sprite_get_speed(spr[i]),
			image_xscale: layer_sprite_get_xscale(spr[i]),
			image_yscale: layer_sprite_get_yscale(spr[i]),
			image_angle: layer_sprite_get_angle(spr[i]),
			image_blend: layer_sprite_get_blend(spr[i]),
			image_alpha: layer_sprite_get_alpha(spr[i]),
			sprite_width: sprite_get_width(layer_sprite_get_sprite(spr[i])) * layer_sprite_get_xscale(spr[i]),
			sprite_height: sprite_get_height(layer_sprite_get_sprite(spr[i])) * layer_sprite_get_yscale(spr[i]),
			x: layer_sprite_get_x(spr[i]),
			y: layer_sprite_get_y(spr[i]),
			bbox_left: layer_sprite_get_x(spr[i]) + sprite_get_bbox_left(layer_sprite_get_sprite(spr[i])),
			bbox_top: layer_sprite_get_y(spr[i]) + sprite_get_bbox_top(layer_sprite_get_sprite(spr[i])),
			bbox_right: layer_sprite_get_x(spr[i]) + (sprite_get_bbox_right(layer_sprite_get_sprite(spr[i])) * layer_sprite_get_xscale(spr[i])),
			bbox_bottom: layer_sprite_get_y(spr[i]) + (sprite_get_bbox_bottom(layer_sprite_get_sprite(spr[i])) * layer_sprite_get_yscale(spr[i])),
			depth: 0
		}
		array_push(info_all, myreturn)
	}
	
	if (array_length(info_all) > 0) {
		return info_all;
	} else {
		show_debug_message_concat("findspriteinfo_all: asset not found:", sprite_get_name(spriteid), "| ", layertosearch)
		return [];
	}
}
