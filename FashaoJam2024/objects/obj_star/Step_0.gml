cam_yoffset = point_distance(0,cam_y,0,CAMERA.y);

y = ystart-cam_yoffset*0.8;

var cam = view_camera[0];
var cam_yy = camera_get_view_y(cam);
var cam_h = camera_get_view_height(cam);

if (ystart < (-1000) and ystart > -2600){
	image_alpha = ((abs(ystart)-1000)/1600);
}else{
	image_alpha = 1;
}

//y = min(ystart-cam_yoffset*0.7,cam_yy);

if (y > cam_yy+cam_h+64) instance_destroy();

image_xscale = lerp(image_xscale,1,0.2);
image_yscale = lerp(image_yscale,1,0.2);

//if (spin) image_angle += 5;