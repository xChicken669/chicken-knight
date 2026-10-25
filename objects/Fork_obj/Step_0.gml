if hp = 0 or hp<0 {global.retry_room = room;room_goto("YouWin")}

var _player = instance_find(Player_obj, 0);

if (_player == noone)
{
    speed = 0;
    exit;
}

var _distance = point_distance(x, y, _player.x, _player.y);
var _target_dir = point_direction(x, y, _player.x, _player.y);

switch (fork_state)
{
    case "chase":
        image_blend = c_white;
        direction = _target_dir;
        speed = chase_speed;

        if (_distance < charge_range)
        {
       
            var _attack_choice = irandom(2);

    
            if (_attack_choice == last_attack)
            {
                _attack_choice += 1;

                if (_attack_choice > 2)
                {
                    _attack_choice = 0;
                }
            }

            last_attack = _attack_choice;
            state_timer = 30;
            speed = 0;
            image_blend = c_red;

            if (_attack_choice == 0)
			{
                charge_dir = _target_dir;
                fork_state = "windup";
            }
            else if (_attack_choice == 1)
            {

                fork_state = "volley_windup";
            }
            else
            {
                aim_dir = _target_dir;
                fork_state = "aim_windup";
            }
        }
        break;

    case "windup":
        speed = 0;
        image_blend = c_red;
        state_timer--;

        if (state_timer <= 0)
        {
            fork_state = "charge";
            state_timer = 60;
        }
        break;

    case "charge":
        image_blend = c_white;
        direction = charge_dir;
        speed = charge_speed;
        state_timer--;

        if (state_timer <= 0)
        {
            fork_state = "cooldown";
            state_timer = 45;
            speed = 0;
        }
        break;

    case "cooldown":
        speed = 0;
        image_blend = c_white;
        state_timer--;

        if (state_timer <= 0)
        {
            fork_state = "chase";
        }
        break;

    case "volley_windup":
        speed = 0;
        image_blend = c_red;
        state_timer--;

        if (state_timer <= 0)
        {
            for (var i = 0; i < 11; i++)
            {
                var _shot = instance_create_layer(
                    x, y, "Instances", ForkShot_obj
                );

                _shot.direction = i * 360 / 11;
                _shot.image_angle = _shot.direction - 90;
            }
			alarm_set(2,20)

            image_blend = c_white;
            fork_state = "volley_cooldown";
            state_timer = 30;
        }
        break;

    case "volley_cooldown":
        speed = 0;
        image_blend = c_white;
        state_timer--;

        if (state_timer <= 0)
        {
            fork_state = "chase";
        }
        break;

    case "aim_windup":
        speed = 0;
        image_blend = c_red;
        state_timer--;

        if (state_timer <= 0)
        {
            for (var i = 0; i < 3; i++)
            {
                var _shot = instance_create_layer(
                    x, y, "Instances", ForkShot_obj
                );

                _shot.direction = aim_dir + (i - 1) * 20;
                _shot.image_angle = _shot.direction - 90;
            }

            image_blend = c_white;
            fork_state = "aim_cooldown";
            state_timer = 45;
        }
        break;

    case "aim_cooldown":
        speed = 0;
        image_blend = c_white;
        state_timer--;

        if (state_timer <= 0)
        {
            fork_state = "chase";
        }
        break;
}
