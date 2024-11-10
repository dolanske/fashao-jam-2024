var cam = view_camera[0];
var cam_y = camera_get_view_y(cam);
var cam_h = camera_get_view_height(cam);

draw_sprite_ext(sprite_index,image_index,x,cam_y+cam_h-y_offset+24-y_shake,image_xscale,image_yscale,0,c_white,1);