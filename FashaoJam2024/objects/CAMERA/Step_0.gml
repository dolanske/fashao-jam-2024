x = lerp(x,target_x,0.1);
y = lerp(y,target_y,0.1);

camera_set_view_pos(view_camera[0], x - camera_w / 2 - random_range(-shake,shake), y - camera_h / 2 + 48)
camera_set_view_size(view_camera[0], camera_w, camera_h)

shake = approach(shake,0,1);
