/// @desc drawwp hoepel 
//draw

with(obj_player) {
  if(alarm[1]<=0) {
    draw_sprite(spr_hoepel,choose(0,0,0,1,0,0,0,2), x,y-32);
  } else {
    draw_sprite(spr_hoepel,3,x,y-32); 
  }
} // move player draw to draw end!!!!!!!!!!