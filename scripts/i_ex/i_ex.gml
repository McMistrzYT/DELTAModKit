function i_ex(instanceid) {
    if (instanceid >= 0) return instance_exists(instanceid) else return false;
}

function d_ex() { return i_ex(obj_dialoguer) }