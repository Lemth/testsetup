/// @desc step hoepel 
//step


// update players
if(!instance_exists(obj_countdown) && !instance_exists(obj_finish)) {
  with(obj_player) {
    if(player_hoepel_value<100 && image_index!=0) { // play condition
      if(player_but1==1) {
        if(player_hoepel_press!=1 && other.room_hoepel_state==1) {
          player_hoepel_speed+=1; 
        } else { player_hoepel_speed-=1; } // wrong keypress!!
        player_hoepel_press=1;
        image_index=7; // left foot down
      }
      if(player_but2==1) {
        if(player_hoepel_press!=2 && other.room_hoepel_state==1) {
          player_hoepel_speed+=1; 
        } else { player_hoepel_speed-=1; } // wrong keypress!!
        player_hoepel_press=2;
        image_index=8; // right foot down foot down
      }
      
      if(other.room_hoepel_state==-1 && player_hoepel_speed<=-1 && (player_but1>10 || player_but2>10)) {
        player_hoepel_score=player_hoepel_value;
        image_index=0; // this is how they stop competing when wrong pressing!
      }
      
      player_hoepel_speed=clamp(player_hoepel_speed-(5/room_speed),0,5); // clamp min max speed.
      
      
      
      player_hoepel_value+=player_hoepel_speed; // update value
      
      y=(room_height*4/5)-player_hoepel_value; // update position visually
    } else { // win condition
      if(player_hoepel_score=-1) {
        image_index=1; // finish position
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
        player_hoepel_score=player_koekoek_value;
      }
  }
}
