/// @desc draw hinkel
//drawing

//draw hinkel paths
with(obj_player) {
  for(i=0;i<array_length_1d(other.room_hinkel_path);i++) {
    if (other.room_hinkel_path[i]<=0) {
      draw_rectangle(x-32,y+2.5-(i*5),x-0.5,y-2.5-(i*5),true);
    }
    if (other.room_hinkel_path[i]>=0) {
      draw_rectangle(x+0.5,y+2.5-(i*5),x+0.5,y-32-(i*5),true);
    }
  }
}


/// @desc step hinkel 
//step

// update players
if(!instance_exists(obj_countdown) && !instance_exists(obj_finish)) {
  with(obj_player) {
    if(player_hinkel_value<100) {
      player_hinkel_var=clamp(other.room_hinkel_path[clamp(round(player_hinkel_value/20),0,20)],-1,1);
      
      switch (player_hinkel_var) {
        case -1:
          if(player_but1==1 && player_but2==0) {
            player_hinkel_speed+=1;
          } else if (player_but2>=1) {
            player_hinkel_speed-=1;
          }
          break;
        case 0:
          if(player_but1>=1 && player_but2>=1) {
            player_hinkel_speed+=1;
          } else if (player_but2>=30 || player_but1>=30) {
            player_hinkel_speed-=1;
          }
          break;
        case 1:
          if(player_but2==1 && player_but1==0) {
            player_hinkel_speed+=1;
          } else if (player_but1>=1) {
            player_hinkel_speed-=1;
          }
          break;
      }
      player_hinkel_speed=clamp(player_hinkel_speed,0,5);
      
      player_hinkel_value+=player_hinkel_speed;
      
       y=(room_height*4/5)-player_hinkel_value; // update position visually
    } else { // win condition
      if(player_hinkel_score=-1) {
        image_index=1; // finish position
        player_hinkel_score=100+(30-other.room_hinkel_timer);
        other.room_hinkel_counter-=1;
      }
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
      }
  }
}
