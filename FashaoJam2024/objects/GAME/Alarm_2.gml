alarm[2] = random_range(120,360);
if (CAMERA.y > -2800) exit;
instance_create_depth(CAMERA.x+(room_width/4)*choose(-1,1),CAMERA.y-random_range(room_height/8,room_height/2),1,obj_star_fall);