// Drop the tile
blocks_placed = 0

jerab_dir = 0; //direction of jerab
jerab_dir_prev = 0;
jerab_a = random(pi * 2);
jerab_speed = 0.06; //how fast does jerab swing

current_block = spr_block_base;
block_spd = 0; //speed of the block
block_dir = 0; //direction of block

rope_dist = 0;

drop_cd = 0;

// Game score
points = 0
hp = 3

// Combo degrades every second until it reaches zero
// Scoring B = keep at the same level for 2 seconds
// Scoring A and S = increase combo by x

// This will show a bar somewhere which is filling up. 
// If the bar is filled up, you will multiply all the points
// you gathered during the combo

// Start combo by scoring 2 S or A in a row

// max combo = 5
// A and S + 0.5
combo = 0

