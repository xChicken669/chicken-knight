if counter > random_range(8,10) {
instance_destroy(KetchupPuddle_obj)
alarm_set(1,60)

} else {


instance_create_layer(Player_obj.x + random_range(-100,100),Player_obj.y + random_range(-100,100),"Instances",KetchupPuddle_obj)
alarm_set(0,random_range(40,100))
counter += 1
}
if floor(random_range(1,8)) == 2 {
	alarm_set(3,10)
}