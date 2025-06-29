if (canchoose == 1)
{
    var drawstyle = 0;
    
    textx = xx;
    texty = yy;
    
    if (drawstyle == 0)
    {
        for (var i = 0; i < (choicetotal + 1); i += 1)
        {
            draw_set_color((mychoice == i) ? c_yellow : c_white);
            textx = textposx[i];
            texty = textposy[i];
            draw_text(textx, texty, string_hash_to_newline(global.choicemsg[i]));
        }
        
        draw_sprite_ext(heartSprite, 0, hx, hy, image_xscale, image_yscale, 0, c_white, 1);
    }
    
    if (drawstyle == 1)
    {
        var midy = (yy + 60) - 1;
        var bhx = xx + 182;
        var bhy = midy - 8;
        
        if (global.lang == "ja")
            bhy += 4;
        
        draw_set_valign(fa_middle);
        draw_set_halign(fa_right);
        draw_text_ext(xx + 154, midy, string_hash_to_newline(global.choicemsg[0]), 18, 320);
        draw_set_halign(fa_left);
        draw_text_ext(xx + 230, midy, string_hash_to_newline(global.choicemsg[1]), 18, 320);
        
        if (choicetotal >= 2)
        {
            draw_set_halign(fa_center);
            draw_text_ext(xx + 192, (midy - 29) + 1, string_hash_to_newline(global.choicemsg[2]), 18, 320);
        }
        
        if (choicetotal >= 3)
        {
            draw_set_halign(fa_center);
            draw_text_ext(xx + 192, ((midy + 27) - 1) + 6, string_hash_to_newline(global.choicemsg[3]), 18, 320);
        }
        
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        
        if (mychoice == 0)
            bhx = (xx + 154) - string_width(string_hash_to_newline(global.choicemsg[0])) - 20;
        
        if (mychoice == 1)
            bhx = (xx + 230) - 20;
        
        if (mychoice == 2)
        {
            bhx = (xx + 192) - round(string_width(string_hash_to_newline(global.choicemsg[2])) / 2) - 20;
            bhy = (midy - 38) + 1;
        }
        
        if (mychoice == 3)
        {
            bhx = (xx + 192) - round(string_width(string_hash_to_newline(global.choicemsg[3])) / 2) - 20;
            bhy = ((midy + 18) - 1) + 6;
        }
        
        if (choicerstyle == 1)
            bhy -= 2;
        
        draw_sprite_ext(heartSprite, 0, bhx, bhy, image_xscale, image_yscale, 0, c_white, 1);
    }
    
    if (drawstyle == 2)
    {
        text_pos = [];
        text_pos[0][0] = 0;
        text_pos[0][1] = 20;
        text_pos[1][0] = 0;
        text_pos[1][1] = 0;
        text_pos[2][0] = 30;
        text_pos[2][1] = 0;
        text_pos[3][0] = 0;
        text_pos[3][1] = 0;
        
        for (var i = 0; i < (choicetotal + 1); i += 1)
        {
            var choice_color = (mychoice == i) ? 65535 : 16777215;
            draw_set_color(choice_color);
            var x_offset = text_pos[i][0];
            var y_offset = text_pos[i][1];
            textx = textposx[i] + x_offset;
            texty = textposy[i] + y_offset;
            draw_text(textx, texty, string_hash_to_newline(global.choicemsg[i]));
            draw_set_color(c_white);
        }
        
        var heart_x_offset = 0;
        
        if (mychoice == 2)
            heart_x_offset = 30;
        
        draw_sprite_ext(heartSprite, 0, hx + heart_x_offset, hy, image_xscale, image_yscale, 0, c_white, 1);
    }
}
