/// @desc obj_countdown draw event

// draw fading number:
draw_sprite_ext(asset_get_index("spr_countdown_"+string(number)),0,room_width/2,room_height/2,1,1,0,c_white,(counter/room_speed));