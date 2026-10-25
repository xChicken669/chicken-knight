var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

var _left = _gui_w * 0.5 - 140;
var _right = _gui_w * 0.5 + 140;
var _top = _gui_h * 0.68;
var _bottom = _top + 60;

if (mouse_check_button_pressed(mb_left))
{
    if (point_in_rectangle(_mouse_x, _mouse_y, _left, _top, _right, _bottom))
    {
        room_goto(menu_rm);
    }
}