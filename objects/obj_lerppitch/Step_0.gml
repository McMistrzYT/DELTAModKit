frames++;
var newpitch = lerp(initpitch, targetpitch, frames / maxframes);
snd_pitch(sndtarget, newpitch);

if (frames >= maxframes)
    instance_destroy();
