/// @description room_springen

google_analytics_screenview("Game_4");

// setup.
with(obj_player) {
  y=room_height/2;
  player_springen_value=0;
  player_springen_score=-1;
  image_index=0;
}

room_springen_step=0;
room_springen_timer=0;
room_springen_counter=4;

instance_create_layer(room_width/2,room_height/2,"Overlay",obj_countdown); // countdown object; don't decrease if countdown is there!
