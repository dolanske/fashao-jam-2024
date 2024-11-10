image_xscale = lerp(image_xscale,1,0.2);
image_yscale = lerp(image_yscale,1,0.2);
xscale = random_range(0.8,1.2);
yscale = random_range(0.8,1.2);

life = approach(life,0,1);

if (life = 0){
	instance_destroy();
}