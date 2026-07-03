function scr_maincharacters_actors(required = []){
    actor_count = -1;
	/*
	    kr = 0;
	    kr_actor = instance_create(obj_mainchara.x, obj_mainchara.y, obj_actor);
	    scr_actor_setup(kr, kr_actor, "kris");
	    kr_actor.sprite_index = obj_mainchara.sprite_index;
	    kr_actor.depth = obj_mainchara.depth;
	*/
    allactors = {}
    with (obj_mainchara) visible = 0;
	
	var _actorspawned = {}
	
    for (__jj = -1; __jj < array_length_1d(global.cinstance); __jj++) {
		var slot = noone
		if __jj < 0 {
			slot = obj_mainchara 
			slot.name = "kris"
			slot.target = 0
			slot.facing[slot.target] = global.facing
		} else {
			slot = global.cinstance[__jj]
		}
        if i_ex(slot) {
			var myname = string(slot.name)
			var myactor = scr_spawnmaincharacteractor(myname, slot)
			myactor.spawnedfromparty = true
			_actorspawned[$ myname] = true
        }
    }
	
	show_debug_message(_actorspawned)
	for (var i = 0; i < array_length(required); i++) {
		var myname = string(required[i])
		show_debug_message(myname)
		if !(_actorspawned[$ myname] ?? false) {
			var myactor = scr_spawnmaincharacteractor(myname)			
			_actorspawned[$ myname] = true
			myactor.spawnedfromparty = false
		}
	}
	
}

/// @desc Called by scr_maincharacters_actors Do not call on its own
function scr_spawnmaincharacteractor(myname, actorbaseinstance = noone){
	var hasbaseobject = i_ex(actorbaseinstance)
	if !hasbaseobject actorbaseinstance = new Vector2(0, 0)
	actor_count++
	var nullactordata = {}
					
	nullactordata[$ "actid"] = actor_count + 1
	nullactordata[$ "instance"] = instance_create(actorbaseinstance.x, actorbaseinstance.y, obj_actor);
	scr_actor_setup(nullactordata[$ "actid"], nullactordata[$ "instance"], myname);
	if hasbaseobject {
		nullactordata[$ "instance"].sprite_index = actorbaseinstance.sprite_index;
		nullactordata[$ "instance"].depth = actorbaseinstance.depth;
		nullactordata[$ "instance"].facing = scr_get_cardinal_direction((actorbaseinstance.facing[actorbaseinstance.target] * 90) - 90)
		
		with (actorbaseinstance) {
			visible = 0
			depth = nullactordata[$ "instance"].depth
			if !fun && runmove {
				with nullactordata[$ "instance"] {
					sprite_index = variable_struct_get(self, string(facing) + "sprite")
				}
			}
		}
	} else {
		with nullactordata[$ "instance"] {
			sprite_index = dsprite
		}
	}
			
	allactors[$ myname] = nullactordata
	
	
	var myidentifier = scr_caterpillar_getactorvariable(myname)
	if !is_undefined(myidentifier) && is_string(myidentifier) {
		variable_struct_set(self, myidentifier, nullactordata[$ "actid"])
		variable_struct_set(self, myidentifier + "_actor", nullactordata[$ "instance"])
	}
	
	return nullactordata[$ "instance"]
}

function scr_actor_setup(actid, actinst, actname)
{
    _actorid = actid;
    _actorinstance = actinst;
    _actorname = actname;
    obj_cutscene_master.actor_id[_actorid] = _actorinstance;
    obj_cutscene_master.actor_name[_actorid] = _actorname;
    
    with (_actorinstance)
    {
        number = actid;
        scr_set_facing_sprites(actname);
    }
}

function scr_actor_setup_nofacing(actid, actinst, actname)
{
    _actorid = actid;
    _actorinstance = actinst;
    _actorname = actname;
    obj_cutscene_master.actor_id[_actorid] = _actorinstance;
    obj_cutscene_master.actor_name[_actorid] = _actorname;
    _actorinstance.name = _actorname;
	_actorinstance.number = actid;
}

function scr_findactor(arg0)
{
    with (obj_cutscene_master)
    {
        __foundactor = -1;
        
        for (_jjj = 0; _jjj < 20; _jjj++)
        {
            if (actor_name[_jjj] == arg0 && i_ex(actor_id[_jjj]))
                __foundactor = _jjj;
        }
        
        return __foundactor;
    }
}
