variable_global_set("%%ACTORDEFAULTFACINGSPRITES%%", {})
variable_global_set("%%ACTORNAMECHANGER%%", {})

global.useoldactorspritesystem = false // Change this value to true to switch to Deltarune's facingsprites sprite System!

function scr_set_facing_sprites(arg0)
{
    _actorname = arg0;
    name = arg0;
    
	if !global.useoldactorspritesystem
	{
		_actorname = scr_getfacingspritessubname(name)
		var data = scr_getfacingsprites(_actorname)
		if data != noone
		{
			dsprite = data.down
			usprite = data.up
			lsprite = data.left
			rsprite = data.right
		}
	    specialsprite[0] = dsprite;
	    specialsprite[1] = rsprite;
	    specialsprite[2] = usprite;
	    specialsprite[3] = lsprite;
	    dtsprite = dsprite;
	    rtsprite = rsprite;
	    utsprite = usprite;
	    ltsprite = lsprite;
		exit
	}
	
    if (is_string(_actorname))
    {
        if (_actorname == "kris")
        {
            name = "kris";
            
            if (global.darkzone == 0)
                _actorname = "krislight";
            
            if (global.darkzone == 1)
                _actorname = "krisdark";
        }
        
        if (_actorname == "susie")
        {
            name = "susie";
            
            if (global.darkzone == 0)
            {
                _actorname = "susielight";
                
                if (global.chapter >= 2)
                    _actorname = "susielighteyes";
            }
            
            if (global.darkzone == 1)
            {
                if (global.chapter == 1)
                    _actorname = "susiedark";
                
                if (global.chapter >= 2)
                    _actorname = "susiedarkeyes";
            }
        }
        
        if (_actorname == "ralsei")
        {
            name = "ralsei";
            
            if (global.chapter <= 1)
                _actorname = "ralseihat";
            
            if (global.chapter > 1)
                _actorname = "ralseinohat";
        }
        
        if (_actorname == "noelle")
        {
            name = "noelle";
            
            if (global.darkzone == 0)
                _actorname = "noellelight";
            
            if (global.darkzone == 1)
                _actorname = "noelledark";
        }
        
        if (_actorname == "berdly")
        {
            name = "berdly";
            
            if (global.darkzone == 0)
                _actorname = "berdlylight";
            
            if (global.darkzone == 1)
                _actorname = "berdlydark";
        }
        
        if (_actorname == "krislight")
        {
            usprite = spr_krisu;
            rsprite = spr_krisr;
            dsprite = spr_krisd;
            lsprite = spr_krisl;
        }
        
        if (_actorname == "krisdark")
        {
            usprite = spr_krisu_dark;
            rsprite = spr_krisr_dark;
            dsprite = spr_krisd_dark;
            lsprite = spr_krisl_dark;
        }
        
        if (_actorname == "susielight" || _actorname == "susielighteyes")
        {
            usprite = spr_susie_walk_up_lw;
            rsprite = spr_susie_walk_right_lw;
            dsprite = spr_susie_walk_down_lw;
            lsprite = spr_susie_walk_left_lw;
        }
        
        if (_actorname == "susiedark" || _actorname == "susiedarkeyes")
        {
            usprite = spr_susieu_dark;
            rsprite = spr_susier_dark;
            dsprite = spr_susied_dark;
            lsprite = spr_susiel_dark;
            //specialsprite[4] = spr_susie_shock_r;
            //specialsprite[5] = spr_susie_shock;
        }
        
        /*if (_actorname == "susiedarkeyes")
        {
            usprite = spr_susie_walk_up_dw;
            rsprite = spr_susie_walk_right_dw;
            dsprite = spr_susie_walk_down_dw;
            lsprite = spr_susie_walk_left_dw;
            specialsprite[4] = spr_susie_shock_r;
            specialsprite[5] = spr_susie_shock;
        }*/
        
        /*if (_actorname == "susieunhappy")
        {
            name = "susie";
            
            if (global.darkzone == 1)
            {
                usprite = spr_susie_walk_up_dw;
                rsprite = spr_susie_walk_right_dw_unhappy;
                dsprite = spr_susie_walk_down_dw_unhappy;
                lsprite = spr_susie_walk_left_dw_unhappy;
            }
            else
            {
                usprite = spr_susie_walk_up_lw;
                rsprite = spr_susie_walk_right_lw_unhappy;
                dsprite = spr_susie_walk_down_lw_unhappy;
                lsprite = spr_susie_walk_left_lw_unhappy;
            }
            
            specialsprite[4] = spr_susie_shock_r;
            specialsprite[5] = spr_susie_shock;
        }
        
        if (_actorname == "noellelight")
        {
            usprite = spr_noelle_walk_up_lw;
            rsprite = spr_noelle_walk_right_lw;
            dsprite = spr_noelle_walk_down_lw;
            lsprite = spr_noelle_walk_left_lw;
        }
        
        if (_actorname == "noelledark")
        {
            usprite = spr_noelle_walk_up_dw;
            lsprite = spr_noelle_walk_left_dw;
            rsprite = spr_noelle_walk_right_dw;
            dsprite = spr_noelle_walk_down_dw;
        }
        
        if (_actorname == "berdlylight")
        {
            usprite = spr_berdly_walk_up_lw;
            rsprite = spr_berdly_walk_right_lw;
            dsprite = spr_berdly_walk_down_lw;
            lsprite = spr_berdly_walk_left_lw;
        }
        
        if (_actorname == "berdlydark")
        {
            usprite = spr_berdly_walk_up_dw;
            lsprite = spr_berdly_walk_left_dw;
            rsprite = spr_berdly_walk_right_dw;
            dsprite = spr_berdly_walk_down_dw;
        }
        
        if (_actorname == "berdlyunhappy")
        {
            usprite = spr_berdly_walk_up_dw;
            lsprite = spr_berdly_walk_left_dw_unhappy;
            rsprite = spr_berdly_walk_right_dw_unhappy;
            dsprite = spr_berdly_walk_down_dw_unhappy;
        }
        
        if (_actorname == "ralseihat")
        {
            name = "ralsei";
            usprite = spr_ralseiu;
            rsprite = spr_ralseir;
            dsprite = spr_ralseid;
            lsprite = spr_ralseil;
            specialsprite[5] = spr_ralsei_shock_overworld;
        }*/
        
        if (_actorname == "ralseinohat")
        {
            name = "ralsei";
            usprite = spr_ralsei_walk_up;
            rsprite = spr_ralsei_walk_right;
            dsprite = spr_ralsei_walk_down;
            lsprite = spr_ralsei_walk_left;
        }
        
        /*if (_actorname == "ralseiunhappy")
        {
            name = "ralsei";
            usprite = spr_ralsei_walk_up;
            rsprite = spr_ralsei_walk_right_unhappy;
            dsprite = spr_ralsei_walk_down_unhappy;
            lsprite = spr_ralsei_walk_left_unhappy;
        }
        
        if (_actorname == "lancer")
        {
            name = "lancer";
            usprite = spr_lancer_ut;
            rsprite = spr_lancer_rt;
            dsprite = spr_lancer_dt;
            lsprite = spr_lancer_lt;
        }
        
        if (_actorname == "toriel")
        {
            name = "toriel";
            usprite = spr_toriel_u;
            rsprite = spr_toriel_r;
            dsprite = spr_toriel_d;
            lsprite = spr_toriel_l;
        }
        
        if (_actorname == "alphys")
        {
            name = "alphys";
            usprite = spr_alphysu;
            rsprite = spr_alphysr;
            dsprite = spr_alphysd;
            lsprite = spr_alphysl;
        }
        
        if (_actorname == "car")
        {
            usprite = spr_torcar_u;
            dsprite = spr_torcar_d;
            lsprite = spr_torcar_l;
            rsprite = spr_torcar_r;
        }
        
        if (_actorname == "queen")
        {
            name = "queen";
            usprite = spr_queen_walk_up;
            dsprite = spr_queen_walk_down;
            lsprite = spr_queen_walk_left;
            rsprite = spr_queen_walk_right;
        }
        
        if (_actorname == "queenchair")
        {
            name = "queen";
            usprite = spr_queen_chair_swish_wine;
            dsprite = spr_queen_chair_swish_wine;
            lsprite = spr_queen_chair_swish_wine;
            rsprite = spr_queen_chair_swish_wine;
            specialsprite[4] = spr_queen_chair_ohoho_2;
            specialsprite[5] = spr_queen_chair_ohoho_1;
        }
        
        if (_actorname == "asgore")
        {
            name = "asgore";
            usprite = spr_asgoreu;
            dsprite = spr_asgored;
            lsprite = spr_asgorel;
            rsprite = spr_asgorer;
        }*/
    }
    else
    {
        usprite = _actorname;
        dsprite = _actorname;
        rsprite = _actorname;
        lsprite = _actorname;
        sprite_index = _actorname;
    }
    
    specialsprite[0] = dsprite;
    specialsprite[1] = rsprite;
    specialsprite[2] = usprite;
    specialsprite[3] = lsprite;
    dtsprite = dsprite;
    rtsprite = rsprite;
    utsprite = usprite;
    ltsprite = lsprite;
}

