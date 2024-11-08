camera_set_view_pos(view_camera[0], x - camera_w / 2, y - camera_h / 2)
camera_set_view_size(view_camera[0], camera_w, camera_h)

x = lerp(x,target_x,0.2);
y = lerp(y,target_y,0.2);