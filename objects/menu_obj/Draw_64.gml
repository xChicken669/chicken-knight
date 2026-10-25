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

// Background
draw_set_color(make_color_rgb(60, 38, 25));
draw_rectangle(0, 0, _gui_w, _gui_h, false);

// Title
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(_gui_w * 0.5, _gui_h * 0.22, menu_title);

// Fork button — grey colours
if (point_in_rectangle(
    _mouse_x, _mouse_y,
    _button_left, _fork_top,
    _button_right, _fork_top + _button_height
))
{
    draw_set_color(make_color_rgb(130, 130, 130));
}
else
{
    draw_set_color(make_color_rgb(75, 75, 75));
}
draw_rectangle(_button_left, _fork_top, _button_right, _fork_top + _button_height, false);
draw_set_color(c_white);
draw_rectangle(_button_left, _fork_top, _button_right, _fork_top + _button_height, true);
draw_text(_gui_w * 0.5, _fork_top + _button_height * 0.5, "LEVEL 1 - FORK");

// Ketchup button
if (point_in_rectangle(
    _mouse_x, _mouse_y,
    _button_left, _ketchup_top,
    _button_right, _ketchup_top + _button_height
))
{
    draw_set_color(make_color_rgb(200, 55, 55));
}
else
{
    draw_set_color(make_color_rgb(135, 35, 35));
}
draw_rectangle(_button_left, _ketchup_top, _button_right, _ketchup_top + _button_height, false);
draw_set_color(c_white);
draw_rectangle(_button_left, _ketchup_top, _button_right, _ketchup_top + _button_height, true);
draw_text(_gui_w * 0.5, _ketchup_top + _button_height * 0.5, "LEVEL 2 - KETCHUP");

// Quit button — Fork's former brown colours
if (point_in_rectangle(
    _mouse_x, _mouse_y,
    _button_left, _quit_top,
    _button_right, _quit_top + _button_height
))
{
    draw_set_color(make_color_rgb(180, 90, 30));
}
else
{
    draw_set_color(make_color_rgb(100, 58, 32));
}
draw_rectangle(_button_left, _quit_top, _button_right, _quit_top + _button_height, false);
draw_set_color(c_white);
draw_rectangle(_button_left, _quit_top, _button_right, _quit_top + _button_height, true);
draw_text(_gui_w * 0.5, _quit_top + _button_height * 0.5, "QUIT GAME");

// Reset drawing settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);