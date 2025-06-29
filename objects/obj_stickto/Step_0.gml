if (i_ex(stickingobj) && i_ex(stucktoobj))
{
    stickingobj.depth = stucktoobj.depth + relativedepth;
    stickingobj.x = stucktoobj.x + relx;
    stickingobj.y = stucktoobj.y + rely;
}
else
{
    instance_destroy();
}
