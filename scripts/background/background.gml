enum e__BG
{
    Visible,
    Foreground,
    Index,
    X,
    Y,
    Width,
    Height,
    HTiled,
    VTiled,
    XScale,
    YScale,
    HSpeed,
    VSpeed,
    Blend,
    Alpha
}

function __background_get_colour()
{
    var __colinfo = __background_get_colour_element();
    
    if (__colinfo[0] == -1)
        return 0;
    
    var __col = layer_background_get_blend(__colinfo[0]);
    return __col;
}

function __background_get_colour_element()
{
    var __nearestdepth = -15000;
    var __farthestdepth = 15999;
    var __depthinc = 100;
    var __result;
    __result[0] = -1;
    __result[1] = -1;
    var __colstring = "Colour";
    var __layerlist = layer_get_all();
    var __layerlistlength = array_length_1d(__layerlist);
    var __layerid = -1;
    var __isforeground = false;
    
    for (var __i = 0; __i < __layerlistlength; __i++)
    {
        var __layername = layer_get_name(__layerlist[__i]);
        
        if (string_pos(__colstring, __layername) > 0)
        {
            __layerid = __layerlist[__i];
            break;
        }
    }
    
    if (__layerid != -1)
    {
        var __els = layer_get_all_elements(__layerid);
        var __elslength = array_length_1d(__els);
        
        for (var __i = 0; __i < __elslength; __i++)
        {
            if (layer_get_element_type(__els[__i]) == 1)
            {
                __result[0] = __els[__i];
                __result[1] = __layerid;
            }
        }
    }
    else
    {
        var __newback = __background_set_element(-1, false, false, -1, 0, 0, true, true, 1, 1, true, 0, 0, 0, 1);
        __result[0] = __newback[0];
        __result[1] = __newback[1];
    }
    
    return __result;
}

function __background_set(arg0, arg1, arg2)
{
    var __prop = arg0;
    var __bind = arg1;
    var __val = arg2;
    var __backinfo = __background_get_element(__bind);
    __background_set_internal(__prop, __bind, __val, __backinfo);
    var __res = __background_get_internal(__prop, __bind, __backinfo);
    return __res;
}

function __background_set_colour(arg0)
{
    var __newcol = arg0;
    var __colinfo = __background_get_colour_element();
    
    if (__colinfo[0] == -1)
        return 0;
    
    layer_background_blend(__colinfo[0], __newcol);
    return __newcol;
}

