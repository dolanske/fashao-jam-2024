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

// Slow down spinning if current block is bullet type
if (current_block_instance != noone && !is_undefined(current_block_instance))
and (variable_instance_exists(current_block_instance, "type") && current_block_instance.type == BlockType.BULLET) {
	jerab_speed = 0.03
} else if (jerab_speed != JERAB_SPEED_DEFAULT) {
	jerab_speed = JERAB_SPEED_DEFAULT
}

// Happens once when game is finished 
// (player runs out of yang; thus creating large imbalance between ying & yang in his life)
if (hp < 0 && state == GameState.RUNNING) {
	state = GameState.END
	
	// TODO: endagme screen shit
}