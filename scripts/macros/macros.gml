function macros(){
	#macro DEBUGMODE true
	#macro Debug:DEBUGMODE true
	
	#macro MusicFolder "mus/"
	
	#macro PrimaryBattleMusic "rudebuster_boss.ogg"
	
	#macro INVENTORYMAX_ARMORANDWEAPONS 48
	
	#macro INVENTORYMAX_STORAGE ((global.chapter - (global.chapter >= 3 ? 1 : 0)) * 12)
	#macro INVENTORYMAX_STORAGEARRAYSIZE (6 * 12) // 7 Chapters, Excluding Ch3, Just like Deltarune has for it
	
	#macro NPCSIGNDEBUGBOUNDSDISPLAYALPHA 0
	#macro chaseenemy_drawdebugbox 1
	#macro customdebug_chaseenemy_drawcurrentpacetype 0
	
	#macro IncludeRemovedDebugSoulSlowLock 1
}