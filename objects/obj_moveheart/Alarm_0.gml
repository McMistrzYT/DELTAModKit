x = distx;
y = disty;

if (!i_ex(obj_heart))
{
    heart = instance_create(x, y, obj_heart);
    heart.sprite_index = sprite_index;
    heart.mask_index = mask_index;
}

instance_destroy();
