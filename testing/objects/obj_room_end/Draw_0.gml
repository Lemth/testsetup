/// @description Insert description here
// You can write your code in this editor

with(obj_player) {
//draw_set_color(c_black);
  //draw_text(x,y,"SCORE: "+string(player_score));
//draw_set_color(c_white);
  
  if(counti<player_score*100/other.maxscore) {
    draw_sprite(spr_confetti,irandom(12),x+random_range(-64,64),y+random_range(-64,64));
    counti++;
  }
}
