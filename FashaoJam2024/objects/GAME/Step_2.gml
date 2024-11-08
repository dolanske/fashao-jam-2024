var cam = view_camera[0];

var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

//where is the jerab joint
var joint_x = cam_x+cam_w/2;
var joint_y = cam_y-500;

block_spd = point_distance(joint_x+lengthdir_x(rope_dist,jerab_dir),
						   joint_y+lengthdir_y(rope_dist,jerab_dir),
						   joint_x+lengthdir_x(rope_dist,jerab_dir_prev),
						   joint_y+lengthdir_y(rope_dist,jerab_dir_prev));
block_dir = point_direction(joint_x+lengthdir_x(rope_dist,jerab_dir_prev),
						    joint_y+lengthdir_y(rope_dist,jerab_dir_prev),
						    joint_x+lengthdir_x(rope_dist,jerab_dir),
						    joint_y+lengthdir_y(rope_dist,jerab_dir));

jerab_dir_prev = jerab_dir;
