/// @description room_hangen

google_analytics_screenview("Game_0");

// setup.
with(obj_player) {
  y=room_height/2;
  player_hangen_value=10;
  player_hangen_score=-1;
  image_index=2;
}

room_hangen_timer=0;
room_hangen_counter=4;

instance_create_layer(room_width/2,room_height/2,"Overlay",obj_countdown); // countdown object; don't decrease if countdown is there!