function scr_createfacingsprites(nameidentifier, down,left,up,right)
{
	var facingdata = {}
	facingdata.name = nameidentifier
	facingdata.down = down
	facingdata.left = left
	facingdata.right = right
	facingdata.up = up
	variable_struct_set(variable_global_get("%%ACTORDEFAULTFACINGSPRITES%%"), nameidentifier, facingdata)
	return facingdata
}

function scr_createfacingspritessubname(name, nameidentifier)
{
	variable_struct_set(variable_global_get("%%ACTORNAMECHANGER%%"), name, nameidentifier)
}

function scr_getfacingspritessubname(name)
{
	var face = variable_global_get("%%ACTORNAMECHANGER%%")
	
	if variable_struct_exists(variable_global_get("%%ACTORNAMECHANGER%%"), name)
	{
		var data = variable_struct_get(variable_global_get("%%ACTORNAMECHANGER%%"), name)
		if is_string(data)
			return data;
		else if	is_method(data)
		{
			var data_convert = method(id, data)
			return data_convert()
		}
	}
	return name
}

function scr_getfacingsprites(nameidentifier)
{
	var face = variable_global_get("%%ACTORDEFAULTFACINGSPRITES%%");
	nameidentifier = scr_getfacingspritessubname(nameidentifier); // Just In Case
	if variable_struct_exists(face, nameidentifier)
	{
		return variable_struct_get(face, nameidentifier);
	}
	else
		return noone;
}

