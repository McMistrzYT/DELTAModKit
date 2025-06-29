function scr_load_audio()
{
    var audio_groups = [1, 0];
    
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

function snd_play(arg0, arg1 = 1, arg2 = 1)
{
    var _snd = audio_play_sound(arg0, 50, 0);
    
    if (arg1 != 1)
        snd_volume(_snd, arg1, 0);
    
    if (arg2 != 1)
        snd_pitch(_snd, arg2);
    
    return _snd;
}

function snd_loop(arg0)
{
    return audio_play_sound(arg0, 50, 1);
}

function soundplay(arg0, arg1 = 1, arg2 = 1)
{
    return snd_play(arg0, arg1, arg2);
}

function sound_play(arg0, arg1 = 1, arg2 = 1)
{
    return snd_play(arg0, arg1, arg2);
}

function mus_loop(arg0) {
	_xsndinstance = audio_play_sound(arg0, 90, 1);
	snd_volume(_xsndinstance, global.flag[16], 0);
	return _xsndinstance;
}

function mus_play(arg0) {
	_xsndinstance = audio_play_sound(arg0, 90, 0);
	snd_volume(_xsndinstance, global.flag[16], 0);
	return _xsndinstance;
}

function snd_stop(arg0) {
	audio_stop_sound(arg0);	
}

function sound_stop(arg0) { snd_stop(arg0) }

function snd_free_all() {
	with (obj_astream)
		instance_destroy();
}

function snd_free(arg0) {
	if (instance_exists(obj_astream))
    {
        _xstream = arg0;
        obj_astream.bstream = _xstream;
        
        with (obj_astream)
        {
            if (bstream == mystream)
                instance_destroy();
        }
    }
}

function snd_pause(arg0) {
	audio_pause_sound(arg0);	
}

function snd_resume(arg0) {
	audio_resume_sound(arg0);	
}

function snd_init(arg0) {
	var dir = "mus/";
    
    if (global.launcher)
        dir = working_directory + "../mus/";
    
    initsongvar = dir + arg0;
    _mystream = audio_create_stream(initsongvar);
    _astream = instance_create(0, 0, obj_astream);
    _astream.mystream = _mystream;
    _astream.songname = arg0;
    return _mystream;
}

function mus_initplay(arg0)
{
    global.currentsong[0] = snd_init(arg0);
    global.currentsong[1] = mus_play(global.currentsong[0]);
}

function mus_initloop(arg0)
{
    global.currentsong[0] = snd_init(arg0);
    global.currentsong[1] = mus_loop(global.currentsong[0]);
}

function snd_pitch_time(arg0, arg1, arg2)
{
    with (obj_lerppitch)
    {
        if (sndtarget == arg0)
            instance_destroy();
    }
    
    var pitchthing = instance_create(0, 0, obj_lerppitch);
    pitchthing.sndtarget = arg0;
    pitchthing.targetpitch = arg1;
    pitchthing.maxframes = arg2;
    
    with (pitchthing)
        event_user(0);
}

function sound_pitch_time(arg0, arg1, arg2)
{
    snd_pitch_time(arg0, arg1, arg2);
}

function mus_volume(arg0, arg1, arg2)
{
    audio_sound_gain(arg0, arg1 * global.flag[16], (arg2 * 1000) / fps);
}

function snd_is_playing(arg0)
{
    return audio_is_playing(arg0);
}

function sound_is_playing(arg0)
{
    snd_is_playing(arg0);
}

function snd_play_x(arg0, arg1, arg2)
{
    var _mysnd = audio_play_sound(arg0, 50, 0);
    snd_volume(_mysnd, arg1, 0);
    snd_pitch(_mysnd, arg2);
    return _mysnd;
}

function sound_play_x(arg0, arg1, arg2)
{
    snd_play_x(arg0, arg1, arg2);
}

function soundplay_x(arg0, arg1, arg2)
{
    snd_play_x(arg0, arg1, arg2);
}

function mus_loop_ext(arg0, arg1, arg2)
{
    snd_volume(arg0, arg1 * global.flag[16], 0);
    snd_pitch(arg0, arg2);
    return mus_loop(arg0);
}

function snd_stop_all() {
	audio_stop_all()
}

function snd_play_pitch(arg0, arg1)
{
    var _mysnd = audio_play_sound(arg0, 50, 0);
    snd_pitch(_mysnd, arg1);
    return _mysnd;
}

function sound_play_pitch(arg0, arg1)
{
    snd_play_pitch(arg0, arg1);
}

function soundplay_pitch(arg0, arg1)
{
    snd_play_pitch(arg0, arg1);
}