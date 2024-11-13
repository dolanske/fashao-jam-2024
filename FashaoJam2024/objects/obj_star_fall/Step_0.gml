motion_set(direction,speed);

if (life > 0){
	life = approach(life,0,1);
}else{
	instance_destroy();
}