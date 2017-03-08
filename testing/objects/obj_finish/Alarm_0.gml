/// @desc obj_finish alarm[0]
                

if(instance_exists(obj_game)) {
  with(obj_game) {
    room_counter+=1;
    if(room_exists(room_array[room_order[room_counter-1]])) {
      room_goto(room_array[room_order[room_counter-1]]);
    } else {
      room_goto(room_end);
    }
  }
} else {                
  room_goto(room_end); // backup\
}
