var cam = view_camera[0];

var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

//where is the jerab joint
var joint_x = cam_x+cam_w/2;
var joint_y = cam_y-500;

var start_x = cam_x + 8
var start_y = cam_y + 8

if (state == GameState.INTRO) {
	///////////////////////////////////////////////////
	// INTRO

} else if (state == GameState.RUNNING) {
	///////////////////////////////////////////////////
	// IN GAME

	//draw rope
	draw_sprite_ext(spr_rope,0,joint_x+lengthdir_x(rope_dist,jerab_dir),joint_y+lengthdir_y(rope_dist,jerab_dir),0.25,2,jerab_dir-270,c_white,1);

	//draw block
	if (drop_cd <= 20)
		draw_sprite_ext(current_block_sprite,sprite_animation_frame,joint_x+lengthdir_x(rope_dist+sprite_get_height(current_block_sprite),jerab_dir),joint_y+lengthdir_y(rope_dist+sprite_get_height(current_block_sprite),jerab_dir),1,1,jerab_dir,c_white,1);

	// Draw score
	draw_set_font(font)
	// TODO Pridej money ikonku nalevo od yenu
	// A naanimuj ji
	//draw_text(start_x, start_y, "Yen")
	//var score_text_height = string_height("Yen")

	//yen in the middle
	//rectangle
	draw_set_color(c_black);
	draw_rectangle(cam_x,cam_y+cam_h-48,cam_x+cam_w,cam_y+cam_h,false);
	draw_set_color(c_white);
	//points
	draw_set_font(font_lg);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var points_xx = cam_x+cam_w/2;
	var points_yy = cam_y+cam_h-24;
	draw_set_color(make_color_rgb(255,252,197));
	draw_text(points_xx,points_yy+points_y,points);
	draw_set_color(c_white);
	//yen
	draw_sprite_ext(spr_yen,0,points_xx-string_width(points)/2-24+random_range(-points_y/2,points_y/2),points_yy+random_range(-points_y/2,points_y/2),points_scale*0.6,1*0.6,0,c_white,1);
	draw_sprite_ext(spr_yen,0,points_xx+string_width(points)/2+24+random_range(-points_y/2,points_y/2),points_yy+random_range(-points_y/2,points_y/2),points_scale*0.6,1*0.6,0,c_white,1);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	
	//draw_set_font(font_lg);
	//draw_text(start_x, start_y + score_text_height+points_y, points)

	// Draw health
	//draw_set_font(font)
	//draw_text(start_x + CAMERA.camera_w - string_width("Yang") - 16, start_y, "Yang")
	//draw_set_font(font_lg)
	//draw_text(start_x + CAMERA.camera_w - string_width(hp) - 16, start_y + score_text_height, hp)

	// Draw combo
	if (string_length(combo_text) > 0) {
		// TODO combo text kresli pozpatek, at je nejnovejsi blok always TOP LEFT
		// TODO naanimuj to tak aby to slo poznat, ze ten nejnovejsi je latest combo (treba bude mit na chvilku vetsi x_scale a y_scale a prilety trosku zvrchu)
		draw_set_color(c_black)
		for (var i = 1; i < string_length(combo_text)+1; i++){
			var letter = string_char_at(combo_text,i);
			draw_sprite_ext(asset_get_index("spr_" + string(letter) + "_tier"),0,start_x+40+(i-1)*64-floor((i-1)/5)*5*64,start_y+48+floor((i-1)/5)*48,random_range(0.4,0.6),random_range(0.4,0.6),random_range(-5,5),c_white,1);
		}
		
		draw_set_color(c_white)
		
		if (!audio_is_playing(sfx_cheer_crowd)) {
			audio_play_sound(sfx_cheer_crowd, 1, true, 0.5, 0, 0.7)
		}
	} else {
		if (audio_is_playing(sfx_cheer_crowd)) {
			audio_stop_sound(sfx_cheer_crowd)
			audio_sound_pitch(sfx_cheer_crowd, 1)
		}
	}
} else if (state == GameState.END) {
	///////////////////////////////////////////////////
	// END SCREEN
	
	// TODO
	// Finalni score by melo nejak poskakovat at je tam extra efekt
	// Pridat zvuk cinkani minci, zatim co se skore pricita
	
	ge_text_offset = lerp(ge_text_offset, start_x, 0.2)
	ge_text_opacity = lerp(ge_text_opacity, 1, 0.2)
	
	draw_set_alpha(ge_overlay_alpha)
	draw_set_color(c_black)
	draw_rectangle(ge_text_offset - 9, start_y - 8, ge_text_offset + window_get_width(), start_y + window_get_height(), false)
	draw_set_alpha(1)
	draw_set_color(c_white)
	ge_overlay_alpha = lerp(ge_overlay_alpha, 0.8, 0.1)
	
	draw_set_font(font_lg)
	draw_text(ge_text_offset, start_y, ge_title)
	draw_set_font(font)
	draw_text(ge_text_offset, start_y + 32, ge_subtitle)
	draw_rectangle(ge_text_offset, start_y + 56, ge_text_offset + 64, start_y + 58, false)
	
	draw_set_alpha(ge_text_opacity)
	
	// Draw stats
	
	// Play money sound
	if (ge_points != points) {
		audio_play_sound(
			choose(sfx_money_1,sfx_money_2, sfx_money_3),
			1, false, random_range(0.01, 0.8)
		)
	}
	
	ge_points = lerp_stats(ge_points, points)
	draw_text(ge_text_offset, start_y + 80, "Yen")
	draw_text(ge_text_offset + 156, start_y + 80, round(ge_points))
	
	ge_stats.total_blocks = lerp_stats(ge_stats.total_blocks, stats.total_blocks)
	draw_text(ge_text_offset, start_y + 100, "Placed blocks")
	draw_text(ge_text_offset + 156, start_y + 100, round(ge_stats.total_blocks))
	
	ge_stats.total_combos = lerp_stats(ge_stats.total_combos, stats.total_combos)
	draw_text(ge_text_offset, start_y + 120, "Combos")
	draw_text(ge_text_offset + 156, start_y + 120,round(ge_stats.total_combos))
	
	// Show the longest combo text increasing
	if (string_length(ge_stats.longest_combo) != string_length(stats.longest_combo)) {
		ge_frames++
	}
	
	// Only increase every 8 frames. Fuck you I dont want alarm for this
	if (ge_frames % 8 == 0) {
		// TODO muzem udelat ze pokazde kdyz se to incrementne, tak ten text poskoci?
		ge_stats.longest_combo += string_char_at(stats.longest_combo, string_length(ge_stats.longest_combo))
	}
	
	draw_text(ge_text_offset, start_y + 140, "Longest combo")
	draw_text(ge_text_offset + 156, start_y + 140, ge_stats.longest_combo)
	
	draw_rectangle(ge_text_offset, start_y + 166, ge_text_offset + 64, start_y + 168, false)
	
	ge_stats.s_tier_blocks = lerp_stats(ge_stats.s_tier_blocks, stats.s_tier_blocks)
	draw_text(ge_text_offset, start_y + 190, "S tier")
	draw_text(ge_text_offset + 156, start_y + 190,round(ge_stats.s_tier_blocks))
	
	ge_stats.a_tier_blocks = lerp_stats(ge_stats.a_tier_blocks, stats.a_tier_blocks)
	draw_set_alpha(0.9)
	draw_text(ge_text_offset, start_y + 210, "A tier")
	draw_text(ge_text_offset + 156, start_y + 210, round(ge_stats.a_tier_blocks))
	
	ge_stats.b_tier_blocks = lerp_stats(ge_stats.b_tier_blocks, stats.b_tier_blocks)
	draw_set_alpha(0.8)
	draw_text(ge_text_offset, start_y + 230, "B tier")
	draw_text(ge_text_offset + 156, start_y + 230, round(ge_stats.b_tier_blocks))
	
	ge_stats.c_tier_blocks = lerp_stats(ge_stats.c_tier_blocks, stats.c_tier_blocks)
	draw_set_alpha(0.7)
	draw_text(ge_text_offset, start_y + 250, "C tier")
	draw_text(ge_text_offset + 156, start_y + 250, round(ge_stats.c_tier_blocks))
	
	ge_stats.d_tier_blocks = lerp_stats(ge_stats.d_tier_blocks, stats.d_tier_blocks)
	draw_set_alpha(0.6)
	draw_text(ge_text_offset, start_y + 270, "D tier")
	draw_text(ge_text_offset + 156, start_y + 270, round(ge_stats.d_tier_blocks))
	
	ge_stats.total_misses = lerp_stats(ge_stats.total_misses, stats.total_misses)
	draw_set_alpha(1)
	draw_text(ge_text_offset, start_y + 290, "Misses")
	draw_text(ge_text_offset + 156, start_y + 290, round(ge_stats.total_misses))
	
	var y_start = obj_stem.y;
	
	// TODO: basically by se toto melo kreslit uprostred obrazovky
	// a kdyz se prida jeden, hned se to zas vycentruje
	
	// Takze az by sel mimo obrazovku, poujde mimo nahoru i dolu zaroven
	
	// TODO: udelej to tak, aby se tam ta vez jakoby postavila (treba 10 bloku za veterinu +/-?)
	
	with(obj_block){
		draw_sprite_ext(
			sprite_index,
			image_index,
			x / 8 + start_x + room_width / 1.5 + 32,
			y / 8 - y_start + start_y + cam_h + 180,
			image_xscale / 8,
			image_yscale / 8,
			image_angle,
			c_white,
			1
		);
	}
	with(obj_stem){
		draw_sprite_ext(
			sprite_index,
			image_index,
			x / 8 + start_x + room_width / 1.5 + 32,
			y / 8 - y_start + start_y + cam_h + 180,
			image_xscale / 8,
			image_yscale / 8,
			image_angle-(image_angle+90)/2+45,
			c_white,
			1
		);
	}
}