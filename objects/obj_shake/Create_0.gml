camera_ = 0;
shakespeed = 1;
shakesign = 1;
shakex = 4;
shakey = 4;
siner = 0;
active = 0;
permashake = 0;
beenset = 0;

if (instance_number(object_index) >= 2)
{
    active = -1;
    instance_destroy();
}
