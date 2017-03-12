/// @description room_wippen

google_analytics_screenview("Game_3");

// setup.
with(obj_player) {
  y=room_height/2;
  player_wippen_value=90;
  player_wippen_score=-1;
  image_index=4;
}

room_wippen_timer=0;
room_wippen_counter=4;

instance_create_layer(room_width/2,room_height/2,"Overlay",obj_countdown); // countdown object; don't decrease if countdown is there!
