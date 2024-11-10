if (state == BlockState.FALLING) {
	// If block is off camera, we know we missed the whole pile
	if (y > CAMERA.y + CAMERA.camera_h / 2 + sprite_height) {
		missed_block(speed)
		return
	}
	
	image_yscale = approach(image_yscale, image_yscale * 0.9, 0.005);
	
	if (place_meeting(x, y, [obj_block, obj_stem])) {
		var speed_prev = speed;
		speed = 0
		gravity = 0
		friction = 0
		state = BlockState.STOPPED
		x += 1000;
		var nearest = instance_nearest(x-1000,y,obj_block);
		x -= 1000;
		if (nearest.top = 1) {
			if (is_clock_late) {
				missed_block(speed_prev, nearest)
				return
			}
			
			// FIX
			// Need to grade how block was placed on the stem
			
			// Calculate score based on the distance between 
			// the center and the nearest block center
			var offset = abs(x - nearest.x)
			
			if (type == BlockType.NARROW) {
				offset *= 0.625
			}
			
			// The max x offset can be width of the sprite - 1
			var perc = 100 - (offset / sprite_width) * 100
			
			// Save score to current block & world stats
			// Determine swing of the tower as well
			if (perc >= 97) {
				placed_rating = Rating.S
				GAME.stats.s_tier_blocks += 1
				
				obj_stem.swing_smooth = max(0, obj_stem.swing - 0.3)
			} else if (perc < 97 && perc >= 85) {
				placed_rating = Rating.A
				GAME.stats.a_tier_blocks += 1
				
				obj_stem.swing_smooth = max(0, obj_stem.swing - 0.15)
			} else if (perc < 85 && perc >= 75) {
				placed_rating = Rating.B
				GAME.stats.b_tier_blocks += 1
				
				obj_stem.swing_smooth = min(1, obj_stem.swing + 0.025)
			} else if (perc < 75 && perc >= 62) {
				placed_rating = Rating.C
				GAME.stats.c_tier_blocks += 1
				
				obj_stem.swing_smooth = min(1, obj_stem.swing + 0.05)
			} else if (perc < 62 && perc >= 40) {
				placed_rating = Rating.D
				GAME.stats.d_tier_blocks += 1
				
				obj_stem.swing_smooth = min(1, obj_stem.swing + 0.1)
			} else if (perc < 40) {
				missed_block(speed_prev, nearest)
				return
			}
			
			// Increase the height of the expandable block based on the score it's placed on
			if (type == BlockType.EXPAND) {
				image_xscale = max(((4 - placed_rating) / 4) * 2.5, 1)
			}
			
			// Rare healing block
			if (type == BlockType.HEAL) {
				GAME.hp += 1
			}
			
			// If current and previous block have combo
			if (is_combo_block()) {
				GAME.combo_text += get_rating_str(placed_rating);
			} else if (string_length(GAME.combo_text) > 0) {
				GAME.end_combo()
			}
			
			// This will increment the game points. If you score S, it will add 5 points
			// Because enums start at 0 and move up, D = 4
			GAME.points += 5 - placed_rating
			GAME.stats.total_blocks += 1
			
			//calculating position
			block_dir_offset = angle_difference(point_direction(obj_stem.x,obj_stem.y,x,y),obj_stem.dir);
			block_dist = point_distance(obj_stem.x,obj_stem.y,x,y);
			image_angle = obj_stem.dir-90;
			
			if (place_meeting(x,y,[obj_block,obj_stem])){
				while (place_meeting(x,y,[obj_block,obj_stem])){
					x += lengthdir_x(1,image_angle-180);
					y += lengthdir_y(1,image_angle-180);
					block_dist ++;
				}
			} else {
				while (!place_meeting(x,y,[obj_block,obj_stem])){
					x += lengthdir_x(1,image_angle);
					y += lengthdir_y(1,image_angle);
					block_dist --;
				}
			}
			repeat(5 - placed_rating){
				var vfx = instance_create_depth(x,y,0,obj_rating_vfx);
				vfx.sprite_index = asset_get_index(string("spr_{0}_tier",get_rating_str(placed_rating)));
				vfx.direction = image_angle+90*choose(-1,1)+random_range(-30,30);
				vfx.vspeed = - 10;
				vfx.speed = random_range(10,20);
			}

			alarm[0] = 90
			
			block_dist -= 1;
			with(obj_block) top = 0;
			top = 1;
			
			with(obj_stem) length = other.block_dist;
			
			//squash vfx
			final_xscale = image_xscale
			final_yscale = image_yscale
			image_xscale = image_xscale * 0.9;
			image_yscale = image_yscale * 1.2;
			
			audio_play_sound(sfx_drop, 1, false, 0.1, 0, 0.6)
			
			//setting camera position
			CAMERA.target_y = y - 180;
			shake = 5;
		} else {
			missed_block(speed_prev, nearest)
		}
	}
	
	image_angle = lerp(image_angle,270,0.05);
}

if (state == BlockState.STOPPED) {
	x = obj_stem.x+lengthdir_x(block_dist,obj_stem.dir+block_dir_offset);
	y = obj_stem.y+lengthdir_y(block_dist,obj_stem.dir+block_dir_offset);
	image_angle = obj_stem.dir-90;
	// De-squash
	image_xscale = lerp(image_xscale, final_xscale, 0.2);
	image_yscale = lerp(image_yscale, final_yscale, 0.2);
}

if (shake > 0){
	if (instance_exists(obj_block)) {
		with(instance_nearest(x,y+80,obj_block)) {
			shake = other.shake/2;
		}
	}
	shake = approach(shake,0,1);
}