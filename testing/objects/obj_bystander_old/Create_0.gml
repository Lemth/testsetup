/// @description room_hangen

// setup.
with(obj_player) {
  y=room_height/2;
  player_hangen_value=10;
  player_hangen_score=-1;
  image_index=1;
}

room_hangen_timer=0;
room_hangen_count=4;

instance_create_layer(room_width/2,room_height/2,"Overlay",obj_countdown); // countdown object; don't decrease if countdown is there!

/// @desc step hange 
//step

if(!instance_exists(obj_countdown) && !instance_exists(obj_finish)) {
  with(obj_player) {
    if(player_hangen_value>0) {
      player_hangen_value-=(room_hangen_timer/10)/room_speed;
      player_hangen_value=min(10,max(button1+button2)/(room_speed));
      y=(room_height/2)+player_hangen_value;
    } else {
      y=min(y+1,room_height*3/4); // drop untill 3/4 of room height.
      if(player_hangen_score=-1) {
        image_index=0;
        player_hangen_score=other.room_hangen_timer;
        other.room_hangen_count-=1;
      }
    }
  }
}

room_hangen_timer+=1/room_speed;
if((room_hangen_timer>=30 || room_hangen_counter<=0) && !instance_exists(obj_finish)) { // if 30 sec timer or all dropped. (with no finish available)
   instance_create_layer(room_width/2,room_height/2,"Overlay",obj_finish); // finish object; does freeze and roomswitch.
  with(obj_player) { // set score for other players
      if(player_hangen_score=-1) {
        player_hangen_score=other.room_hangen_timer;
      }
  }
}





/// @desc obj_countdown create

counter=room_speed;
number=3;

/// @desc obj_countdown step

counter-=1;

if(counter<=0) {
  number-=1; 
  if(number<=0) {
    instance_destroy();
  }
  counter=room_speed;
}

/// @desc obj_countdown draw event

// draw fading number:
draw_sprite_ext(asset_get_index("spr_countdown_"+string(number),0,room_width/2,room_height/2,1,1,0,c_white,(counter/room_speed));


                
/// @desc obj_finish create
                
alarm[0]=room_speed*3; // 3 seconds room_switch.
                
/// @desc obj_finish alarm[0]
                
room_goto(room_end);
                
/// @desc obj_finish draw
              
draw_set_alpha(min(1,1-(alarm[0]/(room_speed*3))));
draw_rectangle(0,0,room_width,room_height,false); // fade out to white rectangle
draw_set_alpha(1);


/*
// You can write your code in this editor

img_pants=asset_get_index("spr_pants"+string(irandom(3)));
img_shoes=asset_get_index("spr_shoes"+string(irandom(1)));


var body_r=irandom_range(50,250);
var body_b=max(0,body_r-irandom_range(10,50));
var body_g=min(body_r-10,(body_r+body_b)/2+choose(0,irandom(50)));
col_body=make_color_rgb(body_r,body_g,body_b);

col_pants=make_color_rgb(irandom(255),irandom(255),irandom(255));
col_shoes=make_color_rgb(irandom(255),irandom(255),irandom(255));
col_shirt=make_color_rgb(irandom(255),irandom(255),irandom(255));
col_hair=make_color_rgb(irandom(255),irandom(255),irandom(255));
col_eyes=make_color_rgb(irandom(255),irandom(255),irandom(255));


pos_left=choose(-1,1);
pos_width=random_range(0.6,1);
pos_height=pos_width*random_range(1.5-pos_width,1);

img_index=irandom(3);
alarm[0]=room_speed;
*/
