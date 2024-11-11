enum BlockType {
	BASE,
	EXPAND,
	HEAL,
	BULLET,
	NARROW,
	CLOCK
}

enum BlockState {
	FALLING,
	STOPPED
}

state = BlockState.FALLING
type = BlockType.BASE

sprite_index = spr_block_base;
image_speed = 0;
image_angle = 0;
gravity = 1;
friction = .1;

final_xscale = 0
final_yscale = 0

shake = 0;

block_dir_offset = 0;
block_dist = 0;

top = 1;

is_clock_late = false

// Store how far from the center we've placed the next block
placed_rating = Rating.NONE

// Will throw the block off and reduce health
function missed_block(speed_prev, nearest = undefined) {
	GAME.hp -= 1
	GAME.end_combo()
	CAMERA.shake += 10;
	GAME.stats.total_misses += 1
	
	// Show a block tumbling down
	if (nearest != noone && !is_undefined(nearest)) {
		var vfx = instance_create_depth(x,y-sprite_get_height(sprite_index)/2,depth-1,obj_block_falling);
		vfx.sprite_index = asset_get_index(sprite_get_name(sprite_index) + "_falling");
		vfx.image_index = image_index;
		vfx.image_angle = image_angle;
		vfx.image_yscale = image_yscale
		vfx.speed = speed_prev/2;
		vfx.direction = point_direction(nearest.x,nearest.y,x,y);
		vfx.vspeed -= 5;
	}
	audio_play_sound(
		choose(sfx_fall_1, sfx_fall_2, sfx_fall_3, sfx_fall_4, sfx_fall_5, sfx_fall_6, sfx_fall_7),
		1, false 
	)
	
	instance_destroy();
}