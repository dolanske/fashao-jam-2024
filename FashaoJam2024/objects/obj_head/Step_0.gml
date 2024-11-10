//image_xscale = random_range(0.8,1.2);
//image_yscale = random_range(0.8,1.2);

life = approach(life,0,1);

if (life > 10){
y_offset = lerp(y_offset,y_offset_to,0.2);
y_shake = random_range(-10,10);
}else{
	y_offset = lerp(y_offset,0,0.2);
	if (life = 0) instance_destroy();
}