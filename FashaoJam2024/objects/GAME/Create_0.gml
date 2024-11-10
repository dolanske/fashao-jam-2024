randomize()

enum GameState {
	INTRO,
	RUNNING,
	END,
}

// Constants

CLOCK_TIMING = 20
BASE_HP = 3
JERAB_SPEED_DEFAULT = 0.06
GAME_SLOW_LIMIT = 15

//////////////////////////////////////////

state = GameState.RUNNING

jerab_dir = 0; //direction of jerab
jerab_dir_prev = 0;
jerab_a = random(pi * 2);

jerab_speed = JERAB_SPEED_DEFAULT; //how fast does jerab swing

current_block_sprite = spr_block_base;
current_block_type = BlockType.BASE
current_block_instance = noone

sprite_animation_frame = 0

block_spd = 0; //speed of the block
block_dir = 0; //direction of block

rope_dist = 0;

drop_cd = 0;

// Game score
points = 0
hp = BASE_HP

// Combo starts by getting S and A
// Combo lasts while the S and A streak is active
combo = 0

// Ends the combo. Can be called even if combo wasn't happening
function end_combo() {
	points += combo
	if (combo > 0) {
		stats.total_combos += 1
	}
	
	combo = 0
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

alarm[0] = 1; // cloud spawner