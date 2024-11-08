if (state == BlockState.FALLING) {
	image_angle = lerp(image_angle,270,0.05);
	
	if (place_meeting(x, y, [obj_block, obj_stem])) {
		speed = 0
		gravity = 0
		friction = 0
		state = BlockState.STOPPED
	}
}

