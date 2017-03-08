/// @description room_werpen
// setup.
with(obj_player) {
  y=room_height*4/5;
  player_werpen_value=0;
  player_werpen_score=-1;
  player_werpen_var=0;
  image_index=10;
}

room_werpen_timer=0;
room_werpen_counter=4;

instance_create_layer(room_width/2,room_height/2,"Overlay",obj_countdown); // countdown object; don't decrease if countdown is there!
