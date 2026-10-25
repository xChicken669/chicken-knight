var _target_x = Player_obj.x;
var _target_y = Player_obj.y;


var _cam_x = camera_get_view_x(cam);
var _cam_y = camera_get_view_y(cam);

var _new_x = lerp(_cam_x, _target_x - camera_get_view_width(cam) / 2, follow_speed);
var _new_y = lerp(_cam_y, _target_y - camera_get_view_height(cam) / 2, follow_speed);

camera_set_view_pos(cam, _new_x, _new_y);