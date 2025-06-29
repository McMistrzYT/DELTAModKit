function ease_out_bounce(arg0, arg1, arg2, arg3)
{
    arg0 /= arg3;
    
    if (arg0 < 0.36363636363636365)
    {
        return (arg2 * (7.5625 * arg0 * arg0)) + arg1;
    }
    else if (arg0 < 0.7272727272727273)
    {
        arg0 -= 0.5454545454545454;
        return (arg2 * ((7.5625 * arg0 * arg0) + 0.75)) + arg1;
    }
    else if (arg0 < 0.9090909090909091)
    {
        arg0 -= 0.8181818181818182;
        return (arg2 * ((7.5625 * arg0 * arg0) + 0.9375)) + arg1;
    }
    else
    {
        arg0 -= 0.9545454545454546;
        return (arg2 * ((7.5625 * arg0 * arg0) + 0.984375)) + arg1;
    }
}

function ease_out_elastic(arg0, arg1, arg2, arg3)
{
    var _s = 1.70158;
    var _p = 0;
    var time = arg0;
    var start = arg1;
    var change = arg2;
    var duration = arg3;
    
    if (time == 0 || change == 0)
        return start;
    
    time /= duration;
    
    if (time == 1)
        return start + arg2;
    
    if (!_p)
        _p = duration * 0.3;
    
    if (change < abs(arg2))
    {
        change = arg2;
        _s = _p * 0.25;
    }
    else
    {
        _s = (_p / (2 * pi)) * arcsin(arg2 / change);
    }
    
    return (change * power(2, -10 * time) * sin((((time * duration) - _s) * (2 * pi)) / _p)) + arg2 + start;
}

function ease_out_back(arg0, arg1, arg2, arg3, arg4 = 1.70158)
{
    arg0 = (arg0 / arg3) - 1;
    return (arg2 * ((arg0 * arg0 * (((arg4 + 1) * arg0) + arg4)) + 1)) + arg1;
}

function ease_in_bounce(arg0, arg1, arg2, arg3)
{
    return (arg2 - ease_out_bounce(arg3 - arg0, 0, arg2, arg3)) + arg1;
}

function ease_in_elastic(arg0, arg1, arg2, arg3)
{
    var _s = 1.70158;
    var _p = 0;
    var _a = arg2;
    
    if (arg0 == 0 || _a == 0)
        return arg1;
    
    arg0 /= arg3;
    
    if (arg0 == 1)
        return arg1 + arg2;
    
    if (_p == 0)
        _p = arg3 * 0.3;
    
    if (_a < abs(arg2))
    {
        _a = arg2;
        _s = _p * 0.25;
    }
    else
    {
        _s = (_p / (2 * pi)) * arcsin(arg2 / _a);
    }
    
    return -(_a * power(2, 10 * --arg0) * sin((((arg0 * arg3) - _s) * (2 * pi)) / _p)) + arg1;
}

function ease_inout_bounce(arg0, arg1, arg2, arg3)
{
    if (arg0 < (arg3 * 0.5))
        return (ease_in_bounce(arg0 * 2, 0, arg2, arg3) * 0.5) + arg1;
    
    return (ease_out_bounce((arg0 * 2) - arg3, 0, arg2, arg3) * 0.5) + (arg2 * 0.5) + arg1;
}

function ease_inout_elastic(arg0, arg1, arg2, arg3)
{
    var _s = 1.70158;
    var _p = 0;
    var _a = arg2;
    
    if (arg0 == 0 || _a == 0)
        return arg1;
    
    arg0 /= (arg3 * 0.5);
    
    if (arg0 == 2)
        return arg1 + arg2;
    
    if (!_p)
        _p = arg3 * 0.44999999999999996;
    
    if (_a < abs(arg2))
    {
        _a = arg2;
        _s = _p * 0.25;
    }
    else
    {
        _s = (_p / (2 * pi)) * arcsin(arg2 / _a);
    }
    
    if (arg0 < 1)
        return (-0.5 * (_a * power(2, 10 * --arg0) * sin((((arg0 * arg3) - _s) * (2 * pi)) / _p))) + arg1;
    
    return (_a * power(2, -10 * --arg0) * sin((((arg0 * arg3) - _s) * (2 * pi)) / _p) * 0.5) + arg2 + arg1;
}

function ease_inout_back(arg0, arg1, arg2, arg3)
{
    var _s = 1.70158;
    arg0 /= arg3;
    arg0 *= 2;
    
    if (arg0 < 1)
    {
        _s *= 1.525;
        return (arg2 * 0.5 * (arg0 * arg0 * (((_s + 1) * arg0) - _s))) + arg1;
    }
    
    arg0 -= 2;
    _s *= 1.525;
    return (arg2 * 0.5 * ((arg0 * arg0 * (((_s + 1) * arg0) + _s)) + 2)) + arg1;
}


// scr
function scr_ease_out(arg0, arg1)
{
    if (arg1 < -3 || arg1 > 7)
        return arg0;
    
    switch (arg1)
    {
        case -3:
            return ease_out_bounce(arg0, 0, 1, 1);
        
        case -2:
            return ease_out_elastic(arg0, 0, 1, 1);
        
        case -1:
            return ease_out_back(arg0, 0, 1, 1);
        
        case 0:
            return arg0;
        
        case 1:
            return sin(arg0 * 1.5707963267948966);
        
        case 2:
            return -arg0 * (arg0 - 2);
        
        case 6:
            return -power(2, -10 * arg0) + 1;
        
        case 7:
            arg0--;
            return sqrt(1 - (arg0 * arg0));
        
        default:
            arg0--;
            
            if (arg1 == 4)
            {
                return -1 * (power(arg0, arg1) - 1);
                break;
            }
            
            return power(arg0, arg1) + 1;
    }
}

function scr_ease_in(arg0, arg1)
{
    if (arg1 < -3 || arg1 > 7)
        return arg0;
    
    switch (arg1)
    {
        case -3:
            return ease_in_bounce(arg0, 0, 1, 1);
        
        case -2:
            return ease_in_elastic(arg0, 0, 1, 1);
        
        case -1:
            var _s = 1.70158;
            return arg0 * arg0 * (((_s + 1) * arg0) - _s);
        
        case 0:
            return arg0;
        
        case 1:
            return -cos(arg0 * 1.5707963267948966) + 1;
        
        case 6:
            return power(2, 10 * (arg0 - 1));
        
        case 7:
            return -(sqrt(1 - sqr(arg0)) - 1);
        
        default:
            return power(arg0, arg1);
    }
}

function scr_ease_inout(arg0, arg1)
{
    if (arg1 < -3 || arg1 > 7)
        return arg0;
    
    if (arg1 == -3)
        return ease_inout_bounce(arg0, 0, 1, 1);
    else if (arg1 == -2)
        return ease_inout_elastic(arg0, 0, 1, 1);
    else if (arg1 == -1)
        return ease_inout_back(arg0, 0, 1, 1);
    else if (arg1 == 1)
        return -0.5 * cos((pi * arg0) - 1);
    else if (arg1 == 0)
        return arg0;
    
    arg0 *= 2;
    
    if (arg0 < 1)
    {
        return 0.5 * scr_ease_in(arg0, arg1);
    }
    else
    {
        arg0--;
        return 0.5 * (scr_ease_out(arg0, arg1) + 1);
    }
}
