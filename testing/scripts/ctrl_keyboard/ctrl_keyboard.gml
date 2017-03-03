/// @desc ctrl_keyboard()

if(keyboard_check(button1)) {
	action1+=1;
} else {
	action1=0;
}

if(keyboard_check(button2)) {
	action2+=1;
} else {
	action2=0;
}

draw_sprite(key1,sign(action1),x,y); // image index 0 == unpressed, 1 == pressed.
draw_sprite(key2,sign(action2),x,y);
draw_text(x,y,string(chr(button1)));
draw_text(x,y,string(chr(button2)));