function __background_set_element(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14)
{
    var __bind = arg0;
    var __vis = arg1;
    var __fore = arg2;
    var __back = arg3;
    var __x = arg4;
    var __y = arg5;
    var __htiled = arg6;
    var __vtiled = arg7;
    var __xscale = arg8;
    var __yscale = arg9;
    var __stretch = arg10;
    var __hspeed = arg11;
    var __vspeed = arg12;
    var __blend = arg13;
    var __alpha = arg14;
    var __nearestdepth = 1000000000;
    var __farthestdepth = -1000000000;
    var __depthinc = 100;
    var __result;
    __result[0] = -1;
    __result[1] = -1;
    var __fgstring = "Foreground";
    var __bgstring = "Background";
    var __colstring = "Colour";
    var __fglen = string_length(__fgstring);
    var __bglen = string_length(__bgstring);
    var __layerlist = layer_get_all();
    var __layerlistlength = array_length_1d(__layerlist);
    var __collayer = -1;
    var __slots, __isforeground;
    
    for (var __i = 0; __i < 8; __i++)
    {
        __slots[__i] = -1;
        __isforeground[__i] = false;
    }
    
    var __slot, __layername;
    
    for (var __i = 0; __i < __layerlistlength; __i++)
    {
        __layername = layer_get_name(__layerlist[__i]);
        
        if (string_pos(__fgstring, __layername) > 0)
        {
            var __slotchr = string_char_at(__layername, __fglen + 1);
            
            if (__slotchr == "")
                continue;
            
            __slot = real(__slotchr);
            __slots[__slot] = __layerlist[__i];
            __isforeground[__slot] = true;
        }
        else if (string_pos(__bgstring, __layername) > 0)
        {
            var __slotchr = string_char_at(__layername, __bglen + 1);
            
            if (__slotchr == "")
                continue;
            
            __slot = real(__slotchr);
            __slots[__slot] = __layerlist[__i];
            __isforeground[__slot] = false;
        }
        else if (string_pos(__colstring, __layername) > 0)
        {
            __collayer = __layerlist[__i];
            layer_depth(__layerlist[__i], __farthestdepth);
        }
        else
        {
            var __currdepth = layer_get_depth(__layerlist[__i]);
            
            if (__currdepth < __nearestdepth)
                __nearestdepth = __currdepth;
            
            if (__currdepth > __farthestdepth)
                __farthestdepth = __currdepth;
        }
    }
    
    __farthestdepth += (__depthinc + 1000);
    __nearestdepth -= __depthinc;
    __farthestdepth = max(__farthestdepth, 2147483600);
    __nearestdepth = min(__nearestdepth, -2147482000);
    
    for (var __i = 0; __i < 8; __i++)
    {
        if (__slots[__i] != -1)
        {
            var __depth = 0;
            
            if (__isforeground[__i] == true)
                __depth = __nearestdepth - (__i * __depthinc);
            else
                __depth = __farthestdepth - __depthinc - (__slot * __depthinc);
            
            layer_depth(__slots[__i], __depth);
        }
    }
    
    if (__collayer != -1)
        layer_depth(__collayer, __farthestdepth);
    
    var __layerdepth;
    
    if (__bind == -1)
    {
        __layername = __colstring;
        __layerdepth = __farthestdepth;
    }
    else if (__fore == true)
    {
        __layername = __fgstring + string(__bind);
        __layerdepth = __nearestdepth - (__bind * __depthinc);
    }
    else
    {
        __layername = __bgstring + string(__bind);
        __layerdepth = __farthestdepth - __depthinc - (__bind * __depthinc);
    }
    
    var __layerid;
    
    if (__bind == -1)
        __layerid = __collayer;
    else
        __layerid = __slots[__bind];
    
    if (__layerid != -1)
        layer_destroy(__layerid);
    
    __layerid = layer_create(__layerdepth, __layername);
    layer_x(__layerid, __x);
    layer_y(__layerid, __y);
    layer_hspeed(__layerid, __hspeed);
    layer_vspeed(__layerid, __vspeed);
    var __backel = layer_background_create(__layerid, __back);
    layer_background_visible(__backel, __vis);
    layer_background_htiled(__backel, __htiled);
    layer_background_vtiled(__backel, __vtiled);
    layer_background_xscale(__backel, __xscale);
    layer_background_yscale(__backel, __yscale);
    layer_background_stretch(__backel, __stretch);
    layer_background_blend(__backel, __blend);
    layer_background_alpha(__backel, __alpha);
    __result[0] = __backel;
    __result[1] = __layerid;
    return __result;
}

function __background_set_internal(arg0, arg1, arg2, arg3)
{
    var __prop = arg0;
    var __bind = arg1;
    var __val = arg2;
    var __backinfo = arg3;
    
    if (__backinfo[0] == -1)
        return -1;
    
    var __backid = __backinfo[0];
    var __layerid = __backinfo[1];
    var __isfore = __backinfo[2];
    
    if (__prop == e__BG.Foreground)
    {
        if (round(__val) != round(__isfore))
        {
            var __visible = layer_get_visible(__layerid);
            var __index = layer_background_get_sprite(__backid);
            var __htiled = layer_background_get_htiled(__backid);
            var __vtiled = layer_background_get_vtiled(__backid);
            var __stretch = layer_background_get_stretch(__backid);
            var __blend = layer_background_get_blend(__backid);
            var __alpha = layer_background_get_alpha(__backid);
            var __xscale = layer_background_get_xscale(__backid);
            var __yscale = layer_background_get_yscale(__backid);
            var __x = layer_get_x(__layerid);
            var __y = layer_get_y(__layerid);
            var __hspeed = layer_get_hspeed(__layerid);
            var __vspeed = layer_get_vspeed(__layerid);
            __background_set_element(__bind, __visible, __val, __index, __x, __y, __htiled, __vtiled, __xscale, __yscale, __stretch, __hspeed, __vspeed, __blend, __alpha);
        }
    }
    else
    {
        switch (__prop)
        {
            case e__BG.Visible:
                layer_set_visible(__layerid, __val);
                layer_background_visible(__backid, __val);
                break;
            
            case e__BG.Index:
                layer_background_change(__backid, __val);
                
                if (sprite_exists(__val))
                {
                    layer_background_blend(__backid, c_white);
                    layer_background_alpha(__backid, 1);
                }
                
                break;
            
            case e__BG.X:
                layer_x(__layerid, __val);
                break;
            
            case e__BG.Y:
                layer_y(__layerid, __val);
                break;
            
            case e__BG.HTiled:
                layer_background_htiled(__backid, __val);
                break;
            
            case e__BG.VTiled:
                layer_background_vtiled(__backid, __val);
                break;
            
            case e__BG.XScale:
                layer_background_xscale(__backid, __val);
                break;
            
            case e__BG.YScale:
                layer_background_yscale(__backid, __val);
                break;
            
            case e__BG.HSpeed:
                layer_hspeed(__layerid, __val);
                break;
            
            case e__BG.VSpeed:
                layer_vspeed(__layerid, __val);
                break;
            
            case e__BG.Blend:
                layer_background_blend(__backid, __val);
                break;
            
            case e__BG.Alpha:
                layer_background_alpha(__backid, __val);
                break;
            
            default:
                break;
        }
    }
    
    return -1;
}

