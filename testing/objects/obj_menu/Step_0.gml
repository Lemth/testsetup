/// @description Insert description here
// You can write your code in this editor

// mouse controls:

menu_length = array_length_1d(menu_array);

for(var i=0; i<menu_length; i++) {
      if(point_in_rectangle((room_width*(i+1)/(menu_length+1))-(sprite_width(menu_array[i])/2),(room_height/2)-(sprite_height(menu_array[i])/2),
                            (room_width*(i+1)/(menu_length+1))+(sprite_width(menu_array[i])/2),(room_height/2)+(sprite_height(menu_array[i])/2)) {
            menu_pos=i;
            break; // break for loop if any found and set.
      }
}
