if global.ketchupcounter == 0 {
	direction = point_direction(x,y,Player_obj.x,Player_obj.y)
	global.ketchupcounter = 1
} else if global.ketchupcounter == 1 {
	direction = point_direction(x,y,Player_obj.x,Player_obj.y) - 30
	global.ketchupcounter = 2
} else if global.ketchupcounter == 2 {
	direction = point_direction(x,y,Player_obj.x,Player_obj.y) + 30
	global.ketchupcounter = 0
}
speed = 5
image_xscale = 0.5
image_yscale = 0.5