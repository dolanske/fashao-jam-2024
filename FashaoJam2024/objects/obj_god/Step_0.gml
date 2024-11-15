var cam = view_camera[0];
var cam_y = camera_get_view_y(cam);
var cam_x = camera_get_view_x(cam);
var cam_h = camera_get_view_height(cam);
var cam_w = camera_get_view_width(cam);

switch(state){
	case 0:
		y_offset = lerp(y_offset,160,0.1);
		x_offset = lerp(x_offset,200,0.1);
		image_angle = lerp(image_angle,20,0.1);
		life --;
		if (life = 40){
			repeat(GAME.hp+1){
				var heart = instance_create_depth(cam_x+cam_w/2,cam_y+cam_h/4,-6,obj_heart_vfx);
				heart.direction = 270+random_range(-30,30);
				heart.speed = 5;
				heart.life = 45;
			}
		}
		if (life = 0){
			state = 1;
			life = 60;
		}
	break;
	case 1:
		y_offset = lerp(y_offset,-60,0.1);
		x_offset = lerp(x_offset,-200,0.1);
		image_angle = lerp(image_angle,-20,0.1);
		
		life --;
		if (life = 0){
			instance_destroy();
		}
	break;
}