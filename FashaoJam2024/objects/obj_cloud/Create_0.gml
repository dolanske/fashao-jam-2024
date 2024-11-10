cam_x = CAMERA.x;
cam_y = CAMERA.y;

cam_yoffset = 0;

depth = choose(7,8,9);

hspeed = sign(cam_x-x)/depth*10;
image_speed = 0;
image_index = choose(0,1,2,3);

alarm[0] = 600;