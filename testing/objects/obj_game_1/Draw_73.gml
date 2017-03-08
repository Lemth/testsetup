/// @desc koekoek draw event
// add puppet

if(room_koekoek_state==1) {
  draw_sprite(spr_player,11,room_width/2,72); // counting
} else {
  draw_sprite(spr_player,2,room_width/2,72); // HALT!
  draw_sprite(spr_halt_symbol,0,room_width/2,72+64); // hand
}