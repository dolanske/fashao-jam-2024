if (drop_cd > 10) exit;

// Release block
var cam = view_camera[0];

var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

// where is the jerab joint
var joint_x = cam_x+cam_w/2;
var joint_y = cam_y-500;

// draw rope
draw_sprite_ext(spr_rope,0,joint_x,joint_y,rope_dist,1,jerab_dir,c_white,1);

// Create new block
var block = instance_create_depth(joint_x+lengthdir_x(rope_dist+sprite_get_height(current_block_sprite),jerab_dir),joint_y+lengthdir_y(rope_dist+sprite_get_height(current_block_sprite),jerab_dir),0,obj_block);
block.image_angle = jerab_dir;
block.sprite_index = current_block_sprite;
block.image_index = sprite_animation_frame
block.speed = block_spd / 2;
block.direction = block_dir;
block.type = current_block_type

if (sprite_animation_frame >= 8 && current_block_type == BlockType.CLOCK) {
	block.is_clock_late = true
}

// Save instance so it can be referenced
current_block_instance = block

drop_cd = 50;

// Reset clock / sprite animation
sprite_animation_frame = 0

// Select next block after the current one was dropped
var chance = random(10)

if (chance < 7) {
	current_block_sprite = spr_block_base
	current_block_type = BlockType.BASE
} else if (chance < 9 && chance >= 7) {
	// Randomly choose basic modifiers
	var block_choice = choose(
		{ sprite: spr_block_expand, type: BlockType.EXPAND },
		{ sprite: spr_block_narrow, type: BlockType.NARROW },
		{ sprite: spr_block_bullet, type: BlockType.BULLET }
	)
	
	current_block_sprite = block_choice.sprite
	current_block_type = block_choice.type
} else if (chance >= 9.5) {
	var block_choice = choose(
		{ sprite: spr_block_heal, type: BlockType.HEAL },
		{ sprite: spr_block_clock, type: BlockType.CLOCK },
	)
	current_block_sprite = block_choice.sprite
	current_block_type = block_choice.type
	
	if (block_choice.type == BlockType.CLOCK) {
		alarm[1] = CLOCK_TIMING
	}
}