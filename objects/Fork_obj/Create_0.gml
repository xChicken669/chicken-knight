hp = 70
speed = 1
image_speed = 0
trigger_radius = 500
distance = 500
trigger_circle_colour = c_black
alarm_set(1,800)


charge_range = 300;

fork_state = "chase";
state_timer = 0;
charge_dir = 0;
aim_dir = 0;
last_attack = -1;

chase_speed = 1;
charge_speed = 5;
audio_play_sound(BeepBox, 0, true);
