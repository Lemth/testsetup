/// @description room_hinkel

google_analytics_screenview("Game_6");

// setup.
with(obj_player) {
  y=room_height*4/5;
  player_hinkel_value=0;
  player_hinkel_score=-1;
  player_hinkel_speed=0;
  image_index=5;
}

room_hinkel_timer=0;
room_hinkel_counter=4;
room_hinkel_path[0]=choose(-1,1);
for(i=1;i<=20;i++) {
 room_hinkel_path[i]=irandom_range(-1,1); 
}

instance_create_layer(room_width/2,room_height/2,"Overlay",obj_countdown); // countdown object; don't decrease if countdown is there!
