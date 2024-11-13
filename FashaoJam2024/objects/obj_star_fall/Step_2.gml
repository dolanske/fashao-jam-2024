var trail = instance_create_depth(x,y,1,obj_star_trail);
trail.image_xscale = point_distance(x,y,xprevious,yprevious);
trail.image_angle = point_direction(x,y,xprevious,yprevious);
trail.image_yscale = life_max/15;
trail.image_yscale = clamp(trail.image_yscale,1,4);
/*
if (life < life_max/4){
	trail.image_alpha = 0.5;
}