/// @description Destroy Bullet

ww = window_get_width();
wh = window_get_height();

if (place_meeting(x,y,oWall)) instance_destroy();
if (x < 0) || (x > ww) instance_destroy();
if (y < 0) || (y > wh) instance_destroy();

