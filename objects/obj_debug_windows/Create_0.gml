
remmx = mouse_x - camerax();
remmy = mouse_y - cameray();

xx = remmx - 40;
yy = remmy - 20;
xx = clamp(xx, 40, 520);
yy = clamp(yy, 40, 340);
type = 0;
button_text[0] = "Drag Window!";
event_user(15);
watchvar = " ";
watchflag = -1;

for (i = 0; i < button_amount; i++)
{
    button_state[i] = false;
    button_clicked[i] = false;
}

