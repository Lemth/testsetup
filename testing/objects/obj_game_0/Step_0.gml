/// @desc step hange 
//step


// update players
if(!instance_exists(obj_countdown) && !instance_exists(obj_finish)) {
  with(obj_player) {
    if(player_hangen_value>0) {
      player_hangen_value-=(other.room_hangen_timer/10)/room_speed;
	  var but=0;
	  if(player_but1>0) { but+=1; }
	  if(player_but2>0) { but+=1; }
      player_hangen_value=min(10,player_hangen_value+(but/(room_speed)));
      y=(room_height/2)+player_hangen_value;
    } else {
      y=min(y+1,room_height*3/4); // drop untill 3/4 of room height.
      if(player_hangen_score=-1) {
        image_index=0;
        player_hangen_score=other.room_hangen_timer;
        other.room_hangen_counter-=1;
      }
    }
  }
}

room_hangen_timer+=1/room_speed; // increment timer


// finish conditions
if((room_hangen_timer>=30 || room_hangen_counter<=0) && !instance_exists(obj_finish)) { // if 30 sec timer or all dropped. (with no finish available)
   instance_create_layer(room_width/2,room_height/2,"Overlay",obj_finish); // finish object; does freeze and roomswitch.
  with(obj_player) { // set score for other players
      if(player_hangen_score=-1) {
        player_hangen_score=other.room_hangen_timer;
      }
  }
}