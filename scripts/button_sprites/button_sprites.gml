function scr_getbuttonsprite(arg0, arg1)
{
    var control = arg0;
    var isString = arg1;
    var button = noone;
    var is_dualshock = os_type == os_ps4 || global.gamepad_type == "Sony DualShock 4";
    var is_dualsense = os_type == os_ps5 || global.gamepad_type == "DualSense Wireless Controller";
    var button_sprite = button_questionmark;
    var invert = is_dualshock && (global.typer == 50 || global.typer == 70 || global.typer == 71);
    
    if (isString)
    {
        if (control == "A")
        {
            button_sprite = button_xbox_left;
            
            if (os_type == os_switch || os_type == os_switch2)
            {
                button_sprite = button_switch_left_0;
            }
            else if (is_dualshock || is_dualsense)
            {
                button_sprite = invert ? button_ps4_dpad_left_dark : button_ps4_dpad_left;
                
                if (is_dualsense)
                    button_sprite = invert ? button_ps4_dpad_left_dark : button_ps5_dpad_left;
            }
            
            return button_sprite;
        }
        
        if (control == "D")
        {
            button_sprite = button_xbox_right;
            
            if (os_type == os_switch || os_type == os_switch2)
            {
                button_sprite = button_switch_right_0;
            }
            else if (is_dualshock || is_dualsense)
            {
                button_sprite = invert ? button_ps4_dpad_right_dark : button_ps4_dpad_right;
                
                if (is_dualsense)
                    button_sprite = invert ? button_ps4_dpad_right_dark : button_ps5_dpad_right;
            }
            
            return button_sprite;
        }
        
        if (control == "W")
        {
            button_sprite = button_xbox_up;
            
            if (os_type == os_switch || os_type == os_switch2)
            {
                button_sprite = button_switch_up_0;
            }
            else if (is_dualshock || is_dualsense)
            {
                button_sprite = invert ? button_ps4_dpad_up_dark : button_ps4_dpad_up;
                
                if (is_dualsense)
                    button_sprite = invert ? button_ps4_dpad_up_dark : button_ps5_dpad_up;
            }
            
            return button_sprite;
        }
        
        if (control == "S")
        {
            button_sprite = button_xbox_down;
            
            if (os_type == os_switch || os_type == os_switch2)
            {
                button_sprite = button_switch_down_0;
            }
            else if (is_dualshock || is_dualsense)
            {
                button_sprite = invert ? button_ps4_dpad_down_dark : button_ps4_dpad_down;
                
                if (is_dualsense)
                    button_sprite = invert ? button_ps4_dpad_down_dark : button_ps5_dpad_down;
            }
            
            return button_sprite;
        }
        
        if (control == "l")
        {
            button_sprite = button_xbox_left_bumper;
            
            if (is_dualshock || is_dualsense)
            {
                button_sprite = button_ps4_l1;
                
                if (is_dualsense)
                    button_sprite = button_ps5_l1;
            }
            
            if (os_type == os_switch || os_type == os_switch2)
                button_sprite = button_switch_l_0;
            
            return button_sprite;
        }
        
        if (control == "L")
        {
            button_sprite = button_xbox_left_trigger;
            
            if (is_dualshock || is_dualsense)
            {
                button_sprite = button_ps4_l2;
                
                if (is_dualsense)
                    button_sprite = button_ps5_l2;
            }
            
            if (os_type == os_switch || os_type == os_switch2)
                button_sprite = button_switch_zl_0;
            
            return button_sprite;
        }
        
        if (control == "r")
        {
            button_sprite = button_xbox_right_bumper;
            
            if (is_dualshock || is_dualsense)
            {
                button_sprite = button_ps4_r1;
                
                if (is_dualsense)
                    button_sprite = button_ps5_r1;
            }
            
            if (os_type == os_switch || os_type == os_switch2)
                button_sprite = button_switch_r_0;
            
            return button_sprite;
        }
        
        if (control == "R")
        {
            button_sprite = button_xbox_right_trigger;
            
            if (is_dualshock || is_dualsense)
            {
                button_sprite = button_ps4_r2;
                
                if (is_dualsense)
                    button_sprite = button_ps5_r2;
            }
            
            if (os_type == os_switch || os_type == os_switch2)
                button_sprite = button_switch_zr_0;
            
            return button_sprite;
        }
        
        if (control == "j")
        {
            button_sprite = button_xbox_l;
            
            if (is_dualshock || is_dualsense)
                button_sprite = button_ps4_l;
            
            if (os_type == os_switch || os_type == os_switch2)
                button_sprite = button_switch_lStick;
            
            return button_sprite;
        }
        
        if (control == "J")
        {
            button_sprite = button_xbox_r;
            
            if (is_dualshock || is_dualsense)
                button_sprite = button_ps4_r;
            
            if (os_type == os_switch || os_type == os_switch2)
                button_sprite = button_switch_rStick;
            
            return button_sprite;
        }
        
        if (control == "Z")
            button = global.button0;
        
        if (control == "X")
            button = global.button1;
        
        if (control == "C")
            button = global.button2;
    }
    else
    {
        button = control;
        
        if (control == gp_padl)
        {
            button_sprite = button_xbox_left;
            
            if (os_type == os_switch || os_type == os_switch2)
            {
                button_sprite = button_switch_left_0;
            }
            else if (is_dualshock || is_dualsense)
            {
                button_sprite = invert ? button_ps4_dpad_left_dark : button_ps4_dpad_left;
                
                if (is_dualsense)
                    button_sprite = invert ? button_ps4_dpad_left_dark : button_ps5_dpad_left;
            }
            
            return button_sprite;
        }
        
        if (control == gp_padr)
        {
            button_sprite = button_xbox_right;
            
            if (os_type == os_switch || os_type == os_switch2)
            {
                button_sprite = button_switch_right_0;
            }
            else if (is_dualshock || is_dualsense)
            {
                button_sprite = invert ? button_ps4_dpad_right_dark : button_ps4_dpad_right;
                
                if (is_dualsense)
                    button_sprite = invert ? button_ps4_dpad_right_dark : button_ps5_dpad_right;
            }
            
            return button_sprite;
        }
        
        if (control == gp_padu)
        {
            button_sprite = button_xbox_up;
            
            if (os_type == os_switch || os_type == os_switch2)
            {
                button_sprite = button_switch_up_0;
            }
            else if (is_dualshock || is_dualsense)
            {
                button_sprite = invert ? button_ps4_dpad_up_dark : button_ps4_dpad_up;
                
                if (is_dualsense)
                    button_sprite = invert ? button_ps4_dpad_up_dark : button_ps5_dpad_up;
            }
            
            return button_sprite;
        }
        
        if (control == gp_padd)
        {
            button_sprite = button_xbox_down;
            
            if (os_type == os_switch || os_type == os_switch2)
            {
                button_sprite = button_switch_down_0;
            }
            else if (is_dualshock || is_dualsense)
            {
                button_sprite = invert ? button_ps4_dpad_down_dark : button_ps4_dpad_down;
                
                if (is_dualsense)
                    button_sprite = invert ? button_ps4_dpad_down_dark : button_ps5_dpad_down;
            }
            
            return button_sprite;
        }
    }
    
    if (button == gp_face1)
    {
        button_sprite = button_xbox_a;
        
        if (is_dualshock || is_dualsense)
        {
            button_sprite = button_ps4_cross_0;
            
            if (is_dualsense)
                button_sprite = button_ps5_cross_0;
        }
        
        if (os_type == os_switch || os_type == os_switch2)
            button_sprite = button_switch_b_0;
        
        return button_sprite;
    }
    
    if (button == gp_face2)
    {
        button_sprite = button_xbox_b;
        
        if (is_dualshock || is_dualsense)
        {
            button_sprite = button_ps4_circle_0;
            
            if (is_dualsense)
                button_sprite = button_ps5_circle_0;
        }
        
        if (os_type == os_switch || os_type == os_switch2)
            button_sprite = button_switch_a_0;
        
        return button_sprite;
    }
    
    if (button == gp_face3)
    {
        button_sprite = button_xbox_x;
        
        if (is_dualshock || is_dualsense)
        {
            button_sprite = button_ps4_square_0;
            
            if (is_dualsense)
                button_sprite = button_ps5_square_0;
        }
        
        if (os_type == os_switch || os_type == os_switch2)
            button_sprite = button_switch_y_0;
        
        return button_sprite;
    }
    
    if (button == gp_face4)
    {
        button_sprite = button_xbox_y;
        
        if (is_dualshock || is_dualsense)
        {
            button_sprite = button_ps4_triangle_0;
            
            if (is_dualsense)
                button_sprite = button_ps5_triangle_0;
        }
        
        if (os_type == os_switch || os_type == os_switch2)
            button_sprite = button_switch_x_0;
        
        return button_sprite;
    }
    
    if (button == gp_shoulderl)
    {
        button_sprite = button_xbox_left_bumper;
        
        if (is_dualshock || is_dualsense)
        {
            button_sprite = button_ps4_l1;
            
            if (is_dualsense)
                button_sprite = button_ps5_l1;
        }
        
        if (os_type == os_switch || os_type == os_switch2)
            button_sprite = button_switch_l_0;
        
        return button_sprite;
    }
    
    if (button == gp_shoulderlb)
    {
        button_sprite = button_xbox_left_trigger;
        
        if (is_dualshock || is_dualsense)
        {
            button_sprite = button_ps4_l2;
            
            if (is_dualsense)
                button_sprite = button_ps5_l2;
        }
        
        if (os_type == os_switch || os_type == os_switch2)
            button_sprite = button_switch_zl_0;
        
        return button_sprite;
    }
    
    if (button == gp_shoulderr)
    {
        button_sprite = button_xbox_right_bumper;
        
        if (is_dualshock || is_dualsense)
        {
            button_sprite = button_ps4_r1;
            
            if (is_dualsense)
                button_sprite = button_ps5_r1;
        }
        
        if (os_type == os_switch || os_type == os_switch2)
            button_sprite = button_switch_r_0;
        
        return button_sprite;
    }
    
    if (button == gp_shoulderrb)
    {
        button_sprite = button_xbox_right_trigger;
        
        if (is_dualshock || is_dualsense)
        {
            button_sprite = button_ps4_r2;
            
            if (is_dualsense)
                button_sprite = button_ps5_r2;
        }
        
        if (os_type == os_switch || os_type == os_switch2)
            button_sprite = button_switch_zr_0;
        
        return button_sprite;
    }
    
    if (button == gp_stickl)
    {
        button_sprite = button_xbox_left_stick;
        
        if (is_dualshock || is_dualsense)
        {
            button_sprite = button_ps4_l3_0;
            
            if (is_dualsense)
                button_sprite = button_ps5_l3;
        }
        
        if (os_type == os_switch || os_type == os_switch2)
            button_sprite = button_switch_lStickClick_0;
        
        return button_sprite;
    }
    
    if (button == gp_stickr)
    {
        button_sprite = button_xbox_right_stick;
        
        if (is_dualshock || is_dualsense)
        {
            button_sprite = button_ps4_r3_0;
            
            if (is_dualsense)
                button_sprite = button_ps5_r3;
        }
        
        if (os_type == os_switch || os_type == os_switch2)
            button_sprite = button_switch_rStickClick_0;
        
        return button_sprite;
    }
    
    if (button == gp_select)
    {
        button_sprite = button_xbox_share;
        
        if (is_dualshock)
            button_sprite = button_ps4_touchpad;
        else if (is_dualsense)
            button_sprite = button_ps5_touchpad;
        
        if (os_type == os_switch || os_type == os_switch2)
            button_sprite = button_switch_minus_0;
        
        return button_sprite;
    }
    
    if (button == gp_start)
    {
        button_sprite = button_xbox_menu;
        
        if (is_dualshock)
            return button_ps4_options;
        else if (is_dualsense)
            button_sprite = button_ps5_start;
        
        if (os_type == os_switch || os_type == os_switch2)
            button_sprite = button_switch_plus_0;
        
        return button_sprite;
    }
    
    if (button == gp_padl)
    {
        button_sprite = button_xbox_left;
        
        if (os_type == os_switch || os_type == os_switch2)
        {
            button_sprite = button_switch_left_0;
        }
        else if (is_dualshock || is_dualsense)
        {
            button_sprite = invert ? button_ps4_dpad_left_dark : button_ps4_dpad_left;
            
            if (is_dualsense)
                button_sprite = invert ? button_ps4_dpad_left_dark : button_ps5_dpad_left;
        }
        
        return button_sprite;
    }
    
    if (button == gp_padr)
    {
        button_sprite = button_xbox_right;
        
        if (os_type == os_switch || os_type == os_switch2)
        {
            button_sprite = button_switch_right_0;
        }
        else if (is_dualshock || is_dualsense)
        {
            button_sprite = invert ? button_ps4_dpad_right_dark : button_ps4_dpad_right;
            
            if (is_dualsense)
                button_sprite = invert ? button_ps4_dpad_right_dark : button_ps5_dpad_right;
        }
        
        return button_sprite;
    }
    
    if (button == gp_padu)
    {
        button_sprite = button_xbox_up;
        
        if (os_type == os_switch || os_type == os_switch2)
        {
            button_sprite = button_switch_up_0;
        }
        else if (is_dualshock || is_dualsense)
        {
            button_sprite = invert ? button_ps4_dpad_up_dark : button_ps4_dpad_up;
            
            if (is_dualsense)
                button_sprite = invert ? button_ps4_dpad_up_dark : button_ps5_dpad_up;
        }
        
        return button_sprite;
    }
    
    if (button == gp_padd)
    {
        button_sprite = button_xbox_down;
        
        if (os_type == os_switch || os_type == os_switch2)
        {
            button_sprite = button_switch_down_0;
        }
        else if (is_dualshock || is_dualsense)
        {
            button_sprite = invert ? button_ps4_dpad_down_dark : button_ps4_dpad_down;
            
            if (is_dualsense)
                button_sprite = invert ? button_ps4_dpad_down_dark : button_ps5_dpad_down;
        }
        
        return button_sprite;
    }
    
    return button_sprite;
}
