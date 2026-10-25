move_speed = 0;
max_speed = 5;
acceleration = 0.15;
friction = 0.2;
move_dir = 0;
_dx_orientation = 0
_dy_orientation = 0
shoot_time = 0
hp = 100
maxhp = 100

// Create the particle system
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


vel_x = 0;
vel_y = 0;

acceleration = 0.45;
friction = 0.35;
max_speed = 4;

face_dir = 0; // Sprite faces right at angle 0

dash_speed = 8;
dash_duration = 18; // Frames
dash_cooldown_max = 45; // Frames
dash_timer = 0;
dash_cooldown = 0;

shoot_time = get_timer();

turn_acceleration = 2.5