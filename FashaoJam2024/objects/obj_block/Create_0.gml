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

function stop_fall() {
	
}