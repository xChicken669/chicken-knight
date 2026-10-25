speed = 5;
shot_timer = 200;

hit_ps = part_system_create();
part_system_depth(hit_ps, -100);

// Create the particle type
hit_pt = part_type_create();
part_type_shape(hit_pt, pt_shape_pixel);
part_type_size(hit_pt, 3, 4, 0, 0);


part_type_color2(hit_pt, c_yellow, c_orange);
part_type_speed(hit_pt, 2, 5, 0, 0);
part_type_direction(hit_pt, 0, 360, 0,0);
part_type_gravity(hit_pt, 0.1, 270);
part_type_life(hit_pt, 20, 25);