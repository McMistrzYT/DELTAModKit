if (scr_debug())
{
    xx = 300;
    yy = 465;
    col = make_color_rgb(40, 40, 40);
	presscol = c_silver
	holdcol = c_white
    draw_set_font(fnt_small);
    
    draw_set_color(left_p() ? presscol : (left_h() ? holdcol : col));
    
    draw_text_outline(xx, yy - 6, "[U]", 0);
    
    draw_set_color(left_p() ? presscol : (left_h() ? holdcol : col));
    
    draw_text_outline(xx - 15, yy, "[L]", 0);
    
    draw_set_color(down_p() ? presscol : (down_h() ? holdcol : col));
    
    draw_text_outline(xx, yy, "[D]", 0);
    
    draw_set_color(right_p() ? presscol : (right_h() ? holdcol : col));
    
    draw_text_outline(xx + 15, yy, "[R]", 0);
    
    draw_set_color(button1_p() ? presscol : (button1_h() ? holdcol : col));
    
    draw_text_outline(xx + 45, yy, scr_get_input_name(4), 0);
    
    draw_set_color(button2_p() ? presscol : (button2_h() ? holdcol : col));
    
    draw_text_outline(xx + 60, yy, scr_get_input_name(5), 0);
    
	draw_set_color(button3_p() ? presscol : (button3_h() ? holdcol : col));
    
    draw_text_outline(xx + 75, yy, scr_get_input_name(6), 0);
}
