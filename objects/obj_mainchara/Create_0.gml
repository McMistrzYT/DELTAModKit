global.currentroom = scr_get_id_by_room_index(room);
scr_character_set_names();

autorun = 0;
bg = 0;
is_using_held_item = false;

scr_depth();
stepping = 0;
stepped = 0;
drawbattlemode = 1;
battlemode = 0;
battleheart = instance_create(x, y, obj_overworldheart);
battleheart.image_alpha = 0;
battleheart.image_speed = 0;
battlealpha = 0;
becamebattle = 0;
sliding = 0;
becamesword = 0;
swordmode = 0;
swordcon = 0;
swordtimer = 0;
stop_movement = 0;
roomenterfreezeend = 0;
climbing = 0;
climbbuffer = 0;
floorheight = 0;
darkmode = global.darkzone;

cutscene = 0;
press_l = 0;
press_r = 0;
press_d = 0;
press_u = 0;
px = 0;
py = 0;
wallcheck = 0;
wspeed = 3;
bwspeed = 3;

if (darkmode == 1)
{
    bwspeed = 4;
    wspeed = 4;
}

canrun = true;
run = 0;
runtimer = 0;
runcounter = 0;
drawdebug = 0;
ignoredepth = 0;

freeze = 0;
holding_item = noone
disable_interaction_checks = false
subxspeed = 0;
subyspeed = 0;
subx = 0;
suby = 0;
walkanim = 0;
walkbuffer = 0;
walktimer = 0;

image_speed = 0;
dsprite = spr_krisd;
rsprite = spr_krisr;
usprite = spr_krisu;
lsprite = spr_krisl;
climbsprite = 3707;
timebetweenwalkframes = 10
halign = 0
valign = 0
depthbonus = 0

if darkmode {
	dsprite = spr_krisd_dark;
	rsprite = spr_krisr_dark;
	usprite = spr_krisu_dark;
	lsprite = spr_krisl_dark;	
	
	stepping = 1;
    image_xscale = 2;
    image_yscale = 2;
}

scr_character_set_caterpillar_offsets(global.char[0])
scr_character_set_caterpillar_sprites(global.char[0])

init_clothes = false;

swordfacing = 1;
swordsprite = rsprite;
fun = 0;

if (global.facing == 0) sprite_index = dsprite;
if (global.facing == 1) sprite_index = rsprite;
if (global.facing == 2) sprite_index = usprite;
if (global.facing == 3) sprite_index = lsprite;

onebuffer = 0;
twobuffer = 0;
threebuffer = 0;
global.menuno = 0;

for (i = 0; i < 10; i += 1)
    global.menucoord[i] = 0;

cameFromEntrance = global.entrance;

