image_xscale = lerp(image_xscale,0,0.3);
image_yscale = lerp(image_yscale,0,0.3);

if (image_xscale < 0.05){
	var yen = instance_create_depth(x,y,-2,obj_yen);
	yen.direction = 90+random_range(-70,70);
	yen.speed = random_range(2,9);
	yen.vspeed -= 2;
	instance_destroy();
}