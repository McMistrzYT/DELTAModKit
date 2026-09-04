bspace = 30;
padding = 5;
wd = 160;

var i = 0
/*
for (i = 0; i < button_amount; i++)
{
if string_width(button_text[i]) > wd - 20
	wd = string_width(button_text[i]) + 20
}
*/

ht = 40 + (bspace * button_amount);
mx = ((mouse_x - camerax()) / camerawidth()) * 640;
my = ((mouse_y - cameray()) / cameraheight()) * 480;
draw_set_color(c_black);
draw_rectangle(xx - 4, yy - 4, xx + wd + 4, yy + ht + 4, false);
draw_set_color(c_ltgray);
draw_rectangle(xx, yy, xx + wd, yy + ht, false);

replacedcur = false

for (i = 0; i < button_amount; i++){
    button_state[i] = ____DEBUGWINDOWS__BUTTONSTATES.Base;
    if (point_in_rectangle(mx, my, xx + 10, yy + (bspace * i) + padding, (xx + wd) - 10, yy + ((bspace + 1) * i) + bspace)) {
		var hover = button_data[i][$ "hover"] ?? function(mydata) {}
		hover(button_data[i])
		/*
        if (i > 0)
        {
            
        }
        else
        {
        }
		*/
    }
}

if !replacedcur && window_get_cursor() != cr_default window_set_cursor(cr_default)

draw_set_font(fnt_main);

for (i = 0; i < button_amount; i++) {
    if (button_state[i] == ____DEBUGWINDOWS__BUTTONSTATES.Base)		draw_set_color(c_ltgray);    
    if (button_state[i] == ____DEBUGWINDOWS__BUTTONSTATES.Hovered)	draw_set_color(c_white);    
    if (button_state[i] == ____DEBUGWINDOWS__BUTTONSTATES.Held)		draw_set_color(c_dkgray); 
	if (button_state[i] == ____DEBUGWINDOWS__BUTTONSTATES.Released) draw_set_color(c_blue);
    
    if (i == 0) draw_set_color(merge_color(draw_get_color(), c_aqua, 0.7));
    
    draw_rectangle(xx + 10, yy + (bspace * i) + padding, (xx + wd) - 10, (yy + 30 + ((bspace + 1) * i)) - padding, false);
    draw_set_color(c_black);
    draw_rectangle(xx + 10, yy + (bspace * i) + padding, (xx + wd) - 10, (yy + 30 + ((bspace + 1) * i)) - padding, true);
    draw_set_color(c_red);
	if string_width(button_text[i]) > wd - 20 {
		draw_text_width(xx + 10, yy + (bspace * i) + padding, button_text[i], wd - 20)
	} else draw_text(xx + 10, yy + (bspace * i) + padding, button_text[i]);
	
    draw_set_color(c_black);
}

for (i = 0; i < button_amount; i++) {
	var update = button_data[i][$ "update"] ?? function(mydata) {}
	update(button_data[i])
	if button_clicked[i] {
		var execute = button_data[i][$ "execute"] ?? function(mydata) {}
		var release = execute(button_data[i]) ?? true
		if release button_clicked[i] = false
	}
}

