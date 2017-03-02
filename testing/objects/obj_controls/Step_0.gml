/// @description Controller bank

mouse_check_button_pressed(mb_any) {
	if(ctrl_lease[9]==false) {
	
		scr_new_player(9);
		
		if(mouse_check_button(mb_left)&&mouse_check_button(mb_right)) {
			
			scr_new_player(9);
			new_player.keyset=current_keyset; // set/lease keyset (>-1 == player controlled)
		}
		exit; // prevent rest of code cause already found potentional new player this step
	}
}

if(keyboard_check_pressed(vk_anykey)) {
	for(var i=0; i<9; i++) { // available keysets
		if(ctrl_lease[i]==false) { // check if keyset is free
			for(var j=0; j<4; j++) { // loop through keys to find match
				if(ctrl[i,j]==keyboard_lastkey) {
					
					scr_new_player(i,ctrl[i,0],ctrl[i,1]); // also send specific keys
					
					if(keyboard_check(ctrl[i,0])&&keyboard_check(ctrl[i,1])) {
						
						scr_new_player(i,ctrl[i,0],ctrl[i,1]); // also send specific keys
						new_player.keyset=current_keyset; // set/lease keyset (>-1 == player controlled)
						
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
					
					scr_new_player(10+i);
					new_player.keyset=current_keyset; // set/lease keyset (>-1 == player controlled)
				}
				exit; // prevent rest of code cause already found potentional new player this step
			}
		}
	}
}



/// @desc scr_new_player()
/// @arg keysets
/// @arg button1 (for keyboard only)
/// @arg button2 (for keyboard only)

current_keyset=argument[0]; // needed outside script

new_player=scr_find_new_player(); // needed outside script

if(new_player!=-1) {
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
}
	
	
	
/// @desc scr_find_new_player()
/// return (new_player) instance_id

// FIND AVAILABLE PLAYER AND RETURN ID OR RETURN -1

return(id);