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

draw_set_color(make_color_rgb(45, 28, 25));
draw_rectangle(0, 0, _gui_w, _gui_h, false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(_gui_w * 0.5, _gui_h * 0.25, "GAME OVER");
draw_text(_gui_w * 0.5, _gui_h * 0.34, "The chicken got killed(skill issues)!");

if (point_in_rectangle(_mouse_x, _mouse_y, _left, _retry_top, _right, _retry_top + _height))
{
    draw_set_color(make_color_rgb(190, 65, 55));
}
else
{
    draw_set_color(make_color_rgb(125, 40, 35));
}
draw_rectangle(_left, _retry_top, _right, _retry_top + _height, false);
draw_set_color(c_white);
draw_rectangle(_left, _retry_top, _right, _retry_top + _height, true);
draw_text(_gui_w * 0.5, _retry_top + _height * 0.5, "RETRY");

if (point_in_rectangle(_mouse_x, _mouse_y, _left, _menu_top, _right, _menu_top + _height))
{
    draw_set_color(make_color_rgb(130, 130, 130));
}
else
{
    draw_set_color(make_color_rgb(75, 75, 75));
}
draw_rectangle(_left, _menu_top, _right, _menu_top + _height, false);
draw_set_color(c_white);
draw_rectangle(_left, _menu_top, _right, _menu_top + _height, true);
draw_text(_gui_w * 0.5, _menu_top + _height * 0.5, "MAIN MENU");

if (point_in_rectangle(_mouse_x, _mouse_y, _left, _quit_top, _right, _quit_top + _height))
{
    draw_set_color(make_color_rgb(130, 130, 130));
}
else
{
    draw_set_color(make_color_rgb(75, 75, 75));
}
draw_rectangle(_left, _quit_top, _right, _quit_top + _height, false);
draw_set_color(c_white);

draw_rectangle(_left, _quit_top, _right, _quit_top + _height, true);
draw_text(_gui_w * 0.5, _quit_top + _height * 0.5, "QUIT");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);