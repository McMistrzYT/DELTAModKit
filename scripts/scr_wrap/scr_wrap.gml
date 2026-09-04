function scr_wrap(value, _min, _max) {
	var _val = value
	var _range = abs(_max - _min)
	
	if (_max <= _min) {
		debug_log("wrap error, min higher than max!")
		return value;
	} else {
		while (_val < _min)
			_val += _range
		
		while (_val > _max)
			_val -= _range
		
		return _val;
	}
}

function scr_wrap_new() {
	var _val = argument[0]
	var _max = argument[2]
	var _min = argument[1]
	
	if ((_val % 1) == 0) {
		while (_val > _max || _val < _min) {
			if (_val > _max)
				_val = (_min + _val) - _max - 1
			else if (_val < _min)
				_val = ((_max + _val) - _min) + 1
			else {
				// Likely some sort of Commented out Code.
			}
		}
		
		return _val;
	} else {
		var _old = argument[0] + 1
		
		while (_val != _old) {
			_old = _val
			
			if (_val < _min)
				_val = _max - (_min - _val)
			else if (_val > _max)
				_val = _min + (_val - _max)
			else {
				// Likely the Same Commented Out Code.
			}
		}
		
		return _val;
	}
}


function scr_wrap_newer(value, _min, _max){
	if value >= _min && value <= _max return value
	if value < _min && _max >= infinity return _min
	if value > _max && _min <= -infinity return _max
	
	var __maxmod = (_max + 1 - _min)
	if __maxmod == 0 return 0
	value = value % __maxmod
	value = (_max - (_max - value) % __maxmod)
	var toreturn = clamp(value, _min, _max)
	return toreturn ?? value
}