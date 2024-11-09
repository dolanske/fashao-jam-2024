draw_sprite_ext(sprite_index,image_index,x+random_range(-shake,shake),y+random_range(-shake,shake),image_xscale,image_yscale,image_angle,c_white,1);

// TODO: show some effect here
// The effect will disappear in a little bit
if (placed_effect_active) {
	draw_text(x + 64, y - 32, placed_rating)
}
