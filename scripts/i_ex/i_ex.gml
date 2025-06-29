function i_ex(arg0)
{
    if (arg0 > 0)
        return instance_exists(arg0);
    else
        return false;
}