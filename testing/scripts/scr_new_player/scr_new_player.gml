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
	} else if(current_keyset>=0) {
		new_player.button1=argument[1];
		new_player.button2=argument[2];
		new_player.ctrl_script="ctrl_keyboard";	
	}
	
	return(true);
} else {
	return(false);	
}