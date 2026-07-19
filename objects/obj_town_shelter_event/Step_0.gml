vol = 1
vol2 = 0

if (obj_mainchara.y >= 420){
	vol = 1 - ((obj_mainchara.y - 620) / 400)
	vol2 = 0 + ((obj_mainchara.y - 1100) / 300)
}

if (vol < 0) vol = 0
if (vol2 < 0) vol2 = 0

snd_volume(global.currentsong[1], vol, 0)
snd_volume(dk, vol2, 0)
