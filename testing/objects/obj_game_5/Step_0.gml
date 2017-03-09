

/// @desc step hoepel 
//step
// update players
if(!instance_exists(obj_countdown) && !instance_exists(obj_finish)) {
  with(obj_player) {
    if(player_hoepel_value<100) { // play condition
	    if(keyset==-1 && random(room_speed)<=1) { player_but1=1; }
	    if(keyset==-1 && random(room_speed)<=1) { player_but2=1; }
      if((player_but1==1 || player_but2==1) && alarm[1]<=0) {
        player_hoepel_speed=min(5,player_hoepel_speed+.5);
        if(image_index=6) {
          image_index=7; // right foot down foot down
        } else { image_index=6; } // left foot down down down down 
      }
      
      player_hoepel_speed-=1/room_speed;
      
      if(player_hoepel_speed>4) {
        // too fast!
        alarm[1]=room_speed;
        player_hoepel_speed=0;
      }
	    if(keyset==-1) {
	    player_but1=0;
	    player_but2=0;
	    }
      player_hoepel_speed=clamp(player_hoepel_speed,0,5);
      player_hoepel_value+=player_hoepel_speed/4; // update value
      
      y=(room_height*4/5)-(player_hoepel_value*2); // update position visually
    } else { // win condition
      if(player_hoepel_score=-1) {
        image_index=0; // finish position
        player_hoepel_score=100+(30-other.room_hoepel_timer);
        other.room_hoepel_counter-=1;
      }
    }
  }
}

room_hoepel_timer+=1/room_speed; // increment timer


// finish conditions
if((room_hoepel_timer>=30 || room_hoepel_counter<=0) && !instance_exists(obj_finish)) { // if 30 sec timer or all dropped. (with no finish available)
   instance_create_layer(room_width/2,room_height/2,"Overlay",obj_finish); // finish object; does freeze and roomswitch.
  with(obj_player) { // set score for other players
      if(player_hoepel_score=-1) {
        player_hoepel_score=player_hoepel_value;
		image_index=10;
      }
  }
}
