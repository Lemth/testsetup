/// @desc step wippen 
//step


// update players
if(!instance_exists(obj_countdown) && !instance_exists(obj_finish)) {
  with(obj_player) {
    if(player_wippen_value>0 && player_wippen_value<180) {
      
      if(player_wippen_value>90) {
        player_wippen_value-=(player_wippen_value-90)*(15-other.room_wippen_timer)/room_speed; // value good?
      } else if (player_wippen_value<90) {
        player_wippen_value+=(90-player_wippen_value)*(15-other.room_wippen_timer)/room_speed; // value good?
      }
      if(keyset==-1 && random(room_speed/10)<=1) {
          switch(choose(0,1)) {
            case 0:
              player_but1=1;
              break;
            case 1:
              player_but2=1;
              break;
            default:
			//
              break;
          }
      }
      if(player_but1>=1) {
        player_wippen_value+=1; // value good?
      } 
      if(player_but2>=1) {
        player_wippen_value-=1; // value good?
      } 
	    if(keyset==-1) { player_but1=0; player_but2=0; }
      player_wippen_value+=random_range(-.1,.1);
      direction=player_wippen_value-90;
    } else {
      direction=(direction+90)/2;
      if(player_wippen_score=-1) {
        player_wippen_score=(30-other.room_wippen_timer)+90;
        other.room_wippen_counter-=1;
		image_index=0;
      }
    }
  }
}

room_wippen_timer+=1/room_speed; // increment timer


// finish conditions
if((room_wippen_timer>=30 || room_wippen_counter<=0) && !instance_exists(obj_finish)) { // if 30 sec timer or all dropped. (with no finish available)
   instance_create_layer(room_width/2,room_height/2,"Overlay",obj_finish); // finish object; does freeze and roomswitch.
  with(obj_player) { // set score for other players
      direction=0;
      //image_index=0; // ?
      if(player_wippen_score=-1) {
        player_wippen_score=abs(player_wippen_value-90);
		image_index=2;
      }
  }
}