// Base Deltarune
scr_createfacingsprites("krislight", spr_krisd, spr_krisl, spr_krisu, spr_krisr)
scr_createfacingsprites("krisdark", spr_krisd_dark, spr_krisl_dark, spr_krisu_dark, spr_krisr_dark)

scr_createfacingsprites("susielighteyes", spr_susie_walk_down_lw, spr_susie_walk_left_lw, spr_susie_walk_up_lw, spr_susie_walk_right_lw)
scr_createfacingspritessubname("susielight", "susielighteyes") // Doesn't Exist in DELTAMODKIT
scr_createfacingspritessubname("susie", function() {
	var _actorname = "susiedark"
	if (global.darkzone == 0)
    {
            _actorname = "susielighteyes";
    }
            
    if (global.darkzone == 1)
    {
        if (global.chapter == 1)
        {
            _actorname = "susiedark";
        }
                
        if (global.chapter >= 2)
        {
            _actorname = "susiedarkeyes";
        }
    }
	return _actorname
})
scr_createfacingsprites("susiedark", spr_susied_dark, spr_susiel_dark, spr_susieu_dark, spr_susier_dark)
scr_createfacingsprites("susiedarkeyes", spr_susie_walk_down_dw, spr_susie_walk_left_dw, spr_susie_walk_up_dw, spr_susie_walk_right_dw)
scr_createfacingspritessubname("susieunhappy", function() {
if global.darkzone == true
	return "susiedarkeyes"
return "susielighteyes"
}) // Doesn't Exist in DELTAMODKIT

scr_createfacingspritessubname("kris", function() {
if global.darkzone == true
	return "krisdark"
return "krislight"
})

scr_createfacingsprites("ralseinohat", spr_ralsei_walk_down, spr_ralsei_walk_left, spr_ralsei_walk_up, spr_ralsei_walk_right)
scr_createfacingspritessubname("ralseihat", "ralseinohat") // Doesn't Exist yet in DELTAMODKIT, So it'll default to Ralsei's Nohat sprite

if sprite_exists(asset_get_index("spr_toriel_u")) // We can assume Toriel Exists
	scr_createfacingsprites("toriel", spr_toriel_d, spr_toriel_l, spr_toriel_u, spr_toriel_r)
if sprite_exists(asset_get_index("spr_torcar_u")) // We can assume Toriel's Car Exists
	scr_createfacingsprites("car", spr_torcar_d, spr_torcar_l, spr_torcar_u, spr_torcar_r)
