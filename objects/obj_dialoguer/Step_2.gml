if (zurasucon == 1)
{
    if (i_ex(writer))
    {
        remwriterx = writer.writingx - camerax();
        remwritery = writer.writingy - cameray();
    }
    
    zurasucon = 2;
}

if (zurasucon >= 1 && remfacex == 0)
{
    if (global.fc != 0)
    {
        remfacex = obj_face.x - camerax();
        remfacey = obj_face.y - cameray();
    }
}
