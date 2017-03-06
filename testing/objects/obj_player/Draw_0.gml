/// @description Insert description here
// You can write your code in this editor

//script_execute(state); // execute current game
if(showkeys>-1) {
	plussign=(min(keyset,0)*-1)+1;
	if(ctrl_script=="ctrl_keyboard") {
		ctrl_keyboard();
	} else if (ctrl_script=="ctrl_mouse") {
		ctrl_mouse();
	} else if (ctrl_script=="ctrl_gamepad") {
		ctrl_gamepad();
	}
} 


draw_self();