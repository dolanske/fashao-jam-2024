motion_set(direction,speed);

if (life > 0){
	life = approach(life,0,1*(GAME.jerab_speed/GAME.JERAB_SPEED_DEFAULT));
}else{
	instance_destroy();
}