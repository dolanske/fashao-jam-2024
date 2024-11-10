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
stats.total_heals = 0
stats.total_combos = 0

hp = BASE_HP
points = 0
combo = 0

sprite_animation_frame = 0

current_block_sprite = spr_block_base;
current_block_type = BlockType.BASE
current_block_instance = noone

obj_stem.swing = 0
