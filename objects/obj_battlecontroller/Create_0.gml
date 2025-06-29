if (global.flag[9] == 1)
{
    var battlemusicvolume = 0.7;
    
    if (i_ex(obj_astream))
    {
        if (obj_astream.mystream == global.batmusic[0])
        {
            if (obj_astream.songname != "mus/battle.ogg")
                battlemusicvolume = 1;
        }
    }
    
    global.batmusic[1] = mus_loop_ext(global.batmusic[0], battlemusicvolume, 1);
}

victory = 0;
victoried = 0;
skipvictory = 0;
global.battleend = 0;
battlewriter = 19212912;
myface = 1913918291;
lbuffer = 0;
rbuffer = 0;
onebuffer = 0;
twobuffer = 0;
myfightreturntimer = 1;
messagepriority = -1;
attackpriority = -1;
hidemercy = 0;
cantspare[2] = 0;
global.darkzone = 1;
global.fighting = 1;

/*if (global.encounterno == 73)
{
    global.fc = 3;
    global.fe = 4;
    global.flag[62] = 1;
}

if (global.flag[62] == 0)
{
    global.fe = 0;
    global.fc = 0;
    global.typer = 4;
    global.battletyper = 4;
}*/

global.flag[62] = 0;
global.myfight = 0;
global.mnfight = 0;
global.bmenuno = 0;
global.attacking = 0;
global.acting = 0;
global.tension = 0;
global.spelldelay = 10;
global.turntimer = 120;
scr_spellinfo_all();
global.tensionselect = 0;

for (j = 0; j < 3; j += 1)
{
    global.temptension[j] = global.tension;
    
    for (i = 0; i < 13; i += 1)
        tempitem[i][j] = global.item[i];
}

for (i = 0; i < 3; i += 1)
{
    global.charcond[i] = 0;
    global.automiss[i] = 0;
    
    if (global.char[i] != DRCharacter.None)
    {
        global.charmove[i] = 1;
        global.charcantarget[i] = 1;
        global.chardead[i] = 0;
    }
    else
    {
        global.charmove[i] = 0;
        global.charcantarget[i] = 0;
    }
}

itempage = 0;
spellpage = 0;
global.flag[50] = 0;
global.flag[51] = 0;
global.flag[52] = 0;
global.flag[53] = 0;
global.flag[63] = 0;

for (i = 0; i < 3; i += 1)
    scr_monster_statreset(i);

for (i = 0; i < 3; i += 1)
{
    if (global.monstertype[i] > 0)
        scr_monster_makeinstance(i);
}

global.monstergold[3] = 0;
global.monsterexp[3] = 0;
global.charturn = 0;
global.currentactingchar = 0;

for (i = 0; i < 3; i += 1)
{
    global.acting[i] = 0;
    global.actingsingle[i] = 0;
    global.actingsimul[i] = 0;
    global.actingtarget[i] = 0;
    global.actingchoice[i] = 0;
    global.charaction[i] = 0;
    global.charspecial[i] = 0;
    global.chartarget[i] = 0;
    global.faceaction[i] = 0;
    global.rembmenuno[i] = 0;
    global.targeted[i] = 0;
    global.battleat[i] = global.at[global.char[i]] + global.itemat[global.char[i]][0] + global.itemat[global.char[i]][1] + global.itemat[global.char[i]][2];
    global.battledf[i] = global.df[global.char[i]] + global.itemdf[global.char[i]][0] + global.itemdf[global.char[i]][1] + global.itemdf[global.char[i]][2];
    global.battlemag[i] = global.mag[global.char[i]] + global.itemmag[global.char[i]][0] + global.itemmag[global.char[i]][1] + global.itemmag[global.char[i]][2];
    global.battleactcount[i] = 0;
    global.monsterattackname[i] = " ";
    
    for (j = 0; j < 18; j++)
    {
        global.battlespell[i][j] = 0;
        global.battlespellname[i][j] = " ";
        global.battlespelldesc[i][j] = " ";
        global.battlespellcost[i][j] = 0;
        global.battlespelltarget[i][j] = 2;
        global.battlespellspecial[i][j] = 0;
    }
}

scr_spellmenu_setup();

