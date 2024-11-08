if (state == BlockState.FALLING) {
	if (place_meeting(x, y, [obj_block, obj_stem])) {
		speed = 0
		gravity = 0
		friction = 0
		state = BlockState.STOPPED
		determine_quality()
		return
	}
	
	image_angle = lerp(image_angle,270,0.05);
}

