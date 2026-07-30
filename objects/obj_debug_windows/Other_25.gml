button_amount = basebuttonamount
//show_message(basebuttonamount)
switch type {
	case ____DEBUGWINDOWS__TYPES.ObjectSelected: {
		__getselectedobject = function() {
			if i_ex(obj_debug_xy) && i_ex(obj_debug_xy.selected_object) return obj_debug_xy.selected_object
			return noone
		}
		_addbutton("Change Sprite Index", function() {
			with __getselectedobject() {
				var checksprite = asset_get_index(get_string("Enter new sprite_index.", ""));
				if sprite_exists(checksprite) sprite_index = checksprite
			}
		})
		_addbutton("Change Variable", function() {
			with __getselectedobject() {
				var varname = get_string("Enter variable name. No quotation marks.", "");
                
                if (variable_struct_exists(self, varname)) {
                    var foundvar = variable_struct_get(self, varname);
                    var strfoundvar = string(foundvar);
                    var newvalue = other._stringgettype(varname + " is " + strfoundvar + ". Enter new value.\nuse \"This for strings!\"\n[ \"This\", \"for\", \"arrays!\", 1225 ] and this: 124512125 for numbers", "");
                    variable_instance_set(self, varname, newvalue);
                } else show_message("No variable exists. Zannen.");
			}
		})
		//_addbutton("Change Variable (string)")
		_addbutton("Watch Variable", function() {
			with __getselectedobject() {
	            var varname = get_string("Enter variable name. No quotation marks. No arrays.", "");
                
		            if (variable_instance_exists(self, varname)) other.watchvar = varname;            
		            else show_message("No variable exists. Zannen.");
			
				}
		}, function(mydata) {
			watchvar = " "
			mydata.update = function(mydata) {
				var mytext = "Watch Variable"
				
				if watchvar != " " {
					var exists = true
					with __getselectedobject() {
						if variable_instance_exists(self, other.watchvar) {
							exists = true
							mytext = other.watchvar + ": " + string(variable_instance_get(self, other.watchvar));				
						}
					}
					if !exists watchvar = " "
				}
				
				button_text[mydata.index] = mytext
			}
		})
		_addbutton("DELETE OBJECT", function() { with __getselectedobject() { instance_destroy() } instance_destroy() })
	break; }
	case ____DEBUGWINDOWS__TYPES.NoObject: {
		_addbutton("Set Flag", function() {
	        var whatflag = -1;
	        whatflag = get_string("Which flag? ", "");
        
	        if (whatflag != "") {
	            whatflag = real(string_digits(whatflag));
            
	            if (whatflag > 0) {
	                var flagvalue = global.flag[whatflag];
	                flagvalue = get_string("Flag [" + string(whatflag) + "] is " + string(flagvalue) + ". Enter new value.", "");
                
	                if (flagvalue != "") global.flag[whatflag] = real(string_digits(flagvalue));
	            }
	        }	
		})
		_addbutton("Watch Flag", function() {
	        whatflag = get_string("Flag to watch? ", "");
        
	        if (whatflag != "") {
	            whatflag = real(string_digits(whatflag));            
	            if (whatflag > 0) watchflag = whatflag;
	        }
		
		}, function(mydata) {
			watchflag = -1
			mydata.update = function(mydata) {
				var mytext = "Watch Flag"
				
				if watchflag != -1 {
					mytext = "Flag [" + string(watchflag) + "] : " + string(global.flag[watchflag]) + " | " + scr_flag_name_get(watchflag);
				}
				
				button_text[mydata.index] = mytext
			}
		})
		_addbutton("Set/Check Global Var", function() {
			var varname = get_string("Enter variable name. No quotation marks.", "");
                
            if variable_global_exists(varname) {
                var varval = variable_global_get(varname);
                var newval = other._stringgettype("The value of " + varname + " is " + string(varval) + ". What to set it to?\nuse \"This for strings!\"\n[ \"This\", \"for\", \"arrays!\", 1225 ] and this: 124512125 for numbers", "");
                variable_global_set(varname, real(newval));
            } else show_message("No variable exists. Zannen.");		
		})
		_addbutton("Select Object", function() {
			var varname = get_string("object name?", "");
        
	        if (varname != "") {
	            if (i_ex(asset_get_index(varname))){
	                with (obj_debug_xy) selected_object = instance_find(asset_get_index(varname), 0);                
	                instance_destroy();
	            }
	        }	
		})
		_addbutton("Instance Create", function() {
			var varname = get_string("object name?", "");
        
	        if (varname != "") {
	            if (asset_get_index(varname) > 0) {
	                var bepis = instance_create(mouse_x, mouse_y, asset_get_index(varname));                
	                with (obj_debug_xy) selected_object = bepis;
                
	                instance_destroy();
	            }
	        }	
		})	
	break; }
}