var cam = view_camera[0];
var cam_y = camera_get_view_y(cam);
var cam_x = camera_get_view_x(cam);
var cam_h = camera_get_view_height(cam);
var cam_w = camera_get_view_width(cam);

var y_shake = 0;

if (GAME.hp = -1)
	y_shake = random_range(-10,10);


draw_sprite_ext(spr_god,image_index,cam_x+cam_w-x_offset,cam_y+y_offset-y_shake,image_xscale,image_yscale,image_angle,c_white,1);