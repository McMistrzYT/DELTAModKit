// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_defend(char = global.charturn, nexthero = true){
	scr_tensionheal(40);
                
	global.faceaction[char] = 4;
	global.charaction[char] = 10;
	if nexthero scr_nexthero()
}