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


function scr_wrap_newer(_val, _min, _max){ 
   try {
	   if _min > _max {
			var _oldmin = _min
			_min = _max
			_max = _oldmin
	   }
		return _max - ((_max - (_val % (_max + 1))) % (_max - _min + 1));
   } catch (ex) {return 0}
}