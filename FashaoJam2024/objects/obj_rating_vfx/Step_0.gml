image_xscale = lerp(image_xscale,0.3,0.2);
image_yscale = lerp(image_yscale,0.3,0.2);

if (life > 0){
	life = approach(life,0,1);
}else{
	image_xscale = approach(image_xscale,0,0.1);
	image_yscale = approach(image_yscale,0,0.1);
}