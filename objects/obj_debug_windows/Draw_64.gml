bspace = 30;
padding = 5;
wd = 160;

var i = 0

for (i = 0; i < button_amount; i++)
{
if string_width(button_text[i]) > wd - (padding * 2)
	wd = string_width(button_text[i]) + (padding * 2)
}

ht = 40 + (bspace * button_amount);
mx = mouse_x - camerax();
my = mouse_y - cameray();
draw_set_color(c_black);
draw_rectangle(xx - 4, yy - 4, xx + wd + 4, yy + ht + 4, false);
draw_set_color(c_ltgray);
draw_rectangle(xx, yy, xx + wd, yy + ht, false);

var replacedcur = false


for (i = 0; i < button_amount; i++)
{
    button_state[i] = 0;
    if (point_in_rectangle(mx, my, xx + 10, yy + (bspace * i) + padding, (xx + wd) - 10, yy + ((bspace + 1) * i) + bspace))
    {
        if (i > 0)
        {
            button_state[i] = 1;
			replacedcur = true
			window_set_cursor(cr_handpoint);
            if (mouse_check_button(mb_left))
            {
			if i == 0
				window_set_cursor(cr_drag);
                button_state[i] = 2;
            }
            
            if (mouse_check_button_released(mb_left))
            {
                button_state[i] = 3;
                button_clicked[i] = 1;
            }
        }
        else
        {
            button_state[i] = 1;
            
            if (mouse_check_button(mb_left))
            {
                button_clicked[i] = 1;
                button_state[i] = 3;
            }
        }
    }
}

if !replacedcur
	window_set_cursor(cr_default)

draw_set_font(fnt_main);

for (i = 0; i < button_amount; i++)
{
    if (button_state[i] == 0)
    {
        draw_set_color(c_ltgray);
    }
    
    if (button_state[i] == 1)
    {
        draw_set_color(c_white);
    }
    
    if (button_state[i] == 2)
    {
        draw_set_color(c_dkgray);
    }
    
    if (button_state[i] == 3)
    {
        draw_set_color(c_blue);
    }
    
    if (i == 0)
    {
        draw_set_color(merge_color(draw_get_color(), c_aqua, 0.7));
    }
    
    draw_rectangle(xx + 10, yy + (bspace * i) + padding, (xx + wd) - 10, (yy + 30 + ((bspace + 1) * i)) - padding, false);
    draw_set_color(c_black);
    draw_rectangle(xx + 10, yy + (bspace * i) + padding, (xx + wd) - 10, (yy + 30 + ((bspace + 1) * i)) - padding, true);
    draw_set_color(c_red);
    draw_text(xx + 10, yy + (bspace * i) + padding, button_text[i]);
    draw_set_color(c_black);
}

if (button_clicked[0] == 1)
{
    if (mouse_check_button(mb_left))
    {
        xx += (mx - remmx);
        yy += (my - remmy);
    }
    else
    {
        button_clicked[0] = 0;
    }
}

if (type == 0)
{
    if (button_clicked[1] == 1)
    {
        if (i_ex(obj_debug_xy))
        {
            if (i_ex(obj_debug_xy.selected_object))
            {
                checksprite = asset_get_index(get_string("Enter new sprite_index.", ""));
                
                if (checksprite != -1)
                {
                    obj_debug_xy.selected_object.sprite_index = checksprite;
                }
            }
        }
        
        button_clicked[1] = 0;
    }
    
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

xx = clamp(xx, 40, 500);
yy = clamp(yy, 40, 340);
remmx = mouse_x - camerax();
remmy = mouse_y - cameray();
