function __view_get(property, index)
{
    var __prop = property;
    var __index = index;
    var __res = -1;
    var __cam = view_get_camera(__index);
			
    switch (__prop)
    {
        case e__VW.XView:
            __res = camera_get_view_x(__cam);
            break;
        
        case e__VW.YView:
            __res = camera_get_view_y(__cam);
            break;
        
        case e__VW.WView:
            __res = camera_get_view_width(__cam);
            break;
        
        case e__VW.HView:
            __res = camera_get_view_height(__cam);
            break;
        
        case e__VW.Angle:
            __res = camera_get_view_angle(__cam);
            break;
        
        case e__VW.HBorder:
            __res = camera_get_view_border_x(__cam);
            break;
        
        case e__VW.VBorder:
            __res = camera_get_view_border_y(__cam);
            break;
        
        case e__VW.HSpeed:
            __res = camera_get_view_speed_x(__cam);
            break;
        
        case e__VW.VSpeed:
            __res = camera_get_view_speed_y(__cam);
            break;
        
        case e__VW.Object:
            __res = camera_get_view_target(__cam);
            break;
        
        case e__VW.Visible:
            __res = view_get_visible(__index);
            break;
        
        case e__VW.XPort:
            __res = view_get_xport(__index);
            break;
        
        case e__VW.YPort:
            __res = view_get_yport(__index);
            break;
        
        case e__VW.WPort:
            __res = view_get_wport(__index);
            break;
        
        case e__VW.HPort:
            __res = view_get_hport(__index);
            break;
        
        case e__VW.Camera:
            __res = view_get_camera(__index);
            break;
        
        case e__VW.SurfaceID:
            __res = view_get_surface_id(__index);
            break;
        
        default:
            break;
    }
    
    return __res;
}

function __view_set(property, index, value)
{
    var __prop = property;
    var __index = index;
    var __val = value;
    __view_set_internal(__prop, __index, __val);
    var __res = __view_get(__prop, __index);
    return __res;
}

function __view_set_internal(property, index, value)
{
    var __prop = property;
    var __index = index;
    var __val = value;
    var __cam = view_get_camera(__index);
    switch (__prop)
    {
        case e__VW.XView:
            camera_set_view_pos(__cam, __val, camera_get_view_y(__cam));
            break;
        
        case e__VW.YView:
            camera_set_view_pos(__cam, camera_get_view_x(__cam), __val);
            break;
        
        case e__VW.WView:
            camera_set_view_size(__cam, __val, camera_get_view_height(__cam));
            break;
        
        case e__VW.HView:
            camera_set_view_size(__cam, camera_get_view_width(__cam), __val);
            break;
        
        case e__VW.Angle:
            camera_set_view_angle(__cam, __val);
            break;
        
        case e__VW.HBorder:
            camera_set_view_border(__cam, __val, camera_get_view_border_y(__cam));
            break;
        
        case e__VW.VBorder:
            camera_set_view_border(__cam, camera_get_view_border_x(__cam), __val);
            break;
        
        case e__VW.HSpeed:
            camera_set_view_speed(__cam, __val, camera_get_view_speed_y(__cam));
            break;
        
        case e__VW.VSpeed:
            camera_set_view_speed(__cam, camera_get_view_speed_x(__cam), __val);
            break;
        
        case e__VW.Object:
            camera_set_view_target(__cam, __val);
            break;
        
        case e__VW.Visible:
            __res = view_set_visible(__index, __val);
            break;
        
        case e__VW.XPort:
            __res = view_set_xport(__index, __val);
            break;
        
        case e__VW.YPort:
            __res = view_set_yport(__index, __val);
            break;
        
        case e__VW.WPort:
            __res = view_set_wport(__index, __val);
            break;
        
        case e__VW.HPort:
            __res = view_set_hport(__index, __val);
            break;
        
        case e__VW.Camera:
            __res = view_set_camera(__index, __val);
            break;
        
        case e__VW.SurfaceID:
            __res = view_set_surface_id(__index, __val);
            break;
        
        default:
            break;
    }
    
    return 0;
}

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
