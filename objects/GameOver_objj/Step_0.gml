var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

var _left = _gui_w * 0.5 - 140;
var _right = _gui_w * 0.5 + 140;
var _height = 55;


var _top = _gui_h * 0.48;
var _gap = 14;

var _retry_top = _top;
var _menu_top = _top + _height + _gap;
var _quit_top = _top + (_height + _gap) * 2;

if (mouse_check_button_pressed(mb_left))
{
    if (point_in_rectangle(_mouse_x, _mouse_y, _left, _retry_top, _right, _retry_top + _height))
    {
        room_goto(global.retry_room);
    }
    else if (point_in_rectangle(_mouse_x, _mouse_y, _left, _menu_top, _right, _menu_top + _height))
    {
        room_goto(menu_rm);
    }
    else if (point_in_rectangle(_mouse_x, _mouse_y, _left, _quit_top, _right, _quit_top + _height))
    {
        game_end();
    }
}