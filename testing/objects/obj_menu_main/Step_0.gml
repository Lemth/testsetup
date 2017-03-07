/// @description Insert description here
// You can write your code in this editor

//obj_controller does skipping through options and outputs ENTER and ESC

event_inherited();


/// @desc DRAWING AND USING INPUT (after step)
/////////////////
// rest in DRAW EVENT:

menu_length = array_length_1d(menu_array);

if(menu_pos>=menu_length) { // reset if past max.
   menu_pos=0;  
}

for(var i=0; i<menu_length; i++) {
   if(point_in_rectangle((room_width*(i+1)/(menu_length+1))-(sprite_width(menu_array[i])/2),(room_height/2)-(sprite_height(menu_array[i])/2),
                            (room_width*(i+1)/(menu_length+1))+(sprite_width(menu_array[i])/2),(room_height/2)+(sprite_height(menu_array[i])/2)) {
          menu_pos=i;     
          if(mouse_check_pressed(mb_left)) {
              enter=1; // set enter key as pressed (so mouse only works when hovering!!)                  
          }
   }
    
      // cases for menu options here!      
      if(enter==1) { // if pressed enter (or did the mb click!)
          switch(i) {
             case 0: 
                  if(mouse_check_pressed(mb_left)) {
                     alarm[9]=10;  // 10 step delay for adding mouse to player
                  } else {
                     alarm[0]=10;   // 10 step delay for adding keyboard to player
                  }
                  room_goto(room_start); // start the game
               break;
             case 1:
                  room_goto(room_options); // goto options
               break;
             case 2:
                  game_end(); // end game. :'(
               break;
             default: break;
          }
      }
    
                 
   // draw windows                            
   draw_sprite(menu_array[i],min(1,abs(menu_pos-i)),room_width*(i+1)/(menu_length+1),room_height/2);
}
                            
                          
     
/// @desc alarm[9] MOUSE
      
with(obj_controls) {
   if(scr_new_player(9)) {
         new_player.keyset=9; // set/lease keyset (>-1 == player controlled)
         ctrl_lease[9]=true;
   }  
}
      
/// @desc alarm[0] keyboard
with(obj_controls) {      
   if(scr_new_player(0,vk_left,vk_right)) { // also send specific keys
      new_player.keyset=0; // set/lease keyset (>-1 == player controlled)
      ctrl_lease[0]=true;
   }   
}  
   
