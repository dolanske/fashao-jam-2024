switch(state){
	case 0:
		image_xscale = lerp(image_xscale,0.2,0.5);
		image_yscale = lerp(image_yscale,1.5,0.5);
		if (image_yscale > 1.4) state = 1;
	break;
	case 1:
		image_xscale = lerp(image_xscale,0.1,0.5);
		image_yscale = lerp(image_yscale,1.2,0.5);
		if (image_xscale < 0.13) state = 2;
	break;
	case 2:
		image_xscale = lerp(image_xscale,0,0.4);
		image_yscale = lerp(image_yscale,0.8,0.4);
		if (image_xscale = 0) instance_destroy();
	break;
}