//release block
var cam = view_camera[0];

var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

//where is the jerab joint
var joint_x = cam_x+cam_w/2;
var joint_y = cam_y-500;
var rope_dist = 700;

//draw rope
draw_sprite_ext(spr_rope,0,joint_x,joint_y,rope_dist,1,jerab_dir,c_white,1);

//draw block
var block = instance_create_depth(joint_x+lengthdir_x(rope_dist,jerab_dir),joint_y+lengthdir_y(rope_dist,jerab_dir),0,obj_block);
block.image_angle = jerab_dir;
block.sprite_index = current_block;
block.speed = block_spd/2;
block.direction = block_dir;