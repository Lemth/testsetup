/// @desc ctrl_keyboard()

if(keyboard_check(button1)) {
	player_but1+=1;
	alarm[0]=room_speed*12;
} else {
	player_but1=0;
}

if(keyboard_check(button2)) {
	player_but2+=1;
	alarm[0]=room_speed*12;
} else {
	player_but2=0;
}

if(showkeys==0) {
	draw_sprite(spr_keyboard_arrows,sign(player_but1),x-8*plussign,y+16); // image index 0 == unpressed, 1 == pressed.
	draw_sprite_ext(spr_keyboard_arrows,sign(player_but2),x+8*plussign,y+16,-1,1,0,c_white,1);
} else {
	draw_sprite(spr_keyboard,sign(player_but1),x-8*plussign,y+16); // image index 0 == unpressed, 1 == pressed.
	draw_sprite(spr_keyboard,sign(player_but2),x+8*plussign,y+16);
} 
if(showkeys==7) {
	if(!player_but1) {
		draw_set_color(c_black);
	}
	draw_text(x-8*plussign,y+16,"1");
	draw_set_color(c_white);
	if(!player_but2) {
		draw_set_color(c_black);
	}
	draw_text(x+8*plussign,y+16,"3");
	draw_set_color(c_white);
} else if(showkeys==8) {
	if(!player_but1) {
		draw_set_color(c_black);
	}
	draw_text(x-8*plussign,y+16,"4");
	draw_set_color(c_white);
	if(!player_but2) {
		draw_set_color(c_black);
	}
	draw_text(x+8*plussign,y+16,"6");
	draw_set_color(c_white);
} else if (showkeys>0) {
	if(!player_but1) {
		draw_set_color(c_black);
	}
	draw_text(x-8*plussign,y+16,string(chr(button1)));
	draw_set_color(c_white);
	if(!player_but2) {
		draw_set_color(c_black);
	}
	draw_text(x+8*plussign,y+16,string(chr(button2)));
	draw_set_color(c_white);
}

if(plussign==2) {
	draw_sprite(spr_plus,0,x,y+16);
}
