if (myinteract == 3)
{
	if (!d_ex())
	{
		global.interact = 0
		myinteract = 0
		
		with (obj_mainchara) onebuffer = 3
		
		if (selfdestruct == true) alarm[0] = 2
	}
}
