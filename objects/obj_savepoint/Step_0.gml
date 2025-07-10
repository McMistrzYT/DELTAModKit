if (myinteract == 3)
{
    if (i_ex(mydialoguer) == false)
    {
        instance_create(0, 0, obj_savemenu);
        myinteract = 0;
    }
}

if (global.darkzone == 0)
{
    image_alpha = 0.5;
    
    if (instance_exists(obj_mainchara))
    {
        var dist = distance_to_object_bbox(id, obj_mainchara);
        
        if (dist <= 40)
            image_alpha = (1 - (dist / 40)) + 0.5;
    }
}
