if (state == BlockState.FALLING) {
	image_yscale = approach(image_yscale,0.9,0.005);
	if (place_meeting(x, y, [obj_block, obj_stem])) {
		var speed_prev = speed;
		speed = 0
		gravity = 0
		friction = 0
		state = BlockState.STOPPED
		x += 1000;
		var nearest = instance_nearest(x-1000,y,obj_block);
		x -= 1000;
		if (nearest.top = 1){
			//calculating position
			block_dir_offset = angle_difference(point_direction(obj_stem.x,obj_stem.y,x,y),obj_stem.dir);
			block_dist = point_distance(obj_stem.x,obj_stem.y,x,y);
			image_angle = obj_stem.dir-90;
			//var iterations = round(speed*2);
			if (place_meeting(x,y,[obj_block,obj_stem])){
				while (place_meeting(x,y,[obj_block,obj_stem])){
					x += lengthdir_x(1,image_angle-180);
					y += lengthdir_y(1,image_angle-180);
					block_dist ++;
					//iterations --;
				}
			}else{
				while (!place_meeting(x,y,[obj_block,obj_stem])){
					x += lengthdir_x(1,image_angle);
					y += lengthdir_y(1,image_angle);
					block_dist --;
					//iterations --;
				}
			}
			block_dist -= 1;
			with(obj_block) top = 0;
			top = 1;
			
			with(obj_stem) length = other.block_dist;
			
			//squash vfx
			image_yscale = 1.2;
			image_xscale = 0.9;
			
			//setting camera position
			CAMERA.target_y = y-180;
			shake = 5;
			determine_quality()
			return
		}else{
			CAMERA.shake += 10;
			var vfx = instance_create_depth(x,y-sprite_get_height(sprite_index)/2,depth-1,obj_block_falling);
			vfx.sprite_index = asset_get_index(sprite_get_name(sprite_index) + "_falling");
			vfx.image_index = image_index;
			vfx.image_angle = image_angle;
			vfx.speed = speed_prev/2;
			vfx.direction = point_direction(nearest.x,nearest.y,x,y);
			vfx.vspeed -= 5;
			instance_destroy();
		}
	}
	
	image_angle = lerp(image_angle,270,0.05);
}

if (state == BlockState.STOPPED){
	x = obj_stem.x+lengthdir_x(block_dist,obj_stem.dir+block_dir_offset);
	y = obj_stem.y+lengthdir_y(block_dist,obj_stem.dir+block_dir_offset);
	image_angle = obj_stem.dir-90;
	image_xscale = lerp(image_xscale,1,0.2);
	image_yscale = lerp(image_yscale,1,0.2);
}

if (shake > 0){
	if (instance_exists(obj_block)){
			with(instance_nearest(x,y+80,obj_block)){
				shake = other.shake/2;
			}
		}
	shake = approach(shake,0,1);
}