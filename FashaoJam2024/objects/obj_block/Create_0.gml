enum BlockState {
	FALLING,
	STOPPED
}

state = BlockState.FALLING

sprite_index = spr_block_base;
image_speed = 0;
image_angle = 0;
gravity = 1;
friction = .1;

shake = 0;

block_dir_offset = 0;
block_dist = 0;

top = 1;

// Quality
// Store how well was the block placed
center_offset = 0

function determine_quality() {
	var collided_instance = collision_rectangle(x - 100, y, x + sprite_width + 100, y + sprite_height + 5, [obj_stem, obj_block], true, true)
	show_debug_message(collided_instance)
}