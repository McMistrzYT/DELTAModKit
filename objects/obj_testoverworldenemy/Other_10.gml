if (encountered == 0)
{
	if (global.interact == 0 || global.interact == 4 || washit == 1)
	{
		encountered = 1
		global.specialbattle = 0
		global.flag[9] = 1
		
		if (global.flag[9] == 1) {
			global.batmusic[0] = snd_init(PrimaryBattleMusic)
			
		}
		
		alarm[5] = -300
		vspeed = 0
		global.interact = 1
		con = 1
	}
}
