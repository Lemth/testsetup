/// @desc obj_finish draw
              
draw_set_alpha(min(1,1-(alarm[0]/(room_speed*3))));
draw_rectangle(0,0,room_width,room_height,false); // fade out to white rectangle
draw_set_alpha(1);
