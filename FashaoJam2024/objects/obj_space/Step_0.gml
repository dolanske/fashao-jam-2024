cam_yoffset = point_distance(0,cam_y,0,CAMERA.y);

y = ystart-cam_yoffset*0.8;

var cam = view_camera[0];
var cam_yy = camera_get_view_y(cam);

y = min(ystart-cam_yoffset*0.7,cam_yy);