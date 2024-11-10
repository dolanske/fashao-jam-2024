// Restart game. 
// Everything that needs to reset to default as if the game was truly restarted

with (obj_block) {
	instance_destroy()
}

CAMERA.target_y = room_height / 2
CAMERA.shake = 0

// Reset stats
stats.s_tier_blocks = 0
stats.a_tier_blocks = 0
stats.b_tier_blocks = 0
stats.c_tier_blocks = 0
stats.d_tier_blocks = 0
stats.total_blocks = 0
stats.total_misses = 0
stats.total_combos = 0

hp = BASE_HP
points = 0
combo_text = ""

sprite_animation_frame = 0

current_block_sprite = spr_block_base;
current_block_type = BlockType.BASE
current_block_instance = noone

obj_stem.swing = 0
obj_stem.swing_smooth = 0

state = GameState.RUNNING

audio_stop_sound(game_music)
audio_stop_sound(game_over_music)
audio_play_sound(game_music, 1, true, 0.35)

ge_title = choose("Pillar completed", "Time's up!", "Completed", "Doneskis", "Mirakulous!!", "Mao is happy", "BIG NEWS")
ge_subtitle = choose("Astonishing, beautiful", "Aamazing feng shui", "Thank you builder", "Built by bulder fasho", "Awarded 50 potatoes", "Chinese New York")

ge_overlay_alpha = 0
ge_text_offset = -10
ge_text_opacity = 0