if (instance_exists(obj_heart))
{
    sizexoff = 0;
    sizeyoff = 0;
    x = obj_heart.x + 10 + sizexoff;
    y = obj_heart.y + 10 + sizeyoff;
}
else
{
    instance_destroy();
}
