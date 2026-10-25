// WASD input
var _input_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _input_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

var _input_length = point_distance(0, 0, _input_x, _input_y);

if (_input_length > 0)
{
    _input_x /= _input_length;
    _input_y /= _input_length;

    // Face the direction you are pressing right away
    face_dir = point_direction(0, 0, _input_x, _input_y);
}

dash_cooldown = max(0, dash_cooldown - 1);

if (keyboard_check_pressed(vk_shift) && dash_cooldown <= 0)
{
    if (_input_length == 0 && point_distance(0, 0, vel_x, vel_y) > 0.1)
    {
        face_dir = point_direction(0, 0, vel_x, vel_y);
    }

    dash_timer = dash_duration;
    dash_cooldown = dash_cooldown_max;
}

if (dash_timer > 0)
{
    vel_x = lengthdir_x(dash_speed, face_dir);
    vel_y = lengthdir_y(dash_speed, face_dir);
    dash_timer--;
}
else
{
    // Turn faster when pressing against your current movement
    var _accel_x = acceleration;
    var _accel_y = acceleration;

    if (_input_x != 0 && vel_x != 0 && sign(_input_x) != sign(vel_x))
    {
        _accel_x = turn_acceleration;
    }

    if (_input_y != 0 && vel_y != 0 && sign(_input_y) != sign(vel_y))
    {
        _accel_y = turn_acceleration;
    }

    vel_x += _input_x * _accel_x;
    vel_y += _input_y * _accel_y;

    if (_input_x == 0)
    {
        if (vel_x > 0) vel_x = max(0, vel_x - friction);
        else vel_x = min(0, vel_x + friction);
    }

    if (_input_y == 0)
    {
        if (vel_y > 0) vel_y = max(0, vel_y - friction);
        else vel_y = min(0, vel_y + friction);
    }

    // Limit total speed, including diagonal movement
    var _speed = point_distance(0, 0, vel_x, vel_y);

    if (_speed > max_speed)
    {
        vel_x = (vel_x / _speed) * max_speed;
        vel_y = (vel_y / _speed) * max_speed;
    }
}

image_angle = face_dir - 90;

// Move in small steps so fast movement is less likely to pass through a wall
var _move_x = vel_x;
var _move_y = vel_y;
var _steps = ceil(max(abs(_move_x), abs(_move_y)));

if (_steps > 0)
{
    _move_x /= _steps;
    _move_y /= _steps;

    repeat (_steps)
    {
        // Resolve horizontal and vertical collisions separately to slide along walls
        if (_move_x != 0)
        {
            if (!place_meeting(x + _move_x, y, Wall_obj))
            {
                x += _move_x;
            }
            else
            {
                vel_x = 0;
                _move_x = 0;
            }
        }

        if (_move_y != 0)
        {
            if (!place_meeting(x, y + _move_y, Wall_obj))
            {
                y += _move_y;
            }
            else
            {
                vel_y = 0;
                _move_y = 0;
            }
        }
    }
}

if (keyboard_check_pressed(vk_space))
{
    if (get_timer() - shoot_time > 1000000 / 3)
    {
        audio_play_sound(laserShoot, 1, false);

        // Spawn 50 pixels in front of the chicken
        var _spawn_x = x + lengthdir_x(50, face_dir);
        var _spawn_y = y + lengthdir_y(50, face_dir);

        if (round(random_range(1, 10)) == 4)
        {
            var _bullet = instance_create_layer(
                _spawn_x, _spawn_y, "Instances", Bigbullet_obj
            );
            _bullet.direction = face_dir;
        }
        else
        {
            var _bullet = instance_create_layer(
                _spawn_x, _spawn_y, "Instances", Bullet_obj
            );
            _bullet.direction = face_dir;
        }

        shoot_time = get_timer();
    }
}

if (hp <= 0)
{
	audio_stop_all()
    global.retry_room = room;
    room_goto(GameOver)
}

if (keyboard_check(vk_escape)) {
	var escapetime = get_timer()
	if escapetime - get_timer() < -0.5 {
		room_goto(menu_rm)
		audio_stop_all()
	}
		
}