/*
if (type == 0)
{
    
    if (button_clicked[2] == 1)
    {
        if (i_ex(obj_debug_xy))
        {
            if (i_ex(obj_debug_xy.selected_object))
            {
                var so = obj_debug_xy.selected_object;
                var varname = get_string("Enter variable name. No quotation marks. No arrays.", "");
                
                if (variable_instance_exists(so, varname))
                {
                    var foundvar = variable_instance_get(so, varname);
                    foundvar = string(foundvar);
                    var newvalue = get_string(varname + " is " + foundvar + ". Enter new REAL NUMBER value.", "");
                    variable_instance_set(so, varname, real(newvalue));
                }
                else
                {
                    show_message("No variable exists. Zannen.");
                }
            }
        }
        
        button_clicked[2] = 0;
    }
    
    if (button_clicked[3] == 1)
    {
        if (i_ex(obj_debug_xy))
        {
            if (i_ex(obj_debug_xy.selected_object))
            {
                var so = obj_debug_xy.selected_object;
                var varname = get_string("Enter variable name. No quotation marks. No arrays.", "");
                
                if (variable_instance_exists(so, varname))
                {
                    var foundvar = string(variable_instance_get(so, varname));
                    var newvalue = get_string(varname + " is " + foundvar + ". Enter string value.", "");
                    variable_instance_set(so, varname, string(newvalue));
                }
                else
                {
                    show_message("No variable exists. Zannen.");
                }
            }
        }
        
        button_clicked[3] = 0;
    }
    
    if (button_clicked[4] == 1)
    {
        if (i_ex(obj_debug_xy))
        {
            if (i_ex(obj_debug_xy.selected_object))
            {
                var so = obj_debug_xy.selected_object;
                var varname = get_string("Enter variable name. No quotation marks. No arrays.", "");
                
                if (variable_instance_exists(so, varname))
                {
                    watchvar = varname;
                }
                else
                {
                    show_message("No variable exists. Zannen.");
                }
            }
        }
        
        button_clicked[4] = 0;
    }
    
    if (button_clicked[5] == 1)
    {
        if (i_ex(obj_debug_xy))
        {
            if (i_ex(obj_debug_xy.selected_object))
            {
                with (obj_debug_xy.selected_object)
                {
                    instance_destroy();
                }
                
                instance_destroy();
            }
        }
        
        button_clicked[4] = 0;
    }
    
    if (watchvar != " ")
    {
        button_text[4] = "Watch Variable";
        
        if (i_ex(obj_debug_xy))
        {
            if (i_ex(obj_debug_xy.selected_object))
            {
                var so = obj_debug_xy.selected_object;
                
                if (variable_instance_exists(so, watchvar))
                {
                    button_text[4] = watchvar + ": " + string(variable_instance_get(so, watchvar));
                }
            }
        }
    }
}
else if (type == 1)
{
    if (button_clicked[1] == 1)
    {
        var whatflag = -1;
        whatflag = get_string("Which flag? ", "");
        
        if (whatflag != "")
        {
            whatflag = real(string_digits(whatflag));
            
            if (whatflag > 0)
            {
                var flagvalue = global.flag[whatflag];
                flagvalue = get_string("Flag [" + string(whatflag) + "] is " + string(flagvalue) + ". Enter new value.", "");
                
                if (flagvalue != "")
                {
                    global.flag[whatflag] = real(string_digits(flagvalue));
                }
            }
        }
        
        button_clicked[1] = 0;
    }
    
    if (button_clicked[2] == 1)
    {
        var whatflag = -1;
        whatflag = get_string("Flag to watch? ", "");
        
        if (whatflag != "")
        {
            whatflag = real(string_digits(whatflag));
            
            if (whatflag > 0)
            {
                watchflag = whatflag;
            }
            
            button_clicked[2] = 0;
        }
    }
    
    if (watchflag > 0)
    {
        button_text[2] = "Flag [" + string(watchflag) + "] : " + string(global.flag[watchflag]) + " | " + scr_flag_name_get(watchflag);
    }
    
    if (button_clicked[3] == 1)
    {
        var varname = get_string("Enter variable name without \"global.\"", "");
        
        if (varname != "")
        {
            if (variable_global_exists(varname))
            {
                var varval = variable_global_get(varname);
                var newval = get_string("The value of " + varname + " is " + string(varval) + ". What to set it to?", "");
                
                if (newval != "")
                {
                    if (real(string_digits(newval)) > 0)
                    {
                        variable_global_set(varname, real(newval));
                    }
                }
            }
            else
            {
                show_message("No variable exists. Zannen.");
            }
        }
        
        button_clicked[3] = 0;
    }
    
    if (button_clicked[4] == 1)
    {
        var varname = get_string("object name?", "");
        
        if (varname != "")
        {
            if (i_ex(asset_get_index(varname)))
            {
                with (obj_debug_xy)
                {
                    selected_object = instance_find(asset_get_index(varname), 0);
                }
                
                instance_destroy();
            }
        }
        
        button_clicked[4] = 0;
    }
    
    if (button_clicked[5] == 1)
    {
        var varname = get_string("object name?", "");
        
        if (varname != "")
        {
            if (asset_get_index(varname) > 0)
            {
                var bepis = instance_create(mouse_x, mouse_y, asset_get_index(varname));
                
                with (obj_debug_xy)
                {
                    selected_object = bepis;
                }
                
                instance_destroy();
            }
        }
        
        button_clicked[5] = 0;
    }
}
*/

xx = clamp(xx, minx, maxx);
yy = clamp(yy, miny, maxy);
remmx = mx
remmy = my
