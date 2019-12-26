//  Get Player Input

key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// Calculate Movement

var move = key_right - key_left;

hsp = move * walksp;

vsp += grv;

// Check if we are on the floor
// Check if we press the jump key

if (place_meeting(x, y + 1, oWall)) && (key_jump)
{
	vsp -= jumpPwr;
}

// Horizontal Collision
if(hsp != 0){
	if (place_meeting(x + hsp, y, oWall))
	{
		while (!place_meeting(x + sign(hsp), y, oWall))
		{
			x += sign(hsp);
		}
		hsp = 0;
	}

}

x += hsp; // Move left and right

// Vertical Collision
if(vsp != 0){
	if (place_meeting(x, y + vsp, oWall))
	{
		while (!place_meeting(x, y + sign(vsp), oWall))
		{
			y += sign(vsp);
		}
		vsp = 0;
	}
}

y += vsp; // Move up and down

// Animation

if (!place_meeting(x, y + 1, oWall))
{
	sprite_index = sPlayerA;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;
	if(hsp == 0)
	{
		sprite_index = sPlayer;	
	}
	else
	{
		sprite_index = sPlayerR;
	}
	
}

if (hsp != 0) image_xscale = sign(hsp);








