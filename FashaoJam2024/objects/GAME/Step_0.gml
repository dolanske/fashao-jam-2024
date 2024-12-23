jerab_dir = sin(jerab_a)*10+270;
jerab_a += jerab_speed;

if (jerab_a > pi * 2) {
	jerab_a = jerab_a % (pi * 2)
}

if (drop_cd > 0){
	if (drop_cd < 40 and drop_cd > 25){
		rope_dist = approach(rope_dist,0,20);
	}
}
if (drop_cd <= 25){
	rope_dist = lerp(rope_dist,700,0.2);
}

drop_cd = approach(drop_cd,0,1);

points_y = approach(points_y,0,2);

points_a += 0.2;
points_scale = sin(points_a);

// Slow down spinning if current block is bullet type
if (current_block_instance != noone && !is_undefined(current_block_instance))
and (variable_instance_exists(current_block_instance, "type") && current_block_instance.type == BlockType.BULLET) {
	jerab_speed = 0.03
	with(CAMERA){
		camera_w = lerp(camera_w,camera_w_default-65,0.2)
		camera_h = lerp(camera_h,camera_h_default-65,0.2)
	}
	audio_sound_pitch(game_music, lerp(audio_sound_get_pitch(game_music), 0.6, 0.01))
} else {
	with(CAMERA){
		camera_w = lerp(camera_w,camera_w_default,0.2)
		camera_h = lerp(camera_h,camera_h_default,0.2)
	}
	jerab_speed = JERAB_SPEED_DEFAULT
	audio_sound_pitch(game_music, lerp(audio_sound_get_pitch(game_music), 1, 0.025))
}

// Happens once when game is finished 
// (player runs out of yang; thus creating large imbalance between ying & yang in his life)
if (hp < 0 && state == GameState.RUNNING) {
	state = GameState.END
	audio_stop_sound(game_music)
	audio_play_sound(game_over_music, 1, true, 0.35)
	call_later(15,time_source_units_frames,function(){
		repeat(20){
		instance_create_depth(CAMERA.x,CAMERA.y+160,-1,obj_head);
		}
		audio_play_sound(sfx_laugh_crowd,1,false);
	});
}