for (i = 0; i < 20; i += 1)
{
    for (j = 0; j < 20; j += 1)
        global.bmenucoord[i][j] = 0;
}

movenoise = 0;
selnoise = 0;
laznoise = 0;
damagenoise = 0;
grazenoise = 0;
bcolor = merge_color(c_purple, c_black, 0.7);
bcolor = merge_color(bcolor, c_dkgray, 0.5);
tp = 0;
tpy = 50;
bp = 0;
bpy = 152;
intro = 1;
chartotal = 0;

for (i = 0; i < DRHero.__MAX__; i++) {
	charpos[i] = -1;
	havechar[i] = 0;
	mmy[i] = 0;
}

global.charinstance[0] = 12129292;
global.charinstance[1] = 12129292;
global.charinstance[2] = 12129292;

with (global.charinstance[0])
    myself = 0;

with (global.charinstance[1])
    myself = 1;

with (global.charinstance[2])
    myself = 2;

for (i = 0; i < 3; i += 1)
{
    if (global.char[i] == DRCharacter.None) continue;
	
	var charhere = global.char[i];
	
    chartotal += 1;
	havechar[charhere - 1] = 1;
    charpos[charhere - 1] = i;
    global.charinstance[i] = instance_create(global.heromakex[i], global.heromakey[i], scr_hero_get_battle_instance(charhere - 1));
    global.charinstance[i].myself = i;
    global.charinstance[i].char = charhere;
    global.charinstance[i].depth = 200 - (i * 20);
}

slmxx = 0;
slmyy = 0;
s_siner = 0;
t_siner = 0;
instance_create(0, 0, obj_tensionbar);
reset = 0;
timeron = 1;
noreturn = 0;

for (i = 0; i < DRHero.__MAX__; i++) {
	hpcolor[i] = scr_hero_get_color(i);	
	hpcolorsoft[i] = merge_color(hpcolor[i], c_white, 0.5);
}

global.flag[36] = 0;
global.flag[39] = 0;

if (global.ambush == 1)
{
    scr_ambush();
    global.ambush = 0;
}

if (global.ambush == 2)
{
    with (obj_monsterparent)
        firststrike = 1;
    
    global.tension = round(global.maxtension / 4);
    global.ambush = 0;
}

disablesusieact = 0;
mercytotal = 0;
idefendedthisturn = 0;
ypostenna = 0;
oopsallacts = 0;
spadebuttonenabled = false;
spadebuttoncount = 0;
spadebuttontimer = 0;
heartbuttoncount = 0;
heartbuttontimer = 0;
heartbuttondirection = 270;
heartsuccesstimer = 0;
heartsuccesscon = 0;
recentlyhighlightingheart = 0;
recentlyhighlightingheartvalue = 0;
rouxlsbuttontimer = 0;
rouxlsbuttoncount = -6;
rouxlsbuttoncount2 = -6;
rouxlsbuttoncount_y = 0;
rouxlsgridenabled = false;
recentlyhighlightingspade = 0;
recentlyhighlightingspadevalue = 0;
gridchangedirections = true;
spadebuttondirection = 0;
rouxlsbuttondirection = 270;
rouxlsbuttondirection2 = 270;
rouxlserrorcon = 0;
rouxlserrortimer = 0;
rouxlstelegraphtimer = 0;
rouxlstelegraphcon = 0;
spadetelegraphtimer = 0;
spadetelegraphcon = 0;
spadesuccesstimer = 0;
spadesuccesscon = 0;
rouxlsbuttonendcon = 0;
buttonorder = 0;
spadefail = false;
buttonspeed = 0;
norouxlsbutton = false;
dogtimer = 0;
dogcon = 0;
dogselectedcount = 0;

if (global.chapter == 3)
{
    battletimer = 0;
    battleseconds = 0;
    battleminutes = 0;
    boardend = 0;
    global.boardbattleresult = "won";
    rabbickvar = choose(0, 1);
}

tripticket = 0;
tripticketcon = 0;
triptickettimer = 0;

if (global.chapter == 3)
{
    if (global.encounterno == 131 || global.encounterno == 126 || global.encounterno == 125)
    {
        if (scr_keyitemcheck(DRKeyItem.TripTicket))
            tripticket = 1;
    }
}
