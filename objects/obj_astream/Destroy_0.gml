snd_stop(mystream)
if mystream != snd_nosound {
	audio_destroy_stream(mystream);
}