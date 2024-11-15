cam_x = CAMERA.target_x;
cam_y = CAMERA.target_y;


cam_yoffset = 0;
cam_yoffset_smooth = 0;

image_a = 1;

depth = choose(7,8,9);

hspeed_base = sign(cam_x-x)/depth*10;
hspeed = hspeed_base;
image_speed = 0;
image_index = choose(0,1,2,3);

alarm[0] = 900;