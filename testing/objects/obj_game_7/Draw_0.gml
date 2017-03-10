/// @desc DRAW werpen 
//MOVE THIS ALL TO DRAW!!! EVERYTHING IN HERE!


// update players
if(!instance_exists(obj_countdown) && !instance_exists(obj_finish)) {
  with(obj_player) {
  draw_sprite(spr_basket,0,x,room_height*4/5-95*2);
	  if(keyset==-1 && random(room_speed*10)<=1) { player_but1=95; }
	  if(keyset==-1 && random(room_speed*10)<=1) { player_but1=95; }
    if((player_but1+player_but2)>0) {
		image_index=10;
      player_werpen_value+=1;
      player_werpen_var=player_werpen_value;
      if((player_but1+player_but2)==90 || (player_but1+player_but2)==91) {
          player_werpen_score+=3;
      }
      if((player_but1+player_but2)==100 || (player_but1+player_but2)==101 || (player_but1+player_but2)==102) {
          player_werpen_score-=3;
      }
    } else if (player_werpen_value>0) {
		image_index=12;
      draw_sprite(spr_ball,0,x,y-((player_werpen_var-player_werpen_value)*2));
      player_werpen_value-=1;
    }
	  if(keyset==-1) {player_but1=0; player_but2=0; }
  }
}

room_werpen_timer+=1/room_speed; // increment timer


// finish conditions
if((room_werpen_timer>=30) && !instance_exists(obj_finish)) { // if 30 sec timer or all dropped. (with no finish available)
   instance_create_layer(room_width/2,room_height/2,"Overlay",obj_finish); // finish object; does freeze and roomswitch.
  with(obj_player) { // set score for other players
      player_werpen_score=max(0,player_werpen_score);
	  image_index=10;
      
  }
}
