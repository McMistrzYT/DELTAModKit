function scr_jump_to_point_sprite(landx, landy, speed, time, jumpspr = 0, landspr = 0){
    __jump_to_point = instance_create(x, y, obj_jump_to_point);
    __jump_to_point.target = id;
    
    with (__jump_to_point) {
        startx = x;
        starty = y;
        endx = landx;
        endy = landy;
        jumpspeed = speed;
        jumptime = time;
        jumpsprite = jumpspr;
        landsprite = landspr;        
        if (jumpspr > 0) usesprites = 1;
        
        drawshadow = 0;
    }
    
    return __jump_to_point;
}

function scr_jump_to_point(landx, landy, speed, time, literallyeverytrackrelatedvalue = 0){
    var ___jump = scr_jump_to_point_sprite(landx, landy, speed, time, 0, 0);
    
    with (___jump){
        trackalpha = literallyeverytrackrelatedvalue;
        trackblend = literallyeverytrackrelatedvalue;
        trackindex = literallyeverytrackrelatedvalue;
        tracksprite = literallyeverytrackrelatedvalue;
        trackangle = literallyeverytrackrelatedvalue;
    }
    
    return ___jump;
}

function scr_jump_in_place(speed, time){
    scr_jump_to_point(x, y, speed, time);
}
