function functions_scr(){

}
function thickcircle(x1, y1, r, thickness, col) {
	draw_set_circle_precision(64);
    for (var i = 0; i < thickness; i++) {
        draw_circle_colour(x1, y1, r - i, col, col, true);
    }
}




function hpbar(hp, maxhp, width, height, x1, y1, border, col1, radius) {
    var ratio = (maxhp > 0) ? clamp(hp / maxhp, 0, 1) : 0;
    var fill_width = width * ratio;

    // Rounded border
    draw_roundrect_colour_ext(
        x1 - border, y1 - height - border,
        x1 + width + border, y1 + height + border,
        radius + border, radius + border,
        c_black, c_black, false
    );

    // Bar background
    draw_roundrect_colour_ext(
        x1, y1 - height,
        x1 + width, y1 + height,
        radius, radius,
        c_dkgray, c_dkgray, false
    );

    // Health fill
    if (fill_width > 0) {
        var fill_radius = min(radius, fill_width * 0.5);
        draw_roundrect_colour_ext(
            x1, y1 - height,
            x1 + fill_width, y1 + height,
            fill_radius, fill_radius,
            col1, col1, false
        );
    }
}