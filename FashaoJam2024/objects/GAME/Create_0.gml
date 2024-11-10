randomize()

enum GameState {
	RUNNING,
	END,
}

state = GameState.RUNNING

jerab_dir = 0; //direction of jerab
jerab_dir_prev = 0;
jerab_a = random(pi * 2);

jerab_speed_default = 0.06
jerab_speed = jerab_speed_default; //how fast does jerab swing

current_block_sprite = spr_block_base;
current_block_instance = noone
block_spd = 0; //speed of the block
block_dir = 0; //direction of block

game_slow_limit = 15

rope_dist = 0;

drop_cd = 0;

// Game score
points = 0
hp = 3

// Combo starts by getting S and A
// Combo lasts while the S and A streak is active
combo = 0

function end_combo() {
	points += combo
	combo = 0
	stats.total_combos += 1
}

// Statistics for end screen
stats = {
	s_tier_blocks: 0,
	a_tier_blocks: 0,
	b_tier_blocks: 0,
	c_tier_blocks: 0,
	d_tier_blocks: 0,
	total_blocks: 0,
	total_misses: 0,
	total_heals: 0,
	total_combos: 0,
}