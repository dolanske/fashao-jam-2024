randomize()

enum GameState {
	// TODO Implement intro
	INTRO,
	RUNNING,
	END,
}

// Constants

CLOCK_TIMING = 20
BASE_HP = 3
JERAB_SPEED_DEFAULT = 0.06
GAME_SLOW_LIMIT = 15
COMBO_SPLIT = 1
GE_STATS_INCREMENT = 0.1

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
combo_text = ""

// Ends the combo. Can be called even if combo wasn't happening
function end_combo() {
	var combo_len = string_length(combo_text)
	points += combo_len
	
	if (combo_len > 0) {
		stats.total_combos += 1
	
		// Save longest combo to stats
		if (combo_len > string_length(stats.longest_combo)) {
			stats.longest_combo = combo_text
		}
	}
	
	combo_text = ""
}

// Statistics for end screen
function create_empty_stats() {
	// Create empty stats object
	return {
		s_tier_blocks: 0,
		a_tier_blocks: 0,
		b_tier_blocks: 0,
		c_tier_blocks: 0,
		d_tier_blocks: 0,
		total_blocks: 0,
		total_misses: 0,
		total_combos: 0,
		longest_combo: "",
	}
}

stats = create_empty_stats()

alarm[0] = 1; // cloud spawner

audio_play_sound(game_music, 1, true, 0.35)

////////////////////////////////////////////////////////

// Game end controllers
ge_overlay_alpha = 0
ge_text_offset = -10
ge_text_opacity = 0
ge_stats = create_empty_stats()
ge_points = 0
ge_frames = 0

function lerp_stats(field, real_field) {
	return lerp(field, real_field, GE_STATS_INCREMENT)
}

// Random end-screen text selection
function choose_title() {
	return choose("Pillar completed", "Time's up!", "Completed", "Doneskis", "Miraculous!!", "Mao is happy", "BIG NEWS", "Minecraft???", "Peking celebrates", "Yin yan")
}

function choose_subtitle() {
	return choose("Astonishing, beautiful", "Amazing feng shui", "Thank you builder", "Built by builder Fashao", "Awarded 50 potatoes", "Chinese New York", "+ million social credits", "5 year plan on track", "Feng shui restored")
}	

ge_title = choose_title()
ge_subtitle = choose_subtitle()