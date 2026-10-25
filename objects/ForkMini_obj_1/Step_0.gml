distance = point_distance(x,y,Player_obj.x,Player_obj.y)
image_angle = direction - 90

direction = point_direction(x,y,Player_obj.x,Player_obj.y)
if distance < trigger_radius {speed = 3.5} else {speed = 0}
if hp<0 or hp==0 {instance_destroy()}