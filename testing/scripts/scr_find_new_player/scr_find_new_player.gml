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
