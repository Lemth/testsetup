/// @description room_koekoek!

// setup.
with(obj_player) {
  y=room_height*4/5;
  player_koekoek_value=0;
  player_koekoek_score=-1;
  image_index=2;
}

room_koekoek_timer=0; // max time clock
room_koekoek_counter=4; // players done.

instance_create_layer(room_width/2,room_height/2,"Overlay",obj_countdown); // countdown object; don't decrease if countdown is there!
