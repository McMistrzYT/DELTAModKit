function scr_array_to_bitmask(arr, bytesperindex = 1){
	var maxvalue = power(2, bytesperindex) - 1
	var newFlag = 0
	var arrayLength = array_length(arr)
	
	if (arrayLength > floor(18 / bytesperindex)) scr_debug_print("Warning! values_to_bitmask: Array too long. Truncating to " + string(floor(18 / bytesperindex)))
	
	for (var i = 0; i < min(arrayLength, floor(18 / bytesperindex)); i++){
		var value = arr[i]
		
		if (value > maxvalue || value < 0 || floor(value) != value) {
			scr_debug_print("Warning! values_to_bitmask: Value " + string(i) + "is too large, too small or not an integer.")
			value = clamp(floor(value), 0, maxvalue)
			scr_debug_print("Fixed Value: " + string(value))
		}
		
		newFlag |= ((value & maxvalue) << (i * bytesperindex))
	}
	
	return newFlag;
}

function scr_bitmask_to_array(bitmask, arraysize, bytesperindex = 1){
	var mask = power(2, bytesperindex) - 1
	var values = array_create(arraysize)
	
	for (var i = 0; i < arraysize; i++) values[i] = (bitmask >> (i * bytesperindex)) & mask
	
	return values;
}

function scr_set_bitmask_value(bitmask, index, value, bytesperindex = 1){
	var maxvalue = power(2, bytesperindex) - 1
	
	if (value > maxvalue || value < 0 || floor(value) != value) {
		scr_debug_print("Warning! scr_set_bitmask_value: Value " + string(value) + " is too large, too small or not an integer.")
		value = clamp(floor(value), 0, maxvalue)
		scr_debug_print("Fixed Value: " + string(value))
	}
	
	if (index > (18 / bytesperindex)) scr_debug_print("ERROR: WRITING OUT OF BITMASK BOUNDS")
	
	bitmask &= ~(maxvalue << (index * bytesperindex))
	bitmask |= ((value & maxvalue) << (index * bytesperindex))
	return bitmask;
}

function scr_get_bitmask_value(bitmask, index, bytesperindex = 1){
	var maxvalue = power(2, bytesperindex) - 1
	return (bitmask >> (index * bytesperindex)) & maxvalue;
}