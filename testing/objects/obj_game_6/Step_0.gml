


/// @desc step hinkel 
//step

// update players
if(!instance_exists(obj_countdown) && !instance_exists(obj_finish)) {
  with(obj_player) {
    if(player_hinkel_value<100) {
      player_hinkel_var=clamp(other.room_hinkel_path[clamp(round(player_hinkel_value/20),0,20)],-1,1);
      image_index=11;
	    if(keyset==-1 && random(room_speed)<=1) { player_but1=1; }
	    if(keyset==-1 && random(room_speed)<=1) { player_but2=1; }
      switch (player_hinkel_var) {
        case -1:
          if(player_but1==1 && player_but2==0) {
            player_hinkel_speed+=1;
			image_index=8;
          } else if (player_but2>=1) {
		  image_index=9;
            player_hinkel_speed-=1;
          }
          break;
        case 0:
          if(player_but1>=1 && player_but2>=1) {
		  image_index=10;
            player_hinkel_speed+=1;
          } else if (player_but2>=30 || player_but1>=30) {
		  image_index=choose(8,9);
            player_hinkel_speed-=1;
          }
          break;
        case 1:
          if(player_but2==1 && player_but1==0) {
		  image_index=9;
            player_hinkel_speed+=1;
          } else if (player_but1>=1) {
		  image_index=8;
            player_hinkel_speed-=1;
          }
          break;
		  default:
			image_index=11;
		  break;
      }
      player_hinkel_speed=clamp(player_hinkel_speed,0,5);
      if(keyset==-1) { player_but1=0; player_but2=0;}
      player_hinkel_value+=player_hinkel_speed/10; // modifier
      
       y=(room_height*4/5)-(player_hinkel_value*2); // update position visually
    } else { // win condition
      if(player_hinkel_score=-1) {
        image_index=0; // finish position
        player_hinkel_score=100+(30-other.room_hinkel_timer);
        other.room_hinkel_counter-=1;
      }
    }
  }
}

room_hinkel_timer+=1/room_speed; // increment timer


// finish conditions
if((room_hinkel_timer>=30 || room_hinkel_counter<=0) && !instance_exists(obj_finish)) { // if 30 sec timer or all dropped. (with no finish available)
   instance_create_layer(room_width/2,room_height/2,"Overlay",obj_finish); // finish object; does freeze and roomswitch.
  with(obj_player) { // set score for other players
      if(player_hinkel_score=-1) {
        player_hinkel_score=player_hinkel_value;
		image_index=5;
      }
  }
}
