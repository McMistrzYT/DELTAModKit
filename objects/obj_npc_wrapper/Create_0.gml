npc = noone
animspeed = 30/240

setdialogue = function(talked){
	scr_speaker("no_name")
	msgset(0, "* PLACEHOLDER./%", "obj_npc_wrapper_slash_Create_0_gml_8_0")
}

alwaysanimate = false
typer = ""
con = 0
choices = []
anim_messages = []

function set_animate_messages(){
	anim_messages = []
	
	for (var i = 0; i < argument_count; i++) anim_messages[argument[i]] = true
}

step_function = function(){}
draw_function = function(){}
