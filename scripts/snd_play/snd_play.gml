function scr_load_audio()
{
    var audio_groups = [audio_sfx, audiogroup_default];
    
    for (var i = 0; i < array_length(audio_groups); i++)
    {
        if (audio_group_is_loaded(audio_groups[i]))
            continue;
        
        audio_group_load(audio_groups[i]);
    }
}

function snd_volume(arg0, arg1, arg2)
{
    audio_sound_gain(arg0, arg1, (arg2 * 1000) / fps);
}

function sound_volume(arg0, arg1, arg2)
{
    snd_volume(arg0, arg1, arg2);
}

function snd_pitch(arg0, arg1)
{
    audio_sound_pitch(arg0, arg1);
}

function sound_pitch(arg0, arg1)
{
    snd_pitch(arg0, arg1);
}

function snd_play(audio, volume = 1, pitch = 1){
    var _snd = audio_play_sound(audio, 50, 0);
    
    if (volume != 1) snd_volume(_snd, volume, 0);    
    if (pitch != 1) snd_pitch(_snd, pitch);
    
    return _snd;
}

function snd_loop(audio){ return audio_play_sound(audio, 50, 1); }
function soundplay(audio, volume = 1, pitch = 1){ return snd_play(audio, volume, pitch); }
function sound_play(audio, volume = 1, pitch = 1){ return snd_play(audio, volume, pitch); }

function mus_loop(audio) {
	_xsndinstance = audio_play_sound(audio, 90, 1);
	snd_volume(_xsndinstance, global.flag[16], 0);
	return _xsndinstance;
}

function mus_play(audio) {
	_xsndinstance = audio_play_sound(audio, 90, 0);
	snd_volume(_xsndinstance, global.flag[16], 0);
	return _xsndinstance;
}

function snd_stop(audio) {
	audio_stop_sound(audio);	
}

function sound_stop(audio) { snd_stop(audio) }

function snd_free_all() {
	with (obj_astream)
		instance_destroy();
}

function snd_free(audio) {
	if (instance_exists(obj_astream)) {
        _xstream = audio;
        obj_astream.bstream = _xstream;
        
        with (obj_astream){
            if (bstream == mystream) instance_destroy();
        }
    }
}

function snd_pause(audio) {
	audio_pause_sound(audio);	
}

function snd_resume(audio) {
	audio_resume_sound(audio);	
}

function snd_init(songname) {
	var dir = MusicFolder;    
    if (global.launcher) dir = working_directory + "../" + MusicFolder;
    
    initsongvar = dir + songname;
    if file_exists(initsongvar)
        _mystream = audio_create_stream(initsongvar);
    else
        _mystream = snd_nosound;
    _astream = instance_create(0, 0, obj_astream);
    _astream.mystream = _mystream;
    _astream.songname = songname;
    return _mystream;
}

function mus_initplay(songname){
    global.currentsong[0] = snd_init(songname);
    global.currentsong[1] = mus_play(global.currentsong[0]);
}

function mus_initloop(songname){
    global.currentsong[0] = snd_init(songname);
    global.currentsong[1] = mus_loop(global.currentsong[0]);
}

function snd_pitch_time(audio, pitch, time){
    with (obj_lerppitch) { if (sndtarget == audio) instance_destroy(); }
    
    var pitchthing = instance_create(0, 0, obj_lerppitch);
    pitchthing.sndtarget = audio;
    pitchthing.targetpitch = pitch;
    pitchthing.maxframes = time;
    
    with (pitchthing) event_user(0);
}

function sound_pitch_time(audio, pitch, time){ snd_pitch_time(audio, pitch, time); }

function mus_volume(audio, volume, time){ audio_sound_gain(audio, volume * global.flag[16], (time * 1000) / fps); }

function snd_is_playing(audio){ return audio_is_playing(audio); }
function sound_is_playing(audio){ snd_is_playing(audio); }

function snd_play_x(audio, volume, pitch){
    var _mysnd = audio_play_sound(audio, 50, 0);
    snd_volume(_mysnd, volume, 0);
    snd_pitch(_mysnd, pitch);
    return _mysnd;
}

function sound_play_x(audio, volume, pitch){ snd_play_x(audio, volume, pitch); }
function soundplay_x(audio, volume, pitch){ snd_play_x(audio, volume, pitch); }
function mus_loop_ext(music, volume, pitch){
    snd_volume(music, volume * global.flag[16], 0);
    snd_pitch(music, pitch);
    return mus_loop(music);
}

function snd_stop_all() { audio_stop_all() }

function snd_play_pitch(audio, pitch){
    var _mysnd = audio_play_sound(audio, 50, 0);
    snd_pitch(_mysnd, pitch);
    return _mysnd;
}

function sound_play_pitch(audio, pitch){ snd_play_pitch(audio, pitch); }
function soundplay_pitch(audio, pitch){ snd_play_pitch(audio, pitch); }
