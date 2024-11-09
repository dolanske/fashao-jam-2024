dir = sin(a)*amplitude*swing;
a += 0.05;


image_angle = dir;

image_xscale = lerp(image_xscale,1,0.2);

d = min(length/8,room_width/2);

var ang = point_direction(x,y,x+d,y-length);
amplitude = abs(angle_difference(90,ang));