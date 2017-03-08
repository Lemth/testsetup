/// @description room_koekoek!

// setup.
with(obj_player) {
  y=room_height*4/5;
  player_koekoek_value=0;
  player_koekoek_score=-1;
  player_koekoek_speed=0;
  player_koekoek_press=-1;
  image_index=2;
}

room_koekoek_state=1; // 1 == true == run!
room_koekoek_timer=0; // max time clock
room_koekoek_counter=4; // players done.

instance_create_layer(room_width/2,room_height/2,"Overlay",obj_countdown); // countdown object; don't decrease if countdown is there!

//
alarm[0]=(3+irandom_range(3,6))*room_speed;
