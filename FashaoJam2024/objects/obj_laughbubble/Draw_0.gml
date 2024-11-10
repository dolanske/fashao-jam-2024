var cam = view_camera[0];
var cam_y = camera_get_view_y(cam);
var cam_h = camera_get_view_height(cam);

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*xscale,image_yscale*yscale,0,c_white,1);