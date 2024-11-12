if (flash){
	gpu_set_fog(true,c_white,0,1000);
	draw_sprite_ext(spr_yen,0,x,y,image_xscale*scale,1*scale,image_angle,c_white,1);
	gpu_set_fog(false,c_white,0,1000);
}else{
	draw_sprite_ext(spr_yen,0,x,y,image_xscale*scale,1*scale,image_angle,c_white,1);
}