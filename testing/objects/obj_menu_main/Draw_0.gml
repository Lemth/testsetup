/// @desc DRAWING AND USING INPUT (after step)
/////////////////
// rest in DRAW EVENT:



if(menu_pos>=menu_length) { // reset if past max.
   menu_pos=0;  
}

for(var i=0; i<menu_length; i++) {
   if(point_in_rectangle(mouse_x,mouse_y,
						(room_width*(i+1)/(menu_length+1))-(sprite_get_width(menu_array[i])/2),
						(room_height/2)-(sprite_get_height(menu_array[i])/2),
                        (room_width*(i+1)/(menu_length+1))+(sprite_get_width(menu_array[i])/2),
						(room_height/2)+(sprite_get_height(menu_array[i])/2))) {
          menu_pos=i;     
          if(mouse_check_button_pressed(mb_left)) {
              enter=1; // set enter key as pressed (so mouse only works when hovering!!)                  
          }
   }
                 
   // draw windows                            
   draw_sprite(menu_array[i],min(1,abs(menu_pos-i)),room_width*(i+1)/(menu_length+1),room_height/2);
}

// cases for menu options here!      
      if(enter==1) { // if pressed enter (or did the mb click!)
          switch(menu_pos) {
             case 0: 
					with(obj_controls) {
		                  if(mouse_check_button_pressed(mb_left)) {
		                     set_first_player="mouse";  // 10 step delay for adding mouse to player
		                  } else {
		                     set_first_player="keyboard";   // 10 step delay for adding keyboard to player
		                  }
				  }
                  room_goto(room_start); // start the game
               break;
             case 1:
                  room_goto(room_options); // goto options
               break;
		case 2:
                  room_goto(room_about); // goto about
               break;
             case 3:
                  game_end(); // end game. :'(
               break;
             default: break;
          }
      }
	  
	  
for(i=0; i<image_number; i++) {
	sinus+=1;
	draw_sprite(sprite_index,i,(room_width/2)+((i-((image_number-1)/2))*sprite_width),(room_height/5)+sin(sinus));
}
