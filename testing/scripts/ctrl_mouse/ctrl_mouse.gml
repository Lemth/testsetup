/// @desc ctrl_mouse()

if(mouse_check_button(mb_left)) {
	action1+=1;
} else {
	action1=0;
}

if(mouse_check_button(mb_right)) {
	action2+=1;
} else {
	action2=0;
}

draw_sprite(mouse1,sign(action1),x,y); // image index 0 == unpressed, 1 == pressed.
draw_sprite(mouse2,sign(action2),x,y);
draw_text(x,y,”Left Mouse”);
draw_text(x,y,”Right Mouse”);
