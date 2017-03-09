/// @desc ctrl_controller()

if(gamepad_is_connected(showkeys-10)) {

	if(gamepad_button_check(showkeys-10,gp_shoulderl) || gamepad_button_check(showkeys-10,gp_shoulderlb)) {
		player_but1+=1;
		alarm[0]=room_speed*12;
	} else {
		player_but1=0;
	}

	if(gamepad_button_check(showkeys-10,gp_shoulderr) || gamepad_button_check(showkeys-10,gp_shoulderrb)) {
		player_but2+=1;
		alarm[0]=room_speed*12;
	} else {
		player_but2=0;
	}

	draw_sprite(spr_gamepad,0+2*sign(player_but1),x-8*plussign,y+16); // image index 0 == unpressed, 1 == pressed.
	draw_sprite(spr_gamepad,1+2*sign(player_but2),x+8*plussign,y+16);
	if(plussign==2) {
		draw_sprite(spr_plus,0,x,y+16);
	}

}
