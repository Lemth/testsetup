/// @description Check for devices and claimed controls

mouse_check_button_pressed(mb_any) {
	if(ctrl_lease[9]==false) {
	
		// REPORT PROPPER MOUSE KEYS
		
		if(mouse_check_button(mb_left)&&mouse_check_button(mb_right)) {
			ctrl_lease[9]=true;
			
			// ASSIGN MOUSE KEYS
			
		}
	}
}

if(keyboard_check_pressed(vk_anykey)) {
	for(var i=0; i<9; i++) { // available keysets
		if(ctrl_lease[i]==false) { // check if keyset is free
			for(var j=0; j<4; j++) { // loop through keys to find match
				if(ctrl[i,j]==keyboard_lastkey) {
					
					// REPORT PROPPER KEYS
					
					if(keyboard_check(ctrl[i,0])&&keyboard_check(ctrl[i,1])) {
						ctrl_lease[i]=true;
						
						// ASSIGN KEYS
						
						
						i=999;j=999;// break loop
					}
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
			 
				// REPORT PROPPER GAMEPAD KEYS
				
				if((gamepad_button_check(i,gp_shoulderl)||gamepad_button_check(i,gp_shoulderlb))
				 &&(gamepad_button_check(i,gp_shoulderr)||gamepad_button_check(i,gp_shoulderrb))) {
					ctrl_lease[10+i]=true;
					
					// ASSIGN GAMEPAD KEYS
					
				}
			}
		}
	}
}

