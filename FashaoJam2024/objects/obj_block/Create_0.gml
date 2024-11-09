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

// Store how far 
placed_rating = Rating.NONE

// Will throw the block off and reduce health
function missed_block() {
	GAME.hp -= 1
	CAMERA.shake += 10;
	
	var vfx = instance_create_depth(x,y-sprite_get_height(sprite_index)/2,depth-1,obj_block_falling);
	vfx.sprite_index = asset_get_index(sprite_get_name(sprite_index) + "_falling");
	vfx.image_index = image_index;
	vfx.image_angle = image_angle;
	vfx.speed = speed_prev/2;
	vfx.direction = point_direction(nearest.x,nearest.y,x,y);
	vfx.vspeed -= 5;
	
	instance_destroy();
}