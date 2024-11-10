var cam = view_camera[0];

var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

//where is the jerab joint
var joint_x = cam_x+cam_w/2;
var joint_y = cam_y-500;

// FIX:
// BLok narrow je z nejakeho duvodu nepripojeny na lano

//draw rope
draw_sprite_ext(spr_rope,0,joint_x+lengthdir_x(rope_dist,jerab_dir),joint_y+lengthdir_y(rope_dist,jerab_dir),0.25,2,jerab_dir-270,c_white,1);

//draw block
if (drop_cd <= 20)
	draw_sprite_ext(current_block_sprite,sprite_animation_frame,joint_x+lengthdir_x(rope_dist+sprite_get_height(current_block_sprite),jerab_dir),joint_y+lengthdir_y(rope_dist+sprite_get_height(current_block_sprite),jerab_dir),1,1,jerab_dir,c_white,1);

//////////////////////////

// Draw the player's points
var start_x = CAMERA.x - CAMERA.camera_w / 2 + 8
var start_y = CAMERA.y - CAMERA.camera_h / 2 + 8

// Draw score
draw_set_font(font)
// TODO: offset by the money icon 
draw_text(start_x, start_y, "Money")
var score_text_height = string_height("Money")
draw_set_font(font_lg)
draw_text(start_x, start_y + score_text_height, points)

// Draw health
draw_set_font(font)
draw_text(start_x + CAMERA.camera_w - string_width("Yang") - 16, start_y, "Yang")
draw_set_font(font_lg)
draw_text(start_x + CAMERA.camera_w - string_width(hp) - 16, start_y + score_text_height, hp)

// Draw combo
if (combo > 0) {
	// TODO: better position & hype 
	draw_set_color(c_black)
	var combo_string = string("{0} Combo", combo)
	draw_text(CAMERA.x - string_width(combo_string) / 2, CAMERA.y + CAMERA.camera_h / 2 - 64, combo_string)
	draw_set_color(c_white)
}