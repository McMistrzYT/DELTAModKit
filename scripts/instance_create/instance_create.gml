function instance_create(arg0, arg1, arg2){
	var myDepth = object_get_depth(arg2);
    return instance_create_depth(arg0, arg1, myDepth, arg2);
}