if (global.interact == 3) {
	noentrancefound = 0;
    
	if (global.entrance > 0)
	{
	    if (global.flag[21] <= 0)
	    {
	        global.interact = 0;
	        global.flag[21] = -10;
	        roomenterfreezeend = 1;
	    }
        
	    switch (global.entrance)
	    {
	        case 1:
	            if (i_ex(obj_markerA))
	                setxy(obj_markerA.x, obj_markerA.y);
	            else
	                noentrancefound = 1;
                
	            break;
            
	        case 2:
	            if (i_ex(obj_markerB))
	                setxy(obj_markerB.x, obj_markerB.y);
	            else
	                noentrancefound = 1;
                
	            break;
            
	        case 3:
	            if (i_ex(obj_markerC))
	                setxy(obj_markerC.x, obj_markerC.y);
	            else
	                noentrancefound = 1;
                
	            break;
            
	        case 4:
	            if (i_ex(obj_markerD))
	                setxy(obj_markerD.x, obj_markerD.y);
	            else
	                noentrancefound = 1;
                
	            break;
            
	        case 5:
	            if (i_ex(obj_markerE))
	                setxy(obj_markerE.x, obj_markerE.y);
	            else
	                noentrancefound = 1;
                
	            break;
            
	        case 6:
	            if (i_ex(obj_markerF))
	                setxy(obj_markerF.x, obj_markerF.y);
	            else
	                noentrancefound = 1;
                
	            break;
            
	        case 18:
	            if (i_ex(obj_markerr))
	                setxy(obj_markerr.x, obj_markerr.y);
	            else
	                noentrancefound = 1;
                
	            break;
            
	        case 19:
	            if (i_ex(obj_markers))
	                setxy(obj_markers.x, obj_markers.y);
	            else
	                noentrancefound = 1;
                
	            break;
            
	        case 20:
	            if (i_ex(obj_markert))
	                setxy(obj_markert.x, obj_markert.y);
	            else
	                noentrancefound = 1;
                
	            break;
            
	        case 21:
	            if (i_ex(obj_markeru))
	                setxy(obj_markeru.x, obj_markeru.y);
	            else
	                noentrancefound = 1;
                
	            break;
            
	        case 22:
	            if (i_ex(obj_markerv))
	                setxy(obj_markerv.x, obj_markerv.y);
	            else
	                noentrancefound = 1;
                
	            break;
            
	        case 23:
	            if (i_ex(obj_markerw))
	                setxy(obj_markerw.x, obj_markerw.y);
	            else
	                noentrancefound = 1;
                
	            break;
            
	        case 24:
	            if (i_ex(obj_markerX))
	                setxy(obj_markerX.x, obj_markerX.y);
	            else
	                noentrancefound = 1;
                
	            break;
            
	        default:
	            noentrancefound = 1;
	    }
        
	    if (noentrancefound == 1){
	        if (i_ex(obj_markerAny)) {
				for (var i = 0; i < instance_count; i++) {
					var findo = instance_id_get(i)
					if findo.object_index == obj_markerAny {
						if findo.image_index == global.entrance {
							x = findo.x
							y = findo.y
								
							if (variable_global_exists("marker_lerpX") && variable_global_exists("marker_lerpY")){ // Why do these use "noone" when they're numbers not instances?
								if (global.marker_lerpX != noone){
									x = lerp(findo.bbox_left, findo.bbox_right, global.marker_lerpX)
									global.marker_lerpX = noone
									used_vertical_transition = true
								}
							
								if (global.marker_lerpY != noone){
									y = lerp(findo.bbox_top, findo.bbox_bottom, global.marker_lerpY)
									global.marker_lerpY = noone
								}
							}
						}
					}
				}
			}
	        else
	        {
	            setxy(room_width / 2, room_height / 2);
	            debug_log("entrance not found, setting to center of room");
	            debug_log("entrance requested was global.entrance=" + string(global.entrance));
	        }
	    }
	}
}

initwd = sprite_width;
initht = sprite_height;
mywidth = sprite_width;
myheight = sprite_height;
interactedobject = noone

// @desc Checks if kris and the floorobject is on the Same Height (Only Defined in obj_mainchara so it can only be used in that Scope.)
function check_heightfloor(xcheck, ycheck, floorobject) {
    var __onfloor = 0;
    var __inst = instance_position(bbox_right + xcheck, bbox_top + ycheck, floorobject);
    
    if (__inst != noone) {
        if (__inst.floorheight == floorheight)
            __onfloor++;
    }
    
    __inst = instance_position(bbox_right + xcheck, bbox_bottom + ycheck, floorobject);
    if (__inst != noone) {
        if (__inst.floorheight == floorheight)
            __onfloor++;
    }
    
    __inst = instance_position(bbox_left + xcheck, bbox_top + ycheck, floorobject);
    if (__inst != noone) {
        if (__inst.floorheight == floorheight)
            __onfloor++;
    }
    
    __inst = instance_position(bbox_left + xcheck, bbox_bottom + ycheck, floorobject);
    if (__inst != noone) {
        if (__inst.floorheight == floorheight)
            __onfloor++;
    }
    
    if (__onfloor == 4)
        __onfloor = true;
    else
        __onfloor = false;
    
    return __onfloor;
}

nudgex = 0;
nudgey = 0;
nudgelerp = 0.1;


if scr_flag_get(DRFLAG.HeldOverworldItemId_ForceStart) > 0 {
	var overworlditemid = scr_flag_get(DRFLAG.HeldOverworldItemId_ForceStart)
	scr_flag_set(DRFLAG.HeldOverworldItemId_ForceStart, DROverworldItem.None)
	
	holding_item = scr_overworlditem_create(overworlditemid)
	
}

noclip = false;


if (scr_debug()) {
	if (layer_exists("OBJECTS_MAIN")) {
		if (!layer_get_visible("OBJECTS_MAIN")) {
			scr_debug_print("OBJECTS_MAIN layer is disabled! See console.")
			show_debug_message_concat("OBJECTS_MAIN layer is disabled in room: ", room_get_name(room), "    Turn on before you save!")
			layer_set_visible("OBJECTS_MAIN", true)
		}
	}
}

darkrunmultiplierchangeamt = 0.8	// Default == 0.8
runspeedadder = 1					// Default == 1