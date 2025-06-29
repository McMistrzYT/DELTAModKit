function scr_oflash(arg0 = false)
{
    var _oflash = instance_create_depth(x, y, depth - 1, obj_oflash);
    _oflash.image_xscale = image_xscale;
    _oflash.image_yscale = image_yscale;
    _oflash.image_speed = 0;
    _oflash.image_index = image_index;
    _oflash.sprite_index = sprite_index;
    _oflash.target = id;
    _oflash.follow = arg0;
    return _oflash;
}
