

/// @desc step springen 
//step

sinus=48+48*sin((room_springen_step/10)*clamp(2*(2+sin(room_springen_timer)),1.1,1.9));

// update players
if(!instance_exists(obj_countdown) && !instance_exists(obj_finish)) {
  with(obj_player) {
    if(alarm[2]>0) { //(can't jump)
      
      //this is movebow
      player_springen_value=-(((64*alarm[2])/15)-((32*(alarm[2]*alarm[2]))/225)); 
      image_index=1;
	  
    } else { // CAN jump!
	     if(keyset==-1 && random(room_speed)<=1) { player_but1=1; }
	    if(keyset==-1 && random(room_speed)<=1) { player_but2=1; }
      if(player_but1==1 || player_but2==1) { 
        alarm[2]=room_speed; // alarm[0] on player for move bow
      }
	    player_but1=0;
	    player_but2=0;
      player_springen_score+=1;
	  image_index=0;
    }
    y=(room_height/2)+player_springen_value;
    if(other.sinus<4 && player_springen_value<other.sinus) {
      player_springen_score-=1/room_speed; // penalty!
      alarm[3]=room_speed; // blinking!
    }
  }
}

room_springen_timer+=1/room_speed; // increment timer
room_springen_step+=1;

// finish conditions
if((room_springen_timer>=30) && !instance_exists(obj_finish)) { // if 30 sec timer or all dropped. (with no finish available)
   instance_create_layer(room_width/2,room_height/2,"Overlay",obj_finish); // finish object; does freeze and roomswitch.
  with(obj_player) { // set score for other players
      if(player_springen_score!=-1) {
        player_springen_score*=2;
		image_index=0;
      }
  }
}
