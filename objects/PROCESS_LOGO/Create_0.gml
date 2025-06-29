w = sprite_width;
h = sprite_height;
chyoffset = 50;
chsprite = IMAGE_LOGO_CENTER_CHAPTERNUMBER;
chnum = global.chapter;
NOISE = snd_play(AUDIO_INTRONOISE);
siner = 0;
factor = 1;
factor2 = 0;
factory = h / 2;
mid = h / 2;
x = (__view_get(e__VW.WView, 0) / 2) - (w / 2);
y = (__view_get(e__VW.HView, 0) / 2) - (h / 2) - 10;
inity = y;
PHASE = 0;
PHASETIMER = 0;
PHASEPLUS = 0;
AA = 1;
AB = 1;
ingame = 1;

if (global.plot == 0)
    ingame = 0;

skipped = 0;
skiptimer = 0;
room_speed = 15;