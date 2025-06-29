obj_menuwriter.testwho = who;

with (obj_menuwriter)
{
    if (active == 1 && testwho == who)
        instance_destroy();
}

active = 1;
