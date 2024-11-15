y_offset_to = random_range(48,160);
y_offset = 0;
image_xscale = choose(-1,1);
image_yscale = 1;

x = random_range(0,room_width);

life = random_range(60,80);

y_shake = 0;

image_speed = 0;
image_index = choose(0,1,2,3);

if (random(2) < 1){
	var vfx = instance_create_depth(x,y+64,-2,obj_laughbubble);
	vfx.vspeed = -y_offset_to/8;
	vfx.friction = 2;
	vfx.life = life;
	vfx.sprite_index = spr_laught_bubble;
}
