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

// Quality
// Store how well was the block placed
center_0ffset = 0

function determine_quality() {
	var collided_instance = collision_rectangle(x - 100, y, x + sprite_width + 100, y + sprite_height + 5, [obj_stem, obj_block], true, true)
	show_debug_message(collided_instance)
	if (collided_instance != noone) {
		CAMERA.target_y = CAMERA.y - collided_instance.sprite_height
	}
}	