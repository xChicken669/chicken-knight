var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

var _button_left = _gui_w * 0.5 - 140;
var _button_right = _gui_w * 0.5 + 140;
var _button_height = 60;
var _first_top = _gui_h * 0.42;
var _gap = 18;

var _fork_top = _first_top;
var _ketchup_top = _first_top + _button_height + _gap;
var _quit_top = _first_top + (_button_height + _gap) * 2;

if (mouse_check_button_pressed(mb_left))
{
    if (point_in_rectangle(
        _mouse_x, _mouse_y,
        _button_left, _fork_top,
        _button_right, _fork_top + _button_height
    ))
    {
        room_goto(Fork);
    }
    else if (point_in_rectangle(
        _mouse_x, _mouse_y,
        _button_left, _ketchup_top,
        _button_right, _ketchup_top + _button_height
    ))
    {
        room_goto(Ketchup);
    }
    else if (point_in_rectangle(
        _mouse_x, _mouse_y,
        _button_left, _quit_top,
        _button_right, _quit_top + _button_height
    ))
    {
        game_end();
    }
}