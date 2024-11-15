cam_yoffset = point_distance(0,cam_y,0,CAMERA.y);


y = ystart-cam_yoffset*0.9;

if (y < -1800){
	image_a = 1-((abs(y+1800))/1000);
	if (y < -2800) instance_destroy();
}


hspeed = hspeed_base*(GAME.jerab_speed/GAME.JERAB_SPEED_DEFAULT);