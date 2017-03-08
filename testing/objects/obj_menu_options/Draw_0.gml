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
		// FULLSCREEN HERE
			if(global.fullscreen==0) {
							global.fullscreen=1;
						} else {
							global.fullscreen=0;
						}  
			  
               break;
             case 1:
                  // RESOLUTION HERE
			  if (global.resolution_height==display_get_height() ) {
							global.resolution_height=360;	
						}		
						global.resolution_height=((global.resolution_height/180)+1)*180;
						if(global.resolution_height>2160) {
							global.resolution_height=360;
						} else if (global.resolution_height>display_get_height() ) {
							global.resolution_height=display_get_height();	
						}
			  
               break;
             case 2:
                  // VOLUME HERE
			  global.volume+=0.1;
						if(global.volume>1) {
							global.volume=0;
						}
			  
               break;
		case 2:
                  room_goto(room_menu); // end game. :'(
               break;
             default: break;
          }
	      ini_open("m.ini");
						ini_write_real("Settings","Fullscreen",global.fullscreen);
						ini_write_real("Settings","Resolution",global.resolution_height);
					
						ini_write_real("Settings","Volume",global.volume);
					
						ini_close();
						game_restart();
      }
	  
	  
for(i=0; i<image_number; i++) {
	sinus+=1;
	draw_sprite(sprite_index,i,(room_width/2)+((i-((image_number-1)/2))*sprite_width),(room_height/5)+sin(sinus));
}
