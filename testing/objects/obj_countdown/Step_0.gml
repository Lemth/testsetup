/// @desc obj_countdown step

counter-=1;

if(counter<=0) {
  number-=1; 
  if(number<=0) {
	if(goto!=-1) {
		room_goto(goto);
	} 
    instance_destroy();
  }
  counter=room_speed;
}

