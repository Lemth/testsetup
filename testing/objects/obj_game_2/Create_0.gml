/// @description room_balans

// setup.
with(obj_player) {
  y=room_height/2;
  player_balans_value=90;
  player_balans_score=-1;
  image_index=3;
}

room_balans_timer=0;
room_balans_counter=4;

instance_create_layer(room_width/2,room_height/2,"Overlay",obj_countdown); // countdown object; don't decrease if countdown is there!
