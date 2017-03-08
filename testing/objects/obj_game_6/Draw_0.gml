/// @desc draw hinkel
//drawing

//draw hinkel paths
with(obj_player) {
	draw_set_color(c_black);
  for(i=0;i<array_length_1d(other.room_hinkel_path);i++) {
    if (other.room_hinkel_path[i]<=0) {
      draw_rectangle(x-20,y+5-(i*10)+(player_hinkel_value*2),x-0.5,y-5-(i*10)+(player_hinkel_value*2),true);
    }
    if (other.room_hinkel_path[i]>=0) {
      draw_rectangle(x+0.5,y+5-(i*10)+(player_hinkel_value*2),x+20,y-5-(i*10)+(player_hinkel_value*2),true);
    }
  }
  draw_set_color(c_white);
}