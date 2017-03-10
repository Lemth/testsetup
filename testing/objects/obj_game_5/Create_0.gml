/// @description room_hoepel

google_analytics_screenview("Game_5");

// setup.
with(obj_player) {
  y=room_height*4/5;
  player_hoepel_value=0;
  player_hoepel_score=-1;
  player_hoepel_speed=0;
  image_index=10;
}

room_hoepel_timer=0;
room_hoepel_counter=4;

instance_create_layer(room_width/2,room_height/2,"Overlay",obj_countdown); // countdown object; don't decrease if countdown is there!
