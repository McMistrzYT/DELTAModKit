function Vector2(_x = 0, _y = 0) constructor {
	static add = function(vec2){
		x += vec2.x
		y += vec2.y
	}
	
	static scale = function(vec2){
		x *= vec2.x
		y *= vec2.y
	}
	
	static lerpo = function(vec2, endvalue, amt){
		var __vec = vec2
		__vec.x = lerp(vec2, endvalue, amt)
		__vec.y = lerp(vec2, endvalue, amt)
		return __vec;
	}
	
	static set = function(vec2){
		x = vec2.x
		y = vec2.y
	}
	
	x = _x
	y = _y
	
	direction = function(x, y){ return point_direction(0, 0, x, y); }
	
	magnitude = function(x, y){ return point_distance(0, 0, x, y); }
	
	normalized = function(x, y){
		var __len = point_direction(0, 0, x, y)
		if (x == 0 && y == 0) return new Vector2();
		
		return new Vector2(x / __len, y / __len);
	}
}
