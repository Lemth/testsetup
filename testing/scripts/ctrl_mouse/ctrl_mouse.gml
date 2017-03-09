/// @desc ctrl_mouse()

if(mouse_check_button(mb_left)) {
	player_but1+=1;
	alarm[0]=room_speed*12;
} else {
	player_but1=0;
}

if(mouse_check_button(mb_right)) {
	player_but2+=1;
	alarm[0]=room_speed*12;
} else {
	player_but2=0;
}

draw_sprite(spr_mouse,0+2*sign(player_but1),x-8*plussign,y+16); // image index 0 == unpressed, 1 == pressed.
draw_sprite(spr_mouse,1+2*sign(player_but2),x+8*plussign,y+16);
if(plussign==2) {
	draw_sprite(spr_plus,0,x,y+16);
}
