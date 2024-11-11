if (state == GameState.RUNNING && current_block_type == BlockType.CLOCK) {
	// Clock timer
	sprite_animation_frame++

	if (sprite_animation_frame < 8) {
		audio_play_sound(sfx_clock, 1, false)
		alarm[1] = CLOCK_TIMING * (jerab_speed / JERAB_SPEED_DEFAULT)
	} else {
		audio_play_sound(sfx_bell, 1, false)
	}
}
