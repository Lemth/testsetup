/// @desc step balans 
//step


// update players
if(!instance_exists(obj_countdown) && !instance_exists(obj_finish)) {
  with(obj_player) {
    if(player_balans_value>0 && player_balans_value<180) {
      
      if(player_balans_value>90) {
        player_balans_value+=(player_balans_value-90)*other.room_balans_timer/(room_speed*5); // value good?
      } else if (player_balans_value<90) {
        player_balans_value-=(90-player_balans_value)*other.room_balans_timer/(room_speed*5); // value good?
      }
      if(keyset==-1 && random(room_speed/10)<=1) {
          switch(choose(0,1)) {
            case 0:
              player_but1=1;
              break;
            case 1:
              player_but2=1;
              break;
            case default:
              break;
          }
      }
      if(player_but1==1) {
        player_balans_value+=1; // value good?
      } 
      if(player_but2==1) {
        player_balans_value-=1; // value good?
      }
	if(keyset==-1) { player_but1=0; player_but2=0; }
      player_balans_value+=random_range(-.1,.1);
      direction=player_balans_value-90;
    } else {
      if(player_balans_score=-1) {
        image_index=2;
        player_balans_score=other.room_balans_timer;
        other.room_balans_counter-=1;
      }
    }
  }
}

room_balans_timer+=1/room_speed; // increment timer


// finish conditions
if((room_balans_timer>=30 || room_balans_counter<=0) && !instance_exists(obj_finish)) { // if 30 sec timer or all dropped. (with no finish available)
   instance_create_layer(room_width/2,room_height/2,"Overlay",obj_finish); // finish object; does freeze and roomswitch.
  with(obj_player) { // set score for other players
      direction=0;
      if(player_balans_score=-1) {
		image_index=1;
        player_balans_score=other.room_balans_timer*2;
      }
  }
}
