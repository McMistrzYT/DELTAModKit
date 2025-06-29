cur_jewel = 0;
alarm[0] = 1;
charcon = 0;
chartimer = 0;
tp = 0;
xx = __view_get(e__VW.XView, 0);
yy = __view_get(e__VW.YView, 0);
global.fighting = 0;
movenoise = 0;
selectnoise = 0;
cancelnoise = 0;
onebuffer = 0;
twobuffer = 0;
threebuffer = 0;
upbuffer = 0;
downbuffer = 0;
hold_up = 0;
hold_down = 0;
dograndom = 0;
atalk = 0;
deschaver = 0;
bcolor = merge_color(c_purple, c_black, 0.7);
bcolor = merge_color(bcolor, c_dkgray, 0.5);
chartotal = 0;

global.charturn = 3;
tp = 0;
tpy = 50;
bp = 0;
bpy = 152;

for (p = 0; p < DRHero.__MAX__; p++) {
	mmy[p] = 0;
	havechar[p] = 0;
}

global.submenu = 0;
global.charselect = -1;

for (var i = 0; i < 36; i += 1)
    global.submenucoord[i] = 0;

global.cinstance[0] = 4343434343;
global.cinstance[1] = 343434343434;

for (var i = 0; i < 3; i += 1)
{
    global.faceaction[i] = 0;
	
	if (global.char[i] == DRCharacter.None) continue;
	
	chartotal++;
	havechar[global.char[i] - 1] = 1;
    charpos[global.char[i] - 1] = i;
        
    if (i > 0 && global.char[i] != DRCharacter.Kris)
    {
        global.cinstance[i - 1] = instance_create(obj_mainchara.x, obj_mainchara.y, obj_caterpillarchara);
        global.cinstance[i - 1].target = i * 12;
		
		with (global.cinstance[i - 1])
			scr_character_set_caterpillar_sprites(global.char[i]);
    }
}

global.charinstance[0] = obj_mainchara;
global.charinstance[1] = global.cinstance[0];
global.charinstance[2] = global.cinstance[1];
slmxx = 0;
slmyy = 0;
s_siner = 0;
menusiner = 0;
pagemax[0] = 0;
pagemax[1] = 0;
getmusvol = 1;
curvol = 1;

for (p = 0; p < DRHero.__MAX__; p++)
	hpcolor[p] = scr_hero_get_color(p);
	
menu_sprite = spr_darkmenudesc;
autorun_text = "Auto-Run";
back_text = "Back";
gamepad_controls = [gp_face1, gp_face2, gp_face3, gp_face4, gp_shoulderl, gp_shoulderlb, gp_shoulderr, gp_shoulderrb, gp_select, gp_start, gp_stickl, gp_stickr, gp_padu, gp_padd, gp_padl, gp_padr];
border_options = ["Dynamic", "Simple", "None"];
selected_border = 0;

rouxlsgridenabled = false;
rouxlsbuttoncount_y = 0;
disablesusieact = 0;
dogcon = 0;