image_angle += amount1;

a += amount2;
image_xscale = sin(a);

flash = approach(flash,0,1);

if (x < 0){
	hspeed = abs(hspeed);
}
if (x > room_width){
	hspeed = -abs(hspeed);
}

var cam = view_camera[0];
var cam_h = camera_get_view_height(cam);
var cam_y = camera_get_view_y(cam);

if (y > cam_y+cam_h){
	GAME.points ++;
	GAME.points_y += 8;
	instance_destroy();
	instance_create_depth(x,y,-1,obj_yen_gone);
}


if (a > pi*2){
	a = a%(pi*2);
	flash = 3;
	change = 1;
}

if (a > pi) and (change){
	flash = 3;
	change = 0;
}