if (paused && !pausing)
{
    pausing = true;
    audio_pause_all();
    instance_deactivate_all(true);
}

if (pausing && !os_is_paused())
{
    paused = false;
    pausing = false;
    instance_activate_all();
    audio_resume_all();
    alarm[0] = 1;
}