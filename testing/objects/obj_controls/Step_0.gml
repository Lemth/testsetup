/// @description Controller bank

if(room==room_menu || room==room_options || room==room_about) { // if in menu, then menu controls - else go player
	with(obj_menu) { // parent object! (sooo clever <3)
		if(keyboard_check_pressed(vk_up)||keyboard_check_pressed(ord("W"))) {
			pos_move-=1;
		} 
		if(keyboard_check_pressed(vk_down)||keyboard_check_pressed(ord("S"))) {
			pos_move+=1;
		} 
		// loop around array.
		if(keyboard_check_pressed(vk_enter)||keyboard_check_pressed(vk_space)) {
			//gotoroom from array
		}
		if(keyboard_check_pressed(vk_esc)) {
			//previous room OR QUIT :'(	
		}
		//(in object check mousexmousey vs prevmousexprevmousey, also mouseclicks)
	}
	
} else { // ... [ - else go player ]

	if(scr_find_new_player()!=-4) { // only execute if not all players are taken

		if(mouse_check_button_pressed(mb_any)) {
			if(ctrl_lease[9]==false) {

				scr_new_player(9);
	
				if(mouse_check_button(mb_left)&&mouse_check_button(mb_right)) {

					if(scr_new_player(9)) {
						new_player.keyset=current_keyset; // set/lease keyset (>-1 == player controlled)
					}
				}
				exit; // prevent rest of code cause already found potentional new player this step
			}
		}
	}

	if(keyboard_check_pressed(vk_anykey)) {
		for(var i=0; i<9; i++) { // available keysets
			if(ctrl_lease[i]==false) { // check if keyset is free
				for(var j=0; j<4; j++) { // loop through keys to find match
					if(ctrl[i,j]==keyboard_lastkey) {

						scr_new_player(i,ctrl[i,0],ctrl[i,1]); // also send specific keys

						if(keyboard_check(ctrl[i,0])&&keyboard_check(ctrl[i,1])) {

							if(scr_new_player(i,ctrl[i,0],ctrl[i,1])) { // also send specific keys
								new_player.keyset=current_keyset; // set/lease keyset (>-1 == player controlled)
							}

							i=999;j=999; // break loop
						}
						exit; // prevent rest of code cause already found potentional new player this step
					}
				}
			} 
		}
	}

	if(maxpads>0) {
			for(var i=0; i<maxpads; i++) {
				if(ctrl_lease[10+i]==false) {
					if(gamepad_button_check_pressed(i,gp_face1)||gamepad_button_check_pressed(i,gp_face2)
					 ||gamepad_button_check_pressed(i,gp_face3)||gamepad_button_check_pressed(i,gp_face4)
					 ||gamepad_button_check_pressed(i,gp_shoulderl)||gamepad_button_check_pressed(i,gp_shoulderr)
					 ||gamepad_button_check_pressed(i,gp_shoulderlb)||gamepad_button_check_pressed(i,gp_shoulderrb)
					 ||gamepad_button_check_pressed(i,gp_padl)||gamepad_button_check_pressed(i,gp_padr)
					 ||gamepad_button_check_pressed(i,gp_padu)||gamepad_button_check_pressed(i,gp_padd)
					 ||gamepad_button_check_pressed(i,gp_stickl)||gamepad_button_check_pressed(i,gp_stickr)) {

						scr_new_player(10+i);

						if((gamepad_button_check(i,gp_shoulderl)||gamepad_button_check(i,gp_shoulderlb))
						 &&(gamepad_button_check(i,gp_shoulderr)||gamepad_button_check(i,gp_shoulderrb))) {

							if(scr_new_player(10+i)) {
								new_player.keyset=current_keyset; // set/lease keyset (>-1 == player controlled)
							}
						}
						exit; // prevent rest of code cause already found potentional new player this step
					}
				}
			}
		}

	}
	
}

/// @desc scr_new_player()
/// @arg keysets
/// @arg button1 (for keyboard only)
/// @arg button2 (for keyboard only)
/// return true if new_player was found

current_keyset=argument[0]; // needed outside script

new_player=scr_find_new_player(); // needed outside script

if(new_player!=-4) {
	new_player.showkeys=current_keyset; // show keyset
	
	if(current_keyset==9) {
		new_player.ctrl_script="ctrl_mouse";
	} else if(current_keyset>=10) {
		new_player.ctrl_script="ctrl_gamepad";
	} else if(current_keyset>=0 && argument_count==3) {
		new_player.button1=argument[1];
		new_player.button2=argument[2];
		new_player.ctrl_script="ctrl_keyboard";	
	}
	
	return(true);
} else {
	return(false);	
}
	
	
	
/// @desc scr_find_new_player()
/// return (new_player) instance_id

if(global.player2.keyset<0) {
	return(global.player2);
} else if(global.player3.keyset<0) {
	return(global.player3);
} else if(global.player1.keyset<0) {
	return(global.player1);
} else if(global.player4.keyset<0) {
	return(global.player4);
} else {
	return(-4); // all players are taken
}
