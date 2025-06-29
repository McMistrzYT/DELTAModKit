function scr_animate(arg0, arg1, arg2)
{
    __animator = instance_create(x, y, obj_animator);
    __animator.target = id;
    __animator.initframe = arg0;
    __animator.endframe = arg1;
    __animator.fake_image_speed = arg2;
    return __animator;
}
