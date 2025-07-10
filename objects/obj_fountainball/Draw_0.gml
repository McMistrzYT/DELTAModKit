if (init == 0 && back == 0)
{
    backball = instance_create(x, y, obj_fountainball);
    backball.image_xscale = 0.1;
    backball.image_yscale = 0.1;
    backball.image_blend = c_white;
    backball.depth = depth + 1;
    backball.vspeed = vspeed;
    backball.hspeed = hspeed;
    backball.friction = friction;
    backball.gravity = gravity;
    backball.gravity_direction = gravity_direction;
    backball.back = 1;
    init = 1;
}

size += 0.5;
image_xscale += 0.01;
image_yscale += 0.01;
draw_self();

if (y <= (-20 - size))
    instance_destroy();