function __background_get_element(arg0)
{
    var __bind = arg0;
    var __result;
    __result[0] = -1;
    __result[1] = -1;
    __result[2] = -1;
    var __fgstring = "Foreground";
    var __bgstring = "Background";
    var __fglen = string_length(__fgstring);
    var __bglen = string_length(__bgstring);
    var __layerlist = layer_get_all();
    var __layerlistlength = array_length_1d(__layerlist);
    var __layerid = -1;
    var __isforeground = false;
    
    for (var __i = 0; __i < __layerlistlength; __i++)
    {
        var __layername = layer_get_name(__layerlist[__i]);
        
        if (string_pos(__fgstring, __layername) > 0)
        {
            var __slotchr = string_char_at(__layername, __fglen + 1);
            
            if (__slotchr == "")
                continue;
            
            var __slot = real(__slotchr);
            
            if (__slot == __bind)
            {
                __layerid = __layerlist[__i];
                __isforeground = true;
                break;
            }
        }
        else if (string_pos(__bgstring, __layername) > 0)
        {
            var __slotchr = string_char_at(__layername, __bglen + 1);
            
            if (__slotchr == "")
            {
            }
            else
            {
                var __slot = real(__slotchr);
                
                if (__slot == __bind)
                {
                    __layerid = __layerlist[__i];
                    __isforeground = false;
                    break;
                }
            }
        }
    }
    
    if (__layerid != -1)
    {
        var __els = layer_get_all_elements(__layerid);
        var __elslength = array_length_1d(__els);
        
        for (var __i = 0; __i < __elslength; __i++)
        {
            if (layer_get_element_type(__els[__i]) == 1)
            {
                __result[0] = __els[__i];
                __result[1] = __layerid;
                __result[2] = __isforeground;
            }
        }
    }
    else
    {
        var __newback = __background_set_element(__bind, false, false, -1, 0, 0, true, true, 1, 1, false, 0, 0, 16777215, 1);
        __result[0] = __newback[0];
        __result[1] = __newback[1];
        __result[2] = false;
    }
    
    return __result;
}

function __background_get_internal(arg0, arg1, arg2)
{
    var __prop = arg0;
    var __bind = arg1;
    var __backinfo = arg2;
    
    if (__backinfo[0] == -1 || layer_background_exists(__backinfo[1], __backinfo[0]) == false)
    {
        __backinfo = __background_get_element(__bind);
        
        if (__backinfo[0] == -1)
            return -1;
    }
    
    var __res = -1;
    var __backid = __backinfo[0];
    var __layerid = __backinfo[1];
    var __isfore = __backinfo[2];
    
    switch (__prop)
    {
        case e__BG.Visible:
            __res = layer_get_visible(__layerid);
            break;
        
        case e__BG.Foreground:
            __res = __isfore;
            break;
        
        case e__BG.Index:
            __res = layer_background_get_sprite(__backid);
            break;
        
        case e__BG.X:
            __res = layer_get_x(__layerid);
            break;
        
        case e__BG.Y:
            __res = layer_get_y(__layerid);
            break;
        
        case e__BG.Width:
            __res = sprite_get_width(layer_background_get_index(__backid));
            break;
        
        case e__BG.Height:
            __res = sprite_get_height(layer_background_get_index(__backid));
            break;
        
        case e__BG.HTiled:
            __res = layer_background_get_htiled(__backid);
            break;
        
        case e__BG.VTiled:
            __res = layer_background_get_vtiled(__backid);
            break;
        
        case e__BG.XScale:
            __res = layer_background_get_xscale(__backid);
            break;
        
        case e__BG.YScale:
            __res = layer_background_get_yscale(__backid);
            break;
        
        case e__BG.HSpeed:
            __res = layer_get_hspeed(__layerid);
            break;
        
        case e__BG.VSpeed:
            __res = layer_get_vspeed(__layerid);
            break;
        
        case e__BG.Blend:
            __res = layer_background_get_blend(__backid);
            break;
        
        case e__BG.Alpha:
            __res = layer_background_get_alpha(__backid);
            break;
        
        default:
            break;
    }
    
    return __res;
}