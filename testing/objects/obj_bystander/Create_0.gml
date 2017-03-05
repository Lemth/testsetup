/// @description Insert description here
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