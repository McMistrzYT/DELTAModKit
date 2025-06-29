function scr_facing_letter_to_number(arg0)
{
    if (arg0 == "d")
        return 0;
    
    if (arg0 == "r")
        return 1;
    
    if (arg0 == "l")
        return 3;
    
    if (arg0 == "u")
        return 2;
}

function scr_get_cardinal_direction(arg0)
{
    _mycardinal = "n";
    _mydegree = arg0;
    
    while (_mydegree > 360 || _mydegree < 0)
    {
        if (_mydegree > 360)
            _mydegree -= 360;
        
        if (_mydegree < 0)
            _mydegree += 360;
    }
    
    if (_mydegree >= 315 || _mydegree <= 45)
        _mycardinal = "r";
    
    if (_mydegree >= 45 && _mydegree <= 135)
        _mycardinal = "u";
    
    if (_mydegree >= 135 && _mydegree <= 225)
        _mycardinal = "l";
    
    if (_mydegree >= 225 && _mydegree <= 315)
        _mycardinal = "d";
    
    return _mycardinal;
}
