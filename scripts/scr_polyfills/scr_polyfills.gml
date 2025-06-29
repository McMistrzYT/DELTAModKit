/// @func array_foreach(arr, func)
/// @arg 0 arr   // source array
/// @arg 1 func  // function(element, index)
function arr_foreach(arr, func) {
    var n = array_length_1d(arr);
    for (var i = 0; i < n; ++i) {
        func(arr[i], i);
    }
}

/// @func array_find_index(arr, predicate)
/// @arg 0 arr        // 1D array
/// @arg 1 predicate  // function(element, index) → bool
function arr_find_index(arr, predicate) {
    var n = array_length_1d(arr);
    for (var i = 0; i < n; ++i) {
        if (predicate(arr[i], i)) return i;
    }
    return -1;
}

/// @func array_contains(arr, value)
/// @arg 0 arr        // 1D array
/// @arg 1 value      // value to look for
function arr_contains(arr, value) {
    if (!is_array(arr)) {
        return false;
    }
    
    var len = array_length(arr);
    for (var i = 0; i < len; i++) {
        var item = arr[i];
        if (item == value) {
            return true;
        }
    }
	
    return false;
}


/// @func array_push(arr, ...)
/// @arg 0 arr        // 1D array
/// @arg 1+ ...       // values to append
function arr_push(arr) {
    for (var k = 1; k < argument_count; ++k) {
        array_push(arr, argument[k]);
    }
}

/// @func array_pop(arr)
/// @arg 0 arr        // 1D array
function arr_pop(arr) {
    var len = array_length_1d(arr);
    if (len <= 0) return undefined;
    var val = arr[len-1];
    array_resize(arr, len-1);
    return val;
}

function arr_length(arr) { return array_length_1d(arr); }

// string
function stringsetloc(str, code) { return str; }