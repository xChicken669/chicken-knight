hp = 70
global.ketchupcounter = 0
boss_state = "rest"; 
state_timer = 60;
last_attack = -1;
attack_choice = 0;
target_x = x;
target_y = y;
depth = -10
speed = 0;
alarm_set(0,random_range(40,100))
counter = 0
audio_play_sound(KetchupSong,0,1)

