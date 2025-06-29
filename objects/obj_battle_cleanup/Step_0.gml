if (!instance_exists(obj_afterimage))
{
    if (sprite_exists(custom_box_sprite))
        sprite_delete(custom_box_sprite);
    
    if (instance_exists(self))
        instance_destroy();
}
