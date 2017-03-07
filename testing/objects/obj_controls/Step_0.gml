/// @description Controller bank

if(room==room_menu || room==room_options || room==room_about) { // if in menu, then menu controls - else go player
	with(obj_menu) { // parent object! (sooo clever <3)
		if(keyboard_check_pressed(vk_left)||keyboard_check_pressed(ord("A"))) {
			menu_pos-=1;
		} 
		if(keyboard_check_pressed(vk_right)||keyboard_check_pressed(ord("D"))) {
			menu_pos+=1;
		} 
		// loop around array.
		if(keyboard_check_pressed(vk_enter)||keyboard_check_pressed(vk_space)) {
			enter=1;
		} else {
			enter=0;	
		}
		if(keyboard_check_pressed(vk_escape)) {
			room_goto(room_menu);	
		} 
		//(mouse in menuy
	}
	
} else { // ... [ - else go player ]

	if(scr_find_new_player()!=-4) { // only execute if not all players are taken

		if(mouse_check_button_pressed(mb_any)) {
			if(ctrl_lease[9]==false) {

				scr_new_player(9);
	
				if(mouse_check_button(mb_left)&&mouse_check_button(mb_right)) {

					if(scr_new_player(9)) {
						new_player.keyset=current_keyset; // set/lease keyset (>-1 == player controlled)
						ctrl_lease[9]=true;
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
								ctrl_lease[i]=true;
							}

							i=999;j=999; // break loop
						}
						exit; // prevent rest of code cause already found potentional new player this step
					}
				}
			} 
		}
		/* // inteded for 3sec hold additional keybinds - scrapped for innefficiency.
		i=10+maxpads; // set i to one beyond maxpads.
		for(j=i; array_length_1d(ctrl_lease)<=j; j++) {
			ctrl_lease[j]=false; // add extra keyboard value to the keyset table.
		}
		do {
			
			
		} until (ctrl_lease[i]==false)
		*/
	}

	if(maxpads>0) {
		for(var i=0; i<maxpads; i++) {
			if (gamepad_is_connected(i)) {
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
								ctrl_lease[10+i]=true;
							}
						}
						exit; // prevent rest of code cause already found potentional new player this step
					}
				}
			}
		}
	}
	// first run only
	if(set_first_player=="mouse") {
		if(scr_new_player(9)) {
         new_player.keyset=9; // set/lease keyset (>-1 == player controlled)
         ctrl_lease[9]=true;
		}  
		set_first_player="";
	} else if(set_first_player=="keyboard") {
		if(scr_new_player(0,vk_left,vk_right)) { // also send specific keys
		    new_player.keyset=0; // set/lease keyset (>-1 == player controlled)
		    ctrl_lease[0]=true;
		}   
		set_first_player="";
	}




}
	
