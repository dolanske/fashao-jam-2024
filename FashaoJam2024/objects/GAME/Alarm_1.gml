// Clock timer
audio_play_sound(sfx_clock, 1, false)
sprite_animation_frame++

if (sprite_animation_frame < 8) {
	alarm[1] = CLOCK_TIMING
}	
