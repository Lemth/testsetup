/// @description Insert description here
// You can write your code in this editor

event_inherited();

//room_goto(room_start);
menu_array[0]=spr_playbutton; // play game |>
menu_array[1]=spr_gearbutton; // options   -o-
menu_array[2]=spr_abouthowto; // about how ?
menu_array[3]=spr_exitbutton; // exit game X

menu_pos=0;
menu_length = array_length_1d(menu_array);

sinus=0;
