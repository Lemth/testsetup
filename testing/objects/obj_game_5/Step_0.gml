/// @desc drawwp hoepel 
//draw

with(obj_player) {
  if(alarm[hoepel]<=0) {
    draw_sprite(spr_hoepel,choose(0,0,0,1,0,0,0,2), x,y-32);
  } else {
    draw_spite(spr_hoepel,3,x,y-32); 
  }
} // move player draw to draw end!!!!!!!!!!

/// @desc step hoepel 
//step
// update players
if(!instance_exists(obj_countdown) && !instance_exists(obj_finish)) {
  with(obj_player) {
    if(player_hoepel_value<100) { // play condition
      if((player_but1==1 || player_but2==1) && alarm[hoepel]<=0) {
        player_hoepel_speed=min(5,player_hoepel_speed+.5);
        if(image_index=7) {
          image_index=8; // right foot down foot down
        } else { image_index=7; } // left foot down down down down 
      }
      
      player_hoepel_speed-=1/room_speed;
      
      if(player_hoepel_speed>4) {
        // too fast!
        alarm[hoepel]=room_speed;
        player_hoepel_speed=0;
      }
      
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
        player_hoepel_score=player_hoepel_value;
      }
  }
}
