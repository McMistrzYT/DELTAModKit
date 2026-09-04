burst = 0;
shift = 1;
image_alpha = 1;
flytime = 8;
distvector = scr_heartgetspawnpos()
distx = distvector.x;
disty = distvector.y;
dist = point_distance(x, y, distx, disty);
move_towards_point(distx, disty, dist / flytime);
alarm[0] = flytime;
image_speed = 0;
