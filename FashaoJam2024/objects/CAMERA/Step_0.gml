x = lerp(x,target_x,0.1);
y = lerp(y,target_y,0.1);

camera_set_view_pos(view_camera[0], x - camera_w / 2 - random_range(-shake,shake), y - camera_h / 2 + 48)
camera_set_view_size(view_camera[0], camera_w, camera_h)

shake = approach(shake,0,1);

//spawn stars
if (target_y < -1800){
	if (random(30) < 1) and (abs(abs(y)-abs(target_y)) > 1){
		instance_create_depth(target_x+random_range(-camera_w/2-32,camera_w/2),target_y-camera_h/2-96+random_range(-48,48),3,obj_star);
	}
}
if (target_y < -1400){
	if (random(30) < 1) and (abs(abs(y)-abs(target_y)) > 1){
		instance_create_depth(target_x+random_range(-camera_w/2-32,camera_w/2),target_y-camera_h/2-96+random_range(-48,48),3,obj_star);
	}
}
if (target_y < -1000){
	if (random(15) < 1) and (abs(abs(y)-abs(target_y)) > 1){
		instance_create_depth(target_x+random_range(-camera_w/2-32,camera_w/2),target_y-camera_h/2-96+random_range(-48,48),3,obj_star);
	}
}
