if (keyboard_check(ord("c")))
{
    onesec = scr_marker(x, y, sprite_index);
    onesec.image_xscale = image_xscale;
    onesec.image_yscale = image_yscale;
    onesec.depth = depth;
    onesec.image_index = image_index;
    onesec.image_speed = image_speed;
    scr_doom(onesec, 2);
    instance_destroy();
}
