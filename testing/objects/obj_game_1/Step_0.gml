/// @desc step koekoek 
//step


// update players
if(!instance_exists(obj_countdown) && !instance_exists(obj_finish)) {
  with(obj_player) {
    if(player_koekoek_value<100 && image_index!=0) { // play condition
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
      if(player_but1==1) {
        if(player_koekoek_press!=1 && other.room_koekoek_state==1) {
          player_koekoek_speed+=1; 
        } else { player_koekoek_speed-=1; } // wrong keypress!!
        player_koekoek_press=1;
        image_index=6; // left foot down
      }
      if(player_but2==1) {
        if(player_koekoek_press!=2 && other.room_koekoek_state==1) {
          player_koekoek_speed+=1; 
        } else { player_koekoek_speed-=1; } // wrong keypress!!
        player_koekoek_press=2;
        image_index=7; // right foot down foot down
      }
       if(keyset==-1) {
         player_but1=0;
         player_but2=0;
       }
      if(other.room_koekoek_state==-1 && player_koekoek_speed<=-1 && (player_but1>10 || player_but2>10)) {
        player_koekoek_score=player_koekoek_value;
        image_index=1; // this is how they stop competing when wrong pressing!
      }
      
      player_koekoek_speed=clamp(player_koekoek_speed-(5/room_speed),0,5); // clamp min max speed.
      
      
      
      player_koekoek_value+=player_koekoek_speed/10; // update value
      
      y=(room_height*4/5)-(player_koekoek_value*2); // update position visually
    } else { // win condition
      if(player_koekoek_score=-1) {
        image_index=5; // finish position
        player_koekoek_score=100+(30-other.room_koekoek_timer);
        other.room_koekoek_counter-=1;
      }
    }
  }
}

room_koekoek_timer+=1/room_speed; // increment timer


// finish conditions
if((room_koekoek_timer>=30 || room_koekoek_counter<=0) && !instance_exists(obj_finish)) { // if 30 sec timer or all dropped. (with no finish available)
   instance_create_layer(room_width/2,room_height/2,"Overlay",obj_finish); // finish object; does freeze and roomswitch.
  with(obj_player) { // set score for other players
      if(player_koekoek_score=-1) {
        player_koekoek_score=player_koekoek_value;
      }
  }
}




