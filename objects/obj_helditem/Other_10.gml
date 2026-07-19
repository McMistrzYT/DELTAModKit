if (held || frozen) exit

held = true
snd_play(snd_item)

if (i_ex(obj_mainchara)) obj_mainchara.holding_item = self
