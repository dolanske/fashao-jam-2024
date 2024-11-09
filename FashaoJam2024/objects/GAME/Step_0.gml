jerab_dir = sin(jerab_a)*10+270;
jerab_a += jerab_speed;

if (drop_cd > 0){
	if (drop_cd < 40 and drop_cd > 25){
		rope_dist = approach(rope_dist,0,20);
	}
}
if (drop_cd <= 25){
	rope_dist = lerp(rope_dist,700,0.2);
}

drop_cd = approach(drop_cd,0,1);