/// @description Insert description here
// You can write your code in this editor

with(obj_game) {
	instance_destroy();
}
with(obj_player) {
	instance_destroy();
}

room_goto(room_menu);