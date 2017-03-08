/// @description Insert description here
// You can write your code in this editor

// LIST ALL ROOMS // randomize for all i care.
room_array[0]=room_game_0;
room_array[1]=room_game_1;
room_array[2]=room_game_2;
room_array[3]=room_game_3;
room_array[4]=room_game_4;
room_array[5]=room_game_5;
room_array[6]=room_game_6;
room_array[7]=room_game_7;

for(i=0;i<array_length_1d(room_array);i++) {
  do {
    already_exists=false;
    room_order[i]=irandom(7);
    for(j=0;j<array_length_1d(room_order);j++) {
       if(i!=j && room_order[i]==room_order[j]) {
          already_exists=true;
       }
    }
  } until (already_exists==false)
}

room_counter=0;

// NOW ACCESS ROOMS LIKE THIS: 
/*
with(obj_game) {
  room_counter+=1;
  if(room_exists(room_array[room_order[room_counter-1]])) {
    room_goto(room_array[room_order[room_counter-1]]);
  } else {
    room_goto(room_end);
  }
}
*/
