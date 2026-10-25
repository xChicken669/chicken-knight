instance_create_layer(Player_obj.x + random_range(-10,10),Player_obj.y + random_range(-10,10),"Instances",KetchupPuddle_obj)

counter += 1
if counter > 40 {
	counter = 0
	alarm_set(0,random_range(40,100))
} else {alarm_set(2,10)}