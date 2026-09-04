function scr_animate(initalframe, finalframe, imagespeed){
    __animator = instance_create(x, y, obj_animator);
    __animator.target = id;
    __animator.initframe = initalframe;
    __animator.endframe = finalframe;
    __animator.fake_image_speed = imagespeed;
    return __animator;
}
