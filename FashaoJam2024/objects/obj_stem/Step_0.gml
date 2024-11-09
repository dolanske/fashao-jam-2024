dir = sin(a)*amplitude;
a += 0.05;


image_angle = dir;

image_xscale = lerp(image_xscale,1,0.2);

d = min(length/2,room_width/2);

amplitude = tan(d/length)*sin(a);