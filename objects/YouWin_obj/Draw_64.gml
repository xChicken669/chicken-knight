var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

var _left = _gui_w * 0.5 - 140;
var _right = _gui_w * 0.5 + 140;
var _top = _gui_h * 0.68;
var _bottom = _top + 60;

draw_set_color(make_color_rgb(65, 42, 28));
draw_rectangle(0, 0, _gui_w, _gui_h, false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(make_color_rgb(255, 220, 90));
draw_text(_gui_w * 0.5, _gui_h * 0.32, win_title);

draw_set_color(c_white);
draw_text(_gui_w * 0.5, _gui_h * 0.46, win_message);

if (point_in_rectangle(_mouse_x, _mouse_y, _left, _top, _right, _bottom))
{
    draw_set_color(make_color_rgb(230, 90, 55));
}
else
{
    draw_set_color(make_color_rgb(160, 55, 40));
}

draw_rectangle(_left, _top, _right, _bottom, false);

draw_set_color(c_white);
draw_rectangle(_left, _top, _right, _bottom, true);
draw_text(_gui_w * 0.5, _top + 30, "MAIN MENU");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);