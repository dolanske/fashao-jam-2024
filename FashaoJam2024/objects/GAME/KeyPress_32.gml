if (drop_cd > 10) exit;

//release block
var cam = view_camera[0];

var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

//where is the jerab joint
var joint_x = cam_x+cam_w/2;
var joint_y = cam_y-500;

//draw rope
draw_sprite_ext(spr_rope,0,joint_x,joint_y,rope_dist,1,jerab_dir,c_white,1);

// Choose a new block type
var ran = random(10)
var next_block_type
// TODO: update chances
if (ran < 7) {
	current_block_sprite = spr_block_base
	next_block_type = BlockType.BASE
} else if (ran >= 7) {
	current_block_sprite = spr_block_expand
	next_block_type = BlockType.EXPAND
}

// Create new block
var block = instance_create_depth(joint_x+lengthdir_x(rope_dist+sprite_get_height(current_block_sprite),jerab_dir),joint_y+lengthdir_y(rope_dist+sprite_get_height(current_block_sprite),jerab_dir),0,obj_block);
block.image_angle = jerab_dir;
block.sprite_index = current_block_sprite;
block.speed = block_spd / 2;
block.direction = block_dir;
block.type = next_block_type

// Save instance so it can be referenced
current_block_instance = block

drop_cd = 50;