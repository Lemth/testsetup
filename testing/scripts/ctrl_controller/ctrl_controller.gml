/// @desc ctrl_controller()

if(gamepad_button_check(keyset-10,gp_shoulderl) || gamepad_button_check(keyset-10,gp_shoulderlb)) {
	action1+=1;
} else {
	action1=0;
}

if(gamepad_button_check(keyset-10,gp_shoulderr) || gamepad_button_check(keyset-10,gp_shoulderrb)) {
	action2+=1;
} else {
	action2=0;
}

draw_sprite(controller1,sign(action1),x,y); // image index 0 == unpressed, 1 == pressed.
draw_sprite(controller2,sign(action2),x,y);
draw_text(x,y,"Left Shoulder");
draw_text(x,y,"Right Shoulder");
